<template>
  <div>
      <shopHeader></shopHeader>
      <div id="product">
            <div style="display: block;">
              <div id="imgDiv">
                <img id="main_img" src="../../assets/productList/productList.jpeg" alt="">
                <div id="imgList">
                    <img src="../../assets/productList/productList.jpeg" alt="">
                    <img src="../../assets/productList/productList.jpeg" alt="">
                    <img src="../../assets/productList/productList.jpeg" alt="">
                </div>
              </div>
              <div id="detail">
                <div id="title">
                    <span>【测试学习使用】Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干大容量 洗烘一体 厨卫家电</span>
                </div>

                <p class="red activity">门店机型 德邦送货</p>
            
                <div id="price">
                    <span id="span1">价格:<span class="red span2">¥4500</span></span>
                </div>
                <div id="stock">
                    <span id="span3">库存:<span class="span4">9985</span></span>
                </div>

                <div id="count">
                    <span id="span5">数量:</span>
                    <span id="add" class="span">+</span>
                    <span id="p-count" class="span">1</span>
                    <span id="reduce" class="span">-</span>
                </div>

                <button id="buy">立即购买</button>
                <a href="#" id="shopcar">加入购物车</a>
              </div>
            </div>
            

            <div id="productDetail">
                <div id="nav">
                    <a href="#">商品详情</a>
                </div>
                <p><img alt="1TB2WLZrcIaK.eBjSspjXXXL.XXa_!!2114960396.jpg" src="http://img.happymmall.com/ffcce953-81bd-463c-acd1-d690b263d6df.jpg" width="790" height="920"><img alt="2TB2zhOFbZCO.eBjSZFzXXaRiVXa_!!2114960396.jpg" src="http://img.happymmall.com/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg" width="790" height="1052"><img alt="3TB27mCtb7WM.eBjSZFhXXbdWpXa_!!2114960396.jpg" src="http://img.happymmall.com/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg" width="790" height="820"><br></p>
            </div>
      </div>
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
  components: {
      shopHeader
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
    margin-right: 10px;
    border: 1px solid #eee;
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
