<template>
  <q-page class="q-ma-sm">
    <q-dialog v-model="dialog" persistent seamless  >
      <div class="column">
        <div class="row bg-blue" >

          <h5 class="text-h5 text-white q-ma-md ">中原大學</h5>
        </div>
        <div class="row">
            <q-card  flat  class="q-pa-lg ">
              <q-card-section  class="bg-deep-orange-1">
                確定要登出?
              </q-card-section>
              <q-card-actions>
                <q-btn label="ok" @click="doLogout"></q-btn>
              </q-card-actions>
            </q-card>

        </div>
      </div>

    </q-dialog>

  </q-page>
</template>


<script setup>

import {computed, ref} from "vue"
  import { Loading, useQuasar } from 'quasar'
  const $q = useQuasar()

  import axios from "axios";
  import { useRouter } from 'vue-router';
  const router = useRouter()


  const dialog = ref(true)

  const alert = ref(false)
  const loading = ref(false);
  const myForm = ref(null)
  const doLogout = ()=>{
    window.location.href="../api/auth.logout.jsp";
  }


</script>

<style scoped>

</style>
