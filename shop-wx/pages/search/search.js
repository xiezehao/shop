// pages/search/search.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    keyword:"",
    productList:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(options)
    const _this=this;
    this.setData({
      keyword:options.keyword
    });
    wx.setNavigationBarTitle({
      title: '搜索"'+_this.data.keyword+'"'
    })
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    const _this=this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=Search&f=search&keyword="+_this.data.keyword,
      method: "GET",
      dataType: "json",
      success: function(res) {
        console.log(res);
        _this.setData({
          productList:res.data
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
  
  },
  to:function(e){
    // console.log(e)
    console.log(e.currentTarget.dataset.id)
    let id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../productMsg/productMsg?id='+id,
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  }
})