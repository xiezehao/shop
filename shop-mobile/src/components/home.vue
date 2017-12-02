<template>
  <div class="home">
     <router-view></router-view> 
       <mt-tabbar v-model="selected" :fixed="fixed">
        <mt-tab-item v-for="(item,index) in tab" :key="index" :id="item.index">
          <img slot="icon" :src="item.img"/>
          {{item.title}}
        </mt-tab-item> 
      </mt-tabbar> 
    
  </div>
</template>

<script>
export default {
  name: '',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      fixed:true,
      isActive:0,
      tab:[{
        index:0,
        img:require("../assets/home/home-icon.png"),
        title:"首页",
        to:"/"
      },{
        index:1,
        img:require("../assets/home/product-icon2.png"),
        title:"产品",
        to:'/product'
      },{
        index:2,
        img:require("../assets/home/center-icon2.png"),
        title:"个人中心",
        to:'/center'
      }],
      selected:0
    }
  },
  components: {
    // Swipe, SwipeItem
  },
  methods: {
    to(str){
      // console.log(str);
      this.$router.push(str);
    },
    clear(){
      this.tab.forEach(function(element) {
        
      }, this);
    }
  },
  watch:{
    selected:function(val, oldVal){
      // console.log(val)
      const _this=this;
      switch(val){
        case 0:
          _this.tab[0].img=require("../assets/home/home-icon.png");
          _this.tab[1].img=require("../assets/home/product-icon2.png");
          _this.tab[2].img=require("../assets/home/center-icon2.png");
          this.$router.push(this.tab[val].to)
          break;
        case 1:
          _this.tab[0].img=require("../assets/home/home-icon2.png");
          _this.tab[1].img=require("../assets/home/product-icon.png");
          _this.tab[2].img=require("../assets/home/center-icon2.png");
          this.$router.push(this.tab[val].to)
          break;
        case 2:
          const id=sessionStorage.getItem("id");
          if (id) {
            _this.tab[0].img=require("../assets/home/home-icon2.png");
            _this.tab[1].img=require("../assets/home/product-icon2.png");
            _this.tab[2].img=require("../assets/home/center-icon.png");
            
            this.$router.push(this.tab[val].to);
          }else{
            this.$router.push('/login');
          }
          
          break;
      }
      // this.$router.push(this.tab[val].to)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
 .home{
  height: 100%;
} 
#swipe{
  height: 500px;
}
.mint-swipe-indicator{
  /* background: red; */
}
</style>
