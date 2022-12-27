<template>
  <q-page class="q-ma-sm">
    <q-dialog v-model="loginDialog" persistent seamless  >
      <div class="column">
        <div class="row bg-blue-grey" >

          <h5 class="text-h5 text-white q-ma-md ">中原大學</h5>
        </div>
        <div class="row">
          <q-form @submit="doLogin" class="q-gutter-md" method="post" :action="action">

            <q-card  flat  class="q-pa-lg ">
              <q-card-section  class="bg-amber-4" v-if="$route.params.error">
                登入失敗請重新登入
              </q-card-section>
              <q-card-section>
                <q-input    v-model="login.id" name="UserNm" type="text"   label="帳號"  :rules="[ (val) => val && val.length > 0 || 'Please type your account number ']"/>
                <q-input    v-model="login.pw" name="UserPasswd" type="password" label="密碼"  :rules="[ (val) => val && val.length > 0 || 'Please type your password']"/>
                <input type="hidden" name="returnPath" :value="returnPath">
                <input type="hidden" name="failPath" :value="failPath">
              </q-card-section>
              <q-card-actions class="q-px-md">
                <q-btn unelevated color="blue-grey" size="lg" type="submit" class="full-width" label="Login"   />
              </q-card-actions>
              <q-card-section class="text-center q-pa-none">
                <p class="text-grey-6">請輸入itouch帳號密碼</p>
              </q-card-section>
            </q-card>
          </q-form>
        </div>
      </div>

    </q-dialog>

  </q-page>
</template>



<script setup>
//form data
let action = 'http://127.0.0.1:9000/api/auth.getAuthOOOOO.jsp'


import {onBeforeMount, ref} from "vue"
import { Loading, useQuasar } from 'quasar'
const $q = useQuasar()

const loginDialog = ref(true)
const login = ref({
  id:"", pw:""
})


  const alert = ref(false)
  const loading = ref(false);
  const myForm = ref(null)
  const doLogin = (evt)=>{
    Loading.show()
    loginDialog.value = false;
    evt.target.submit()
  }
onBeforeMount(()=>{

 })

</script>

<style scoped>

</style>
