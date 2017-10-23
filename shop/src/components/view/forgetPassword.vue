<template>
  <div>
    <logo></logo>
    <div id="content">
      <div id="title">
        <h1>找回密码</h1>
      </div>
      <!-- 第一步 -->
      <div id="form" v-show="isShow">
        <p>请输入用户名：</p>
        <div>
          <div id="imgDiv">
            <img src="../../assets/login/user.png" alt="">
          </div><input v-model="username" type="text" placeholder="请输入用户名">
          <button id="next" @click="next">下一步</button>
        </div>
      </div>

      <div id="question" v-show="isShow2">
        <p>密码提示问题为：{{user.question}}</p>
        <p>请输入密码提示答案：</p>
        <div id="imgDiv">
            <img src="../../assets/login/password.png" alt="">
        </div><input v-model="answer" type="text" placeholder="请输入答案">
        <button id="next" @click="next2">下一步</button>
      </div>
      <div id="tijiao" v-show="isShow3">
        <p>请输入新密码</p>
        <div id="imgDiv">
            <img src="../../assets/login/password.png" alt="">
        </div><input v-model="newPassword" type="text" placeholder="请输入新密码">
        <button id="next" @click="next3">提交</button>
      </div>
      
    </div>
  </div>
</template>

<script>
import logo from "@/components/common/logo"
export default {
  data () {
    return {
      isShow:true, 
      isShow2:false,
      isShow3:false,
      username:'',
      answer:"",
      user:[],
      newPassword:""
    }
  },
  components: {
    logo
  },
  methods: {
    next(){
      if (this.username!="") {
        this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getUserByUsername&username="+this.username)
                  .then(response=>{
                  // console.log(response);
                  if (response.data.code=="100") {
                    alert(response.data.msg);
                  }else if(response.data.code=="200"){
                    this.user=response.data.msg[0];
                    this.isShow=false;
                    this.isShow2=true;
                    this.isShow3=false;
                    // console.log(this.user);
                  }else{
                    alert("发生未知错误，请重新点击");
                  }
                });
      }else{
        alert("用户名不能空");
      }
    },
    next2(){
      if (this.answer=="") {
        alert("答案不能为空");
      }else{
        if (this.user.answer==this.answer) {
          this.isShow=false;
          this.isShow2=false;
          this.isShow3=true;
        }else{
          alert("答案不相符");
        }
      }
    },
    next3(){
      const id=this.user.id;
      if (this.newPassword!="") {
        this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=changePassword&id="+id+"&password="+this.newPassword)
                  .then(response=>{
                    // console.log(response);
                    if (response.data.code=="200") {
                      alert(response.data.msg);
                      this.$router.push("/login");
                    }else{
                      alert("发生未知错误");
                    }
                  })
      }else{
        alert("密码不能空");
      }
    }
  }
}
</script>

<style scoped>
#content{
  width: 360px;
  margin: 0 auto;
  background: #fff;
  margin-top: 20px;
}
#title{
  padding: 20px 0;
  text-align: center;
  font-size: 18px;
  
  border-bottom: 1px solid #ddd;
}
#title h1{
  font-weight: 700;
}
#form,#question,#tijiao{
  padding: 20px;
}
#form p,#question p,#tijiao p{
  font-size: 14px;
  padding: 0 0 10px;
}
#imgDiv{
  width: 38px;
  height: 38px;
   display: inline-block; 
  background: #eee;
  line-height: 38px;
  text-align: center;
  border: 1px solid #bdbdbd;
}
#imgDiv img,#question img,#tijiao img{
  width: 18px;
  height: 18px;
}
#form input,#question input,#tijiao input{
  width: 266px;
  height: 38px;
  border-left: none;
  border-top: 1px solid #bdbdbd;
  border-right: 1px solid #bdbdbd;
  border-bottom: 1px solid #bdbdbd;
  padding-left: 10px;
  outline: none;
}
#btn{
  padding: 0 20px;
}
#next{
  width: 100%;
  height: 40px;
  border: none;
  background: #1E90FF;
  color: white;
  font-size: 18px;
  outline: none;
  cursor: pointer;
  margin-top: 20px;
}
</style>
