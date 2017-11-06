<template>
  <div>
      <div id="content">
        <mt-field label="原始密码：" placeholder="请输入原始密码" type="password" v-model="password"></mt-field>
        <mt-field label="新密码：" placeholder="请输入新密码" type="password" v-model="newPassword"></mt-field>
        <mt-field label="确认密码：" placeholder="再一次确认密码" type="password" v-model="newPassword2"></mt-field>
       
        <div id="btn">
            <mt-button type="primary" size="large" @click="mofity">修改密码</mt-button>
        </div>
        
      </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui';
export default {
    data () {
        return {
            id:'',
            password:'',
            newPassword:'',
            newPassword2:'',
        }
    },
    methods: {
        mofity(){
            const id=sessionStorage.getItem("id");
            const params=new URLSearchParams();
            params.set("c","User");
            params.set("f","modifyPassword");
            params.set("id",id);
            params.set("oldPassword",this.password);
            params.set("newPassword",this.newPassword);

            this.axios.post("https://www.xiezehao.com/shop/shopPHP/",params)
                        .then(res=>{
                            console.log(res);
                            if (res.data=='1') {
                                MessageBox.alert("", "修改成功，请重新登录");
                                this.$router.push("/login");
                            }
                        })
        }
    }

  
}
</script>

<style scoped>

</style>
