<template>
  <div id="register">
    <logo></logo>

    <div id="content">
        <div id="registerDiv">
          <div id="title"> 
            <span>新用户注册</span>
          </div>
          <!-- 用户名 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/login/user.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请输入用户名">
          </div>
          <!-- 密码 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/login/password.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请输入密码">
          </div>

          <!-- 密码2 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/login/password.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请再次输入密码">
          </div>

          <!-- 电话 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/phone.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请输入电话">
          </div>

          <!-- 邮箱 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/email.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请输入邮箱">
          </div>

          <!-- 密码问题 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/wenhao.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请输入密码提示密码">
          </div>

          <!-- 密码答案 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/key.png" alt="">
            </div>
            <input type="text" name="" id="userInput" placeholder="请输入密码提示答案">
          </div>

          <div id="user" class="common input">
              <button>登陆</button>
          </div>

          <div id="user" class="common bottom">
              <span>已有账号，去登陆>></span>
          </div>


        </div>
    </div>
  </div>
</template>

<script>
import logo from "@/components/common/logo";
export default {
  components: {
      logo
  }
}
</script>

<style scoped>
#content{
  background: #1E90FF;
  padding: 25px 0;
}
#registerDiv{
  width: 400px;
  margin: 0 auto;
  background: white;

}
#title{
  line-height: 40px;
  color: #666;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  border-bottom: 1px solid #ddd;
}
.common{
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
