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
            <input type="text" name="" id="userInput" v-model="username" placeholder="请输入用户名">
          </div>
          <!-- 密码 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/login/password.png" alt="">
            </div>
            <input type="password" name="" id="userInput" v-model="password" placeholder="请输入密码">
          </div>

          <!-- 密码2 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/login/password.png" alt="">
            </div>
            <input type="password" name="" id="userInput" v-model="password2" placeholder="请再次输入密码">
          </div>

          <!-- 电话 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/phone.png" alt="">
            </div>
            <input type="text" name="" id="userInput" v-model="phone" placeholder="请输入手机号码">
          </div>

          <!-- 邮箱 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/email.png" alt="">
            </div>
            <input type="text" name="" id="userInput" v-model="email" placeholder="请输入邮箱">
          </div>

          <!-- 密码问题 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/wenhao.png" alt="">
            </div>
            <input type="text" name="" id="userInput" v-model="question" placeholder="请输入密码提示密码">
          </div>

          <!-- 密码答案 -->
          <div class="common user">
            <div class="icon">
                <img src="../../assets/register/key.png" alt="">
            </div>
            <input type="text" name="" id="userInput" v-model="answer" placeholder="请输入密码提示答案">
          </div>

          <div id="user" class="common input" @click="register">
              <button>登陆</button>
          </div>

          <div id="user" class="common bottom">
              <router-link to="/login">已有账号，去登陆>></router-link>
          </div>


        </div>
    </div>
  </div>
</template>

<script>
import logo from "@/components/common/logo";
import store from "@/vuex/store";
export default {
  data () {
      return {
        username:'',
        password:'',
        password2:'',
        email:'',
        phone:'',
        question:'',
        answer:''
      }
  },
  methods: {
    register(){
        if (!this.username) {
            alert("请填写用户名");
            return;
        }
        if (!this.password) {
            alert("请填写密码");
            return;
        }
        if (!(this.password==this.password2)) {
            alert("两次密码不一样");
            return;
        }
        if (!/^1[34578]\d{9}$/.test(this.phone)) {
            alert("请填写正确的手机号码");
            return;
        }
        if (!/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/.test(this.email)) {
            alert("email填写错误");
            return;
        }
        if (!this.question||!this.answer) {
            alert("请填写问题和答案，用于找回密码");
            return;
        }
        const params=new URLSearchParams();
        params.set("c","User");
        params.set("f","register");
        params.set("username",this.username);
        params.set("password",this.password);
        params.set("email",this.email);
        params.set("phone",this.phone);
        params.set("question",this.question);
        params.set("answer",this.answer);
        const _this=this;
        this.axios.post(this.$store.state.url,params)
                  .then(response=>{
                      if (response.data.code=="200") {
                          alert(response.data.msg);
                          _this.$router.push("/register_success");
                      }else if (response.data.code=="100") {
                          alert(response.data.msg);
                      }
                  })
    }  
  },
  components: {
      logo
  },store
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
.bottom a{
    color: #999;
    text-decoration: none;
}
.bottom a:hover{
    color: #1E90FF;
    cursor: pointer;
}
</style>
