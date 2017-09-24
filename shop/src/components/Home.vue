<template>
  <div class="home">
    <shopHeader></shopHeader>
    <div id="content">
      <div id="fenlei-list">
        <ul>
          <li><a href="#" class="white">手机</a><a href="#">数码</a></li>
          <li><a href="#">电脑</a><a href="#">办公配件</a></li>
          <li><a href="#">电视</a><a href="#">空调</a><a href="#">冰箱</a><a href="#">洗衣机</a></li>
          <li><a href="#">厨卫家电</a><a href="#">小家电</a></li>
          <li><a href="#">家居</a><a href="#">家具</a><a href="#">家装</a></li>
          <li><a href="#">个护化妆</a><a href="#">清洁</a><a href="#">纸品</a></li>
          <li><a href="#">母婴</a><a href="#">玩具</a><a href="#">童装童鞋</a></li>
          <li><a href="#">鞋靴</a><a href="#">箱包</a><a href="#">钟表</a><a href="#">珠宝</a></li>
          <li><a href="#">运动户外</a><a href="#">足球</a><a href="#">汽车足球</a></li>
          <li><a href="#">图书</a><a href="#">音像</a><a href="#">电子书</a></li>
        </ul>
      </div>

      <div id="banner">
        <img src="../assets/home/banner.jpg" alt="" srcset="">
      </div>
    </div>

    <div id="productList">
      <ul>
        <li>
          <div class="title">
            F1  家用电器
          </div>

          <ul>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <li>
          <div class="title">
            F1  家用电器
          </div>

          <ul>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <li>
          <div class="title">
            F1  家用电器
          </div>

          <ul>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
        <li>
          <div class="title">
            F1  家用电器
          </div>

          <ul>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child mr">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
            <li class="child">
              <p>双开门冰箱</p>
              <img src="../assets/home/bingxiang.jpg" alt="" srcset="">
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
  name: 'home',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
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
}
#fenlei-list{
  width: 220px;
  background: #666;
  padding: 10px 0;
  font-size: 14px;
  float: left;
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
#fenlei-list li:hover{
  background: white;
}
#fenlei-list li:hover a{
  color: #1E90FF;
}

#banner img{
  height: 410px;
  width: 850px;
  margin-left: 10px;
}
#productList{
  width: 1080px;
  margin: 0 auto;
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
}
.child p{
}
.child img{
  width:160px;
  height:165px;
  margin-top: 15px;
}
.mr{
  margin-right: 15px;
}
</style>
