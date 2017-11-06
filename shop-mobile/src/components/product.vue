<template>
  <div id="product">
      <div id="search">
        <mt-search
            v-model="value"
            cancel-text="取消"
            placeholder="搜索">
        </mt-search>
      </div>
      <div id="left">
        <ul>
          <li v-for="(item,index) in category" :key="index" @click="change(item.id)">
            {{item.name}}
          </li>
        </ul>
      </div>

      <div id="right">
        <ul>
          <li v-for="(item,index) in product" :key="index">
             <img :src="item.main_image" alt=""> 
            {{item.name}}
            
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
      product:[]
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
                  this.product=res.data;
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
  width: 25%;
  float: left;
  overflow: hidden;
}
#left ul{
  padding: 0;
  border-right: 1px solid black;
}
#left li{
  list-style-type: none;
  padding: 5px 10px;
  font-size: 18px;
  /* float: left; */
}
#right{
  float: left;
  width: 75%;
}
#right ul{
  padding: 0 10px;
}
#right li{
   height: 60px; 
  list-style-type: none;
  font-size: 12px;
  padding: 15px 10px;
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
#right {

}
</style>
