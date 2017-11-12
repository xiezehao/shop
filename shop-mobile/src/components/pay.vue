<template>
  <div>
    <p>订单提交成功，请您尽快支付! <br>订单号：<strong>{{order_no}}</strong></p>
    <p>请使用<span style="font-size:28px;font-weight:bold;color:#1E90FF;"> 支付宝 沙箱版 </span>扫描如下二维码进行支付：</p>
    <div class="qr">
        <img :src="qrImg" alt="无法显示二维码，请刷新">
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      order_no:this.$route.params.order_no,
      total:this.$route.params.total,
      intervalId:0,
      qrImg:"",
    }
  },
  beforeDestroy(){
    clearInterval(this.intervalId);
  },
  mounted () {
    // console.log(this.$route)
    const params=new URLSearchParams();
      params.set("c","Pay");
      params.set("f","pay");
      params.set("order_no",this.$route.params.order_no);
      params.set("total_price",this.$route.params.total);
      this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
            .then(response=>{
                // console.log(response)
                this.qrImg="http://qr.liantu.com/api.php?&w=200&text="+response.data["qr_code"];
            })
            .catch(error=>{
                // console.log(error)
            });
      const params2=new URLSearchParams();
      params2.set("c","Order");
      params2.set("f","getOrderStatus");
      params2.set("order_no",this.$route.params.order_no);
      
      const _this=this;
      this.intervalId=setInterval(()=>{
          
        _this.axios.post("https://www.xiezehao.com/shop/shopPHP/index.php",params2)
                .then(response=>{
                    // console.log("getOrderStatus");
                    var status=response.data[0].status;
                    if (status=="20") {
                        _this.$router.push("/pay_success");
                    }
                });
      },5000);
  }
}
</script>

<style scoped>
.qr{
  text-align: center;
}
</style>
