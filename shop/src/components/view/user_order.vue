<template>
  <div id="user_order">
      <div id="content">
        <p id="title">我的订单</p>
        <table width="100%" id="table_title">
          <thead>
            <tr>
              <td width="10%"></td>
              <td width="60%">商品信息</td>
              <td width="10%">单价</td>
              <td width="10%">数量</td>
              <td width="10%">合计</td>
            </tr>
          </thead>
        </table>

        <div id="order_detail" v-for="item in orderList"> 
          <table width="100%">
            <tbody>
              <tr id="order_detail1">
                <td colspan="5"><span>订单号：{{item.order_no}}</span><span>{{item.create_time}}</span><span>收件人：{{item.receiver_name}}</span><span>订单状态：{{item.status|newStatus}}</span><span>订单总价：<span style="color:#c60023;font-weight:bold;">{{item.total_price}}</span></span><span id="right" @click="to(item.order_no)">查看详情></span></td>
              </tr>
              <tr id="order_detail2"> 
                <td width="10%">
                  <img class="order_img" :src="item.product_image" alt="无法显示图片，请刷新">
                </td>
                <td width="60%" @click="toProduct(item.product_id)" id="product_name"><span>{{item.product_name}}</span></td>
                <td width="10%">{{item.current_unit_price}}</td>
                <td width="10%">{{item.quantity}}</td>
                <td width="10%">{{item.total_price}}</td>
              </tr>
            </tbody>
          </table>
        </div> 
      </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      id:0,
      orderList:[],
      isShow:false

    }
  },
  filters: {
    newStatus(value){
      switch (value) {
        case "10":
          return "未付款";
          break;

        case "20":
          return "已付款";
          break;
      
        default:
          return value;
          break;
      }
    }
  },
  mounted () {
    this.id=sessionStorage.getItem("userId");
    const _this=this;
    this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getUserOrderList&userId="+this.id)
              .then(response=>{
                if (response.data!="0-") {
                  _this.orderList=response.data;
                }
              })
  },
  methods: {
    toProduct(product_id){
      this.$router.push("/product/"+product_id);
    },
    to(order_no){
this.$router.push("/user_center/user_orderMsg/"+order_no);
    }
  }
}
</script>

<style scoped>
#content{
  padding: 10px;
  
}
.order_img{
  width: 82px;
  height: 82px;border:1px solid #ddd;
}
#title{
  font-size: 15px;
  color: #666;
  font-weight: 700;
}
#table_title{
  margin-top: 10px;
  background: #eee;
}
#table_title td{
   padding: 10px; 
   font-size: 13px;
   color: #666;
   font-weight: 700;
}
#order_detail{
  margin-top: 15px;
}
#order_detail1{
  font-size: 13px;
  
}
#order_detail1 td{
  padding: 10px;
  background: #eee;
}
#order_detail1 span{
  margin-right: 30px;
  color: #999;
}
#right{
  float: right;
  font-weight: 800;
}
#right:hover{
  color: #1E90FF;
  text-decoration: underline;
  cursor: pointer;
}
#order_detail2 td{
  padding: 10px;
  background: #fafafa;
  font-size: 13px;
  color: #999;
}
#order_detail2 #product_name span:hover{
  color: #1E90FF;
  text-decoration: underline;
  cursor: pointer;
}
</style>
