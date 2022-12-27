<!--<template>-->

<!--    <div class="q-pa-md q-gutter-sm">-->
<!--        {{cash}}-->

<!--        <ButtonCount>-->

<!--        </ButtonCount>-->

<!--        <ButtonCount :cash="cash" :title="title"  @changeCounter="incrementTotal" >-->

<!--        </ButtonCount>-->


<!--        <q-btn round color="secondary" icon="點我"   @click="incrementTotal"/>-->
<!--&lt;!&ndash;        <q-btn round color="secondary" icon="-"   @click="incrementTotal"/>&ndash;&gt;-->
<!--    </div>-->

<!--</template>-->
<!--<script setup>-->
<!--import { ref } from "vue"-->
<!--import ButtonCount from "pages/ButtonCount.vue";-->
<!--const cash = ref(0);-->
<!--const title = 'aasdasdasd'-->
<!--const incrementTotal = function (){-->
<!--        cash.value ++;-->

<!--}-->

<!--</script>-->
<template>

    <div class="q-pa-md q-gutter-sm">

        {{cash}}
    <ButtonCount :cash="cash"  @changeCounter="incrementTotal" >
    </ButtonCount>

        <q-btn outline  round color="primary" icon="favorite_border"  @click="incrementTotal"/>
        <q-btn outline  round color="primary" icon="gavel" @click="reduceTotal"/>

    </div>
</template>

<script setup>
import {ref} from "vue"
import ButtonCount from "pages/ButtonCount.vue"
const cash = ref(100)
const incrementTotal = function (){
        cash.value ++;

}
const reduceTotal = function (){
    cash.value --;
}
</script>






























































<!--  <div class="q-pa-md">-->
<!--    <q-table-->
<!--      title="問卷完成度排名"-->
<!--      :rows="rows"-->
<!--      :columns="columns"-->
<!--      row-key="name"-->
<!--    />-->
<!--  </div>-->
<!--</template>-->

<!--<script>-->
<!--const columns = [-->
<!--  {-->
<!--    name: 'name',-->
<!--    required: true,-->
<!--    label: '排名',-->
<!--    align: 'left',-->
<!--    field: row => row.name,-->

<!--    sortable: true-->
<!--  },-->
<!--  { name: '系級代碼', align: 'center', label: '系級代碼', field: '系級代碼', sortable: true },-->
<!--  { name: '系級名稱', align: 'center', label: '系級名稱', field: '系級名稱', sortable: true },-->
<!--  { name: '完成度', align: 'center', label: '完成度 ', field: '完成度' },-->
<!--]-->
<!--const rows = [-->
<!--  {-->
<!--    name: '1',-->
<!--    系級代碼: 510,-->
<!--    系級名稱:"資管",-->
<!--    完成度:"98%",-->
<!--  },-->
<!--  {-->
<!--    name: '2',-->
<!--    系級代碼: 511,-->
<!--    系級名稱:"資工",-->
<!--    完成度:"38%",-->
<!--  },-->
<!--  {-->
<!--    name: '3',-->
<!--    系級代碼: 512,-->
<!--    系級名稱:"工工",-->
<!--    完成度:"56%",-->
<!--  },-->
<!--  {-->
<!--    name: '4',-->
<!--    系級代碼: 513,-->
<!--    系級名稱:"企管",-->
<!--    完成度:"55%",-->
<!--  },-->
<!--  {-->
<!--    name: '5',-->
<!--    系級代碼: 514,-->
<!--    系級名稱:"工管",-->
<!--    完成度:"99%",-->
<!--  },-->
<!--  {-->
<!--    name: '6',-->
<!--    系級代碼: 515,-->
<!--    系級名稱:"應外",-->
<!--    完成度:"23%",-->
<!--  },-->
<!--  {-->
<!--    name: '7',-->
<!--    系級代碼: 516,-->
<!--    系級名稱:"應日",-->
<!--    完成度:"27%",-->
<!--  },-->
<!--  {-->
<!--    name: '8',-->
<!--    系級代碼: 517,-->
<!--    系級名稱:"國企",-->
<!--    完成度:"72%",-->
<!--  },-->
<!--  {-->
<!--    name: '9',-->
<!--    系級代碼: 518,-->
<!--    系級名稱:"財經",-->
<!--    完成度:"65%",-->
<!--  },-->
<!--  {-->
<!--    name: '10',-->
<!--    系級代碼: 519,-->
<!--    系級名稱:"財管",-->
<!--    完成度:"66%",-->
<!--  }-->
<!--]-->

<!--export default {-->
<!--  setup () {-->
<!--    return {-->
<!--      columns,-->
<!--      rows-->
<!--    }-->
<!--  }-->
<!--}-->
<!--</script>-->

