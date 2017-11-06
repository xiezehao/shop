<template>
    <div>
        <div id="mask" v-show="isShow"></div>
        <div id="shipping_confirm" v-show="isShow">
            <div id="shipping_title">
                <span>使用新地址</span>
                <img src="../../assets/home/close.png" alt="" @click="showMask">
            </div>
            <div id="shippingMsg">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td>
                                <label><i>*</i>收件人姓名：</label><input v-model="shippingObj.receiver_name" type="text" placeholder="请输入收件人姓名">
                            </td>
                            <td>
                                <label><i>*</i>收件人手机：</label><input v-model="shippingObj.receiver_moblie" type="text" placeholder="请输入11位手机号">
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>
                                <label><i>*</i>所在省市区：</label><input v-model="shippingObj.receiver_province" type="text" placeholder="请输入省份">省
                            </td>
                            <td>
                                <label></label><input v-model="shippingObj.receiver_city" type="text" placeholder="请输入城市">市
                            </td>
                            <td>
                                <label></label><input v-model="shippingObj.receiver_district" type="text" placeholder="请输入区/县">(区/县)
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <label><i>*</i>详细地址：</label><input v-model="shippingObj.receiver_address" type="text" placeholder="请输入详细地址,精确到门牌" style="width:220px;">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label><i>*</i>邮政编码：</label><input v-model="shippingObj.receiver_zip" type="text" placeholder="如：100000">
                            </td>
                            <td>
                                <label><i>*</i>固定电话：</label><input v-model="shippingObj.receiver_phone" type="text" placeholder="010-100000">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <button class="save" @click="save">
                                    保存新地址
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
        </div>
        <shopHeader></shopHeader>
        <div id="confirm">
            <p id="shouhuo">收货地址</p>
            <hr color="#ddd">

            <div>
                <ul id="address_ul">
                    <li v-for="(item,index) in shipping" :class="{address:true,isActive:index===isActive}" @click="change(index)">
                       <p>{{item.receiver_province}}&nbsp;&nbsp;&nbsp;{{item.receiver_city}}&nbsp;&nbsp;&nbsp;({{item.receiver_name}}收)</p>
                       <p>{{item.receiver_district}}{{item.receiver_address}}</p>
                       <p>{{item.receiver_moblie}}</p>
                       <div class="hidden">
                        <span>编辑</span>
                        <span>删除</span>
                       </div>
                    </li>

                    <li style="text-align: center;" class="address" @click="showMask">
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
                        <tr v-for="item in order_item">
                            <td class="productImg">
                                <img class="img" :src="item.product_image" alt="/">
                            </td>
                            <td class="product">
                                 {{item.product_name}}
                            </td>
                            <td class="center">
                                ¥ {{item.current_unit_price}}
                            </td>
                            <td class="center">
                                x{{item.quantity}}
                            </td>
                            <td class="center">
                                ¥ {{item.total_price}}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="total">
                <span>支付总价：</span>
                <span class="totalPrice">¥ {{total}}</span>
                <span class="payBtn" @click="to()">支付订单</span>
            </div>
        </div>
    </div>
 
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
    data () {
        return {
            order_no:this.$route.params.order_no,
            order_item:[],
            user_id:0,
            shipping:[],
            isActive:-1,
            isShow:false,
            shippingObj:{
                receiver_name:'',
                receiver_phone:'',
                receiver_moblie:'',
                receiver_province:'',
                receiver_city:'',
                receiver_distric:'',
                receiver_address:'',
                receiver_zip:''
            }
        }
    },
  components: {
      shopHeader
  },
  computed: {
      total(){
          let total=0;
          this.order_item.forEach(function(element) {
              total+=parseInt(element.total_price);
          }, this);
          return total;
      }  
  },
  mounted () {
    this.user_id=sessionStorage.getItem("userId");
    const _this=this;
    this.axios.all([_this.getOrder_item(),_this.getShipping()])
        .then(_this.axios.spread(function(order_item,shipping) {
            _this.order_item=order_item.data;
            shipping.data.forEach(function(element,index) {
                element.index=index;
            }, this);
            _this.shipping=shipping.data;
        }))
  },
  methods: {
      to(){
        //   console.log(this.shipping[this.isActive].id);
          if (this.isActive) {
              alert("请选择地址");
              return ;
          }
          const params=new URLSearchParams();
          params.set("c","Order");
          params.set("f","order");
          params.set("order_no",this.order_no);
          params.set("user_id",this.user_id);
          params.set("shipping_id",this.shipping[this.isActive].id);
          params.set("payment",this.total);
          this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
                    .then(response=>{
                        // console.log(response);
                        if (response.data) {
                            this.$router.push({name:'payment',params:{order_no:this.order_no,total:this.total}});
                        }
                    })
        
      },
      getOrder_item(){
          return this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Order&f=getOrder_item&order_no="+this.order_no);
      },
      getShipping(){
          return this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getShipping&user_id="+this.user_id);
      },
      change(index){
        this.isActive=index;
        // console.log(index);
      },
      showMask(){
          this.isShow=!this.isShow;
      },
      save(){
        const params=new URLSearchParams();
        params.set("c","User");
        params.set("f","putShipping");
        params.set("user_id",this.user_id);
        params.set("receiver_name",this.shippingObj.receiver_name);
        params.set("receiver_phone",this.shippingObj.receiver_phone);
        params.set("receiver_moblie",this.shippingObj.receiver_moblie);
        params.set("receiver_province",this.shippingObj.receiver_province);
        params.set("receiver_city",this.shippingObj.receiver_city);
        params.set("receiver_district",this.shippingObj.receiver_district);
        params.set("receiver_address",this.shippingObj.receiver_address);
        params.set("receiver_zip",this.shippingObj.receiver_zip);
        const _this=this;
        this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
                  .then(response=>{
                      if (response.data) {
                          alert("已保存新地址");
                          _this.showMask();
                          _this.$router.go(0);
                      }
                  })
      }
  }
}
</script>

<style scoped>
#mask{
    width: 100%;
    height: 100%;
    background: gray;
    position: absolute;
    opacity: 0.5;
}
#shipping_confirm{
    width: 700px;
    height: 350px;
    background: white;
    /* opacity: 1; */
    margin: 0 auto;
    left: 50%;
    transform: translate(-50%);
    position: absolute;
    margin-top: 40px;
    border-radius: 5px;
}
#confirm{
    width: 1080px;
    margin: 0 auto;
}
#shouhuo{
    font-weight: bold;
    font-size: 14px;
}
#address_ul li{
    float: left;
}
.address{
    width: 170px;
    height: 75px;
    font-size: 12px;
    color: #666;
    border: 3px dashed #ccc;
    padding: 15px;
    margin-right: 10px;
    margin-top: 10px;
}
.address:hover{
    cursor: pointer;
}
.address:hover .hidden{
    display: block;
}
.address p{
    margin-bottom: 5px;
}
.isActive{
    border: 3px dashed #1E90FF;
}
.hidden{
    margin-top: 0px;
    float: right;
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
#shipping_title{
    height: 50px;
    border-bottom: 1px solid #999;
}
#shipping_title span{
    font-weight: 700;
    font-size: 14px;
    margin-left: 20px;
    line-height: 50px;
}
#shipping_title img{
    width: 36px;
    float: right;
    line-height: 50px;
    margin-right: 20px;
    margin-top: 7px;
    cursor: pointer;
}
i{
    color: red;
     margin: 0 5px; 
     height: 20px;
     line-height: 20px;
}
#shippingMsg{
      padding: 0px 20px;  
    font-size: 12px;
}
#shippingMsg td{
    padding-top: 25px;
    /* text-align: center */
}
#shippingMsg label{
     width: 110px;
    height: 30px;
    line-height: 30px;
    text-align: right; 
    margin-right: 10px;
}
#shippingMsg input{
    height: 25px;
    width: 125px;
    margin-right: 5px;
    outline: none;
}
.save{
    background: #1E90FF;
    border: none;
    color: white;
    padding: 5px 10px;
    margin-left: 10px;
    outline: none;
    cursor: pointer;
}
</style>
