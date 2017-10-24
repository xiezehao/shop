<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/13 0013
 * Time: 11:12
 */

class UserController extends BaseController
{
    function register(){
        if (!empty($_REQUEST)){
            $username=$_REQUEST["username"];
            $password=$_REQUEST["password"];
            $email=$_REQUEST["email"];
            $phone=$_REQUEST["phone"];
            $question=$_REQUEST["question"];
            $answer=$_REQUEST["answer"];
            $role="1";
            $create_time=date("Y-m-d h:i:s");
            $update_time=date("Y-m-d h:i:s");
            $link=new MySQLModel();
            $result=$link->query("insert into `user` (`username`,`password`,`email`,`phone`,`question`,`answer`,`role`,`create_time`,`update_time`)
                                      VALUES 
                                      ('$username','$password','$email','$phone','$question','$answer','$role','$create_time','$update_time')");
            if (strstr($result,"1062")){
                $res["code"]="100";
                $res["msg"]="名字重复了，请重新填写";
                echo json_encode($res);
            }else if ($result==true){
                $res["code"]="200";
                $res["msg"]="成功注册";
                echo json_encode($res);
            }else{
                $res["code"]="101";
                $res["msg"]="发生未知错误";
                echo json_encode($res);
            }

        }
    }

    function login(){
        if (!empty($_REQUEST)){
            $username=$_REQUEST["username"];
            $password=$_REQUEST["password"];
            $link=new MySQLModel();
            $result=$link->query("select * from `user` where `username`='$username' and `password`='$password'");
            if ($result=='0-'){
                $res["code"]="100";
                $res["msg"]="登录失败，请检查用户名或密码是否正确";
                echo json_encode($res);

            }else{
                $res["code"]="200";
                $res["msg"]=$result;
                echo json_encode($res);
            }

        }
    }

    function getUser(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["userId"];
            $link=new MySQLModel();
            $result=$link->query("select * from `user` where `id`='$id'");
            echo json_encode($result);
        }
    }

    function modifyUser(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["id"];
            $phone=$_REQUEST["phone"];
            $email=$_REQUEST["email"];
            $question=$_REQUEST["question"];
            $answer=$_REQUEST["answer"];
            $link=new MySQLModel();
            $result=$link->query("update `user` set `phone`='$phone',`email`='$email',`question`='$question',`answer`=$answer where `id`='$id'");
            echo $result;
        }
    }

    function modifyPassword(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["id"];
            $oldPassword=$_REQUEST["oldPassword"];
            $newPassword=$_REQUEST["newPassword"];
            $link=new MySQLModel();
            $result=$link->query("update `user` set `password`='$newPassword' where `id`='$id' and `password` = '$oldPassword'");
            echo $result;
        }
    }

    function getUserOrderList(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["userId"];
            $link=new MySQLModel();
            $result=$link->query("select * from `order` as o,`order_item` as item,`shipping` as shipping where o.order_no=item.order_no and o.`user_id`='$id' and o.shipping_id=shipping.id order by o.`id` desc");
            echo json_encode($result);
        }
    }

    function getUserOrder(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["userId"];
            $order_no=$_REQUEST["order_no"];
            $link=new MySQLModel();
            $result=$link->query("select * from `order` as o,`order_item` as item,`shipping` as shipping where o.order_no=item.order_no and o.`user_id`='$id' and o.`order_no`='$order_no' and o.shipping_id=shipping.id");
            echo json_encode($result);
        }
    }

    function getShipping(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["user_id"];
            $link=new MySQLModel();
            $result=$link->query("select * from `shipping` where `user_id`='$id'");
            echo json_encode($result);
        }
    }

    function putShipping(){
        if (!empty($_REQUEST)){
            $id=$_REQUEST["user_id"];
            $receiver_name=$_REQUEST["receiver_name"];
            $receiver_phone=$_REQUEST["receiver_phone"];
            $receiver_moblie=$_REQUEST["receiver_moblie"];
            $receiver_province=$_REQUEST["receiver_province"];
            $receiver_city=$_REQUEST["receiver_city"];
            $receiver_district=$_REQUEST["receiver_district"];
            $receiver_address=$_REQUEST["receiver_address"];
            $receiver_zip=$_REQUEST["receiver_zip"];
            $create_time=date("Y-m-d h:i:s");
            $update_time=date("Y-m-d h:i:s");
            $link=new MySQLModel();
            $result=$link->query("insert into `shipping` (`user_id`,`receiver_name`, `receiver_phone`, `receiver_moblie`, `receiver_province`, `receiver_city`, `receiver_district`, `receiver_address`, `receiver_zip`, `create_time`, `update_time`)
                                                              VALUES 
                                                              ('$id','$receiver_name','$receiver_phone','$receiver_moblie','$receiver_province','$receiver_city','$receiver_district','$receiver_address','$receiver_zip','$create_time','$update_time')");
            echo json_encode($result);

        }
    }

    function getUserByUsername(){
        if (!empty($_REQUEST)){
            $username=$_REQUEST["username"];
            $link=new MySQLModel();
            $result=$link->query("select * from `user` where `username`='$username'");
            if ($result=="0-"){
                $res["code"]="100";
                $res["msg"]="查无此用户";
                echo json_encode($res);
            }else{
                $res["code"]="200";
                $res["msg"]=$result;
                echo json_encode($res);
            }
        }
    }

    function changePassword(){
        if (!empty($_REQUEST)){
            $user_id=$_REQUEST["id"];
            $password=$_REQUEST["password"];
            $link=new MySQLModel();
            $result=$link->query("update `user` set `password`='$password' where `id`='$user_id'");
            if ($result){
                $res["code"]="200";
                $res["msg"]="新密码设置成功，请重新登录";
                echo json_encode($res);
            }else{
                $res["code"]="100";
                $res["msg"]="发生未知错误";
                echo json_encode($res);
            }
        }
    }

}