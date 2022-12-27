<!--<template>-->
<!--  <q-page className="q-pa-lg">-->
<!--    <h5 className="q-mt-not">message</h5>-->
<!--    <q-list bordered separator>-->
<!--      <q-item clickable v-ripple v-for="task  in tasks">-->
<!--        <q-item-section>{{task.title}}</q-item-section>-->
<!--      </q-item>-->

<!--    </q-list>-->
<!--  </q-page>-->
<!--</template>-->

<!--<script>-->
<!--export default {-->
<!--  data() {-->
<!--    return {-->
<!--      tasks: [-->
<!--        {-->
<!--          title: "姓名:小名 學號:11195001 科系:應數一甲 " +-->
<!--                 "表單編號:666 課程名稱:微積分 授課教師:荊行倫",-->
<!--          done: false-->
<!--        },-->
<!--        {-->
<!--          title: "姓名:小華 學號:11196002 科系:物理一甲"+-->
<!--                  "表單編號:777 課程名稱:普通物理 授課教師:鄭秀麗",-->
<!--          done: false-->
<!--        },-->
<!--        {-->
<!--          title: "姓名:小草 學號:11197003 科系:心理一甲" +-->
<!--                 "表單編號:888 課程名稱:普通心理學 授課教師:張馨德",-->
<!--          done: false-->
<!--        }-->
<!--      ]-->
<!--    }-->
<!--  }-->
<!--}-->
<!--</script>-->


<template>
    <q-ajax-bar
        ref="bar"
        position="bottom"
        color="accent"
        size="10px"
        skip-hijack
    />
    <div id="q-app">
        <q-drawer
            side="right"
            v-model="rightDrawerOpen"

            bordered
            :width="400"
            :breakpoint="500"
            class="bg-amber-1"
        >
            <q-scroll-area class="fit">
                <div class="q-pa-sm">
                    <q-item>
                        <q-item-section >
                            <q-btn icon="close" @click="rightDrawerOpen=false"></q-btn>
                        </q-item-section>
                    </q-item>

                    <q-input v-model="editedItem.IP" label="IP"></q-input>
                    <q-input v-model="editedItem.NAME" label="NAME"></q-input>
                    <q-input v-model="editedItem.APPID" label="APPID"></q-input>
                    <q-input v-model="editedItem.DESTINATION" label="DESTINATION"></q-input>
                    <q-input v-model="editedItem.LIB_VERSION" label="LIB_VERSION"></q-input>
                    <q-input v-model="editedItem.IS_PRIMARY_APPID" label="IS_PRIMARY_APPID"></q-input>
                    <q-input type="number" v-model="editedItem.HIT_COUNT" label="HIT_COUNT"></q-input>
                    <q-input type="" v-model="editedItem.LAST_HIT" label="LAST_HIT">
                        <template v-slot:append>
                            <q-icon name="event" class="cursor-pointer">
                                <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                                    <q-date v-model="editedItem.LAST_HIT" mask="YYYY-MM-DD">
                                        <div class="row items-center justify-end">
                                            <q-btn v-close-popup label="Close" color="primary" flat />
                                        </div>
                                    </q-date>
                                </q-popup-proxy>
                            </q-icon>
                        </template>
                    </q-input>
                    <q-item>
                        <q-item-section>
                            <q-btn color="blue" label="修改" @click="editItem(editedItem)" size="sm" class="q-ma-sm-md" icon="edit"></q-btn>
                        </q-item-section>
                        <q-item-section>
                            <q-btn color="red" label="刪除"  @click="deleteItem(editedItem)" :disable="editedItem.disableDeleteBtn" size=sm icon="delete"></q-btn>
                        </q-item-section>
                    </q-item>
                </div>
            </q-scroll-area>
        </q-drawer>
        <div class="q-pa-sm q-gutter-sm">

            <q-table title="Treats" :rows="data.value" :columns="columns" row-key="name" binary-state-sort class="my-sticky-column-table" :loading="loading">
                <template v-slot:top="props">
                    <q-btn  color="primary" icon="add" label="新增" @click="addItem"   >
                    </q-btn>
                    <div class="q-pa-sm q-gutter-sm">
                        <q-dialog v-model="show_dialog">
                            <q-card>
                                <q-card-section>
                                    <div class="text-h6">{{ editedItem.title }}</div>
                                </q-card-section>
                                <q-card-section>
                                    <div class="row">
                                        <q-input v-model="editedItem.IP" label="IP"></q-input>
                                        <q-input v-model="editedItem.NAME" label="NAME"></q-input>
                                        <q-input v-model="editedItem.APPID" label="APPID"></q-input>
                                        <q-input v-model="editedItem.DESTINATION" label="DESTINATION"></q-input>
                                        <q-input v-model="editedItem.LIB_VERSION" label="LIB_VERSION"></q-input>
                                        <q-input v-model="editedItem.IS_PRIMARY_APPID" label="IS_PRIMARY_APPID"></q-input>
                                        <q-input type="number" v-model="editedItem.HIT_COUNT" label="HIT_COUNT"></q-input>
                                        <q-input type="" v-model="editedItem.LAST_HIT" label="LAST_HIT">
                                            <template v-slot:append>
                                                <q-icon name="event" class="cursor-pointer">
                                                    <q-popup-proxy cover transition-show="scale" transition-hide="scale">
                                                        <q-date v-model="editedItem.LAST_HIT" mask="YYYY-MM-DD">
                                                            <div class="row items-center justify-end">
                                                                <q-btn v-close-popup label="Close" color="primary" flat />
                                                            </div>
                                                        </q-date>
                                                    </q-popup-proxy>
                                                </q-icon>
                                            </template>
                                        </q-input>
                                    </div>
                                </q-card-section>

                                <q-card-actions align="right">
                                    <q-btn flat label="OK" color="primary" v-close-popup @click="addRow" round ></q-btn>
                                </q-card-actions>
                            </q-card>
                        </q-dialog>
                    </div>



                    <q-card flat bordered class="my-card bg-grey-1">
                        <q-card-section>
                            <div class="row items-center no-wrap">
                                <div class="col">
                                    <div class="text-h6">Our Planet</div>
                                    <div class="text-subtitle2">by John Doe</div>
                                </div>

                                <div class="col-auto">
                                    <q-btn color="grey-7" round flat icon="more_vert">
                                        <q-menu cover auto-close>
                                        </q-menu>
                                    </q-btn>
                                </div>
                            </div>
                        </q-card-section>
                    </q-card>



































                </template>
                <template v-slot:body="props">
                    <q-tr :props="props" @click="selectItem(props.row)">
                        <!--            <q-td key="actions" :props="props">-->
                        <!--              <q-btn color="blue" label="修改" @click="editItem(props.row)" size="sm" class="q-ma-sm-md" ></q-btn>-->
                        <!--              <q-btn color="red" label="刪除"  @click="deleteItem(props.row)" :disable="props.row.disableDeleteBtn" size=sm></q-btn>-->
                        <!--            </q-td>-->
                        <q-td key="desc" :props="props">
                            <div class="text-pre-wrap q-ml-lg q-mr-lg "  >{{ props.row.IP }}</div>
                            <q-popup-edit v-model="props.row.IP" auto-save  @save="saveIP" @before-show="selectItem(props.row)" v-slot="scope">
                                <q-input v-model="scope.value" dense autofocus ></q-input>
                            </q-popup-edit>
                        </q-td>
                        <q-td key="calories" :props="props" >
                            <q-input v-model=" props.row.NAME " :title="props.row.NAME" label="NAME" >
                            </q-input>
                        </q-td>
                        <q-td key="fat" :props="props">
                            <div class="text-pre-wrap">{{ props.row.APPID }}</div>
                            <q-popup-edit v-model="props.row.APPID" >
                                <q-select v-model=" props.row.APPID" :options="options1"  />
                            </q-popup-edit>
                        </q-td>
                        <q-td key="carbs" :props="props">
                            {{ props.row.DESTINATION }}
                            <q-popup-edit v-model="props.row.DESTINATION" title="DESTINATION"  >
                                <q-input  v-model="props.row.DESTINATION" dense autofocus hint="Use buttons to close" ></q-input>
                            </q-popup-edit>
                        </q-td>
                        <q-td key="carbs" :props="props">
                            {{ props.row.LIB_VERSION }}
                            <q-popup-edit v-model="props.row.LIB_VERSION" title="Update carbs"  >
                                <q-input   v-model="props.row.LIB_VERSION" dense autofocus hint="Use buttons to close" ></q-input>
                            </q-popup-edit>
                        </q-td>
                        <q-td key="carbs" :props="props">
                            {{ props.row.IS_PRIMARY_APPID }}
                            <q-popup-edit v-model="props.row.IS_PRIMARY_APPID" title="Update carbs"  >
                                <q-input   v-model="props.row.IS_PRIMARY_APPID" dense autofocus hint="IS_PRIMARY_APPID" ></q-input>
                            </q-popup-edit>
                        </q-td>
                        <q-td key="carbs" :props="props">
                            {{ props.row.HIT_COUNT }}
                            <q-popup-edit v-model="props.row.HIT_COUNT" title="Update carbs">
                                <q-input   v-model="props.row.HIT_COUNT" dense autofocus hint="HIT_COUNT" ></q-input>
                            </q-popup-edit>
                        </q-td>
                        <q-td key="carbs" :props="props">
                            {{ props.row.LAST_HIT }}
                            <q-popup-edit v-model="props.row.LAST_HIT" title="Update carbs" >
                                <q-input   v-model="props.row.LAST_HIT" dense autofocus hint="LAST_HIT" ></q-input>
                            </q-popup-edit>
                        </q-td>

                    </q-tr>
                </template>
            </q-table>
        </div>
    </div>


</template>

<script setup>
import {onBeforeMount, reactive, ref} from "vue"
import axios from "axios";
import {useQuasar} from "quasar";
const $q = useQuasar();
let server = "";
const rightDrawerOpen = ref(false)
let toggleRightDrawer = ()=> {
    rightDrawerOpen.value = !rightDrawerOpen.value
}

let loading= ref(false)
let action = reactive(null)
let show_dialog=  ref(false)
let editedIndex= ref(-1)
let editedItem= ref({
    IP: "123",
    NAME: "name",
    APPID: "appid",
    DESTINATION: "dest",
    LIB_VERSION: "version",
    IS_PRIMARY_APPID: true,
    HIT_COUNT: 0,
    LAST_HIT: (new Date( )).toISOString().substring(0, 10),
    datemenu2:false,
})

let defaultItem= ref({
    IP: "123",
    NAME: "name",
    APPID: "appid",
    DESTINATION: "dest",
    LIB_VERSION: "version",
    IS_PRIMARY_APPID: true,
    HIT_COUNT: 0,
    LAST_HIT: (new Date( )).toISOString().substring(0, 10),
    datemenu2:false,
})
let columns= [
//   {
//   name: "actions",
//   label: "Actions",
//   field: "actions"
// },
    {
        name: "desc",
        required: true,
        label: "IP",
        align: "left",
        field: row => row.name,
        format: val => `${val}`,
        sortable: true
    },
    {
        name: "calories",
        align: "center",
        label: "NAME",
        field: "calories",
        sortable: true
    },
    {
        name: "fat",
        label: "APPID",
        field: "fat",
        sortable: true,
        style: "width: 10px"
    },
    { name: "carbs", label: "DESTINATION", field: "carbs" ,sortable: true},
    { name: "protein", label: "LIB_VERSION", field: "protein" ,sortable: true},
    { name: "sodium", label: "IS_PRIMARY_APPID", field: "sodium",sortable: true },
    {
        name: "calcium",
        label: "HIT_COUNT",
        field: "calcium",
        sortable: true,
        sort: (a, b) => parseInt(a, 10) - parseInt(b, 10)
    },
    {
        name: "iron",
        label: "LAST_HIT",
        field: "iron",
        sortable: true,
        sort: (a, b) => parseInt(a, 10) - parseInt(b, 10)
    },

]

let data= reactive({value:[]})

let options= [
    'Google', 'Facebook', 'Twitter', 'Apple', 'Oracle'
]

let options1= [
    {label: '01FE65EDE41583D5A7742F849A2157B4', value: '01FE65EDE41583D5A7742F849A2157B4'},
    {label: '01FE65EDE41583D5A7742F849A21TEST', value: '01FE65EDE41583D5A7742F849A21TEST'},
    {label: '1FE65EDE41583D5A7742F849A21TOUCH', value: '1FE65EDE41583D5A7742F849A21TOUCH'},
]




let close = function () {
    console.log('close')
    show_dialog.value = false
    setTimeout(() => {
        editedItem.value = Object.assign({}, defaultItem.value)
        editedIndex.value = -1
    }, 300)
}

onBeforeMount(() => {
    let url = server+"/quasar-todo/jsp/TodoCRUD.jsp?method=query";
    loading.value = true;
    axios.get(url).then(function (response) {
        data.value = response.data.value;
    }).catch(function (response) {
        console.log(response);
    }).finally(
        function (res) {
            loading.value = false;
        }
    )
})

let selectItem = function (item){
    editedIndex.value = data.value.indexOf(item);
    editedItem.value = Object.assign({}, data.value[editedIndex.value]);
    editedItem.value.oldIP = editedItem.value.IP
    editedItem.value.oldAPPID = editedItem.value.APPID
    rightDrawerOpen.value=true;
    console.log('selectItem',item)
}

let editItem = function(item) {
    console.log('editItem',item)
    selectItem(item)
    editedItem.value.title = '修改 IP'
    show_dialog.value = true;
}
let addItem = ()=>{
    selectItem(defaultItem)
    editedItem.value.title = '新增 IP'
    show_dialog.value = true;
}
let saveIP = function (IP, oldIP){
    editedItem.value.IP = IP

    addRow()
}

let addRow = function() {

    let token = '123456789';
    const config = {
        headers: { Authorization: `Bearer ${token}` }
    };
    const bodyParameters =  editedItem.value;



    if (editedIndex.value > -1) {
        console.log('edit '+editedIndex.value)
        let url = server+"/jsp/TodoCRUD.jsp?method=modify";
        loading.value = true;
        axios.post(url,bodyParameters,config).then(
            (response)=>{
                if(response.data.done_YN==='Y') {
                    $q.notify('IP 修改完成 ');
                    Object.assign(data.value[editedIndex.value], editedItem.value)
                }else{
                    $q.dialog( {
                        title: 'Alert<em>!</em>',
                        message :'IP 修改失敗  '+ JSON.stringify(response.data),
                        html : true,
                        fullWidth: true,
                    } )
                }
            }
        ).catch( (response) => {
            $q.dialog( {
                    title: 'Alert<em>!</em>',
                    message :'IP 新增失敗  '+ JSON.stringify(response.data),
                    html : true,
                    fullWidth: true,
                }
            )
        }).finally(()=>{
            loading.value = false;
        })
    } else {
        let url = server+"/jsp/TodoCRUD.jsp?method=add";
        console.log('add  '+editedIndex.value)

        loading.value = true;
        axios.post(url,bodyParameters,config).then(function (response) {
            if(response.data.done_YN==='Y'){
                editedItem.value = response.data.value;
                let tempValue = {};
                Object.assign(tempValue,editedItem.value)
                data.value.unshift(tempValue);
                $q.notify('IP 新增成功 ');
            }else{
                $q.dialog( {
                    title: 'Alert<em>!</em>',
                    message :'IP 新增失敗  '+ JSON.stringify(response.data),
                    html : true,
                    fullWidth: true,
                } )
            }

        }).catch(function (response) {
            $q.dialog( {
                    title: 'Alert<em>!</em>',
                    message :'IP 新增失敗  '+ JSON.stringify(response.data),
                    html : true,
                    fullWidth: true,
                }
            )

        }).finally(
            function (res) {
                loading.value = false
            }
        )
    }
}
let  deleteItem = function(item,qbtn) {

    let url = server+"/jsp/TodoCRUD.jsp?method=delete";
    let token = '123456789';
    const config = {
        headers: { Authorization: `Bearer ${token}` }
    };
    const bodyParameters =  item;

    console.log('deleteItem',item)
    const index = data.value.indexOf(item);
    if(confirm("確定要刪除?")){
        data.value[index].disableDeleteBtn=true;
        loading.value = true;
        axios.post(url,bodyParameters,config).then( (response)=>{
                if(response.data.done_YN==='Y'){
                    $q.notify('IP 刪除成功 ');
                    data.value.splice(index, 1);
                }else{
                    $q.dialog( {
                        title: 'Alert<em>!</em>',
                        message :'IP 刪除失敗  '+ JSON.stringify(response.data),
                        html : true,
                        fullWidth: true,
                    } )
                }
            }
        ).catch( (response) => {
            $q.dialog( {
                    title: 'Alert<em>!</em>',
                    message :'IP 刪除失敗  '+ JSON.stringify(response.data),
                    html : true,
                    fullWidth: true,
                }
            )
        }).finally(()=>{
            loading.value = false;
        })

    }
}
</script>
