<template>
  <div>
      <shopHeader></shopHeader>
      <div id="content">
          <div id="user_left">
            <ul>
                <li v-for="(item,index) in user_left_list" :class="{active:index===isActive}" @click="change(index)">
                    <router-link :to="item.to">{{item.text}}</router-link>
                </li>
            </ul>
          </div>
          <div id="router-view">
            <router-view></router-view>
          </div>
      </div>
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
    data () {
        return {
            isActive:0,
            user_left_list:[
                {index:0,text:"个人中心",to:"/user_center/"},
                {index:1,text:"我的订单",to:"/user_center/user_order"},
                {index:2,text:"修改密码",to:"/user_center/modify_password"},
                {index:3,text:"收货地址",to:"/user_center/user_address"},
            ]
        }
    },
  components: {
      shopHeader
  },
  methods: {
      change(index){
        this.isActive=index;
      }
  }
}
</script>

<style scoped>

#content{
    width: 1080px;
    margin: 0 auto;
}
#user_left{
    float: left;
    color: #999;
    font-size: 12px;
    margin-right: 80px;
}
a{
    color: #999;
}
#user_left li a{
    /* color: #999; */
    text-decoration: none;
}
#user_left li{
    margin: 10px 0;
    cursor: pointer;
}
#user_left li a:hover{
    color: #1E90FF;
}
#router-view{
    width: 950px;
    float: left;
    background: white;
}
.active a{
    color:#1E90FF;
    font-weight: 700;
}
</style>
