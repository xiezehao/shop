<template>
  <div id="header">
       <div id="nav">
           <div id="nav_content">
               <div id="nav_left">
                    <a href="#">登录</a>
                    <a href="#">注册</a>
                </div>
                <div id="nav_right">
                    <a href="#">购物车(0)</a>
                    <a href="#">我的订单</a>
                    <a href="#">关于豪商城</a>
                </div>
           </div>
          
      </div> 

      <div id="search">
        <div id="logo">
            <img src="../../assets/logo.jpg" alt="" srcset="">
        </div>

        <div id="searchDiv">
            <input type="text" name="search" id="searchInput" placeholder="请搜索商品..."><button id="searchButton">搜索</button>
        </div>
      </div>

      <div id="line">

        </div>
  </div>
</template>

<script>
export default {
  name:"header",
  data () {
      return {
          msg:"asd"
      }
  }
}
</script>

<style scoped>
#header{
    width: 100%;
}
#nav{
    background: #eee;
}
#nav_content{
    width: 1080px;
    height: 30px;
    margin: 0 auto;
    
}
#nav_content a{
    color: #999;
}
#nav_left{
    float: left;
    line-height: 30px;
}
#nav_right{
    float: right;
    line-height: 30px;
}
#nav_left a:link,#nav_right a:link{
    color: #eee;
    text-decoration: none;
    font-size: 12px;
}
#nav_left a:hover,#nav_right a:hover{
    color: #1E90FF;
}
#nav_right a{
    margin-left: 10px;
}
#search{
    width: 1080px;
    margin: 25px auto;
}
#logo{
    width: 240px;
    height: 42px;
    display: inline;   
    margin-top: 30px;
    padding-left: 50px;
}
#searchDiv{
    display: inline;
    margin-left: 110px;
}
#searchInput{
    width: 550px;
    border: 2px solid #1E90FF;
    font-size: 15px;
    padding: 10px;
}
#searchButton{
    width: 80px;
    height: 44px;
    color: white;
    font-weight: bold;
    background: #1E90FF;
    border: none;
    font-size: 17px;
    outline: none;
    cursor: pointer;
}
#line{
    height: 2px;
    background: #1E90FF;
}
</style>
