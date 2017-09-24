<template>
    <div>
        <shopHeader></shopHeader>
        <div id="confirm">
            <p id="shouhuo">收货地址</p>
            <hr color="#ddd">

            <div id="address">
                <ul>
                    <li>
                       <span>广州</span>
                       <span>广东省</span>
                       <span>（谢泽豪收）</span>
                       <br>
                       <br>
                       <span>东升五巷18号</span>
                       <span>13726223878</span>
                       <div class="hidden">
                        <span>编辑</span>
                        <span>删除</span>
                       </div>
                    </li>

                    <li style="text-align: center;">
                        <img width="40px" src="../../assets/confirm/add.png" alt="">
                       <p style="margin-top:10px;">使用新地址</p>
                    </li>
                </ul>
            </div>
        
            <div id="shopcarLiist">
                <p id="shouhuo">商品清单</p>

                <table>
                    <thead>
                        <tr>
                            <td width="10%"></td>
                            <td width="30%">商品描述</td>
                            <td width="20%" class="center">价格</td>
                            <td width="20%" class="center">数量</td>
                            <td width="20%" class="center">小计</td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td class="productImg">
                                <img class="img" src="../../assets/productList/productList.jpeg" alt="/">
                            </td>
                            <td class="product">
                                【测试学习使用】Midea/美的 BCD-535WKZM(E)冰箱双开门无霜智能家用厨卫家电
                            </td>
                            <td class="center">
                                ￥4500
                            </td>
                            <td class="center">
                                x2
                            </td>
                            <td class="center">
                                ￥9000
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="total">
                <span>支付总价：</span>
                <span class="totalPrice">￥9000</span>
                <span class="payBtn">支付订单</span>
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
#confirm{
    width: 1080px;
    margin: 0 auto;
}
#shouhuo{
    font-weight: bold;
    font-size: 14px;
}
#address li{
    width: 180px;
    height: 75px;
    font-size: 12px;
    color: #666;
    border: 3px dashed #ccc;
    padding: 15px;
    float: left;
    margin-right: 15px;
}
#address li:hover{
    cursor: pointer;
}
#address li:hover .hidden{
    display: block;
}
.hidden{
    margin-top: 20px;
    right: 0;
    bottom: 0;
    display: none;
}
.hidden span:hover{
    cursor: pointer;
    color: red;
}
#shopcarLiist{
    clear: both;
    padding-top: 20px;
}
#shopcarLiist table{
    width: 100%;
    margin-top: 15px;
    
} 
#shopcarLiist thead{
    font-size: 14px;
    font-weight: bold;
}
#shopcarLiist tbody{
    font-size: 12px;
}
#shopcarLiist td{
    padding-bottom: 10px;
    border-bottom: 1px dotted #999;
}
.img{
    width: 80px;
    height: 80px;
    margin-top: 15px;
}
.productImg{
    width: 108px;
}
.product{
    width: 304px;
    color: #999;
    line-height: 20px;
    padding-right: 20px;
}
.center{
    text-align: center;
}
#total{
    width: 1080px;
    height: 40px;
    margin: 0 auto;
    background: #eee;
    margin-top: 10px;
    text-align: right;
    font-size: 12px;
    line-height: 40px;
}
.totalPrice{
    font-size: 18px;
    color: #c60023;
    font-weight: bold;
    margin-right: 15px;
}
.payBtn{
    width: 108px;
    height: 40px;
    background: #c60023;
    line-height: 40px;
    display: inline-block;
    text-align: center;
    font-size: 17px;
    color: white;
    font-weight: bold;
    cursor: pointer;
}
</style>
