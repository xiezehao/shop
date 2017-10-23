<template>
  <div id="modify_password">
      <div id="content">
        <p>修改密码</p>
        <label for="oldPassword">原始密码：<input v-model="oldPassword" type="text" name="oldPassword"></label>
        <br>
        <label for="newPassword">新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input v-model="newPassword" type="text" name="newPassword"></label>
        <br>
        <label for="newPassword2">确认密码：<input v-model="newPassword2" type="text" name="newPassword2"></label>
        <br>
        <button @click="modify">提交修改</button>
      </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      userId:0,
      oldPassword:"",
      newPassword:"",
      newPassword2:""
    }
  },
  mounted () {
    this.userId=sessionStorage.getItem("userId");
  },
  methods: {
    modify(){
      const _this=this;
      const params=new URLSearchParams();
      params.set("c","User");
      params.set("f","modifyPassword");
      params.set("id",this.userId);
      params.set("oldPassword",this.oldPassword);
      params.set("newPassword",this.newPassword);
      this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
                .then(response=>{
                  console.log(response);
                  if (response.data) {
                    alert("修改成功,请重新登录");
                    sessionStorage.clear();
                    _this.$router.push("/login");
                  }
                })
    }
  }
}
</script>

<style scoped>
#content{
  padding: 10px;
  color: #666;
  font-size: 14px;
}
#content p{
  font-weight: 700;
}
#content input{
  margin: 10px 0 0 0;
  outline: none;
  margin-left: 20px;
}
#content button{
  background: #1E90FF;
  margin-top: 10px;
  color: white;
  font-size: 14px;
  border:none;
  outline: none;
  padding: 5px 10px;
}
</style>
