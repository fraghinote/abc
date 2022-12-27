<template>

<!--  <div class="row column q-pa-sm bg-primary "  >-->
<!--    <q-input  square dense-->
<!--              bg-color="white"-->
<!--              v-model="task2.newTask"-->
<!--              placeholder="Add Task"-->
<!--              @keyup.enter="addTask"-->
<!--    >-->
<!--      <template v-slot:append>-->
<!--        <q-btn round dense flat icon="add" @click="addTask" />-->
<!--      </template>-->
<!--    </q-input>-->
<!--  </div>-->
<!--  <q-list-->
<!--    class="bg-white"-->
<!--    separator-->
<!--    bordered >-->


<!--    <q-item-->
<!--      v-for="(task,index) in todoTasks"-->
<!--      :key="task.title"-->
<!--      tag="label"-->
<!--      v-ripple-->
<!--      :class="{'done bg-blue-1' : task.done }"-->
<!--    >-->
<!--      <q-item-section avatar>-->
<!--        <q-checkbox-->
<!--          v-model="task.done"-->
<!--          class="no-pointer-events"-->
<!--          color="primary"-->
<!--        />-->
<!--      </q-item-section>-->
<!--      <q-item-section>-->
<!--        <q-item clickable v-ripple>  title: {{ task.title }} </q-item>-->

<!--        <q-item-label>done: {{task.deleteYN}}</q-item-label>-->
<!--        <q-item-label>deleteYN: {{task.deleteYN}}</q-item-label>-->
<!--      </q-item-section>-->
<!--      <q-item-section v-if="task.done" side>-->
<!--        <q-btn-->
<!--          @click.stop="deleteTask(task)"-->
<!--          flat round color="primary" icon="delete"  />-->
<!--      </q-item-section>-->
<!--    </q-item>-->

<!--  </q-list>-->
<!--  <q-list-->
<!--    class="bg-green-1"-->
<!--    separator-->
<!--    bordered >-->

<!--      <q-item-->
<!--        v-for="(task,index) in deletedTasks"-->
<!--        :key="task.title"-->
<!--        tag="label"-->
<!--        v-ripple-->
<!--        :class="{'done bg-blue-1' : task.done}"-->
<!--      >-->
<!--      <q-item-section avatar>-->
<!--        <q-checkbox-->
<!--          v-model="task.done"-->
<!--          class="no-pointer-events"-->
<!--          color="primary"-->
<!--        />-->
<!--      </q-item-section>-->
<!--      <q-item-section>-->
<!--          <q-item-label>-->
<!--              {{ task.title }}-->
<!--          </q-item-label>-->

<!--      </q-item-section>-->
<!--      <q-item-section v-if="task.done" side>-->

<!--        <q-btn-->
<!--            @click.stop="undoTask(task)"-->
<!--            flat round color="primary" icon="undo"  />-->
<!--      </q-item-section>-->
<!--    </q-item>-->

<!--  </q-list>-->
<!--  <q-list v-for="index in data" ></q-list>-->


  <q-page>
      {{condition}}
  <q-btn color="purple" @click="loadData" label="Show Notification"  />

    <div class="row">
      <q-input v-model="condition"
               @keyup.enter="loadData"
            label="請輸入查詢條件"
      >

      </q-input>
    </div>
    <q-list  bordered separator >
      <q-item v-for=" (map,index)  in data.value" clickable v-ripple @click="selectItem(map);showDialog()">
        {{ map.IP }} <br>
        <q-item-section
          v-if="data"
          side>
          <q-btn
            @click.stop="deleteTask(index)"
            flat
            round
            dense
            color="primary"
            icon="delete" />
        </q-item-section>
      </q-item>






    </q-list>




<!--    <div class="row q-pa-sm ">-->

<!--      <q-input-->

<!--        v-model="condition"-->
<!--        @keyup.enter=""-->
<!--        class="blue"-->
<!--        square-->
<!--        filled-->
<!--        bg-color="white"-->
<!--        placeholder="請輸入查詢項目"-->
<!--        dense>-->
<!--        <template v-slot:append>-->
<!--          <q-btn-->
<!--          @click="addTask"-->
<!--          round-->
<!--          dense-->
<!--          flat-->
<!--          icon="add" />-->
<!--        </template>-->
<!--      </q-input>-->
<!--      </div>-->
    <q-list class="bg-white" >
      <q-item
          v-for="(task, index) in tasks"
          :key="task.title"
          v-ripple @click="selectedItem,showDialog">
        <q-item-section avatar>
          <q-checkbox v-model="task.done"
          color="primary" />
        </q-item-section>
        <q-item-section>
          <q-item-label>{{task.title}}</q-item-label>
        </q-item-section>
        <q-item-section
          v-if="task.done"
          side>
          <q-btn
          @click.stop="deleteTask(index)"
          flat
          round
          dense
          color="primary"
          icon="delete" />
        </q-item-section>
      </q-item>
    </q-list>
  </q-page>
  <q-dialog v-model="alert">
    <q-card>
      <q-card-section>
        <div class="text-h6">Alert</div>
      </q-card-section>

      <q-card-section class="q-pt-none">
        {{selectedItem}}
      </q-card-section>

      <q-card-actions align="right">

        <q-btn flat label="取消" color="primary" v-close-popup  round ></q-btn>
        <q-btn flat label="確認" color="primary" v-close-popup @click="deleteTask()" round ></q-btn>
      </q-card-actions>
    </q-card>

  </q-dialog>



</template>
<script>
import {computed, reactive, ref} from 'vue'
import { api } from 'boot/axios'
import { useQuasar } from 'quasar'
export default {

  data() {
    return {
      newTask: '',
      tasks:null,
    }
  },
  methods: {
    // deleteTask(index) {
    //   this.tasks.splice(index, 1)
    // },
    deleteTask(index) {

        this.$q.dialog({
            title: '確認',
            message: '是否要刪除留言 ?',
            cancel: true,
            persistent: true
        }).onOk(() => {

          api.post('../api/st.jsp', {index:index,uid:this.uid})

            .then((response) => {
              console.log(response);
            }, (error) => {
              console.log(error);
            });
          console.log(this.uid)
            this.data.value.splice(index, 1)
            this.$q.notify('已刪除')
        })
    },
    addTask() {
        this.tasks.push({
          title: this.newTask,
          done: false
        })
        this.newTask =''
        console.log(this.tasks)
    },




  },

setup () {
  const $q = useQuasar()
  const data = ref({})
  const alert=ref(false)
  const condition = ref("")
  // const tasks = ref([])
  const selectedItem = ref ({});
  const uid = ref();
  const selectItem = (task)=>{
    console.log(task)
    selectedItem.value = task;
  }
  // const newTask = reactive({
  //   newTask : '', confirm :false , tasks: tasks ,deleteYN : false , todoTask : todoTasks
  // })
  // const todoTasks = computed( ()=> {
  //   return tasks.value.filter( item => item.deleteYN === false)
  // })
  // const deletedTasks = computed( ()=>{
  //   return tasks.value.filter( item => item.deleteYN === true)
  // })
  // const task2 = reactive({
  //   newTask : '', confirm :false , tasks: tasks ,deleteYN : false , todoTask : todoTasks
  // })
  // const addTask = ()=> {
  //   let tasks = task2.tasks;
  //   let newId = tasks.length +1;
  //   tasks.push(
  //     { id: newId  , title: task2.newTask ,  done:false ,deleteYN : false  }
  //   )
  //   task2.newTask=''
  // }
  function loadData () {
    let parameters_json = {condition: condition.value}
    // console.log(parameters_json)
    api.post('../api/test.jsp',parameters_json)
      .then((response) => {
        data.value = response.data;
        uid.value = data.value.uid
        console.log(data.value.uid)
      })
      .catch((error) => {
        $q.notify({
          color: 'negative',
          position: 'top',
          message: 'Loading failed'+error,
          icon: 'report_problem',
        })
      })
  }

  function showDialog(){
    console.log('showDialog')
    alert.value = true
  }

  // const deleteTask = (task)=>{
  //   $q.dialog({
  //     title: 'Alert',
  //     message: 'Some message',
  //     cancel : true,
  //     persistent : true
  //   }).onOk(() => {
  //     task.deleteYN = true;
  //     $q.notify('Task Deleted ')
  //   })
  //
  // }

  return { data, loadData,condition,showDialog,alert,selectedItem,selectItem,uid}
},



}

</script>
