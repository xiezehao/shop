<template>

  <div class="user_address">
    <h3>收货地址</h3>
    <table>
      <thead>
        <tr>
          <th width="15%">收货人</th>
          <th width="25%">所在地区</th>
          <th width="25%">详细地址</th>
          <th width="8%">邮编</th>
          <th>手机</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item,index) in addressList" :key="index">
          <td>{{item.receiver_name}}</td>
          <td>{{item.receiver_province}} {{item.receiver_city}} {{item.receiver_district}}</td>
          <td>{{item.receiver_address}}</td>
          <td>{{item.receiver_zip}}</td>
          <td>{{item.receiver_moblie}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data () {
    return {
      user_id:0,
      addressList:[]  
    }
  },
  mounted () {
    this.user_id=sessionStorage.getItem("userId");
    this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getShipping&user_id="+this.user_id)
              .then(res=>{
                console.log(res);
                if (res.data!="0-") {
                  this.addressList=res.data;
                }
              })
  }
}
</script>

<style scoped>
.user_address{
  padding: 5px;
}
h3{
  font-weight: bold;
  font-size: 14px;
}
table{
  border: 1px solid #e7e7e7;
  margin-top: 10px;
  width: 100%;
  
}
th{
  font-size: 14px;
  height: 40px;
  line-height: 40px;
  background: #f2f2f2;
  font-weight: bold;
  padding-left: 5px;
}
td{
  font-size: 14px;
  height: 40px;
  padding-left: 5px;
}
tr:hover td{
  background: #eee;
}
tr{
  border-bottom: 1px solid #e7e7e7;
}
</style>
