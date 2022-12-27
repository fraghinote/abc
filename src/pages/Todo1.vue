<template>
  <q-page class="bg-grey-3  column" >
    <div class="row column q-pa-sm bg-primary "  >
      <q-input  square dense
               bg-color="white"
               v-model="task2.newTask"
               placeholder="Add Task"
               @keyup.enter="addTask"
      >
        <template v-slot:append>
          <q-btn round dense flat icon="add" @click="addTask" />
        </template>
      </q-input>
    </div>
    Todo
    <q-list
      class="bg-white"
      separator
      bordered >


      <q-item
        v-for="(task,index) in todoTasks"
        :key="task.title"
        tag="label"
        v-ripple
        :class="{'done bg-blue-1' : task.done }"
      >
        <q-item-section avatar>
          <q-checkbox
            v-model="task.done"
            class="no-pointer-events"
            color="primary"
          />
        </q-item-section>
        <q-item-section>
          <q-item clickable v-ripple>  title: {{ task.title }} </q-item>

          <q-item-label>done: {{task.deleteYN}}</q-item-label>
          <q-item-label>deleteYN: {{task.deleteYN}}</q-item-label>
        </q-item-section>
        <q-item-section v-if="task.done" side>
          <q-btn
            @click.stop="deleteTask(task)"
            flat round color="primary" icon="delete"  />
        </q-item-section>
      </q-item>

    </q-list>
    <div
      v-if="!task2.tasks.length"
      class="no-tasks absolute-center">
      <q-icon name="check" size="100px" color="primary"></q-icon>
      <div class="text-h5 text-primary text-center">
        No Tasks
      </div>
    </div>
    <q-separator></q-separator>
    已刪除
    <q-list
       >

      <q-item
        v-for="(task,index) in deletedTasks"
        :key="task.title"
        tag="label"
        v-ripple
        :class="{'done bg-blue-1' : task.done}"
      >
        <q-item-section avatar>
          <q-checkbox
            v-model="task.done"
            class="no-pointer-events"
            color="primary"
          />
        </q-item-section>
        <q-item-section>
          <q-item-label>{{ task.title }}

          </q-item-label>

        </q-item-section>
        <q-item-section v-if="task.done" side>

          <q-btn
            @click.stop="undoTask(task)"
            flat round color="primary" icon="undo"  />
        </q-item-section>
      </q-item>

    </q-list>
  </q-page>

</template>

<script setup>
import {computed, reactive, ref} from 'vue'
import { useQuasar } from 'quasar'
import _ from "lodash"

const $q = useQuasar()
const tasks = ref([]);

const todoTasks = computed( ()=> {
  return tasks.value.filter( item => item.deleteYN === false)
});
const deletedTasks = computed( ()=>{
  return tasks.value.filter( item => item.deleteYN === true)
})

const task2 = reactive({
    newTask : '', confirm :false , tasks: tasks ,deleteYN : false , todoTask : todoTasks
  })

  const addTask = ()=> {
    let tasks = task2.tasks;
    let newId = tasks.length +1;
    tasks.push(
      { id: newId  , title: task2.newTask ,  done:false ,deleteYN : false  }
    )
    task2.newTask=''
  }

  const deleteTask = (task)=>{
    $q.dialog({
      title: 'Alert',
      message: 'Some message',
      cancel : true,
      persistent : true
    }).onOk(() => {
      task.deleteYN = true;
      $q.notify('Task Deleted ')
    })

  }

const undoTask = (task) => {
  task.deleteYN = false;
  task.done = false;
}

</script>


<style lang="scss">

  .done{
    .q-item__label{
      text-decoration: line-through;
      color: #bbb;
    }
  }

  .no-tasks{
    opacity: 0.5;
  }

</style>
