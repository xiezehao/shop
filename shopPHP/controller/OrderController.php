<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/09 0009
 * Time: 22:54
 */

class OrderController extends BaseController
{
    public $link;

    public function __construct()
    {
        $link=new MySQLModel();
    }

    function order(){
        if (!empty($_REQUEST)){
            $order_no=$_REQUEST["order_no"];
            $user_id=$_REQUEST["user_id"];
            $shipping_id=$_REQUEST["shipping_id"];
            $payment=$_REQUEST["payment"];
            $payment_type="1";
            $postage="0";
            $status="10";
            $create_time=date("Y-m-d h:i:s");
            $update_time=date("Y-m-d h:i:s");
            $link=new MySQLModel();
            $result=$link->query("insert into `order`(`order_no`, `user_id`, `shipping_id`, `payment`, `payment_type`, `postage`, `status`, `create_time`, `update_time`)
                                                    VALUES
                                                    ('$order_no','$user_id','$shipping_id','$payment','$payment_type','$postage','$status','$create_time','$update_time')");


            echo json_encode($result);
        }
    }

    function order_item(){
        if (!empty($_REQUEST)){
            $link=new MySQLModel();
            $user_id=$_REQUEST["user_id"];
            $order_no=$_REQUEST["order_no"];
            $product_id=$_REQUEST["product_id"];
            $product_name=$_REQUEST["product_name"];
            $product_image=$_REQUEST["product_image"];
            $current_unit_price=$_REQUEST["current_unit_price"];
            $quantity=$_REQUEST["quantity"];
            $total_price=$_REQUEST["total_price"];
            $create_time=date("Y-m-d h:i:s");
            $update_time=date("Y-m-d h:i:s");
            $result=$link->query("insert into `order_item`(`user_id`, `order_no`, `product_id`, `product_name`, `product_image`, `current_unit_price`, `quantity`, `total_price`, `create_time`, `update_time`)
                                                    VALUES 
                                                    ('$user_id','$order_no','$product_id','$product_name','$product_image','$current_unit_price','$quantity','$total_price','$create_time','$update_time')");

            echo json_encode($result);
        }

    }

    function getOrder_item(){
        if (!empty($_REQUEST)){
            $order_no=$_REQUEST["order_no"];
            $link=new MySQLModel();
            $result=$link->query("select * from `order_item` where `order_no`='$order_no'");
            echo json_encode($result);
        }
    }

    function getOrderStatus(){
        if (!empty($_REQUEST)){
            $order_no=$_REQUEST["order_no"];
            $link=new MySQLModel();
            $result=$link->query("select * from `order` where `order_no`='$order_no'");
            echo json_encode($result);
        }
    }
}