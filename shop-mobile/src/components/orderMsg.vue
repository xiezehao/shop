<template>
    <div>
        <ul v-show="msgShow">
            <li>
                <img :src="order_item.product_image" alt="" id="image">
                <p id="name">{{order_item.product_name}}</p>
                <p id="message">
                    <span id="price">价钱：¥{{order_item.current_unit_price}}</span>
                    <span id="count">数量：{{order_item.quantity}}</span>
                </p>
            </li>
        </ul>

        <div id='bottom' v-show="msgShow">
            <div id="left">
                <span>总价钱：¥{{order_item.total_price}}</span>
            </div>
            <div id="right" @click="buy">
                去付款
            </div>
        </div>

        <div id="addShipping" @click="addShipping" v-show="addshippingShow">
            <img src="../assets/add.png" alt="">
            <p>添加收货地址</p>
        </div>

        <div v-show="shippingListShow">

            <ul>
                <li v-for="(item,index) in shipping" :key="index" class="address" @click='chooiseShipping(index)'>
                    <p>
                        <span id="receiver_name">{{item.receiver_name}}</span>
                        <span id="receiver_moblie">{{item.receiver_moblie}}</span>
                    </p>
                    <p id="address">{{item.receiver_province}} {{item.receiver_city}} {{item.receiver_district}} {{item.receiver_address}} </p>
                </li>
            </ul>
        </div>

        <div v-show="shippingShow" @click="addShipping">
            <p id='shippingTitle'>收货地址</p>
            <ul>
                <li class="address">
                    <p>
                        <span id="receiver_name">{{shippingMsg.receiver_name}}</span>
                        <span id="receiver_moblie">{{shippingMsg.receiver_moblie}}</span>
                    </p>
                    <p id="address">{{shippingMsg.receiver_province}} {{shippingMsg.receiver_city}} {{shippingMsg.receiver_district}} {{shippingMsg.receiver_address}} </p>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            id: 1,
            order_no: this.$route.params.order_no,
            order_item: {},
            shipping: [],
            msgShow: true,//订单信息
            shippingListShow: false,//收货地址列表
            shippingShow: false,//已选择的收货地址
            addshippingShow: true,//增加收货地址
            shippingMsg: {}
        }
    },
    mounted() {
        const _this = this;
        //   this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Order&f=getOrder_item&order_no="+this.order_no)
        //             .then(res=>{
        //                 this.order_item=res.data[0];
        //             })
        this.axios.all([_this.getOrder_item(), _this.getShipping()])
            .then(_this.axios.spread(function(order_item, shipping) {
                _this.order_item = order_item.data[0];
                shipping.data.forEach(function(element, index) {
                    element.index = index;
                }, this);
                _this.shipping = shipping.data;
            }))

        // console.log(this.shipping)
    },
    methods: {
        getOrder_item() {
            return this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Order&f=getOrder_item&order_no=" + this.order_no);
        },
        getShipping() {
            return this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=User&f=getShipping&user_id=" + this.id);
        },
        addShipping() {
            this.msgShow = false;//订单信息
            this.shippingListShow = true;//收货地址列表
            this.shippingShow = false;//已选择的收货地址
            this.addshippingShow = false;//增加收货地址
        },
        chooiseShipping(index) {
            this.shippingMsg = this.shipping[index];
            this.msgShow = true;//订单信息
            this.shippingListShow = false;//收货地址列表
            this.shippingShow = true;//已选择的收货地址
            this.addshippingShow = false;//增加收货地址
        },
        buy() {
            const params = new URLSearchParams();
            params.set("c", "Order");
            params.set("f", "order");
            params.set("order_no", this.order_no);
            params.set("user_id", this.id);
            params.set("shipping_id", this.shippingMsg.id);
            params.set("payment", this.order_item.total_price);
            const _this = this;
            this.axios.post("https://www.xiezehao.com/shop/shopPHP/", params)
                .then(response => {
                    // console.log(this.order_no);
                    if (response.data) {
                        _this.$router.push({ name: 'pay', params: { order_no: _this.order_no, total: _this.order_item.total_price } });
                        // this.$router.push("/pay")
                    }
                })
        }
    }
}
</script>

<style scoped>
ul {
    margin: 0;
    padding: 0;
}

li {
    list-style-type: none;
    padding: 0 10px;
}

#image {
    width: 30%;
    height: 90px;
    ;
    float: left;
    margin-right: 5px;
}

#name{
    /* line-height: 90px; */
}

#message {
    clear: both;
    padding-top: 5px;
    height: 30px;
    border-bottom: 1px solid #cdcdcd;
}

#price {
    float: left;
}

#count {
    float: right;
}

#bottom {
    position: absolute;
    bottom: 0;
    height: 45px;
    width: 100%;
    background: #c60023;
    color: white;
    /* padding: 0 10px; */
}

#left {
    float: left;
    line-height: 45px;
    margin-left: 10px;
}

#right {
    float: right;
    line-height: 45px;
    margin-right: 10px;
    border-left: 1px solid black;
    padding-left: 10px;
}

#addShipping {
    text-align: center;
}

#addShipping img {
    width: 80px;
}

#addShipping p {
    margin: 0;
    color: #ccc;
}

.address {
    border-bottom: 1px solid #ddd;
}

#receiver_name {
    float: left;
}

#receiver_moblie {
    float: right;
}

#address {
    clear: both;
    margin: 5px 0;
}

#shippingTitle {
    margin-left: 10px;
}
</style>
