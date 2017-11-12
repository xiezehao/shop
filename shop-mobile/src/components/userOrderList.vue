<template>
  <div>
      <mt-header title="我的订单">
        <router-link to="/" slot="left">
            <mt-button icon="back"></mt-button>
        </router-link>
      </mt-header>
      <div id="content">
        <ul>
          <li v-for="(item,index) in orderList" :key="index">
            <img :src="item.product_image" alt="">
            <div id="productMsg">
              <p id="productName">{{item.product_name}}</p>
              <p>
                <span id="quantity">x{{item.quantity}}</span>
                <span id="total_price">价钱：{{item.total_price}}</span>
                <span id="status">状态：{{item.status|status}}</span>
              </p>
            </div>
            
          </li>
        </ul>
      </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      orderList:[], 
      
    }
  },
  filters: {
    status(value){
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
    const id=sessionStorage.getItem("id");
    console.log(id);
    this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getUserOrderList&userId="+id)
              .then(res=>{
                // console.log(res)
                this.orderList=res.data;
                // console.log(this.orderList);
              })
  }
}
</script>

<style scoped>
ul{
  margin: 0;
  padding: 0;
}
li{
  height: 80px;
  list-style-type: none;
  border-bottom: 1px solid #cdcdcd;
  margin: 10px 10px 0 10px;
}
img{
  width: 20%;
}
li>img{
  float: left;
  /* margin-right: 5px; */
  /* padding: 5px; */
}
#productName{
  height: 36px;
  overflow: hidden;
  padding: 0;
  margin: 0;
}
#productMsg{
   float: left; 
    width: 80%; 
   font-size: 14px;
   padding-left: 10px;
   box-sizing: border-box;
}
#quantity,#status{
  color:#ccc;
  margin-right: 20px;
}
#total_price{
  font-size: 15px;
  color: red;
  margin-right: 20px;
  /* font-weight: bold; */
}
</style>
