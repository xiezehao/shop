import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/home'
import shouye from '@/components/shouye'
import product from '@/components/product'
import center from '@/components/center'
import productList from '@/components/productList'
import login from '@/components/login'
import user_msg from '@/components/user_msg'
import mofityUserMsg from '@/components/mofityUserMsg'
import mofityPassword from '@/components/mofityPassword'
import userOrderList from '@/components/userOrderList'
import search from '@/components/search'
import productMsg from '@/components/productMsg'
import orderMsg from '@/components/orderMsg'
import pay from '@/components/pay'
// import Mint from 'mint-ui'
Vue.use(Router)
// Vue.use(Mint)
export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: home,
      children:[
        {
          path:'',
          component:shouye
        },{
          path:'product',
          component:product
        },{
          path:'center',
          component:center
        }
      ]
    },{
      path:"/productList",
      component:productList
    },{
      path:"/login",
      component:login
    },{
      path:'/user_msg',
      component:user_msg
    },{
      path:'/mofityUserMsg',
      component:mofityUserMsg
    },{
      path:'/mofityPassword',
      component:mofityPassword
    },{
      path:'/userOrderList',
      component:userOrderList
    },{
      path:'/search/:keyword',
      component:search
    },{
      path:'/productMsg/:id',
      component:productMsg
    },{
      path:'/orderMsg/:order_no',
      component:orderMsg
    },{
      name:'pay',
      path:'/pay',
      component:pay
    }
  ]
})
