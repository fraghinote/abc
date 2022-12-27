import { route } from 'quasar/wrappers'
import { createRouter, createMemoryHistory, createWebHistory, createWebHashHistory } from 'vue-router'
import routes from './routes'

import {useIsAuthed} from "stores/isAuthed";
import {storeToRefs} from "pinia";
/*
 * If not building with SSR mode, you can
 * directly export the Router instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Router instance.
 */

export default route(function (/* { store, ssrContext } */) {
  const createHistory = process.env.SERVER
    ? createMemoryHistory
    : (process.env.VUE_ROUTER_MODE === 'history' ? createWebHistory : createWebHashHistory)
    const { isAuthed,surveyUser } = storeToRefs(useIsAuthed())
    const {checkSession}  = useIsAuthed()

  const Router = createRouter({
      scrollBehavior: (to, from, savedPosition) => {
          if (savedPosition) {
              return savedPosition
          } else {
              return { left: 0,top: 0 }
          }
      },
      routes,
    // Leave this as is and make changes in quasar.conf.js instead!
    // quasar.conf.js -> build -> vueRouterMode
    // quasar.conf.js -> build -> publicPath
    history: createHistory(process.env.VUE_ROUTER_BASE)
  })
//取session
    //beforeEach每一個路由要進入前，都會先經過這裡，他會傳入三個參數
    Router.beforeEach(
        //當async函式被呼叫會回傳成功或失敗一個值。 to你要去的路由位置/ from你從哪個路由位置進來/ next繼續往下執行呼叫函示
        async (to, from, next)=>{
            //await會暫停async的執行等待checkSession回傳true或false在執行 //資料庫查找帳號密碼，如果成功找到帳密則回傳true打開登入成功資料畫面，反之則false
            await checkSession()
            if(!isAuthed.value && to.meta.requiresAuth ){
                next({name:'Login'})
            }else{
                next()
            }
        }
    )

    return Router
})
