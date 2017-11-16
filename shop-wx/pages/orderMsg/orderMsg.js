// pages/orderMsg/orderMsg.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    order_no:"",
    orderMsg:{},
    shipping:[],
    userId:"",
    orderMsgShow:false,
    shippingListShow:true,
    addShippingShow:false,
    chooiseShippingShow:true,
    chooiseShipping:{}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // console.log(options)
    this.setData({
      order_no:options.order_no
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    const _this=this;
    wx.getStorage({
      key: 'userMsg',
      success: function(res) {
        _this.setData({
          userId:res.data.id
        })
      },
      fail: function(res) {},
      complete: function(res) {},
    })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    let _this=this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=Order&f=getOrder_item&order_no="+_this.data.order_no,
      method: "GET",
      dataType: "json",
      success: function(res) {
        // console.log(res)
        _this.setData({
          orderMsg:res.data[0]
        })
      },
      fail: function(res) {},
      complete: function(res) {},
    });
    wx.getStorage({
      key: 'userMsg',
      success: function(res) {
        wx.request({
          url: "https://www.xiezehao.com/shop/shopPHP/?c=User&f=getShipping&user_id=" +res.data.id,
          method: "GET",
          dataType: "json",
          success: function (res) {
            console.log(res)
            _this.setData({
              shipping:res.data
            })
           },
          fail: function (res) { },
          complete: function (res) { },
        })
      },
      fail: function(res) {},
      complete: function(res) {},
    })
    
  },
  addShipping:function(){
    this.setData({
      orderMsgShow: true,
      shippingListShow: false,
      addShippingShow: true,
      chooiseShippingShow:true
    })
  },
  chooce:function(e){
    console.log(e.currentTarget.dataset.index);
    let index = e.currentTarget.dataset.index;
    const _this=this;
    this.setData({
      chooiseShipping: _this.data.shipping[index],
      orderMsgShow: false,
      shippingListShow: true,
      addShippingShow: true,
      chooiseShippingShow:false
    });
  },
  buying:function(){
    // console.log(this.data.chooiseShipping.id);
    const _this=this;
    let id = this.data.chooiseShipping.id;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/",
      data: {
        "c":"Order",
        "f":"order",
        "order_no":_this.data.order_no,
        "user_id":_this.data.userId,
        "shipping_id":id,
        "payment": _this.data.orderMsg.total_price
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: "POST",
      dataType: "json",
      success: function(res) {
        // console.log(res)
        if(res.data==true){
          wx.navigateTo({
            url: '../payment/payment?order_no=' + _this.data.order_no + "&total=" + _this.data.orderMsg.total_price,
            success: function(res) {},
            fail: function(res) {},
            complete: function(res) {},
          })
        }
      },
      fail: function(res) {},
      complete: function(res) {},
    })
  }
})