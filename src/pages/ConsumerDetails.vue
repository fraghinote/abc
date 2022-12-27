<template>
    <div class="q-pa-md q-gutter-sm">
    <q-btn icon="add" label="新增顧客" color="primary" @click="newAlert = true"  />
        <q-dialog v-model="newAlert">
            <q-card>
                <q-card-section>
                    <div class="text-h6">新增顧客</div>
                </q-card-section>
<!--                {{newUser}}-->
                <q-card-section class="q-pt-none">
                    <q-input
                        v-model="newUser.name"

                        bg-color="white"
                        color="primary"
                        label="請輸入名稱:"
                        :dense="dense">
                    </q-input>
                    <q-input v-model="newUser.ge" label="請輸入性別:" ></q-input>
                </q-card-section>

                <q-card-actions align="right">
                    <q-btn flat label="取消" color="primary" v-close-popup />
                    <q-btn flat label="確認" color="primary" @click="addTask" v-close-popup />
                </q-card-actions>
            </q-card>
        </q-dialog>
    </div>


    <div class="q-pa-md">
        <q-ajax-bar
            ref="bar"
            position="top"
            color="accent"
            size="10px"
        />
    </div>

    <div v-if="isLoading">
        請稍後....
    </div>

    <div class="q-pa-md row items-start q-gutter-md">

        <q-card class="my-card " clickable v-ripple v-for="(user,index)  in tasks" @click="loadData ; openDialog(alert) ">
            <q-card-section class="my-card bg-grey-1">

                <div class="q-mr-xs ">
                    <q-icon icon name ="close" @click.stop="newdelete(index,user)"></q-icon>
                </div>

                <div class="text-h6">NAME：{{user.NAME}}</div>
                <div class="text-subtitle2">GENDER：{{user.GENDER}}</div>

            </q-card-section>

            <q-separator />

            <q-card-actions align="right">
                <q-btn flat @click.stop="editUser(user)">修改資料</q-btn>
                <q-btn flat @click="loadData(user)">查看更多</q-btn>
            </q-card-actions>
        </q-card>
    </div>

<!--    <q-page className="q-pa-lg">-->
<!--        <q-list bordered separator>-->
<!--&lt;!&ndash;            tasks放進user裡面&ndash;&gt;-->
<!--            <q-item clickable v-ripple v-for="(user,index)  in tasks" @click="loadData(user) ; openDialog(alert) ">-->
<!--                    <q-item-section>-->
<!--                            <q-item-label>ID：{{user.ID}}</q-item-label>-->
<!--                            <q-item-label>NAME：{{user.NAME}}</q-item-label>-->
<!--                            <q-item-label>GENDER：{{user.GENDER}}</q-item-label>-->
<!--                    </q-item-section>-->
<!--                <div class="q-pa-xs q-gutter-xs">-->
<!--&lt;!&ndash;                    修改顧客資料dialog寫在下面66行&ndash;&gt;-->
<!--                    <q-btn  @click.stop="editUser(user)" outline round color="primary" icon="edit" />-->
<!--                </div>-->
<!--                    <div  class="q-pa-xs q-gutter-xs">-->
<!--&lt;!&ndash;                    user被刪掉index在畫面上也即時被刪掉&ndash;&gt;-->
<!--                    <q-btn @click.stop="newdelete(index,user)" outline round color="primary" icon="delete" />-->
<!--                    </div>-->
<!--            </q-item>-->
<!--        </q-list>-->
<!--    </q-page>-->

    <q-dialog v-model="altered">
        <q-card>
            <q-card-section>
                <div class="text-h6">修改顧客資料</div>
            </q-card-section>
            <q-card-section class="q-pt-none">
<!--                {{selectuser}}-->
                <q-input v-model="selectuser.NAME" label="請輸入修改名稱：" />
                <q-input v-model="selectuser.GENDER" label="請輸入修改性別：" />
            </q-card-section>

            <q-card-actions align="right">
                <q-btn flat label="cancel" color="primary" v-close-popup />
                <q-btn flat label="OK" color="primary" @click="newmd" v-close-popup />
            </q-card-actions>
        </q-card>
    </q-dialog>

    <q-dialog v-model="alert">
        <q-card>
            <q-card-section>
                <div class="text-h6">CONSUMER ID : {{CONSUMER.ID}} <br>
                    NAME : {{CONSUMER.NAME}}</div>
                <q-select v-model="ITEM"   @keypress.enter="addCONSUMPTION(CONSUMER.ID,ITEM.ID)" :options="ITEMArray"  label="請點選新增內容:" >
<!--                    Select >> Customizing menu options >> Object options-->
                    <template v-slot:option="{ itemProps, opt, selected, toggleOption }">
                        <q-item v-bind="itemProps">
                            <q-item-section>
                                <q-item-label v-html="opt.ITEM" />
                                <q-item-label v-html="opt.ID" />
                            </q-item-section>
                        </q-item>
                    </template>
                    <template v-slot:after>
                        <q-btn round dense flat icon="send" @click="addCONSUMPTION(CONSUMER.ID,ITEM.ID)"/>
                    </template>
                </q-select>
            </q-card-section>

            <q-card-section class="q-pt-none">
<!--                CONSUMPTIONS-->
                <q-list v-for=" (record,index) in CONSUMPTIONS " class="q-mt-md" >
                <q-item  class="bg-blue-1" @click="selectCONSUMPTIONSItem(record)" clickable>
                    <q-item-section>
<!--                        {{index}}-->
                        {{record.CONSUMPTIONS_ID}}
                        {{record.CONSUMERS_ID}}
                        {{record.NAME}}
                        {{record.GENDER}}
                        {{record.ITEM}}
                        {{record.PRODUCT_ID}}
                        {{record.ITEM}}
                        {{record.DAY}}
                    </q-item-section>
                    <q-btn @click.stop="deleteTask(index, record.CONSUMPTIONS_ID, record.CONSUMERS_ID)"
                           flat
                           round
                           dense
                           color="blue"
                           icon="delete">
                    </q-btn>
                </q-item>
            </q-list>
            </q-card-section>

            <div class="q-pa-md" style="max-width: 300px">
                <div class="q-gutter-md">
                </div>
                <q-list>

                </q-list>
            </div>
            <q-card-actions align="right">
                <q-btn flat label="取消" color="primary" v-close-popup />
                <q-btn flat label="確認" color="primary" v-close-popup />
            </q-card-actions>
        </q-card>

        <q-dialog  v-model="isSelectedAnRecord">

                <q-card>
                    <q-card-section>
                        <div class="text-h6">Alert</div>
                    </q-card-section>

                    <q-card-section class="q-pt-none">
                        {{modify}}
                    </q-card-section>
<!--                    {{modify}}-->
                    <q-select outlined v-model="modify" :options="ITEMArray" label="請點選修改商品選項:" />
                        <template v-slot:option="{ itemProps, opt, selected, toggleOption }">
                            <q-item v-bind="itemProps">
                                <q-item-section>
                                    <q-item-label v-html="opt.ITEM" />
                                    <q-item-label v-html="opt.ID" />
                                </q-item-section>
                            </q-item>
                        </template>
                    <q-card-actions align="right">
                        <q-btn flat label="OK" color="primary" v-close-popup @click="updateTask()" round />
                    </q-card-actions>
                </q-card>

        </q-dialog>

    </q-dialog>
</template>

<script>
import { ref } from 'vue'

import { useQuasar } from 'quasar'

export default {
    data()
    {
        return {


        }
    }

}
</script>
<script setup>
import {onBeforeMount, ref} from 'vue'
import { api } from "boot/axios"
const $q = useQuasar()
const data = ref(null)
const alert = ref(false)
const isLoading = ref(false);
const bar = ref(null)
const newTask = ref('');
const CONSUMER = ref({ID:'',NAME:'',GENDER:'',done:''})
const ITEM = ref({ID:'',ITEM:'',PRICE:'',SHOP_ID:''})
const model = ref(null)
const CONSUMPTIONS = ref([])
const modify = ref({ITEM:''})
const newAlert = ref(false);
const newUser = ref({name:'',ge:''});
const altered = ref(false);
const selectuser = ref({});

const tasks = ref( [

])

const addTask = ()=>{
    console.log("newUser",newUser.value)

    api.post('/api/new.jsp',{newUser:newUser.value})
        .then((response) => {
            console.log("response.data.isOK",response.data.isOK)
            if(response.data.isOK === "Y"){

                data.value = response.data.value
                console.log("data.value",data.value)
                // tasks.value.push(data.value) //新增顧客名稱至畫面
                tasks.value.unshift(data.value) //添加的元素至陣列開頭



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

function newloadData() {
    console.log(newloadData)
    api.post('/api/csm.jsp',)
        .then((response) => {
            tasks.value = response.data.value;
            console.log("tasks.value",tasks.value);


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
    console.log("onBeforeMount");
    newloadData();

})

// function newmd(user){
//     $q.dialog({
//         title: user.ID+user.NAME,
//         message: 'What is your name? (Minimum 3 characters)',
//         prompt: {
//             model: '',
//             isValid: val => val.length > 2, // << here is the magic
//             type: 'text',  // optional
//         },
//         cancel: true,
//         persistent: true
//     }).onOk(data => {
//
//         api.post('../api/alter.jsp', {user:user,alter:data})
//             .then((response) => {
//                 console.log(response);
//                 // data= response.data
//                 let isOK = response.data.isOK;
//                 if(isOK === 'Y'){
//                     $q.notify('已修改')
//                     user.NAME = response.data.user.NAME;  //Response:{"isOK":"Y","user":{"INDEX":3,"ID":507,"NAME":"45678"}}
//
//                 }
//             }, (error) => {
//                 $q.notify(error)
//             })
//
//     })
//
// }
//
function editUser(user){
    altered.value = true;
    //selectuser.value =   {...user};    //{...user}展開運算子(Spread Operator)
    selectuser.value = JSON.parse(JSON.stringify(user)); //JSON.stringify：將物件轉字串。//JSON.parse：將字串轉物件。
}
function newmd() {
    api.post('/api/alter.jsp', {user:selectuser.value})
        .then((response) => {
            data.value = response.data
            let isOK = response.data.isOK;
            if(isOK === 'Y'){
                let ID = selectuser.value.ID
                for(let i = 0; i<tasks.value.length ;i++){
                    let con = tasks.value[i];
                    if(con.ID === ID){
                        tasks.value[i] = data.value.user;
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



function newdelete(index,user){
    $q.dialog({
        title: '刪除顧客',
        message: '確定要刪除顧客 ?',
        cancel: true,
        persistent:true
    }).onOk(() =>{
        api.post('../api/out.jsp', {user:user})
            .then((response) => {
                let isOK = response.data.isOK;
                if(isOK === 'Y'){
                    $q.notify('已刪除')
                    tasks.value.splice(index, 1) //按下刪除，畫面即時刪除一筆
                }
            }, (error) => {
                $q.notify(error)
            })
    })
}












const onItemClick = (item,event)=>{ //event是固定的
    console.log("item",item)
    console.log("event",event)
    api.post('/api/addAdd.jsp?action=addC',{id1: item.id ,CONSUMER_ID1 : consumer.value.ID })
        .then((response) => {
            data.value = response.data
        })
        .catch((error) => {
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })

}

let ITEMArray = ref(
    [
        {ITEM:'橡皮擦', ID:'1', PRICE:'1',SHOP_ID: 1, label:'1.橡皮擦'},
        {ITEM:'鉛筆'  , ID:'2', PRICE:'2',SHOP_ID: 1, label:'2.鉛筆'},
        {ITEM:'牛奶'  , ID:'3', PRICE:'3',SHOP_ID: 2, label:'3.牛奶'},
        {ITEM:'三明治', ID:'4', PRICE:'4',SHOP_ID: 2, label:'4.三明治'},
        {ITEM:'蛋餅'  , ID:'5', PRICE:'5',SHOP_ID: 3, label:'5.蛋餅'},
        {ITEM:'奶茶'  , ID:'6', PRICE:'6',SHOP_ID: 3, label:'6.奶茶'},
    ]
)

const openDialog = (alert)=>{

}
function loadData(user) {
    CONSUMER.value =  user; //畫面顯示使用者名稱
    isLoading.value  = true;

    api.post('/api/ustest.jsp',{ ID : CONSUMER.value.ID})
        .then((response) => {
            CONSUMPTIONS.value = response.data.value
            console.log("CONSUMPTIONS.value",CONSUMPTIONS.value)
            alert.value = true;
            isLoading.value = false;
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

function addCONSUMPTION (CONSUMER_ID,PRODUCT_ID) {
    api.post('/api/addAdd.jsp?addConsumptions',{CONSUMER_ID: CONSUMER_ID, PRODUCT_ID:PRODUCT_ID}).then((response) => {
        data.value = response.data
        console.log(data.value)
        if(data.value.isOK === 'Y'){
            CONSUMPTIONS.value.push(data.value.map);
        }
    }) .catch((error) => {
        $q.notify({
            color: 'negative',
            position: 'top',
            message: 'Loading failed'+error,
            icon: 'report_problem'
        })
    })
}

function deleteTask(index,CONSUMPTIONS_ID,CONSUMERS_ID){

    $q.dialog({
        title: '確認',
        message: '是否刪除留言 ?',
        cancel: true,
        persistent:true
    }).onOk(() =>{
        console.log({CONSUMPTIONS_ID});
        console.log({CONSUMERS_ID});


        api.post('../api/clean.jsp', { CONSUMPTIONS_ID, CONSUMERS_ID})
        .then((response) => {
            let isOK = response.data.isOK;
            if(isOK === 'Y'){
                $q.notify('已刪除')
                CONSUMPTIONS.value.splice(index, 1)
            }
        }, (error) => {
            console.log(error);
            $q.notify(error)
        })
    })
}

let isSelectedAnRecord = ref(false)  //預設沒觸發的話為false
let selectedRecord = ref (null);  //點選alert視窗打開框框得到資料的的灰色底
let selectCONSUMPTIONSItem = (record)=>{  //打開框框點選資料欄存在record裡面，有觸發則顯示資料
    console.log(record)
    selectedRecord.value = record ;
    isSelectedAnRecord.value = true;



}

function updateTask () {
    console.log(modify.value)
    console.log('selectedRecord',selectedRecord.value)
    api.post('/api/revised.jsp',{modify: modify.value,selectedRecord:selectedRecord.value})
        .then((response) => {
            data.value = response.data
            if(data.value.isOK === 'Y'){
                let CONSUMPTIONS_ID = selectedRecord.value.CONSUMPTIONS_ID
                for(let i = 0; i<CONSUMPTIONS.value.length ;i++){
                    let con = CONSUMPTIONS.value[i];
                    if(con.CONSUMPTIONS_ID === CONSUMPTIONS_ID){
                        console.log('found' + i)
                        CONSUMPTIONS.value[i] = data.value.map;
                    }
                }
            }
        })
        .catch((error) => {
            console.log(error);
            $q.notify({
                color: 'negative',
                position: 'top',
                message: 'Loading failed',
                icon: 'report_problem'
            })
        })
}

</script>
<style lang="sass" scoped>
.my-card
    width: 100%
    max-width: 250px
</style>

