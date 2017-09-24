<template>
    <div>
        <logo></logo>
        <div id="login">
            <div id="loginDiv">
                <div id="title">
                    <span>用户登录</span>
                </div>

                <div id="user" class="input">
                    <div class="icon">
                        <img src="../../assets/login/user.png" alt="">
                    </div>
                    <input type="text" name="" id="userInput" placeholder="请输入用户名">
                </div>

                <div id="user" class="input">
                    <div class="icon">
                        <img src="../../assets/login/password.png" alt="">
                    </div>
                    <input type="text" name="" id="userInput" placeholder="请输入密码">
                </div>

                 <div id="user" class="input">
                    <button>登陆</button>
                </div>

                <div id="user" class="input bottom">
                    <span>忘记密码</span>
                    <span>免费注册</span>
                </div>
            </div>
        </div>
    </div>
    
  
</template>

<script>
import logo from "@/components/common/logo"
export default {
  components: {
      logo
  }
}
</script>

<style scoped>
#login{
     background: #1E90FF; 
     padding: 20px;
}
#loginDiv{
    width: 400px;
    margin: 0 auto; 
    background: white;
}
#title{
    height: 48px;
    line-height: 48px;
    border-bottom: 1px solid #ddd;
    font-size: 18px;
    font-weight: bold;
    color: #666;
    text-align: center;
}
.input{
    width: 358px;
    height: 38px;
    border: 1px solid #bdbdbd;
    margin-top: 20px;
    margin-left: 20px;
}
.icon{
    width: 38px;
    height: 38px;
    background: #f3f3f3;
    text-align: center;
    display: inline-block;
    /* border: 1px solid #bdbdbd; */
}
.icon img{
    width: 22px;
    margin-top: 8px;
}
#userInput{
    /* display: inline-block; */
    width: 311px;
    height: 32px;
    position: relative;
    top:-5px;
    left: -2px;
     outline: none; 
     border: none;
}
.input button{
    width: 358px;
    height: 38px;
    background: #1E90FF;
    border: none;
    outline: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
}
.bottom{
    text-align: right;
    font-size: 12px;
    border: none;
}
.bottom span{
    color: #999;
}
.bottom span:hover{
    color: #1E90FF;
    cursor: pointer;
}
</style>
