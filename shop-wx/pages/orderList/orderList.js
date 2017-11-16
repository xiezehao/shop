// pages/orderList/orderList.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userMsg:{},
    id:"",
    orderList:[]
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
    wx.setNavigationBarTitle({
      title: '我的订单'
    });
    
    const _this = this;
    wx.getStorage({
      key: 'userMsg',
      success: function (res) {
        console.log(res);
        _this.setData({
          id: res.data.id
        });
        _this.getOrderList();
      },
      fail: function (res) { },
      complete: function (res) { },
    });
  },
  getOrderList:function(){
    const _this=this;
    wx.request({
      url: "https://www.xiezehao.com/shop/shopPHP/?c=User&f=getUserOrderList&userId="+_this.data.id,
      method: "GET",
      dataType: "json",
      success: function(res) {
        console.log(res)
        res.data.filter(function(item,index){
          switch(item.status){
            case '10':
              item.status="未付款";
              break;

            case "20":
              item.status = "已付款";
              break;
          }
        });
        _this.setData({
          orderList:res.data
        })
      },
      fail: function(res) {},
      complete: function(res) {},
    })
  }

})