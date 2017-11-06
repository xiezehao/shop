<template>
  <div>
      <mt-header title="个人信息">
        <router-link to="/" slot="left">
            <mt-button icon="back"></mt-button>
        </router-link>
        <mt-button slot="right" @click="to">编辑</mt-button>
      </mt-header>

      <div id="content">
          <p>
              名字：{{userMsg.username}}
          </p>
          <p>
              电话：{{userMsg.phone}}
          </p>
          <p>
              邮箱：{{userMsg.email}}
          </p>
          <p>
              问题：{{userMsg.question}}
          </p>
          <p>
              答案：{{userMsg.answer}}
          </p>
      </div>
  </div>
</template>

<script>
export default {
    data () {
        return {
            userMsg:{}
        }
    },
    mounted () {
        this.userMsg=JSON.parse(sessionStorage.getItem("user"));
        // console.log(JSON.parse(this.userMsg));
        // console.log(this.userMsg);
        // this.axios.get("")
    },
    methods: {
        to(){
            this.$router.push("/mofityUserMsg");
        }
    }
}
</script>

<style scoped>
#content p{
    margin-left: 20px;
}


</style>
