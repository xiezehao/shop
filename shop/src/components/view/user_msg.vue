<template>
  <div id="user_msg">
      <div id="content">
        <div id="userMsg" v-show="show">
          <h3>我的信息</h3>
          <p>名字：{{user.username}}</p>
          <p>电话：{{user.phone}}</p>
          <p>邮箱：{{user.email}}</p>
          <p>问题：{{user.question}}</p>
          <p>答案：{{user.answer}}</p> 
          <button @click="show=false">编辑</button>
        </div>
        <div id="modifyMsg" v-show="!show">
          <h3>修改信息</h3>
           <p>名字：{{user["username"]}}</p>
          <p>电话：<input v-model="phone" type="text" /></p>
          <p>邮箱：<input v-model="email" type="text" :value="email"/></p>
          <p>问题：<input v-model="question" type="text" :value="question"/></p>
          <p>答案：<input v-model="answer" type="text" :value="answer"></p> 
          <button @click="modify">提交修改</button><button @click="show=true">返回</button>
        </div>
      </div>
  </div>
</template>

<script>
import store from '@/vuex/store'
export default {
  data () {
    return {
      user:{},
      phone:'',
      email:'',
      question:'',
      answer:'',
      show:true,
      userId:0,
    }
  },
  mounted () {
    this.userId=sessionStorage.getItem("userId");
    const _this=this;
    this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getUser&userId="+this.userId)
              .then(response=>{
                _this.user=response.data[0];
                _this.userId=response.data[0].id;
                _this.phone=response.data[0].phone;
                _this.email=response.data[0].email;
                _this.question=response.data[0].question;
                _this.answer=response.data[0].answer;
              })
  },
  methods: {
    modify(){
      const _this=this;
      const params=new URLSearchParams();
      params.set("c","User");
      params.set("f","modifyUser");
      params.set("id",this.userId);
      params.set("phone",this.phone);
      params.set("email",this.email);
      params.set("question",this.question);
      params.set("answer",this.answer);
      this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
                .then(response=>{
                  console.log(response);
                  if(response.data){
                    alert("修改成功");
                    _this.$router.go(0);
                  }
                })
    }
  }
}
</script>

<style scoped>
#user_msg{

}
#content{
  padding: 10px;
  color: #666;
  font-size: 14px;
}
hr{
  margin: 10px 0;
}
h3{
  font-weight: 700;
}
p{
  margin: 10px 0;
}
button{
  padding: 5px 10px;
  background: #1E90FF;
  color: white;
  border:none;
  cursor: pointer;
  outline: none;
  margin-right: 20px;
}
</style>
