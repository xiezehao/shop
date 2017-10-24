<?php
/**
 * Created by PhpStorm.
 * User: xudong.ding
 * Date: 16/5/19
 * Time: 下午2:09
 */
class AlipayTradeService {

	//支付宝网关地址
	public $gateway_url = "https://openapi.alipay.com/gateway.do";

	//异步通知回调地址
	public $notify_url;

	//签名类型
	public $sign_type;

	//支付宝公钥地址
	public $alipay_public_key;

	//商户私钥地址
	public $private_key;

	//应用id
	public $appid;

	//编码格式
	public $charset = "UTF-8";


	public $token = NULL;

	//重试次数
	private $MaxQueryRetry;

	//重试间隔
	private $QueryDuration;

	//返回数据格式
	public $format = "json";


	function __construct($alipay_config){
		$this->gateway_url = $alipay_config['gatewayUrl'];
		$this->appid = $alipay_config['app_id'];
		$this->sign_type = $alipay_config['sign_type'];
		//$this->private_key = $alipay_config['merchant_private_key_file'];
		$this->private_key = $alipay_config['merchant_private_key'];
		//$this->alipay_public_key = $alipay_config['alipay_public_key_file'];
		$this->alipay_public_key = $alipay_config['alipay_public_key'];
		$this->charset = $alipay_config['charset'];
		$this->MaxQueryRetry = $alipay_config['MaxQueryRetry'];
		$this->QueryDuration = $alipay_config['QueryDuration'];
		$this->notify_url = $alipay_config['notify_url'];

		if(empty($this->appid)||trim($this->appid)==""){
			throw new Exception("appid should not be NULL!");
		}
		if(empty($this->private_key)||trim($this->private_key)==""){
			throw new Exception("private_key should not be NULL!");
		}
		if(empty($this->alipay_public_key)||trim($this->alipay_public_key)==""){
			throw new Exception("alipay_public_key should not be NULL!");
		}
		if(empty($this->charset)||trim($this->charset)==""){
			throw new Exception("charset should not be NULL!");
		}
		if(empty($this->QueryDuration)||trim($this->QueryDuration)==""){
			throw new Exception("QueryDuration should not be NULL!");
		}
		if(empty($this->gateway_url)||trim($this->gateway_url)==""){
			throw new Exception("gateway_url should not be NULL!");
		}
		if(empty($this->MaxQueryRetry)||trim($this->MaxQueryRetry)==""){
			throw new Exception("MaxQueryRetry should not be NULL!");
		}
		if(empty($this->sign_type)||trim($this->sign_type)==""){
			throw new Exception("sign_type should not be NULL");
		}

	}
	function AlipayWapPayService($alipay_config) {
		$this->__construct($alipay_config);
	}

	// 当面付2.0条码支付(带轮询逻辑)
	public function barPay($req) {

		$outTradeNo = $req->getOutTradeNo();
		$bizContent = $req->getBizContent();

		$appAuthToken = $req->getAppAuthToken();

		//$this->writeLog($bizContent);

		//echo $bizContent;

		$request = new AlipayTradePayRequest();
		$request->setBizContent ( $bizContent );


		$response = $this->aopclientRequestExecute ( $request , NULL , $appAuthToken);

		//获取alipay_trade_pay_response对象数据,方便后续处理
		$response = $response->alipay_trade_pay_response;

		$result = new AlipayF2FPayResult($response);

		if (!empty($response)&&("10000" == $response->code)) {
			// 支付交易明确成功
			$result->setTradeStatus("SUCCESS");

		} elseif (!empty($response)&&("10003" == $response->code)) {
			// 返回用户处理中，则轮询查询交易是否成功，如果查询超时，则调用撤销
			$queryContentBuilder = new AlipayTradeQueryContentBuilder();
			$queryContentBuilder->setOutTradeNo($outTradeNo);
			$queryContentBuilder->setAppAuthToken($appAuthToken);

			$loopQueryResponse = $this->loopQueryResult($queryContentBuilder);
			return $this->checkQueryAndCancel($outTradeNo, $appAuthToken, $result, $loopQueryResponse);

		} elseif ($this->tradeError($response)) {
			// 系统错误或者网络异常未响应，则查询一次交易，如果交易没有支付成功，则调用撤销
			$queryContentBuilder = new AlipayTradeQueryContentBuilder();
			$queryContentBuilder->setOutTradeNo($outTradeNo);
			$queryContentBuilder->setAppAuthToken($appAuthToken);

			$queryResponse = $this->query($queryContentBuilder);

			return $this->checkQueryAndCancel($outTradeNo, $appAuthToken, $result, $queryResponse);

		} else {
			// 其他情况表明该订单支付明确失败
			$result->setTradeStatus("FAILED");
		}

		return $result;

	}

	// 当面付2.0消费查询
	public function queryTradeResult($req){
		$response = $this->query($req);
		$result = new AlipayF2FQueryResult($response);

		if($this->querySuccess($response)){
			// 查询返回该订单交易支付成功
			$result->setTradeStatus("SUCCESS");

		} elseif ($this->tradeError($response)){
			//查询发生异常或无返回，交易状态未知
			$result->setTradeStatus("UNKNOWN");
		} else {
			//其他情况均表明该订单号交易失败
			$result->setTradeStatus("FAILED");
		}
		return $result;

	}

	// 当面付2.0消费退款,$req为对象变量
	public function refund($req) {
		$bizContent = $req->getBizContent();
		//$this->writeLog($bizContent);
		$request = new AlipayTradeRefundRequest();
		$request->setBizContent ( $bizContent );
		$response = $this->aopclientRequestExecute ( $request , NULL ,$req->getAppAuthToken());

		$response = $response->alipay_trade_refund_response;

		$result = new AlipayF2FRefundResult($response);
		if(!empty($response)&&("10000"==$response->code)){
			$result->setTradeStatus("SUCCESS");
		} elseif ($this->tradeError($response)){
			$result->setTradeStatus("UNKNOWN");
		} else {
			$result->setTradeStatus("FAILED");
		}

		return $result;
	}

	//当面付2.0预下单(生成二维码,带轮询)
	public function qrPay($req) {

		$bizContent = $req->getBizContent();
		//$this->writeLog($bizContent);

		$request = new AlipayTradePrecreateRequest();
		$request->setBizContent ( $bizContent );
		$request->setNotifyUrl ( $this->notify_url );
//
//		// 首先调用支付api
		$response = $this->aopclientRequestExecute ( $request, NULL ,$req->getAppAuthToken() );
		$response = $response->alipay_trade_precreate_response;

		$result = new AlipayF2FPrecreateResult($response);
		if(!empty($response)&&("10000"==$response->code)){
			$result->setTradeStatus("SUCCESS");
		} elseif($this->tradeError($response)){
			$result->setTradeStatus("UNKNOWN");
		} else {
			$result->setTradeStatus("FAILED");
		}

		return $result;

	}


	public function query($queryContentBuilder) {
		$biz_content = $queryContentBuilder->getBizContent();
		//$this->writeLog($biz_content);
		$request = new AlipayTradeQueryRequest();
		$request->setBizContent ( $biz_content );
		$response = $this->aopclientRequestExecute ( $request , NULL, $queryContentBuilder->getAppAuthToken() );


		return $response->alipay_trade_query_response;
	}

	// 轮询查询订单支付结果
	protected function loopQueryResult($queryContentBuilder){
		$queryResult = NULL;
		for ($i=1;$i<$this->MaxQueryRetry;$i++){
			try{
				sleep($this->QueryDuration);
			}catch (Exception $e){
				print $e->getMessage();
				exit();
			}

			$queryResponse = $this->query($queryContentBuilder);
			if(!empty($queryResponse)){
				if($this->stopQuery($queryResponse)){
					return $queryResponse;
				}
				$queryResult = $queryResponse;
			}
		}
		return $queryResult;
	}

	// 判断是否停止查询
	protected function stopQuery($response){
		if("10000"==$response->code){
			if("TRADE_FINISHED"==$response->trade_status||
				"TRADE_SUCCESS"==$response->trade_status||
				"TRADE_CLOSED"==$response->trade_status){
				return true;
			}
		}
		return false;
	}

	// 根据查询结果queryResponse判断交易是否支付成功，如果支付成功则更新result并返回，如果不成功则调用撤销
	private function checkQueryAndCancel($outTradeNo, $appAuthToken, $result, $queryResponse){
		if($this->querySuccess($queryResponse)){
			// 如果查询返回支付成功，则返回相应结果
			$result->setTradeStatus("SUCCESS");
			$result->setResponse($queryResponse);
			return $result;
		}elseif($this->queryClose($queryResponse)){
			// 如果查询返回交易关闭，标记交易失败
			$result->setTradeStatus("FAILED");
			return $result;
		}

		// 如果查询结果不为成功，则调用撤销
		$cancelContentBuilder = new AlipayTradeCancelContentBuilder();
		$cancelContentBuilder->setAppAuthToken($appAuthToken);
		$cancelContentBuilder->setOutTradeNo($outTradeNo);
		$cancelResponse = $this->cancel($cancelContentBuilder);
		if($this->tradeError($cancelResponse)){
			// 如果第一次同步撤销返回异常，则标记支付交易为未知状态
			$result->setTradeStatus("UNKNOWN");
		}else{
			// 标记支付为失败，如果撤销未能成功，产生的单边帐由人工处理
			$result->setTradeStatus("FAILED");
		}
		return $result;
	}

	// 查询返回“支付成功”
	protected function querySuccess($queryResponse){
		return !empty($queryResponse)&&
				$queryResponse->code == "10000"&&
				($queryResponse->trade_status == "TRADE_SUCCESS"||
					$queryResponse->trade_status == "TRADE_FINISHED");
	}

	// 查询返回“交易关闭”
	protected function queryClose($queryResponse){
		return !empty($queryResponse)&&
		$queryResponse->code == "10000"&&
		$queryResponse->trade_status == "TRADE_CLOSED";
	}

	// 交易异常，或发生系统错误
	protected function tradeError($response){
		return empty($response)||
					$response->code == "20000";
	}


	public function cancel($cancelContentBuilder) {
		$biz_content= $cancelContentBuilder->getBizContent();
		//$this->writeLog($biz_content);
		$request = new AlipayTradeCancelRequest();
		$request->setBizContent ( $biz_content );
		$response = $this->aopclientRequestExecute ( $request ,NULL ,$cancelContentBuilder->getAppAuthToken() );
		return $response->alipay_trade_cancel_response;
	}

	/**
	 * 使用SDK执行提交页面接口请求
	 * @param unknown $request
	 * @param string $token
	 * @param string $appAuthToken
	 * @return string $$result
	 */
	private function aopclientRequestExecute($request, $token = NULL, $appAuthToken = NULL) {

		$aop = new AopClient ();
		$aop->gatewayUrl = $this->gateway_url;
		$aop->appId = $this->appid;
		$aop->signType = $this->sign_type;
		//$aop->rsaPrivateKeyFilePath = $this->private_key;
		$aop->rsaPrivateKey = $this->private_key;
		//$aop->alipayPublicKey = $this->alipay_public_key;
		$aop->alipayrsaPublicKey = $this->alipay_public_key;
		$aop->apiVersion = "1.0";
		$aop->postCharset = $this->charset;


		$aop->format=$this->format;
		// 开启页面信息输出
		$aop->debugInfo=true;
		$result = $aop->execute($request,$token,$appAuthToken);

		//打开后，将url形式请求报文写入log文件
		//$this->writeLog("response: ".var_export($result,true));
		return $result;
	}

	function writeLog($text) {
		// $text=iconv("GBK", "UTF-8//IGNORE", $text);
		//$text = characet ( $text );
		file_put_contents ( "log/log.txt", date ( "Y-m-d H:i:s" ) . "  " . $text . "\r\n", FILE_APPEND );
	}

	/** *利用google api生成二维码图片
	 * $content：二维码内容参数
	 * $size：生成二维码的尺寸，宽度和高度的值
	 * $lev：可选参数，纠错等级
	 * $margin：生成的二维码离边框的距离
	 */
	function create_erweima($content, $size = '200', $lev = 'L', $margin= '0') {
		$content = urlencode($content);
		$image = '<img src="http://chart.apis.google.com/chart?chs='.$size.'x'.$size.'&amp;cht=qr&chld='.$lev.'|'.$margin.'&amp;chl='.$content.'"  widht="'.$size.'" height="'.$size.'" />';
		return $image;
	}

	function ceshi($post){

        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
//        $outTradeNo = "qrpay".date('Ymdhis').mt_rand(100,1000);
        $outTradeNo = $post["order_no"];

        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
        $subject = "订单号：".$post["order_no"];
//        $subject="xxx品牌xxx门店当面付扫码消费";
        // (必填) 订单总金额，单位为元，不能超过1亿元
        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
        $totalAmount = $post["total_price"];
//        $totalAmount="123";

        // (不推荐使用) 订单可打折金额，可以配合商家平台配置折扣活动，如果订单部分商品参与打折，可以将部分商品总价填写至此字段，默认全部商品可打折
        // 如果该值未传入,但传入了【订单总金额】,【不可打折金额】 则该值默认为【订单总金额】- 【不可打折金额】
        //String discountableAmount = "1.00"; //

        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
        $undiscountableAmount = "0.01";

        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
        //$sellerId = "";

        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
//        $body = "购买商品2件共15.00元";
        $body=$post["order_no"];
        //商户操作员编号，添加此参数可以为商户操作员做销售统计
//	$operatorId = "test_operator_id";

        // (可选) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
//	$storeId = "2088102170410181";

        // 支付宝的店铺编号
//	$alipayStoreId= "test_alipay_store_id";

        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，系统商开发使用,详情请咨询支付宝技术支持
        $providerId = ""; //系统商pid,作为系统商返佣数据提取的依据
        $extendParams = new ExtendParams();
        $extendParams->setSysServiceProviderId($providerId);
        $extendParamsArr = $extendParams->getExtendParams();

        // 支付超时，线下扫码交易定义为5分钟
        $timeExpress = "5m";

        // 商品明细列表，需填写购买商品详细信息，
        $goodsDetailList = array();

        // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
        $goods1 = new GoodsDetail();
        $goods1->setGoodsId("apple-01");
        $goods1->setGoodsName("iphone");
        $goods1->setPrice(3000);
        $goods1->setQuantity(1);
        //得到商品1明细数组
        $goods1Arr = $goods1->getGoodsDetail();

        // 继续创建并添加第一条商品信息，用户购买的产品为“xx牙刷”，单价为5.05元，购买了两件
        $goods2 = new GoodsDetail();
        $goods2->setGoodsId("apple-02");
        $goods2->setGoodsName("ipad");
        $goods2->setPrice(1000);
        $goods2->setQuantity(1);
        //得到商品1明细数组
        $goods2Arr = $goods2->getGoodsDetail();

        $goodsDetailList = array($goods1Arr,$goods2Arr);

        //第三方应用授权令牌,商户授权系统商开发模式下使用
        $appAuthToken = "";//根据真实值填写

        // 创建请求builder，设置请求参数
        $qrPayRequestBuilder = new AlipayTradePrecreateContentBuilder();
        $qrPayRequestBuilder->setOutTradeNo($outTradeNo);//订单号
        $qrPayRequestBuilder->setTotalAmount($totalAmount);//订单金额
        $qrPayRequestBuilder->setTimeExpress($timeExpress);//支付超时
        $qrPayRequestBuilder->setSubject($subject);//订单标题
        $qrPayRequestBuilder->setBody($body);//订单描述
        $qrPayRequestBuilder->setUndiscountableAmount($undiscountableAmount);
        $qrPayRequestBuilder->setExtendParams($extendParamsArr);
        $qrPayRequestBuilder->setGoodsDetailList($goodsDetailList);
//	$qrPayRequestBuilder->setStoreId($storeId);
//	$qrPayRequestBuilder->setOperatorId($operatorId);
//	$qrPayRequestBuilder->setAlipayStoreId($alipayStoreId);

        $qrPayRequestBuilder->setAppAuthToken($appAuthToken);
//
//
//        // 调用qrPay方法获取当面付应答
//        $qrPay = new AlipayTradeService($config);
        $qrPayResult = $this->qrPay($qrPayRequestBuilder);
        return $qrPayResult;
    }

}