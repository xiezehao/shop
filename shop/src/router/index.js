import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/Home'
import productList from "@/components/view/productList"
import product from "@/components/view/product"
import confirm from "@/components/view/confirm"
import login from "@/components/view/login"
import register from "@/components/view/register"
import payment from "@/components/view/payment"
import pay_success from "@/components/view/pay_success"
import register_success from "@/components/view/register_success"
import user_center from "@/components/view/user_center"
import user_msg from "@/components/view/user_msg"
import user_order from "@/components/view/user_order"
import modify_password from "@/components/view/modify_password"
import user_orderMsg from "@/components/view/user_orderMsg"
import forgetPassword from "@/components/view/forgetPassword"
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path:"/productList/:keyword",
      name:"productList",
      component:productList
    },{
      path:"/product/:product_id",
      component:product
    },{
      path:"/confirm/:order_no",
      component:confirm
    },{
      path:"/login",
      component:login
    },{
      path:"/register",
      component:register
    },{
      name:"payment",
      path:"/payment",
      component:payment
    },{
      name:"pay_success",
      path:"/pay_success",
      component:pay_success
    },{
      name:"register_success",
      path:"/register_success",
      component:register_success
    },{
      name:"user_center",
      path:"/user_center",
      component:user_center,
      children:[
        {
          path:"",
          component:user_msg
        },{
          path:"user_order",
          component:user_order
        },{
          path:"modify_password",
          component:modify_password
        },{
          path:"user_orderMsg/:order_no",
          component:user_orderMsg
        }
      ]
    },{
      path:"/forgetPassword",
      component:forgetPassword
    }
  ]
})
