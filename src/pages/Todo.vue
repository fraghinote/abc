<template>
  <q-page class="bg-gray-3 column">
    <div class="row q-pa-sm bg-primary">
      <q-input
        v-model="newTask"
        @keyup.enter="addTask"
        class="col"
        square
        filled
        bg-color="white"
        placeholder="請輸入問題"
        dense>
        <template v-slot:append>
          <q-btn
          @click="addTask"
          round
          dense
          flat
          icon="add" />
        </template>
      </q-input>
      </div>
    <q-list class="bg-white">
      <q-item
        v-for="(task, index) in tasks"
        :key="task.title"
      v-ripple>
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
</template>



<script>
export default {
  data() {
    return {
      newTask: '',
      tasks:
      [
        {
          title: "apple",
          done: false
        },
        {
          title: "banana",
          done: false
        },
        {
          title: "lemon",
          done: false
        }
      ]
    }
  },
  methods: {
    deleteTask(index) {
        this.$q.dialog({
            title: '確認',
            message: '是否要刪除留言 ?',
            cancel: true,
            persistent: true
        }).onOk(() => {
            this.tasks.splice(index, 1)
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

  }

}
</script>

