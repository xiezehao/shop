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

    function getCategory(){
        $link=new MySQLModel();
        $result=$link->query("select `id`,`name` from `category` ");
        echo json_encode($result);
    }

    function getProductByCategoryId(){
        if ($_REQUEST){
            $category_id=$_REQUEST["category_id"];
            $link=new MySQLModel();
            $res=$link->query("select `id`,`name`,`main_image` from `product` where `category_id`='$category_id'");
            echo json_encode($res);
        }
    }

}