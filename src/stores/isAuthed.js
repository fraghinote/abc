import { defineStore } from 'pinia'
import axios from "axios";


export const useIsAuthed = defineStore('isAuthed', {
  state: () => ({   //定義初始值
    isAuthed: false,
    surveyUser: {},
  }),

  getters: {        //如同computed計算屬性

  },

  actions: {        //如同method方法
    async checkSession () {
      let response = await axios.post('../api/auth.checkSession.jsp',{})
      this.isAuthed = response.data.isAuthed
      this.surveyUser = response.data.surveyUser
    }
  }
})
