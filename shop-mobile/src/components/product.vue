<template>
  <div id="product">
       <!-- <div id="search">
        <mt-search
            v-model="value"
            cancel-text="取消"
            placeholder="搜索">
        </mt-search>
      </div>  -->
      <div id="left">
         <ul>
          <li v-for="(item,index) in category" :key="index" @click="change(item.id)">
            {{item.name}}
          </li>
        </ul> 
        
      </div>

      <div id="right">

        <p v-show="isShow">暂无数据</p>
         <ul>
           <li v-for="(item,index) in product" :key="index">
             <img :src="item.main_image" alt=""> 
            <p>{{item.name}}</p>
            
          </li> 

        </ul> 
      </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      category:[],
      product:[],
      isShow:false,
    }
  },
  mounted () {
    this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Product&f=getCategory")
              .then(res=>{
                // console.log(res);
                this.category=res.data;
              })
              
  },
  methods: {
    change(id){
      // this.product=[];
      this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Product&f=getProductByCategoryId&category_id="+id)
                .then(res=>{
                  if (res.data!="0-") {
                    this.product=res.data;
                    this.isShow=false;
                  }else{
                    this.product=[];
                    this.isShow=true;
                  }
                  
                })
    }
  }
}
</script>

<style scoped>
#product{
  height: 100%;
}
#search{
  height: 52px;
}
#left{
   /* width: 30%;  */
  height: 100%;
  /* display: inline-block; */
   float: left; 
  /* overflow: hidden; */
  /* overflow-y: auto;
   */
   /* position: relative; */
   overflow:scroll; /*任何时候都强制显示滚动条*/

}
#left ul{
  padding: 0;
  border-right: 1px solid #ddd;
}
#left li{
  list-style-type: none;
  padding: 5px 5px;
  font-size: 16px;
  /* float: left; */
}
#right{
   float: left; 
    width: 70%;  
   height: 100%; 
  overflow: scroll;
  box-sizing: border-box;
}
#right ul{
  padding: 0 10px;
  box-sizing: border-box;
}
#right li{
   height: 60px; 
  list-style-type: none;
  font-size: 12px;
  padding: 15px 10px 0 15px;
  border: 1px solid black;
  border-radius: 5px;
  box-shadow: 2px 2px 5px gray;
  margin-top: 10px;
}
#right img{
  width: 25%;
  /* height: 200px; */
  float: left;
  margin-right: 10px;
}
#right p{
  height: 47px;
  margin: 0;
  overflow: hidden;
}
</style>
