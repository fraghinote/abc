<template>
    asdasd
    <ol>
        <li
            v-for="(d,index) in data">
            {{d}}
        </li>
    </ol>


    1
    2
    3
    4
    5
    {{data1}}
</template>
<script setup>
 import {ref} from "vue"

 const data = ref([1,2,3,4,5])
 const data1 = ref(1)
</script>
