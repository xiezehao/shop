<template>
  <div>
    <shopHeader></shopHeader>
    <div id="productList">
        <ul>
            <li>
                 <img src="../../assets/productList/productList.jpeg" alt="" class="img"> 
                 <p class="red price">¥4500</p>
                 <div class="des">
                    <a href="#" title="【测试学习使用】Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干大容量 洗烘一体 厨卫家电">【测试学习使用】Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干大容量 洗烘一体 厨卫家电</a>
                 </div>
                 
            </li>
        </ul>
    </div>
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
  name:"productList",
  components: {
      shopHeader
  }
}
</script>

<style scoped>
#productList{
    width: 1080px;
    margin: 0 auto;
}
li{
    width: 200px;
    height: 290px;
    background: white;
    cursor: pointer;
    
}
li:hover{
    box-shadow: 2px 2px 5px #666;
}
.img{
    width: 180px;
    height: 200px;
    margin: 10px 10px 5px 10px;
}
.red{
    color: red;
}
.price{
    margin-left: 10px;
}
.des{
    height: 36px;
    overflow: hidden;
    font-size: 13px;
    margin: 5px 10px 0 10px;
    
    
}
.des a{
    color: #666;
    text-decoration: none;
    line-height: 20px;
}
</style>
