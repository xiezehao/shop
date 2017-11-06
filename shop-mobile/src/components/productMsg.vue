<template>
  <div>
      <div id="swipe">
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="(item,index) in sub_image" :key="index">
                <img :src="item" alt="">
            </mt-swipe-item>
        </mt-swipe>
      </div>
      <div id="content">
        <p id="name">{{productMsg.name}}</p>
        <p id="subtitle">{{productMsg.subtitle}}</p>
        <div>
            <span id="price">价格：{{productMsg.price}}</span>
            <div id="count">
                <span id="add" @click="count++">+</span>
                <span>{{count}}</span>
                <span id="reduce" @click="reduce">-</span>
            </div>
            <span id="stock">库存：{{productMsg.stock}}</span>
        </div>

        <div id="detail" v-html="productMsg.detail" width='100%'>
            
        </div>

        <div id="btn" @click="buy">
            <p>立即购买</p>
        </div>
    
      </div>
  </div>
</template>

<script>
export default {
  data () {
      return {
          id:this.$route.params.id,
          productMsg:{},
          sub_image:[],
          count:1
      }
  },
  mounted () {
      this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Product&f=productMsg&product_id="+this.id)
                .then(res=>{
                    // console.log(res)
                    this.productMsg=res.data[0];
                    // console.log(res.data[0].sub_images)
                    this.sub_image=res.data[0].sub_iamges.split(",");
                    // console.log(this.sub_image);
                })
  },
  methods: {
      reduce(){
          if (this.count==1) {
              this.count=1
          }else{
              this.count--;
          }
      },
      buy(){
          let dateObject=new Date();
            let order_no=dateObject.getTime();
            const params=new URLSearchParams();
            params.set("c","Order");
            params.set("f","order_item");
            params.set("user_id","1");
            params.set("order_no",order_no);
            params.set("product_id",this.productMsg.id);
            params.set("product_name",this.productMsg.name);
            params.set("product_image",this.productMsg.main_image);
            params.set("current_unit_price",this.productMsg.price);
            params.set("quantity",this.count);
            params.set("total_price",this.productMsg.price*this.count);
            this.axios.post("https://www.xiezehao.com/shop/shopPHP/index.php",params)
                        .then(response=>{
                            this.$router.push("/orderMsg/"+order_no);
                        });
      }
  }
}
</script>

<style scoped>
#swipe{
     height: 150px; 
}
#swipe img{
    width: 100%;
    height: 150px;
}
#name{
    font-size: 14px;
    margin: 5px;
}
#subtitle{
    font-size: 12px;
    color: #c60023;
    margin-top: 0px;
    margin-left: 5px;
}
#price{
    font-size: 13px;
    margin-left: 5px;
     float: left; 
    text-align: left;
    color: #c60023;
}
#stock{
    font-size: 12px;
     float: right; 
    
     /* text-align: right; */
    margin-right: 5px;
}
#detail{
    width: 100%;
    clear: both;
    padding-top: 10px;
}
#detail>.detail-con>p>img{
    width: 100%;
}
#count{
     /* text-align: center;  */
    display: inline;
     margin-left: 60px; 
     /* margin: 0 auto;  */
     font-size: 12px;
}
#count span{
    border: 1px solid #cdcdcd;
    padding: 3px 5px;
}
#btn{
    width: 100%;
    position: fixed;
    bottom: 0;
    height: 40px;
    color: white;
    background: #c60023;
}
#btn p{
     line-height: 40px;  
    text-align: center;
margin: 0;
}
</style>
