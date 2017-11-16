// pages/productMsg/productMsg.js
var WxParse = require('../../wxParse/wxParse.js');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id:"",
    productMsg:{},
    swiper: [],
    indicatorDots: true,//是否显示面板指示点
    autoplay: true,//是否自动切换
    interval: 5000,//自动切换时间间隔
    duration: 1000,//滑动动画时长
    circular: true,//是否采用衔接滑动
    count:1
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // console.log(options)
    this.setData({
      id:options.id
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    const _this=this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=Product&f=productMsg&product_id="+_this.data.id,
      method: "GET",
      dataType: "json",
      success: function(res) {
        console.log(res)
        let s = res.data[0].sub_iamges;
        let arr=s.split(",");
        console.log(arr);
        _this.setData({
          productMsg:res.data[0],
          swiper:arr
        });
        let detail = res.data[0].detail;
        WxParse.wxParse('detail', 'html', detail, _this, 5);
      },
      fail: function(res) {},
      complete: function(res) {},
    })
  },
  add:function(){
    const _this=this;
    let count=_this.data.count;
    count++;
    this.setData({
      count:count
    });
    // console.log(_this.data.count)
  },
  reduce:function(){
    const _this = this;
    let count = _this.data.count;
    if(count==1){
      return;
    }
    count--;
    this.setData({
      count: count
    });
  },
  buy:function(){
    // console.log(new Date());
    const _this = this;
    let dateObject = new Date();
    let order_no = dateObject.getTime();
    // console.log(total)
    
    wx.getStorage({
      key: 'userMsg',
      success: function(res) {
        // console.log(res.data.id)
        wx.request({
          url: "https://www.xiezehao.com/shop/shopPHP/index.php",
          data: {
            "c": "Order",
            "f": "order_item",
            "user_id": res.data.id,
            "order_no": order_no,
            "product_id":_this.data.productMsg.id,
            "product_name": _this.data.productMsg.name,
            "product_image": _this.data.productMsg.main_image,
            "current_unit_price": _this.data.productMsg.price,
            "quantity": _this.data.count,
            "total_price": _this.data.productMsg.price*_this.data.count
          },
          header: {
            "content-type": "application/x-www-form-urlencoded"
          },
          method: "POST",
          dataType: "json",
          success: function (res) {
            if(res.data==true){
              wx.navigateTo({
                url: '../orderMsg/orderMsg?order_no=' + order_no,
              })
            }
           },
          fail: function (res) { },
          complete: function (res) { },
        })
      },
      fail: function(res) {
        console.log(123456);
      },
      complete: function(res) {},
    })
    
  }
})