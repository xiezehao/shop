<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/09/19 0019
 * Time: 14:42
 */

class MySQLModel extends BaseModel {

    public $server="localhost";
    public $username="root";
    public $password="";
    public $db_name="shop";
    public $link;

    function __construct()
    {
        $this->link=new mysqli($this->server,$this->username,$this->password,$this->db_name);
        mysqli_query($this->link,"set names utf8");
    }

    function __destruct()
    {
        // TODO: Implement __destruct() method.
        $this->link->close();
    }

    function link(){
        return $this->link;
    }

    function query($sql){
        if (strstr($sql,"select")){
            $reuslt=$this->link->query($sql)->fetch_all(MYSQLI_ASSOC);
        }else{
            $reuslt=$this->link->query($sql);
        }

        if ($reuslt){
            return $reuslt;
        }else{
            return mysqli_errno($this->link)."-".mysqli_error($this->link);
        }
    }

}
