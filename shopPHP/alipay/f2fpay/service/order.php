<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/09 0009
 * Time: 14:02
 */

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST,GET,OPTIONS');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');

$server="localhost";
$username="root";
$password="Xie798351803";
$db_name="shop";

$link=new mysqli($server,$username,$password,$db_name) or die("无法连接数据库");
mysqli_query($link,"set names utf8");
$link->query("INSERT INTO `ceshi`(`id`, `order_id`, `status`) VALUES ('1','123456789','1')") or die("无法插入数据");
//$link->query("UPDATE `ceshi` SET `status`='2' WHERE `id`='1'") or die("无法插入数据");