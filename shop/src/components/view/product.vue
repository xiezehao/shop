<template>
  <div>
      <shopHeader></shopHeader>
      <div id="product">
            <div style="display: block;">
              <div id="imgDiv">
                <img id="main_img" :src="sub_iamges[imgIndex]" alt="">
                <div id="imgList">
                    <img v-for="(item,index) in sub_iamges" :src="item" alt="" @mouseover="imgIndex=index">
                </div>
              </div>
              <div id="detail">
                <div id="title">
                    <span>{{productMsg.name}}</span>
                </div>

                <p class="red activity">{{productMsg.subtitle}}</p>
            
                <div id="price">
                    <span id="span1">价格:<span class="red span2">{{productMsg.price}}</span></span>
                </div>
                <div id="stock">
                    <span id="span3">库存:<span class="span4">{{productMsg.stock}}</span></span>
                </div>

                <div id="count">
                    <span id="span5">数量:</span>
                    <button id="add" class="span" @click="add">+</button>
                    <span id="p-count" class="span">{{quantity}}</span>
                    <button id="reduce" class="span" @click="reduce">-</button>
                </div>

                <button id="buy" @click="to">立即购买</button>
                 <!-- <span id="shopcar">加入购物车</span> 
                 <span>购物车已存在该商品</span> -->
              </div>
            </div>
            

            <div id="productDetail">
                <div id="nav">
                    <a href="javascript:void(0);">商品详情</a>
                </div>
                <div v-html="productMsg.detail" style="text-align: center;padding-top:10px;"></div>
            </div>
      </div>
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
  components: {
      shopHeader
  },
  data () {
      return {
        userId:0,
        product_id:this.$route.params.product_id,
        productMsg:[],
        sub_iamges:[],
        quantity:1,
        imgIndex:0      
      }
  },
  mounted () {
    this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Product&f=productMsg&product_id="+this.product_id)
              .then(response=>{
                  this.productMsg=response.data[0];
                  this.sub_iamges=this.productMsg.sub_iamges.split(",");
              })  
  },
  methods: {
      to(){
          this.userId=sessionStorage.getItem("userId");
          if (this.userId) {
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
            params.set("quantity",this.quantity);
            params.set("total_price",this.productMsg.price*this.quantity);
            this.axios.post("https://www.xiezehao.com/shop/shopPHP/index.php",params)
                        .then(response=>{
                            // console.log(response)
                            this.$router.push("/confirm/"+order_no);
                        });
          }else{
              this.$router.push("/login");
          }
          
      },
      add(){
        this.quantity++;
      },
      reduce(){
          if (this.quantity==1) {
              this.quantity=1;
          }else{
              this.quantity--;
          }
      }
  }
}
</script>

<style scoped>
.red{
    color: #c60023;
}
#product{
    width: 1085px;
    /* height: auto;    */
    margin: 0 auto;
}
#imgDiv{
    /* width: 420px;
    height: 515px; */
    margin-right: 10px;
     float: left; 
     display: inline-block; 
    /* display: block; */
}
#main_img{
    width: 420px;
    height: 400px;
}
#imgList img{
    width: 98px;
    height: 98px;
    margin-right: 6px;
    border: 1px solid #eee;
    overflow: hidden;
}
#imgList img:hover{
    border: 1px solid #c60023;
}
#detail{
     width: 650px; 
     /* display: inline; */
    /* display: block; */
     float: left; 
    /* display: inline-block;  */
}
#title{
    font-size: 20px;
}
.activity{
    margin-top: 10px;
}
#price{
    margin-top: 20px;
    background: #eee;
    padding: 10px;
}
#span1,#stock #span3{
    font-size: 12px;
    color: #999;
}
.span2{
    font-size: 18px;
    margin-left: 25px;
}
#stock {
    margin-top: 20px;
    margin-left: 10px;
}
#stock .span4{
    font-size: 12px;
    margin-left: 25px;
    color: black;
}
#count{
    margin-top: 20px;
    margin-left: 10px;
}
#span5{
    font-size: 12px;
}
#add{
    margin-left: 22px;
}
#p-count{
    background: white;
    padding: 5px 10px;
    border: 1px solid black;
}
#add,#reduce{
    padding: 0 8px;
    background: white;
    /* padding: 5px 10px; */
    border: 1px solid black;
    cursor: pointer;
}
#buy{
    width: 125px;
    background: #c60023;
    height: 40px;
    border: none;
    margin-left: 10px;
    margin-top: 25px;
    outline: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
}
#shopcar{
    margin-left: 10px;
    color: #c60023;
    text-decoration: none;
    cursor: pointer;
}
#shopcar:hover{
    text-decoration: underline;
}
#productDetail{
    width: 1080px;
    margin: 0 auto;
     /* clear: both; 
      */
       float: left; 
       background: white;
}
#nav{
    height: 49px;
    background: #eee;
    border: 1px solid #ddd;
    border-bottom: 1px solid #c60023;
}
#nav a{
    width: 100px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    background: #c60023;
    color: white;
    font-size: 16px;
    padding: 15px 15px;
    text-decoration: none;
}
#productDetail p{
    text-align: center;
}
</style>
