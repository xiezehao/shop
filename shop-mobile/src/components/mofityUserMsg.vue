<template>
  <div>
      <mt-header title="修改个人信息">
        <router-link to="/" slot="left">
            <mt-button icon="back"></mt-button>
        </router-link>
      </mt-header>

      <div id="content">
        <!-- <div><span>名字：</span><input type="text" v-model="username"></div>
        <div><span>电话：</span><input type="text" v-model="phone"></div>
        <div><span>邮箱：</span><input type="text" v-model="email"></div>
        <div><span>问题：</span><input type="text" v-model="question"></div>
        <div><span>答案：</span><input type="text" v-model="answer"></div>  -->
        <p>{{username}}</p>
        <!-- <mt-field label="名字：" placeholder="请输入名字" v-model="username" aria-disabled=""></mt-field> -->
        <mt-field label="电话：" placeholder="请输入电话" type="phone" v-model="phone"></mt-field>
        <mt-field label="邮箱：" placeholder="请输入邮箱" type="email" v-model="email"></mt-field>
        <mt-field label="问题：" placeholder="请输入问题" type="text" v-model="question"></mt-field>
        <mt-field label="答案：" placeholder="请输入答案" type="text" v-model="answer"></mt-field>
        <div id="btn">
        <mt-button type="primary" size="large" @click="mofity">修改</mt-button>
        </div>
        
      </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui';
export default {
  data () {
      return {
          userMsg:{},
          username:'',
          phone:'',
          email:'',
          question:'',
          answer:'',
          id:''
      }
  },
  mounted () {
      this.userMsg=JSON.parse(sessionStorage.getItem("user"));
      this.id=sessionStorage.getItem("id");
    //   console.log(this.id);
      this.username=this.userMsg.username;
      this.phone=this.userMsg.phone;
      this.email=this.userMsg.email;
      this.question=this.userMsg.question;
      this.answer=this.userMsg.answer;
  },
  methods: {
      mofity(){
          const params=new URLSearchParams();
        //   console.log(this.answer);
          params.set("c","User");
          params.set("f","modifyUser");
          params.set("id",this.id);
          params.set("phone",this.phone);
          params.set("email",this.email);
          params.set("question",this.question);
          params.set("answer",this.answer);
          this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
                    .then(res=>{
                        if(res.data=='1'){
                            MessageBox.alert("", "修改成功，请重新登录");
                            this.$router.push("/login");
                        }
                    })
      }
  }
}
</script>

<style scoped>
#content div{
    margin: 15px;
    /* box-sizing: border-box; */
}
#content span{
    width: 10%;
}
 #content input{
     width: 84%; 
} 
#content p{
    font-weight: bold;
    text-align: center;
    font-size: 18px;
}
</style>
