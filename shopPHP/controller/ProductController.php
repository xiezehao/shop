<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/10 0010
 * Time: 21:15
 */

class ProductController extends BaseController
{

    function productMsg(){
        if (!empty($_REQUEST)){
            $product_id=$_REQUEST["product_id"];
            $link=new MySQLModel();
            $result=$link->query("select * from `product` where `id`='$product_id'");
            echo json_encode($result);
        }

    }

}