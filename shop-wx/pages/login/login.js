// pages/login/login.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    name:"",
    password:""
  },
  bindNameInput:function(e){
    // console.log(e);
    this.setData({
      name:e.detail.value
    });
  },
  bindPsdInput:function(e){
    this.setData({
      password: e.detail.value
    });
  },
  login:function(){
    // console.log(this.data.name
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=User&f=login&username=" + this.data.name + "&password=" + this.data.password,
      method: "GET",
      dataType: "json",
      success: function(res) {
        
        let result = res.data.msg[0];
        // console.log(result);
        if(res.data.code=="200"){
          wx.setStorage({
            key: 'userMsg',
            data: result,
            success: function (res) { 
              //跳转到tabbar页面，只能用switchTab
              wx.switchTab({
                url: '../index/index'
              })
            }
          });

          
        }

      },
      fail: function(res) {},
      complete: function(res) {},
    })
  }
})