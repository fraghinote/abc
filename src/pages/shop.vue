<template>
    {{isLogin}}
 <div class="q-pa-md">
  <div class="q-gutter-sm row items-start" >
     <q-input rounded outlined color="accent" v-model="search"  @keyup.enter="loadData" label="輸入查詢ID">
         <template v-slot:prepend>
             <q-icon name="search" />
         </template>
     </q-input>

      <q-input rounded outlined color="accent" v-model="nsearch"  @keyup="nloadData" label="輸入查詢SHOP">
          <template v-slot:prepend>
              <q-icon name="search" />
          </template>
      </q-input>

      <q-input rounded outlined color="accent" v-model="newsearch"  @keyup.enter="newloadData" label="輸入查詢ADDRES">
          <template v-slot:prepend>
              <q-icon name="search" />
          </template>
      </q-input>

  </div>
</div>

    <div class="q-pa-md q-gutter-sm">
    <q-btn label="新增商店" icon="shop" outline rounded color="accent" @click="prompt = true" />
        <q-dialog v-model="prompt" persistent>
            <q-card style="min-width: 350px">
                <q-card-section>
                    <div class="text-h6">Your address</div>
                </q-card-section>
                {{shops}}
                <q-card-section class="q-pt-none">
                    <q-input color="accent" dense v-model="shops.shopname" label="請輸入店名:"/>
                    <q-input color="accent" dense v-model="shops.shopaddres" label="請輸入地址:"/>
                </q-card-section>
                <q-card-actions align="right" class="text-accent">
                    <q-btn flat label="Cancel" v-close-popup />
                    <q-btn flat label="Add address" @click="addshop" v-close-popup />
                </q-card-actions>
            </q-card>
        </q-dialog>

    <div class="q-pa-md  color=accent" >
        <q-list bordered separator>
            <q-item clickable v-ripple v-for="(shops,index) in shopsList" :key="shops.ID">
                <q-item-section>

<!--                    <q-item-label>index：{{index}}</q-item-label>-->
                    <q-item-label>ID：{{shops.ID}}</q-item-label>

                    <q-item-label>SHOP：{{shops.SHOP}}
                        <q-popup-edit v-model="shops.SHOP" auto-save v-slot="scope" @save="(value, initialValue) => saveSHOP(value, initialValue,shops)">
                            <q-input v-model="scope.value" dense autofocus counter  @keyup.enter="scope.set" />
                            {{scope.value}},{{scope.set}}
                        </q-popup-edit>
                    </q-item-label>

                    <q-item-label>ADDRES：{{shops.ADDRES}}</q-item-label>
                </q-item-section>

                <div class="q-pa-xs q-gutter-sm">
                    <q-btn outline rounded color="purple" icon="edit" @click="editcorrect(shops)"/>
                </div>

                <div class="q-pa-xs q-gutter-sm">
                    <q-btn outline rounded color="purple" icon="delete" @click.stop="dlt(shops,index)"/>
                </div>
            </q-item>
            <div class="q-pa-md q-gutter-sm">
                <q-dialog v-model="alert1">
                    <q-card>
                        <q-card-section>
                            <div class="text-h6">更改商店</div>
                        </q-card-section>

                        <q-card-section class="q-pt-none">
                            Rerum repellendus voluptas eveniet porro.
                            {{mod}}
                        </q-card-section>
                        <q-input outlined v-model="mod.shopname" label="請輸入更改商店:" />
                        <q-input outlined v-model="mod.shopaddres" label="請輸入更改地址:" />
                        <q-card-actions align="right">
                            <q-btn flat label="OK" color="primary"  @click="correct" v-close-popup />
                        </q-card-actions>
                    </q-card>
                </q-dialog>
            </div>
        </q-list>
    </div>

 </div>


</template>
<script setup>
import {  onBeforeMount,ref } from 'vue'
import { api } from "boot/axios"
import { useQuasar } from 'quasar'
const $q = useQuasar()
const prompt = ref(false)
const shops =ref({shopname:'',shopaddres:''})
const shopsList = ref([])
const data = ref(null)
const alert1 = ref(false)
const mod = ref({})
const search = ref("")
const nsearch = ref("")
const newsearch = ref("")
const label = ref('Click me')

import {userStat} from "stores/userStat";
const store = userStat();
import { storeToRefs } from 'pinia';
const { isLogin } = storeToRefs(store);

const saveSHOP = function (value,initialValue,shops){
    console.log('value='+value)
    console.log('initialValue='+initialValue)
    console.log('shops.ID='+shops.ID)

    let shops1 = { value, initialValue,id:shops.ID};
    console.log(shops1);
    api.post('/api/popup.jsp', {shops1})
        .then((response) => {
            data.value = response.data
            let isOK = response.data.isOK;
            if(isOK === 'Y'){
                let ID = initialValue.ID
                for(let i=0; i<shopsList.value.length; i++){
                    let  con = shopsList.value[i];
                    if(con.ID === ID){
                        shopsList.value[i] = data.value.shops;
                    }
                }
            }
        })
        .catch(() => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

const addshop = ()=>{
        api.post('/api/addshop.jsp',{shops:shops.value})
            .then((response) => {
                if(response.data.isOK === "Y"){
                    data.value = response.data.value
                    console.log("data.value",data.value)
                    shopsList.value.unshift(data.value)
                }
                // data.value = response.data
            })
                .catch(() => {
                    $q.notify({
                        color: 'negative',
                        position: 'top',
                        message: 'Loading failed',
                        icon: 'report_problem'
                    })
            })
}

function shopsData(){
    console.log(shopsData);
    api.post('/api/shopsData.jsp',)
        .then((response) => {
            shopsList.value = response.data.value;
            console.log("shopsList.value",shopsList.value);
        })
        .catch((error) => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed'+error,
                icon: 'report_problem'
            })
        })
}

onBeforeMount(()=>{
    console.log('onBeforeMount');
    api.post('/api/checkSession.jsp').then((res)=>{
        let data = res.data;
        if(data.isOK === 'Y'){
            isLogin.value = true;
        }
    })
    shopsData();

})

function dlt(shops,index){
    $q.dialog({
        title: '刪除商店',
        message: '確定要刪除商店 ?',
        cancel: true,
        persistent:true
    }).onOk(() =>{
        api.post('../api/dlt.jsp', {shops:shops})
            .then((response) => {
                let isOK = response.data.isOK;
                if(isOK === 'Y'){
                    $q.notify('已刪除')
                    shopsList.value.splice(index, 1)
                }
            }, (error) => {
                $q.notify(error)
            })
    })
}

function editcorrect(shops){
    alert1.value =true;
    mod.value =  JSON.parse(JSON.stringify(shops));

}

function correct () {
    api.post('/api/correct.jsp',{shops:mod.value})
        .then((response) => {
            data.value = response.data
            let isOK = response.data.isOK;
            if(isOK === 'Y'){
                let ID = mod.value.ID
                for(let i = 0; i<shopsList.value.length; i++){
                    let con = shopsList.value[i];
                    if(con.ID === ID){
                        shopsList.value[i] = data.value.shops;
                        console.log("data.value.shops23",data.value.shops);
                        //a = {SHOP: '68', INDEX: 2, ID: '623', ADDRES: '6666'}
                        //b = {"shops":{"SHOP":"123","ADDRES":"2","shopname":"456","shopaddres":"2","INDEX":1,"ID":"624"}}
                        // a = b

                        console.log("shopsList123",shopsList);
                    }
                }
            }
        })
        .catch(() => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

function loadData(){
    // let parameters_json = {search:search.value}
    api.post('/api/search.jsp',{search:search.value})
        .then((response) => {
            if(response.data.done_YN === 'Y'){
                shopsList.value = response.data.value
            }
            //data.value = response.data
            //console.log("data.value45646666",data.value)
        })
        .catch(() => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

function nloadData(){
    api.post('/api/nsearch.jsp',{search:nsearch.value})
        .then((response) => {

            if(response.data.done_YN === 'Y'){

                shopsList.value = response.data.value
                console.log("shopsList.value121",shopsList.value)
            }
        })
        .catch(() => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

function newloadData(){
    api.post('/api/newsearch.jsp',{search:newsearch.value})
        .then((response) => {
            console.log(response);

            if(response.data.done_YN === 'Y'){

                shopsList.value = response.data.value
                console.log("shopsList.value121",shopsList.value)
            }
        })
        .catch(() => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

</script>
