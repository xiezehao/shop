<template>
  <div>
      <logo></logo>
      <div id="success">
        <h1>支付成功</h1>
      </div>
      
  </div>
</template>

<script>
import logo from "@/components/common/logo";
export default {
  components: {
      logo
  }
}
</script>

<style scoped>
#success{
    width: 1080px;
    margin: 0 auto;
    background: white;
    margin-top: 20px;
    padding: 20px 0;
}
h1{
    text-align: center;
    color: #1E90FF;
    font-weight: bold;
}
</style>
