<template>
    {{isLogin}}
  <div class="q-pa-md" style="max-width: 400px">

    <q-form
      @submit="onSubmit"
      @reset="onReset"
      class="q-gutter-md"
    >
      <q-input
        filled
        v-model="name"
        label="帳號 *"
        lazy-rules
        :rules="[ val => val && val.length > 0 || '此為必填']"
      />

      <q-input
        filled
        type="text"
        v-model="age"
        label="密碼 *"
        lazy-rules
        :rules="[
          val => val !== null && val !== '' || '此為必填',
        ]"
      />

      <div>
        <q-btn label="登入" type="submit" color="primary"/>
        <q-btn label="忘記密碼" type="reset" color="primary" flat class="q-ml-sm" />
      </div>
    </q-form>

  </div>
</template>

<script setup>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import { api } from 'boot/axios'
import {userStat} from "stores/userStat";
import { storeToRefs } from 'pinia';
const store = userStat();
const { isLogin } = storeToRefs(store);
const $q = useQuasar()
const name = ref(null)
const age = ref(null)
const accept = ref(false)
const submit = ref({name:'',age:''})
import { useRouter } from 'vue-router';
const router = useRouter()



function  onSubmit () {
    submit.value = {name:name.value,age:age.value};
    api.post('/api/onSubmit.jsp',{onSubmit:submit.value})
        .then((response) => {
            console.log("data.value213123"+response.data)
            let data = response.data
            console.log("data ",data)
            console.log("date.isOK === 'Y' ",data.isOK === 'Y')
            if(data.isOK === 'Y'){
                console.log("isLogin.value",isLogin.value);
                isLogin.value = true;
                router.push("/")
            }else{

            }

        })
        .catch(() => {
            isLogin.value = false;
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

function onReset () {
    name.value = null
    age.value = null
    accept.value = false
}




    // if( name.value == 'abcd' && age.value == '1234' ){
    //     accept.value = true;
    //     isLogin.value = true;
    //         $q.notify({
    //             color: 'green-4',
    //             textColor: 'white',
    //             icon: 'cloud_done',
    //             message: 'Submitted'
    //             })
    // }else{
    //     isLogin.value = false;
    //         $q.notify({
    //             color: 'red-5',
    //             textColor: 'white',
    //             icon: 'warning',
    //             message: '帳號或密碼錯誤'
    //           })
    // }

    // if (accept.value !== true) {
    //     $q.notify({
    //         color: 'red-5',
    //         textColor: 'white',
    //         icon: 'warning',
    //         message: '帳號或密碼錯誤'
    //       })
    //     }
    // else {
    //     $q.notify({
    //         color: 'green-4',
    //         textColor: 'white',
    //         icon: 'cloud_done',
    //         message: 'Submitted'
    //         })
    //     }






</script>


