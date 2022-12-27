import { defineStore } from 'pinia'

export const userStat = defineStore('counter', {
  state: () => ({
      isLogin : false,
  }),

})
