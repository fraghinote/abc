import{a1 as V,r as y,a3 as t,ak as d,a9 as k,a6 as e,a7 as i,aq as u,al as _,ac as h,an as w,a5 as o,a4 as c,aj as b,ai as C,L as v,am as T,ao as q,ap as x,ad as B}from"./index.216ed44c.js";import{Q,b as p,a as L}from"./QList.8e2b8aec.js";import{Q as N}from"./QItemLabel.2356331d.js";import{Q as D}from"./QPage.ad49a65e.js";import{api as I}from"./axios.0200396c.js";import{u as K}from"./use-quasar.2a4044c0.js";const S={setup(){const l=K(),s=y(null);function m(){I.get("api/test.jsp").then(n=>{s.value=n.data}).catch(()=>{l.notify({color:"negative",position:"top",message:"Loading failed",icon:"report_problem"})})}return{data:s,loadData:m}},data(){return{newTask:"",tasks:[]}}},U={class:"row","q-pt-xl":""},j={class:"row q-pa-sm"};function E(l,s,m,n,r,F){return t(),d(u,null,[k("div",U,[e(i,{color:"purple",onClick:n.loadData,label:"Show Notification"},null,8,["onClick"])]),(t(!0),d(u,null,_(n.data,a=>(t(),c(Q))),256)),h(" "+w(n.data)+" ",1),e(D,{class:"bg-gray-3 column"},{default:o(()=>[k("div",j,[e(b,{modelValue:r.newTask,"onUpdate:modelValue":s[0]||(s[0]=a=>r.newTask=a),onKeyup:C(l.addTask,["enter"]),class:"blue",square:"",filled:"","bg-color":"white",placeholder:"\u8ACB\u8F38\u5165\u67E5\u8A62\u9805\u76EE",dense:""},{append:o(()=>[e(i,{onClick:l.addTask,round:"",dense:"",flat:"",icon:"add"},null,8,["onClick"])]),_:1},8,["modelValue","onKeyup"])]),e(Q,{class:"bg-white"},{default:o(()=>[(t(!0),d(u,null,_(r.tasks,(a,g)=>v((t(),c(L,{key:a.title},{default:o(()=>[e(p,{avatar:""},{default:o(()=>[e(T,{modelValue:a.done,"onUpdate:modelValue":f=>a.done=f,color:"primary"},null,8,["modelValue","onUpdate:modelValue"])]),_:2},1024),e(p,null,{default:o(()=>[e(N,null,{default:o(()=>[h(w(a.title),1)]),_:2},1024)]),_:2},1024),a.done?(t(),c(p,{key:0,side:""},{default:o(()=>[e(i,{onClick:q(f=>l.deleteTask(g),["stop"]),flat:"",round:"",dense:"",color:"primary",icon:"delete"},null,8,["onClick"])]),_:2},1024)):x("",!0)]),_:2},1024)),[[B]])),128))]),_:1})]),_:1})],64)}var H=V(S,[["render",E]]);export{H as default};
