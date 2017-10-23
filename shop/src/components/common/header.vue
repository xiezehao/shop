<template>
  <div id="header">
       <div id="nav">
           <div id="nav_content">
               <div id="nav_left">
                    <span v-show="username">欢迎，{{username}}</span>
                    <a href="javascript:void(0);" @click="signOut" v-show="username">退出</a>
                    <!-- <a href="/login">登录</a> -->
                    <router-link to="/login" v-show="!username">登陆</router-link>
                    <!-- <a href="#">注册</a> -->
                    <router-link to="/register"  v-show="!username">注册</router-link>
                </div>
                <div id="nav_right">
                    <!-- <router-link to="/user_center">个人中心</router-link> -->
                    <span @click="toUserCenter">个人中心</span>
                    <!-- <a href="#">个人中心</a> -->
                    <!-- <a href="#">购物车(0)</a> -->
                    
                    <span>关于豪商城</span>
                </div>
           </div>
          
      </div> 

      <div id="search">
        <div id="logo">
            <img src="../../assets/logo.jpg" alt="" srcset="" @click="home">
        </div>

        <div id="searchDiv">
            <input v-model="keyword" type="text" name="search" id="searchInput" placeholder="请搜索商品..." @keyup.enter="to"><button id="searchButton" @click="to">搜索</button>
        </div>
      </div>

      <div id="line">

        </div>
  </div>
</template>

<script>
import store from '@/vuex/store';
export default {
  name:"header",
  data () {
      return {
          msg:"asd",
          keyword:this.$route.params.keyword,
          username:"",
      }
  },
  mounted () {
    this.username=sessionStorage.getItem("username");
  },
  methods: {
      to:function(){
          if (this.keyword!=undefined) {
              this.$router.push("/productList/"+this.keyword);
          }
          
      },
      toUserCenter(){
          const userId=sessionStorage.getItem("userId");
          if (userId) {
              this.$router.push("/user_center");
          }else{
              this.$router.push("/login");

          }
        
      },
      home(){
          this.$router.push("/");
      },
      signOut(){
          sessionStorage.setItem("username","");
          sessionStorage.setItem("userId","");
          this.$router.go(0)
      }
  },store
}
</script>

<style scoped>
#header{
    width: 100%;
    margin-bottom: 10px;
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
#nav_left a,#nav_left span{
    color: #999;
    text-decoration: none;
    font-size: 12px;
}
#nav_left a:link,#nav_right span{
    color: #999;
    text-decoration: none;
    font-size: 12px;
}
#nav_left a:hover,#nav_right span:hover{
    color: #1E90FF;
    font-weight: bold;
    cursor: pointer;
}
#nav_right span{
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
    cursor: pointer;
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
