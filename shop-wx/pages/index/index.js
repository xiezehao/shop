//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    //轮播图
    imgList: [
      'http://i3.mifile.cn/a4/xmad_14913974588712_tsRvc.jpg',
      'http://i3.mifile.cn/a4/xmad_14915894814419_zNYsr.jpg',
      'http://i3.mifile.cn/a4/xmad_14913784864515_mkpqH.jpg',
      'http://i3.mifile.cn/a4/xmad_14908694250786_fObqa.jpg',
      'http://i3.mifile.cn/a4/xmad_14913755624659_gRtNH.jpg',
    ],
    indicatorDots: true,//是否显示面板指示点
    autoplay: true,//是否自动切换
    interval: 5000,//自动切换时间间隔
    duration: 1000,//滑动动画时长
    circular: true,//是否采用衔接滑动
    // img:"../../src/image/home/bingxiang.jpg",
    //产品,
    productList: [
      {
        title: "1F 家用电器",
        product: [{
          name: "双门冰箱",
          keyword: '冰箱',
          src: "../../src/image/home/bingxiang.jpg"
        }
          , {
          name: "高清电视",
          src: "../../src/image/home/dianshi.jpg",
          keyword: '电视'
        }, {
          name: "洗衣机",
          src: "../../src/image/home/xiyiji.jpg",
          keyword: '洗衣机'
        }, {
          name: "空调专场",
          src: "../../src/image/home/kongtiao.jpg",
          keyword: '空调'
        }, {
          name: "电热水器",
          src: "../../src/image/home/reshuiqi.jpg",
          keyword: '热水器'

        }]
      }, {
        title: "2F 数码3C",
        product: [{
          name: "笔记本",
          src: "../../src/image/home/bijiben.jpg",
          keyword: '笔记本'
        }, {
          name: "手机",
          src: "../../src/image/home/phone.jpg",
          keyword: '手机'
        }, {
          name: "平板电脑",
          src: "../../src/image/home/pingban.jpg",
          keyword: '电脑'
        }, {
          name: "数码相机",
          src: "../../src/image/home/xiangji.jpg",
          keyword: '相机'
        }, {
          name: "3C配件",
          src: "../../src/image/home/chazuo.jpg",
          keyword: '配件'
        }]
      }, {
        title: "3F 服装箱包",
        product: [{
          name: "女装",
          src: "../../src/image/home/nvzhuang.jpg",
          keyword: '女装'
        }, {
          name: "帽子专区",
          src: "../../src/image/home/map.jpg",
          keyword: '帽子'
        }, {
          name: "旅行箱",
          src: "../../src/image/home/xiangji.jpg",
          keyword: '旅行箱'
        }, {
          name: "手提包",
          src: "../../src/image/home/shoutibao.jpg",
          keyword: '手提包'
        }, {
          name: "保暖内衣",
          src: "../../src/image/home/neiyi.jpg",
          keyword: '内衣'
        }]
      }, {
        title: "4F 食品生鲜",
        product: [{
          name: "最爱零食",
          src: "../../src/image/home/lingshi.jpg",
          keyword: '零食'
        }, {
          name: "生鲜",
          src: "../../src/image/home/zhurou.jpg",
          keyword: '生鲜'
        }, {
          name: "半成品",
          src: "../../src/image/home/cai.jpg",
          keyword: '半成品'
        }, {
          name: "速冻专区",
          src: "../../src/image/home/sudong.jpg",
          keyword: '速冻'
        }, {
          name: "进口食品",
          src: "../../src/image/home/jinkou.jpg",
          keyword: '进口食'
        }]
      }, {
        title: "5F 酒水饮料",
        product: [{
          name: "白酒",
          src: "../../src/image/home/baijiu.jpg",
          keyword: '酒'
        }, {
          name: "红酒",
          src: "../../src/image/home/hongjiu.jpg",
          keyword: '酒'
        }, {
          name: "饮料",
          src: "../../src/image/home/kele.jpg",
          keyword: '饮料'
        }, {
          name: "调制鸡尾酒",
          src: "../../src/image/home/rio.jpg",
          keyword: '酒'
        }, {
          name: "进口洋酒",
          src: "../../src/image/home/jinkoujiu.jpg",
          keyword: '酒'
        }
        ]
      }
    ],
    searchValue: ""
  },
  onLoad: function () {

  },
  onShow: function () {
  },
  search: function (e) {
    // console.log(e)
    let val = e.detail.value;
    wx.navigateTo({
      url: '../search/search?keyword=' + val,
      success: function (res) {

      },
      fail: function (res) { },
      complete: function (res) { },
    })
    // console.log(val)
  }
})
