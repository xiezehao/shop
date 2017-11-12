<template>
  <div>
       <p id="title2">豪商城</p> 
      <div id="login">
            <div id="loginDiv">
                <div id="title">
                    <span>用户登录</span>
                </div>

                <div id="user" class="input">
                    <div class="icon">
                        <img src="../assets/login/user.png" alt="">
                    </div>
                    <input type="text" name="" id="userInput" v-model="username" placeholder="请输入用户名">
                </div>

                <div id="user" class="input">
                    <div class="icon">
                        <img src="../assets/login/password.png" alt="">
                    </div>
                    <input type="password" name="" id="userInput" v-model="password" placeholder="请输入密码" @keydown.enter="login">
                </div>

                 <div id="user" class="input">
                    <button @click="login">登陆</button>
                </div>

                <!-- <div id="user" class="input bottom">
                    <router-link to="/register">免费注册</router-link>
                     <router-link to="/forgetPassword">忘记密码</router-link> 
                </div> -->
            </div>
        </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui';
export default {
  data () {
      return {
          username:'',
          password:''
      }
  },
  methods: {
      login(){
          this.axios.get('https://www.xiezehao.com/shop/shopPHP/?c=User&f=login&username='+this.username+'&password='+this.password)
                    .then(res=>{
                        // console.log(res);
                        if(res.data.code==100){
                            MessageBox.alert(res.data.msg, "登陆失败");
                        }else if(res.data.code==200){
                            MessageBox.alert("", "登陆成功");
                            // console.log(res.data.msg[0]);
                            sessionStorage.setItem("user",JSON.stringify(res.data.msg[0]));
                            sessionStorage.setItem("id",res.data.msg[0].id);
                            this.$router.push("/");
                        }else{
                            MessageBox.alert("", "未知错误");
                        }

                    })
      }
  }
}
</script>

<style scoped>

#login{
     background: #1E90FF; 
     /* padding: 20px; */
}
#loginDiv{
    width: 100%;
    margin: 0 auto; 
    background: white;
}
#title{
    height: 48px;
    line-height: 48px;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    font-size: 18px;
    font-weight: bold;
    color: #666;
    text-align: center;
    margin: 2px;
}
.input{
     /* width: 100%;  */
    height: 38px;
    border: 1px solid #bdbdbd;
    margin-top: 20px;
     margin-left: 10px; 
     margin-right: 10px;
}
.icon{
    width: 38px;
    height: 38px;
    background: #f3f3f3;
    text-align: center;
    display: inline-block;
}
.icon img{
    width: 22px;
    margin-top: 8px;
}

#userInput{
    width: 87%;
    height: 32px;
    position: relative;
    top:-5px;
    left: -2px;
     outline: none; 
     border: none;
}
.input button{
    width: 100%;
    height: 38px;
    /* margin-right: 100px; */
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
#title2{
    text-align: center;
    color: #1E90FF;
    font-size: 32px;
    margin: 5px;
}
</style>
