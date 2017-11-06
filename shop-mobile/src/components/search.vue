<template>
  <div>
      <div id="search">
        <mt-search
            v-model="value"
            cancel-text="取消"
            placeholder="搜索">
        </mt-search>
      </div>
      <div id="content">
        <ul>
            <li v-for="(item,index) in productList" :key="index" @click="to(item.id)">
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
          keyword:this.$route.params.keyword,
          productList:[]
      }
  },
  mounted () {
      this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Search&f=search&keyword="+this.keyword)
                .then(res=>{
                    console.log(res);
                    this.productList=res.data;
                    console.log(this.productList)
                })
  },
  methods: {
      to(id){
        this.$router.push("/productMsg/"+id);
      }
  }
}
</script>

<style scoped>
#search{
      height: 52px;  
}
ul{
    margin: 0;
    padding: 0;
}
li{
    width: 50%;
    list-style-type: none;
    text-align: center;
    float: left;
    margin-top: 10px;
}
li>img{
    width:45%;
}
p{
    height: 35px;
    overflow: hidden;
    margin: 0;
    font-size: 12px;
    margin-top: 5px;
}
</style>
