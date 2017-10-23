import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);

const state={
    user:[],
    user_id:"",
    username:"",
    url:"https://www.xiezehao.com/shop/shopPHP/",
    // url:"http://localhost/shop/shopPHP/",
}

const mutations={
    setUsername(state,username){
        state.username=username;
    },
    setUserId(state,id){
        state.user_id=id;
    },
    setUser(state,user){
        state.user=user;
        console.log(state.user);
    }
}
export default new Vuex.Store({
    state,mutations
})