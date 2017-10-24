<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/09 0009
 * Time: 21:52
 */
class SearchController extends BaseController{

    function search(){
        if (!empty($_REQUEST)){
            $keyword=$_REQUEST["keyword"];
            $link=new MySQLModel();
            $result=$link->query("select * from `product` where `name` like '%$keyword%'");
            echo json_encode($result);
        }
    }
}