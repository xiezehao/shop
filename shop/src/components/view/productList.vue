<template>
  <div>
    <shopHeader></shopHeader>
    <div id="productList">
        <ul>
            <li @click="to(item.id)" v-for="(item,index) in productList">
                 <img :src="item.main_image" alt="" class="img"> 
                 <p class="red price">{{item.price}}</p>
                 <div class="des">
                    <a href="javascript:void(0);">{{item.name}}</a>
                 </div>
            </li>
        </ul>
        <span v-show="isShow" class="result">没有查询的产品</span>
    </div>
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
export default {
  name:"productList",
  data () {
      return {
        keyword:this.$route.params.keyword,
        productList:[],
        isShow:true
      }
  },
  mounted () {
    this.search(this.keyword);
  },
  components: {
      shopHeader
  },
  methods: {
      to(id){
          this.$router.push("/product/"+id);
      },
      search(keyword){
        const _this=this;
        this.axios.get("https://www.xiezehao.com/shop/shopPHP/?c=Search&f=search&keyword="+keyword)
            .then(response=>{
                if (response.data!="0-") {
                    _this.productList=response.data;
                    _this.isShow=false;
                }
            });
      }
  },
  watch: {
      "$route":function(){
        this.search(this.$route.params.keyword);
      }
  }
}
</script>

<style scoped>
#productList{
    width: 1080px;
    margin: 0 auto;
    padding-bottom: 10px;
    text-align: center;
}
li{
    width: 200px;
    height: 290px;
    background: white;
    cursor: pointer;
    float: left;
    margin-left: 16px;
    margin-top: 10px;
}
li:hover{
    box-shadow: 2px 2px 5px #666;
}
.img{
    width: 180px;
    height: 200px;
    margin: 10px 10px 5px 10px;
}
.red{
    color: red;
}
.price{
    margin-left: 10px;
}
.des{
    height: 36px;
    overflow: hidden;
    font-size: 13px;
    margin: 5px 10px 0 10px;
    
    
}
.des a{
    color: #666;
    text-decoration: none;
    line-height: 20px;
}
.result{
    color: #1E90FF;
    font-weight: bold;
}
</style>
