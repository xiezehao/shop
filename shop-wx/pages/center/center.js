// pages/center/center.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
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
    
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    wx.getStorage({
      key: 'userMsg',
      success: function (res) {
        console.log(res)
      },
      fail: function (res) {
        // console.log(res)
        if (res) {
          wx.redirectTo({
            url: '../login/login'
          });
          
        }
      },
      complete: function (res) { },
    })
  },
  to:function(){
    wx.navigateTo({
      url: '../user/user'
    })
  },
  toMP:function(){
    wx.navigateTo({
      url: '../mofityPassword/mofityPassword'
    })
  },
  toOrderList:function(){
    wx.navigateTo({
      url: '../orderList/orderList'
    })
  }
  
})