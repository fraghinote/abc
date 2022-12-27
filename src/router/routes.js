

const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { name:'Login', path: 'login/:error?', component: () => import('pages/Login.vue')  ,  meta: { title: '登入', requiresAuth: false, }  },
      { path:'Logout',component:()=> import('pages/Logout.vue')  ,  meta: { title: '登出', requiresAuth: false, }  },
      { path: '', component: () => import('pages/Todo.vue'), meta:{requiresAuth :true}  },
      { path: 'help', component: () => import('pages/Help.vue') , meta:{requiresAuth :true} },
      { path: 'login1', component: () => import('pages/login1.vue') ,  meta: { title: '登入', requiresAuth: false, }},
      { path: 'Top', component: () => import('pages/Top.vue') , meta:{requiresAuth :true} },
      { path: 'ConsumerDetails', component: () => import('pages/ConsumerDetails.vue'), meta:{requiresAuth :true}  },
      { path: 'IP', component: () => import('pages/IP.vue'), meta:{requiresAuth :true}  },
      { path: 'shop', component: () => import('pages/shop.vue'), meta:{requiresAuth :true}  },
      { path: 'HelpTest', component: () => import('pages/HelpTest.vue') , meta:{requiresAuth :true} },
        { name:'LoginOOOOO', path: 'LoginOOOOO/:error?', component: () => import('pages/LoginOOOOO.vue')  ,  meta: { title: '登入', requiresAuth: false, }  },

    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

export default routes
