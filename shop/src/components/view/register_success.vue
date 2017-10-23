<template>
  <div>
      <logo></logo>
      <div id="success">
          <h1>注册成功</h1>
        <div id="login_btn">
            <router-link to="/login">去登陆</router-link>
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
#success{
    width: 1080px;
    margin: 0 auto;
    margin-top: 20px;
    padding: 20px 0;
    background: white;
}
h1{
    text-align: center;
    font-weight: bold;
    font-size: 25px;
}
#login_btn{
    margin-top: 20px;
    text-align: center;
}
#login_btn a{
    text-decoration: none;
    color: #999;
    font-size: 14px;
    border: 1px solid #999;
    padding: 3px 10px;
}
#login_btn a:hover{
    color: #1E90FF;
    border: 1px solid #1E90FF;
}
</style>
