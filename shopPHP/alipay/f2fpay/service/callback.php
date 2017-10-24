<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/09 0009
 * Time: 14:01
 */

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST,GET,OPTIONS');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');

$server="localhost";
$username="root";
$password="Xie798351803";
$db_name="shop";


$link=new mysqli($server,$username,$password,$db_name);
mysqli_query($link,"set names utf8");
$link->query("UPDATE `ceshi` SET `status`='2' WHERE `id`='1'");

