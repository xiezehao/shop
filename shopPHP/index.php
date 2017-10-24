<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST,GET,OPTIONS');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
//header("Access-Control-Allow-Headers: X-Custom-Header");
include_once './alipay/aop/AopClient.php';
include_once "./alipay/f2fpay/service/AlipayTradeService.php";
include_once './alipay/f2fpay/model/result/AlipayF2FPayResult.php';
include_once './alipay/f2fpay/model/result/AlipayF2FQueryResult.php';
include_once './alipay/f2fpay/model/result/AlipayF2FRefundResult.php';
include_once './alipay/f2fpay/model/result/AlipayF2FPrecreateResult.php';
include_once './alipay/f2fpay/model/builder/AlipayTradeQueryContentBuilder.php';
include_once './alipay/f2fpay/model/builder/AlipayTradeCancelContentBuilder.php';
include_once './alipay/f2fpay/model/builder/AlipayTradePrecreateContentBuilder.php';
include_once './alipay/aop/request/AlipayTradePrecreateRequest.php';

//自动加载
spl_autoload_register(function ($class_name) {
    if (strstr($class_name,"Controller")){
        require "./controller/".$class_name . '.php';
    }else{
        require "./model/".$class_name . '.php';
    }
});


$c;//控制器
$f;//控制器方法名字
$c=$_REQUEST["c"];
$f=$_REQUEST["f"];

$controller=$c."Controller";
$index=new $controller();
$index->$f();
