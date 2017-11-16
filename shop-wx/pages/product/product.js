// pages/product/product.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    category: [],
    qwe:'78',
    qwe:100,
    product:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    const _this = this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=Product&f=getCategory",
      method: 'GET',
      dataType: 'json',
      success: function (res) {
        console.log(res);
        _this.data.category = res.data;
        _this.setData({
          category: res.data
        })
      },
      fail: function (res) { },
      complete: function (res) { },
    });
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
  category(e){
    const id = e.currentTarget.dataset.id;
    const _this=this;
    console.log(id);
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=Product&f=getProductByCategoryId&category_id="+id,
      method: "GET",
      dataType: "json",
      success: function(res) {
        console.log(res)
        _this.setData({
          product:res.data,
        })
      },
      fail: function(res) {},
      complete: function(res) {},
    })
  }
})