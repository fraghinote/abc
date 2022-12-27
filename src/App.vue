<template>

   <router-view></router-view>
</template>


<script>
import { defineComponent } from 'vue'
import Test from './pages/Test.vue'
export default defineComponent({
  name: 'App',
    components :{Test}
})
</script>
