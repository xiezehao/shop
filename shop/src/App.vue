<template>
  <div id="app">
    <!-- <shopHeader></shopHeader> -->
    <div id="main">
      <router-view></router-view>
    </div>
    <div id="footer">
      <shopFooter></shopFooter> 
    </div>
     
  </div>
</template>

<script>
import shopHeader from "@/components/common/header";
import shopFooter from "@/components/common/footer";
export default {
  name: 'app',
  components: {
    shopHeader,
    shopFooter
  }
}
</script>

<style>
#main{
  /* margin-top: 20px; */
}
#footer{
  clear: both;
}
</style>
