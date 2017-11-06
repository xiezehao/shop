<template>
  <div>
      <div id="search">
        <mt-search
            v-model="value"
            cancel-text="取消"
            placeholder="搜索">
        </mt-search>
      </div>
      
      <div id="swipe">
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="(item,index) in imgList" :key="index">
                <img :src="item.src" alt="">
            </mt-swipe-item>
        </mt-swipe>
      </div>
      <ul id="ul1">
          <li v-for="(item,index) in productList" :key="index">
              <p>{{item.title}}</p>
              <ul id="ul2" v-for="(item2,index2) in item.product" :key="index2">
                  <li @click="to(item2.keyword)">
                      <p>{{item2.name}}</p>
                      <img :src="item2.src" alt="">
                  </li>
              </ul>
              
          </li>
      </ul>
  </div>
</template>

<script>
export default {
  data () {
      return {
          value:'',
          imgList:[
            {
            src: 'http://i3.mifile.cn/a4/xmad_14913974588712_tsRvc.jpg',
            href: ''
            },
            {
            src: 'http://i3.mifile.cn/a4/xmad_14915894814419_zNYsr.jpg',
            href: ''
            },
            {
            src: 'http://i3.mifile.cn/a4/xmad_14913784864515_mkpqH.jpg',
            href: ''
            },
            {
            src: 'http://i3.mifile.cn/a4/xmad_14908694250786_fObqa.jpg',
            href: ''
            },
            {
            src: 'http://i3.mifile.cn/a4/xmad_14913755624659_gRtNH.jpg',
            href: ''
            }
          ],
          productList:[
              {
                title:"1F 家用电器",
                product:[{
                    name:"双门冰箱",
                    keyword:'冰箱',
                    src:require("../assets/home/bingxiang.jpg")
                },{
                    name:"高清电视",
                    src:require("../assets/home/dianshi.jpg"),
                    keyword:'电视'
                },{
                    name:"洗衣机",
                    src:require("../assets/home/xiyiji.jpg"),
                    keyword:'洗衣机'
                },{
                    name:"空调专场",
                    src:require("../assets/home/kongtiao.jpg"),
                    keyword:'空调'
                },{
                    name:"电热水器",
                    src:require("../assets/home/reshuiqi.jpg"),
                    keyword:'热水器'

                }]
              },{
                title:"2F 数码3C",
                product:[{
                    name:"笔记本",
                    src:require("../assets/home/bijiben.jpg"),
                    keyword:'笔记本'
                },{
                    name:"手机",
                    src:require("../assets/home/phone.jpg"),
                    keyword:'手机'
                },{
                    name:"平板电脑",
                    src:require("../assets/home/pingban.jpg"),
                    keyword:'电脑'
                },{
                    name:"数码相机",
                    src:require("../assets/home/xiangji.jpg"),
                    keyword:'相机'
                },{
                    name:"3C配件",
                    src:require("../assets/home/chazuo.jpg"),
                    keyword:'配件'
                }]
              },{
                title:"3F 服装箱包",
                product:[{
                    name:"女装",
                    src:require("../assets/home/nvzhuang.jpg"),
                    keyword:'女装'
                },{
                    name:"帽子专区",
                    src:require("../assets/home/map.jpg"),
                    keyword:'帽子'
                },{
                    name:"旅行箱",
                    src:require("../assets/home/xiangji.jpg"),
                    keyword:'旅行箱'
                },{
                    name:"手提包",
                    src:require("../assets/home/shoutibao.jpg"),
                    keyword:'手提包'
                },{
                    name:"保暖内衣",
                    src:require("../assets/home/neiyi.jpg"),
                    keyword:'内衣'
                }]
              },{
                title:"4F 食品生鲜",
                product:[{
                    name:"最爱零食",
                    src:require("../assets/home/lingshi.jpg"),
                    keyword:'零食'
                },{
                    name:"生鲜",
                    src:require("../assets/home/zhurou.jpg"),
                    keyword:'生鲜'
                },{
                    name:"半成品",
                    src:require("../assets/home/cai.jpg"),
                    keyword:'半成品'
                },{
                    name:"速冻专区",
                    src:require("../assets/home/sudong.jpg"),
                    keyword:'速冻'
                },{
                    name:"进口食品",
                    src:require("../assets/home/jinkou.jpg"),
                    keyword:'进口食'
                }]
              },{
                title:"5F 酒水饮料",
                product:[{
                    name:"白酒",
                    src:require("../assets/home/baijiu.jpg"),
                    keyword:'酒'
                },{
                    name:"红酒",
                    src:require("../assets/home/hongjiu.jpg"),
                    keyword:'酒'
                },{
                    name:"饮料",
                    src:require("../assets/home/kele.jpg"),
                    keyword:'饮料'
                },{
                    name:"调制鸡尾酒",
                    src:require("../assets/home/rio.jpg"),
                    keyword:'酒'
                },{
                    name:"进口洋酒",
                    src:require("../assets/home/jinkoujiu.jpg"),
                    keyword:'酒'
                }]
              }
          ]
      }
  },
  methods: {
      to(keyword){
          console.log(keyword)
        this.$router.push("/search/"+keyword);
      }
  }
}
</script>

<style>
#search{
     height: 52px; 
}
#swipe{
    width: 100%;
    height: 150px;
}
#swipe img{
    width: 100%;
}
li{
    list-style-type: none;
    text-align: center;
}
ul{
    padding: 0;
    
}
#ul1{
    margin: 0;
}
#ul1>li{
    clear: both;
    
}
#ul1>li:not(:first-child){
     padding-top: 10px; 
}
#ul1>li>p{
    font-size: 18px;
    padding: 0;
    border-bottom: 1px solid #d58717;
    color: #d58717;
    padding-bottom: 5px;
}
#ul2{
    margin-top: 10px;
    padding: 0 5px;
}
#ul2>li{
    width: 50%;
    float: left;
    box-sizing: border-box;
    /* border: 1px solid gray; */
    /* padding: 5px; */
}
#ul2>li>img{
    width: 50%;
    /* height: 100px; */
}
</style>
