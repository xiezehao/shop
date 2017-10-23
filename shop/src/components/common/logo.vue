<template>
  <div>
      <div id="logo" @click="to">
        <img src="../../assets/logo.jpg" alt="">
      </div>
  </div>
</template>

<script>
export default {
  methods: {
    to(){
      this.$router.push("/")
    }
  }
}
</script>

<style scoped>
div{
  background: white;
}
#logo{
    width: 1080px;
    margin: 0 auto;
    padding-top: 15px;
    cursor: pointer;
}
</style>
