<template>
  <div id="user_orderMsg">
    <div id="content">
        <div id="orderMsg">
            <p id="title">订单信息</p>
            <span>订单号：{{orderMsg.order_no}}</span><span>创建时间：{{orderMsg.create_time}}</span>
            <br>
            <span>收件人：{{orderMsg.receiver_name}}</span>
            <br>
            <span>收货地址：{{orderMsg.receiver_province}}省 {{orderMsg.receiver_city}}市 {{orderMsg.receiver_district}}(区/县) {{orderMsg.receiver_address}}</span>
            <br> 
            <span>订单状态：{{orderMsg.status|newStatus}}</span>
            <br>
            <span>支付方式：在线支付</span>
            <br>
            <button v-show="isShow" @click="to">付款</button>
        </div>

        <div id="line"></div>

        <div id="goods">
            <p id="title">商品清单</p>
            <table width="100%">
                <thead>
                    <tr>
                        <td width="10%"></td>
                        <td width="60%">商品信息</td>
                        <td width="10%">单价</td>
                        <td width="10%">数量</td>
                        <td width="10%">合计</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <img id="img" :src="orderMsg.product_image" alt="无法显示，请刷新">
                        </td>
                        <td>{{orderMsg.product_name}}</td>
                        <td>{{orderMsg.current_unit_price}}</td>
                        <td>{{orderMsg.quantity}}</td>
                        <td>{{orderMsg.total_price}}</td>
                    </tr>
                </tbody>
            </table>
            <p id="totalPrice">订单总价：<span style="color:#c60023;font-weight:bold;">¥{{orderMsg.total_price}}</span></p>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
      return {
          userId:0,
          orderMsg:{},
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
      const order_no=this.$route.params.order_no,_this=this;
      this.userId=sessionStorage.getItem("userId");
      this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getUserOrder&userId="+this.userId+"&order_no="+order_no)
                .then(response=>{
                    // console.log(response);
                    _this.orderMsg=response.data[0];
                    if (_this.orderMsg.status=="10") {
                        this.isShow=true;
                    }
                })
  },
  methods: {
      to(){
          this.$router.push({name:'payment',params:{order_no:this.orderMsg.order_no,total:this.orderMsg.total_price}});
      }
  }
}
</script>

<style scoped>
#content{
    padding-bottom: 10px;
}
#orderMsg{
    padding: 10px;
}
#orderMsg button{
    background: #1E90FF;
    color: white;
    border: none;
    outline: none;
    padding: 5px 10px;
    cursor: pointer;
}
#goods{
    padding: 10px;
}
#img{
    width: 82px;
    height: 82px;
}
#title{
    font-size: 14px;
    color: #666;
    font-weight: 700;
    margin-bottom: 10px;
}
#orderMsg span{
    line-height: 30px;
    font-size: 12px;
    margin-right: 20px;
}
#line{
    height: 15px;
    background: #f6f6f6;
}
#goods table thead td{
    font-size: 13px;
    padding: 10px;
    background: #eee;
    color: #666;
    font-weight: 700;
}
#goods table tbody td{
    font-size: 12px;
    padding: 10px;
    background: #fafafa;
    color: #999;
}
#totalPrice{
    text-align: right;
    margin-top: 10px;
    font-size: 14px;
    margin-right: 15px;
}
</style>
