import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/Home'
import productList from "@/components/view/productList"
import product from "@/components/view/product"
import confirm from "@/components/view/confirm"
import login from "@/components/view/login"
import register from "@/components/view/register"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path:"/productList",
      name:"productList",
      component:productList
    },{
      path:"/product",
      component:product
    },{
      path:"/confirm",
      component:confirm
    },{
      path:"/login",
      component:login
    },{
      path:"/register",
      component:register
    }
  ]
})
