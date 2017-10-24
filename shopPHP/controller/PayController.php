<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/11 0011
 * Time: 23:38
 */

class PayController extends BaseController
{

    function pay(){
        $config = array (
            //签名方式,默认为RSA2(RSA2048)
            'sign_type' => "RSA2",

            //支付宝公钥
            'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4TgxzARBOGEDH4RelqNqQ3gsv0yl6z/WOP3E0uInRRLUScg4wR5RdIJbV9guWUvLZR5ZaI99bUDzkaoiTt+lz8ute1mk22PyWNrBAV807XygFaf6LK9so9qwq5lhoN1QuUj+2checqNe9wS13QlOvZbVdzqicuKwuHHBQZ425ZCkPPQ1tOepOdtCsVe12/fw3Uca9/1IHkfLuqHPiG7kJSZfVXXZb8eFbGoAOs634xv9eFlTe/df22+PsX8s0K/24TMdrU+RK95m3tmEYeyz7Nzkzzf+zTHeQAuvJ6s6C/ACV4OTJbXXBys4AN9v/JXBdxM8Gzw8rRF3J0aNK0AjnQIDAQAB",

            //商户私钥
            'merchant_private_key' => "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCT2YVW8grz0aB8fnSnCKjzdF32fOrkK/ARnrbhaqjcX5odIwpCx47DsRlPoAnbgj42pGti9XfSjtt9TdWg+jVdwd29o6AhhMlM4i9Aj8rA1Qktfe4VlroYksCC3JKcjyQHvIZflfilmTIoNsXGvYPOQwI9RsRBJCBWPpDioXJ1Z0HGYes13NpqEMQTtDIJvIC1C/JdLJi0lFeS/uotSnLPrxS5WGuj5Sc3C8gO+Kl6vprSUviN5BXz4rMdwhrB+M5YtilGFqpKDulityWhs2LvWAQlDadE9KmNx+mtSx+rZKSxZPOKr6jsUmz94bHpAXOyCPNoUi5cZMMiIb0V9HdjAgMBAAECggEAG3UbIUGELTGyF0y4x0iBb+0dgihCyyspw2vxVL2lLIAIs/6M6kf7SHZ8V+BF1GFEwosYcmFZ5l2nf4bT9Lhi7s2RK6XWmEL7y256DghmRBeMQ8mOTK4YU3X1kJf8Fl0y+MjXP6svaTmhKfy6ECWj88tYAB9DVUGrS7kE2UHYatr/WZOdNdF5WaEFQ0MvJMPOpQrl/ZMRWW+8Lzq3CL+h0vv/FjqEQ3tuD3+8lM9nZpvE1nZ4ckyhx8a+NAXvTQv5mQrivFdWRAkldvp+dK5kNnlRW7crMk4nNvsLnbW+S5xPX+QbjbYUgMo7zmuRyYSLwgMVsg2hAhJGgVHgim/34QKBgQDxLic1E0LtlwmAWWhpdxpiUlRCRw0vAo8PjFO9HX6kDYPt4VWr1eFxSVT1uj3msqmNQXObbETuXzf/xaSB2JOkCche/QS4wYZ/ewcdUG/rBLl0T2wu40eC8q+NuJV3bykBriJ/dujPR4PRKkcjHTP2Z9DWTWqx7iyzF5cU9SdoUQKBgQCc7z8BveuILSZKmYmM9vGN0ybZiKDgVdl/UvsOXSosYxm2n/GIjKtmca7pScV2aIXjjpLISAcEUd/EzphSUsSKAsbsu9Px10uIK3Vx3EG+8yXagMqHmZOKvnfcOVWuQ7VLool0GiL5DLf2yH12xh3aX3do8wnqseuShWlyl0srcwKBgQDFCbXScMgPH4QNrf3VnA6cITLhavbkXyzNwRFwwbYDBV+xapT5bCVgzk5w6xVDctd+pehzJAM00+oGNkxuIKiOLcfbgs7muoTNhY+MbXjiAtwYoAJ8VAbKfsbZ++Fw0Aoqaz+X72fIYF7a9bVkhKk9OBev3VO7xiASuMUfxCHL4QKBgQCVX/QtCEUkPTVxVGtkzbhmMlGMRUw7u/tmAeoNZgg6b6mN9vfD7YFH5XWDgEB/0EWAr7hvAoALUJMZlTvPQBDq/HGz66R1UWQHnLYRRoEd6/pf3K7qGvgg2+Lir4AqezAZagBDjo0zWTPRpkwlvbW0oaHbN1p9FhUQRgR0miVmmQKBgQC+A71F9+ieT5eHxdEA2/6yy2zEiHIVFTUkA0JvDks71HFo3e6/DODdtr4BG0b1dWxvesTUH4yUbyP/sL6H1U/fx/ur3cDRg5zq70iwnh2MT6Go5VXzUupax6XJxlNg7+6x9rZeZIdLT76jjtV6LcYT7YJWQCzCOGZGBcgxDUspeQ==",

            //编码格式
            'charset' => "UTF-8",

            //支付宝网关
            'gatewayUrl' => "https://openapi.alipaydev.com/gateway.do",

            //应用ID
            'app_id' => "2016080800191559",

            //异步通知地址,只有扫码支付预下单可用
            'notify_url' => "https://www.xiezehao.com/shop/shopPHP/?c=Pay&f=callback",

            //最大查询重试次数
            'MaxQueryRetry' => "10",

            //查询间隔
            'QueryDuration' => "3"
        );
        $AlipayTradeService = new AlipayTradeService($config);
        $qrPayResult=$AlipayTradeService->ceshi($_REQUEST);
        echo json_encode((array)$qrPayResult->getResponse());
    }

    function callback(){
        $order_no=$_REQUEST["out_trade_no"];//订单号
        $payment_creation_time=$_REQUEST["gmt_create"];//交易创建时间
        $payment_time=$_REQUEST["gmt_payment"];//订单交易支付时间
        $end_time=$_REQUEST["gmt_close"];//订单交易完成时间
        $link=new MySQLModel();
        $result=$link->query("update `order` set `status`='20',`payment_creation_time`='$payment_creation_time',`payment_time`='$payment_time',`end_time`='$end_time' where `order_no`='$order_no'");
        echo json_encode($result);
    }

}