<template>
  <div class="home">
    <shopHeader></shopHeader>
    <div id="content">
      <div id="fenlei-list">
        <ul>
          <li><a href="javascript:void(0);" @click="toProductList('手机')">手机</a><a href="javascript:void(0);" @click="toProductList('数码')">数码</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('电脑')">电脑</a><a href="javascript:void(0);" @click="toProductList('办公配件')">办公配件</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('电视')">电视</a><a href="javascript:void(0);" @click="toProductList('空调')">空调</a><a href="javascript:void(0);" @click="toProductList('冰箱')">冰箱</a><a href="javascript:void(0);" @click="toProductList('洗衣服')">洗衣机</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('厨卫家电')">厨卫家电</a><a href="javascript:void(0);" @click="toProductList('小家电')">小家电</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('家居')">家居</a><a href="javascript:void(0);" @click="toProductList('家具')">家具</a><a href="javascript:void(0);" @click="toProductList('家装')">家装</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('个护化妆')">个护化妆</a><a href="javascript:void(0);" @click="toProductList('清洁')">清洁</a><a href="javascript:void(0);" @click="toProductList('纸品')">纸品</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('母婴')">母婴</a><a href="javascript:void(0);" @click="toProductList('玩具')">玩具</a><a href="javascript:void(0);" @click="toProductList('童装童鞋')">童装童鞋</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('鞋靴')">鞋靴</a><a href="javascript:void(0);" @click="toProductList('箱包')">箱包</a><a href="javascript:void(0);" @click="toProductList('钟表')">钟表</a><a href="javascript:void(0);" @click="toProductList('珠宝')">珠宝</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('运动户外')">运动户外</a><a href="javascript:void(0);" @click="toProductList('足球')">足球</a><a href="javascript:void(0);" @click="toProductList('汽车足球')">汽车足球</a></li>
          <li><a href="javascript:void(0);" @click="toProductList('图书')">图书</a><a href="javascript:void(0);" @click="toProductList('音像')">音像</a><a href="javascript:void(0);" @click="toProductList('电子书')">电子书</a></li>
        </ul>
      </div>
      <div >

      </div>

      <div id="banner" style="overflow:hidden;">
        <transition-group name="move" tag="ul" >
          <li v-for="(item,index) in imgList" :key="index" v-show="index===imgIndex">
            <img :src="item.src" alt="">
          </li>
          
        </transition-group>
        <!-- <div id="banner_font"> -->
          <span id="left" @click="back"><img src="../assets/home/left.png" ></span>
          <span id="right" @click="next"><img src="../assets/home/right.png" ></span>
        <!-- </div> -->
        
      </div>
    </div>

    <div id="productList">
      <ul>
        <!-- f1 -->
        <li>
          <div class="title">
            F1  家用电器
          </div>

          <ul>
            <li class="child mr" @click="toProductList('冰箱')">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('电视')">
              <p>高清电视</p>
              <img src="../assets/home/dianshi.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('洗衣机')">
              <p>洗衣机</p>
              <img src="../assets/home/xiyiji.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('空调')">
              <p>空调专场</p>
              <img src="../assets/home/kongtiao.jpg" alt="" srcset="">
            </li>
            <li class="child" @click="toProductList('热水器')">
              <p>电热水器</p>
              <img src="../assets/home/reshuiqi.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <!-- f2 -->
        <li>
          <div class="title">
            F2  数码3C
          </div>

          <ul>
            <li class="child mr" @click="toProductList('笔记本')">
              <p>笔记本</p>
              <img src="../assets/home/bijiben.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('手机')">
              <p>手机</p>
              <img src="../assets/home/phone.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('平板')">
              <p>平板电脑</p>
              <img src="../assets/home/pingban.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('相机')">
              <p>数码相机</p>
              <img src="../assets/home/xiangji.jpg" alt="" srcset="">
            </li>
            <li class="child" @click="toProductList('配件')">
              <p>3C配件</p>
              <img src="../assets/home/chazuo.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <!-- f3 -->
        <li>
          <div class="title">
            F3  服装箱包
          </div>

          <ul>
            <li class="child mr" @click="toProductList('衣服')">
              <p>女装</p>
              <img src="../assets/home/nvzhuang.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('帽子')">
              <p>帽子专区</p>
              <img src="../assets/home/map.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('箱子')">
              <p>旅行箱</p>
              <img src="../assets/home/xiangji.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('包')">
              <p>手提包</p>
              <img src="../assets/home/shoutibao.jpg" alt="" srcset="">
            </li>
            <li class="child" @click="toProductList('衣服')">
              <p>保暖内衣</p>
              <img src="../assets/home/neiyi.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <!-- f4 -->
        <li>
          <div class="title">
            F4  食品生鲜
          </div>

          <ul>
            <li class="child mr" @click="toProductList('零食')">
              <p>最爱零食</p>
              <img src="../assets/home/lingshi.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('生鲜')">
              <p>生鲜</p>
              <img src="../assets/home/zhurou.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('菜')">
              <p>半成品菜</p>
              <img src="../assets/home/cai.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('速冻')">
              <p>速冻专区</p>
              <img src="../assets/home/sudong.jpg" alt="" srcset="">
            </li>
            <li class="child" @click="toProductList('食品')">
              <p>进口食品</p>
              <img src="../assets/home/jinkou.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <!-- f5 -->
        <li>
          <div class="title">
            F5  酒水饮料
          </div>

          <ul>
            <li class="child mr" @click="toProductList('酒')">
              <p>白酒</p>
              <img src="../assets/home/baijiu.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('酒')">
              <p>红酒</p>
              <img src="../assets/home/hongjiu.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('饮料')">
              <p>饮料</p>
              <img src="../assets/home/kele.jpg" alt="" srcset="">
            </li>
            <li class="child mr" @click="toProductList('酒')">
              <p>调制鸡尾酒</p>
              <img src="../assets/home/rio.jpg" alt="" srcset="">
            </li>
            <li class="child" @click="toProductList('酒')">
              <p>进口洋酒</p>
              <img src="../assets/home/jinkoujiu.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import shopHeader from "@/components/common/header";
export default {
  name: 'home',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
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
      imgIndex:0,
      intervalId:0
    }
  },
  mounted () {
    this.run();
  },
  methods:{
    toProductList:function(keyword){
      this.$router.push("/productList/"+keyword);
    },
    next(){
      clearInterval(this.intervalId);
      if (this.imgIndex==this.imgList.length-1) {
        this.imgIndex=0;
      }else{
        this.imgIndex++;
      }
      this.run();
    },
    back(){
      if (this.imgIndex==0) {
        this.imgIndex=this.imgList.length-1;
      }else{
        this.imgIndex--;
      }
    },
    run(){
      this.intervalId=setInterval(()=>{
        if (this.imgIndex==this.imgList.length-1) {
          this.imgIndex=0;
        }else{
          this.imgIndex++;
        }
      },2000)
    }
  },
  components: {
    shopHeader
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#content{
  width: 1080px;
  margin: 0 auto;
   /* position: absolute;  */
}
#fenlei-list{
  width: 220px;
  background: #666;
  padding: 10px 0;
  font-size: 14px;
  float: left;
  margin-right: 10px;
  /* position: absolute;  */
}
#fenlei-list li{
  padding: 10px;
}
#fenlei-list a{
  color:white;
}
#fenlei-list a:link{
  text-decoration: none;
  margin-left: 5px;
}
#fenlei-list a:hover{
  text-decoration: underline;
}
#fenlei-list li:hover{
  background: white;
  
}
#fenlei-list li:hover a{
  color: #1E90FF;
}
#banner{
  height: 410px;
  width: 850px;
  float: left;
  overflow: hidden;  
  position: relative;  
}
#banner li{
  height: 410px;
  width: 850px;
  position: absolute;
  overflow: hidden;
}
#banner #left{
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  padding: 10px 0; 
  opacity: 0.5;
  cursor: pointer;
}
#banner #left:hover,#banner #right:hover{
  background: gray;
  opacity: 0.3;
}
#banner #right{
  position: absolute;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
  padding: 10px 0; 
  opacity: 0.5;
  cursor: pointer;

}
#productList{
  width: 1080px;
  margin: 0 auto;
  clear: both;
}
#productList>ul>li>ul>li{
  cursor: pointer;
}
.title{
  /* margin: 10px 0;
   */
   height: 50px;
   line-height: 50px;
   font-size: 20px;
   color: #d58717;
   border-bottom: 1px solid #d58717;
}
.child{
  width:180px;
  height:210px;
  background: white;
  padding: 10px 10px 0 10px;
  margin-top: 20px;
  display: inline-block;
  overflow: hidden;
  text-align: center;
}
.child p{
}
.child img{
  width:160px;
  height:165px;
  margin-top: 15px;
  overflow: hidden;
}
.mr{
  margin-right: 15px;
}
.child:hover{
  /* border: 1px solid #ddd;
  box-sizing: border-box; */
}
.child:hover img{
  transform: scale(1.2);
  overflow: hidden; 
}

.move-enter-active {
  transition: all 0.5s ease;
  transform: translateX(0)
}
.move-leave-active {
  transition: all 0.5s ease;
  transform: translateX(-100%);
}
.move-enter {
  transform: translateX(100%);
}
.move-leave {
  transform: translateX(0);
}
</style>
