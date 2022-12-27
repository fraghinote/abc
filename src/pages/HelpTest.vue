<template>


  <q-input
              v-model="newTask"
              @keyup.enter="addTask"
              bg-color="white"
              color="red"
              label="請輸入新增項目:"
              :dense="dense">

    <template v-slot:append >
      <q-btn @click="addTask"
             round
             dense
             flat
             icon="add" />
    </template>
  </q-input>


  <q-page>
    {{condition}}


    <div class="row" >
      <q-input
        v-model="condition"
        model color="red"
        @keyup="loadData"
        label="請輸入查詢條件:">
      </q-input>
    </div>

    <div class="q-pa-md">
    <q-list bordered separator>
      <q-item
      v-for=" (map,index) in data.value"
      clickable v-ripple
      @click="selectItem(map);showDialog()">
        {{map.IP}}
        <q-item-section
          v-if="data"
        side>
        </q-item-section>
        <q-btn @click.stop="deleteTask(index)"
               flat
               round
               dense
               color="deep-orange"
               icon="delete">

        </q-btn>
      </q-item>
    </q-list>
    </div>





  </q-page>
  <q-dialog v-model="alert">
  <q-card>
    <q-card-section>
      <div class="text-h6" icon ="warning">Message</div>

    </q-card-section>
    <q-card-section class="q-pt-none">
      <q-icon name="warning" color="warning" size="32px" /><br>
      {{selectedItem}}<br>
      <br>modifiip:{{modifiip}}
      <q-input outlined v-model="modifiip" label="請輸入修改內容:" @click.stop="updateTask()"/>


    </q-card-section>

    <q-card-section align="right">
      <q-btn flat label="取消" color="primary" v-close-popup  round ></q-btn>
      <q-btn flat label="確認" color="primary" v-close-popup @click="updateTask()" round ></q-btn>
    </q-card-section>
  </q-card>
  </q-dialog>
</template>
<script>
import { ref } from 'vue'
export default {

    data() {
        return {}

    }
}
</script>




<script setup>
import {onBeforeMount, ref} from 'vue'
import { api } from "boot/axios"
import { useQuasar } from 'quasar'
const $q = useQuasar()
const data = ref([])
const alert = ref(false)
const condition = ref("")
const selectedItem = ref({});
const uid = ref();
const tasks = ref([]);
const newTask = ref('')
const modifiip = ref('');
const selectItem = (task) => {
        console.log(task)
        selectedItem.value = task;
        modifiip.value = selectedItem.value.IP;
    }

function loadData() {
        let parameters_json = {condition: condition.value}
        // console.log(parameters_json)
        api.post('../api/test.jsp', parameters_json)
            .then((response) => {
                data.value = response.data;
                uid.value = data.value.uid
                console.log(data.value.uid)
            })
            .catch((error) => {
                $q.notify({
                    color: 'negative',
                    position: 'top',
                    message: 'Loading failed' + error,
                    icon: 'report_problem',
                })
            })
    }

function showDialog() {
        console.log('showDialog')
        alert.value = true
    }

    function addTask() {
        // console.log(data.value['value'])
        let parameters_json = {IP: newTask.value, NAME: newTask.value, APPID: newTask.value}
        console.log(parameters_json)
        api.post('../api/addst.jsp', parameters_json)
            .then((response) => {
                //data.value = response.data;

                let IP = newTask.value;
                data.value['value'].unshift({
                    IP: IP
                })


                newTask.value = ''
            })
            .catch((error) => {
                $q.notify({
                    color: 'negative',
                    position: 'top',
                    message: 'Loading failed' + error,
                    icon: 'report_problem',
                })
            })

    }

function deleteTask(index) {
        $q.dialog({
            title: '確認',
            message: '是否刪除留言 ?',
            cancel: true,
            persistent: true
        }).onOk(() => {
            api.post('../api/del.jsp', {index: index, uid: this.uid})

                .then((response) => {
                    console.log(response);
                }, (error) => {
                    console.log(error);
                })
            console.log(this.uid)
            this.data.value.splice(index, 1)
            $q.notify('已刪除')
        })
    }

function updateTask() {

        api.post('../api/modifitest.jsp', {modifiip: modifiip.value, selectedItem: selectedItem.value})
            .then((response) => {
                console.log(response);
                loadData();
            }, (error) => {
                console.log(error);
            });

    }


    onBeforeMount(() => {  //畫面直接顯示資料
        // console.log(onBeforeMount);
        loadData();
    })



</script>
