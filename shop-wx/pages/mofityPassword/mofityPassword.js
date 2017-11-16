// pages/mofityPassword/mofityPassword.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    oldPassword:"",
    newPassword:"",
    newPassword2:"",
    id:""
  },
  onShow:function(){
    const _this=this;
    wx.getStorage({
      key: 'userMsg',
      success:function(res){
        console.log(res);
        _this.setData({
          id: res.data.id
        });
      }
    });
    
    

  },
  bindOldPasswordInput:function(e){
    this.setData({
      oldPassword: e.detail.value
    });
  },
  bindNewPasswordInput:function(e){
    this.setData({
      newPassword: e.detail.value
    })
  },
  bindNewPasswordInput2: function (e) {
    this.setData({
      newPassword2: e.detail.value
    })
  },
  mofity:function(){
    const _this=this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/index.php",
      data: {
        "c":"User",
        "f":"modifyPassword",
        "id":_this.data.id,
        "oldPassword": _this.data.oldPassword,
        "newPassword": _this.data.newPassword

      },
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      dataType: "json",
      success: function(res) {
        console.log(res)
        if(res.data){
          wx.showToast({
            title: '修改成功',
            icon: 'success',
            image: '',
            duration: 1000,
            mask: true,
            success: function(res) {
              wx.clearStorage();
              wx.redirectTo({
                url: '../login/login'
              })
            },
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