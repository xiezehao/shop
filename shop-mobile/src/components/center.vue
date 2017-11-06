<template>
  <div>
    <div id="top">
      <div id="touxiang">
        <img src="../assets/center/touxiang.png" alt="">
        <p>admin</p>
      </div>
    </div>
    <div id="content">
      <mt-cell title="个人信息" is-link to="/user_msg">
      </mt-cell>
      <mt-cell title="我的订单" is-link to="/userOrderList">
      </mt-cell>
      <mt-cell title="修改密码" is-link to="/mofityPassword">
      </mt-cell>
    </div>
  </div>
</template>

<script>
export default {
  
}
</script>

<style scoped>
#top{
  width: 100%;
  height: 150px;
  background: #1e90ff;
}
#touxiang{
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  text-align: center;
  padding: 0;
  margin: 0;
}
#touxiang p{
  font-size: 18px;
  margin-top: 10px;
  padding: 0;
  color: white;
}
#top img{
  width: 64px;
  height: 64px;
}
#content{
  margin-top: 20px;
}
</style>
