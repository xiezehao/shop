// pages/user/user.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userMsg:{},
    id:""
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
    const _this=this;
    wx.getStorage({
      key: 'userMsg',
      success: function(res) {
        console.log(res);
        _this.setData({
          userMsg: res.data
        })
        // _this.data.userMsg=;
        // _this.data.id=res.data.id;
        // console.log(_this.data.id);
      }
    });
  },
  mofity:function(){
    // console.log("asdsad")
  }
})