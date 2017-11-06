<template>
  <div>
      <ul>
          <li>
              <img :src="order_item.product_image" alt="" id="image">
            <p id="name">{{order_item.product_name}}</p>
            <p id="message"><span id="price">价钱：{{order_item.current_unit_price}}</span><span id="count">数量：{{order_item.quantity}}</span></p>
          </li>
      </ul>
  </div>
</template>

<script>
export default {
  data () {
      return {
          order_no:this.$route.params.order_no,
          order_item:{},
      }
  },
  mounted () {
      const _this=this;
      this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Order&f=getOrder_item&order_no="+this.order_no)
                .then(res=>{
                    this.order_item=res.data[0];
                })
  },
  methods: {

  }
}
</script>

<style scoped>
ul{
    margin: 0;
    padding: 0;
}
li{
    list-style-type: none;
    padding: 0 10px;
}
#image{
    width: 30%;
    height: 90px;;
    float: left;
    margin-right: 5px;
}
#name{
    /* line-height: 90px; */
}
#message{
    clear: both;
    padding-top: 5px;
}
#count{
    float: right;
}
</style>
