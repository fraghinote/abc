<!--<template>-->
<!--    <div>-->
<!--        <button @click="incrementCounter" class="btn btn-outline-primary">增加 {{ counter }} 元</button>-->
<!--        {{counter}}-->
<!--    </div>-->
<!--    {{props.cash}}-->

<!--</template>-->
<!--<script setup>-->
<!--import {computed, ref} from "vue"-->
<!--const props =  defineProps({-->
<!--    cash: Number,-->
<!--    title : String ,-->
<!--})-->
<!--const counter = computed(()=>{  //點擊物件同時顯示數字-->
<!--        return props.cash-->
<!--})-->

<!--const incrementCounter = function (){-->
<!--    counter.value = counter.value+100-->
<!--    emit('changeCounter')-->
<!--}-->

<!--const emit = defineEmits(['changeCounter'])-->


<!--</script>-->

<template>
    <div>

        <button @click="incrementCounter" class="btn btn-outline-primary ">增加 {{ counter }} 元</button>
<!--        {{counter}}-->
        cash{{props.cash}}
    </div>

</template>

<script setup>
import {ref} from "vue"
const counter = ref(100)
const incrementCounter = function (){
    counter.value = counter.value+100
    emit('changeCounter')
}
const  emit = defineEmits(['changeCounter'])

const props = defineProps({
    cash:Number,

})

</script>


