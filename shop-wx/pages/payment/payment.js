// pages/payment/payment.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    order_no:"",
    total:"",
    qrImage:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(options)
    this.setData({
      order_no: options.order_no,
      total: options.total
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    const _this=this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/",
      data: {
        "c":"Pay",
        "f":"Pay",
        "order_no":_this.data.order_no,
        "total_price": _this.data.total
      },
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      method: "POST",
      dataType: "json",
      success: function(res) {
        console.log(res);
        _this.setData({
          qrImage: "http://qr.liantu.com/api.php?&w=200&text=" + res.data.qr_code
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
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})