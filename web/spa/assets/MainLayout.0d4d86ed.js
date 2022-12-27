import{c as N,a as d,h as y,d as be,r as p,w as $,o as Z,T as ht,Q as mt,i as Ke,e as se,n as ge,f as Be,g as ee,l as Le,j as Me,k as gt,m as ye,p as bt,q as yt,s as pt,t as St,u as re,v as zt,x as he,y as Ce,z as Ee,A as Te,B as Pe,C as ke,D as wt,E as Ge,F as Je,G as K,H as _t,I as qt,J as Ct,K as Ze,L as j,M as Qe,N as Ae,O as Tt,P as kt,R as xt,S as Ot,U as $t,V as Re,W as Lt,X as et,Y as Pt,Z as xe,_ as me,$ as Bt,a0 as tt,a1 as Mt,a2 as Ht,a3 as U,a4 as Y,a5 as T,a6 as q,a7 as Dt,a8 as ae,a9 as J,aa as Et,ab as Qt,ac as oe,ad as le}from"./index.216ed44c.js";import{Q as At,a as ie,b as A}from"./QList.8e2b8aec.js";import{c as Rt}from"./selection.5ee60e2b.js";import"./QItemLabel.2356331d.js";var Vt=N({name:"QToolbar",props:{inset:Boolean},setup(e,{slots:n}){const u=d(()=>"q-toolbar row no-wrap items-center"+(e.inset===!0?" q-toolbar--inset":""));return()=>y("div",{class:u.value},be(n.default))}});const Ft={ratio:[String,Number]};function jt(e,n){return d(()=>{const u=Number(e.ratio||(n!==void 0?n.value:void 0));return isNaN(u)!==!0&&u>0?{paddingBottom:`${100/u}%`}:null})}const Nt=16/9;var Ve=N({name:"QImg",props:{...Ft,src:String,srcset:String,sizes:String,alt:String,crossorigin:String,decoding:String,referrerpolicy:String,draggable:Boolean,loading:{type:String,default:"lazy"},fetchpriority:{type:String,default:"auto"},width:String,height:String,initialRatio:{type:[Number,String],default:Nt},placeholderSrc:String,fit:{type:String,default:"cover"},position:{type:String,default:"50% 50%"},imgClass:String,imgStyle:Object,noSpinner:Boolean,noNativeMenu:Boolean,noTransition:Boolean,spinnerColor:String,spinnerSize:String},emits:["load","error"],setup(e,{slots:n,emit:u}){const s=p(e.initialRatio),t=jt(e,s);let l;const o=[p(null),p(e.placeholderSrc!==void 0?{src:e.placeholderSrc}:null)],i=p(0),v=p(!1),a=p(!1),O=d(()=>`q-img q-img--${e.noNativeMenu===!0?"no-":""}menu`),C=d(()=>({width:e.width,height:e.height})),w=d(()=>`q-img__image ${e.imgClass!==void 0?e.imgClass+" ":""}q-img__image--with${e.noTransition===!0?"out":""}-transition`),f=d(()=>({...e.imgStyle,objectFit:e.fit,objectPosition:e.position}));$(()=>k(),L);function k(){return e.src||e.srcset||e.sizes?{src:e.src,srcset:e.srcset,sizes:e.sizes}:null}function L(m){if(clearTimeout(l),a.value=!1,m===null){v.value=!1,o[0].value=null,o[1].value=null;return}v.value=!0,o[i.value].value=m}function _({target:m}){l!==null&&(clearTimeout(l),s.value=m.naturalHeight===0?.5:m.naturalWidth/m.naturalHeight,H(m,1))}function H(m,M){l===null||M===1e3||(m.complete===!0?h(m):l=setTimeout(()=>{H(m,M+1)},50))}function h(m){l!==null&&(i.value=i.value===1?0:1,o[i.value].value=null,v.value=!1,a.value=!1,u("load",m.currentSrc||m.src))}function P(m){clearTimeout(l),v.value=!1,a.value=!0,o[0].value=null,o[1].value=null,u("error",m)}function b(m,M){return y("div",{class:"q-img__container absolute-full",key:m},M)}function x(m){const M=o[m].value,B={key:"img_"+m,class:w.value,style:f.value,crossorigin:e.crossorigin,decoding:e.decoding,referrerpolicy:e.referrerpolicy,height:e.height,width:e.width,loading:e.loading,fetchpriority:e.fetchpriority,"aria-hidden":"true",draggable:e.draggable,...M};return i.value===m?(B.class+=" q-img__image--waiting",Object.assign(B,{onLoad:_,onError:P})):B.class+=" q-img__image--loaded",b("img"+m,y("img",B))}function E(){return v.value!==!0?y("div",{key:"content",class:"q-img__content absolute-full q-anchor--skip"},be(n[a.value===!0?"error":"default"])):y("div",{key:"loading",class:"q-img__loading absolute-full flex flex-center"},n.loading!==void 0?n.loading():e.noSpinner===!0?void 0:[y(mt,{color:e.spinnerColor,size:e.spinnerSize})])}return L(k()),Z(()=>{clearTimeout(l),l=null}),()=>{const m=[];return t.value!==null&&m.push(y("div",{key:"filler",style:t.value})),a.value!==!0&&(o[0].value!==null&&m.push(x(0)),o[1].value!==null&&m.push(x(1))),m.push(y(ht,{name:"q-transition--fade"},E)),y("div",{class:O.value,style:C.value,role:"img","aria-label":e.alt},m)}}});function Wt(){const e=p(!Ke.value);return e.value===!1&&se(()=>{e.value=!0}),e}const at=typeof ResizeObserver!="undefined",Fe=at===!0?{}:{style:"display:block;position:absolute;top:0;left:0;right:0;bottom:0;height:100%;width:100%;overflow:hidden;pointer-events:none;z-index:-1;",url:"about:blank"};var ce=N({name:"QResizeObserver",props:{debounce:{type:[String,Number],default:100}},emits:["resize"],setup(e,{emit:n}){let u=null,s,t={width:-1,height:-1};function l(v){v===!0||e.debounce===0||e.debounce==="0"?o():u===null&&(u=setTimeout(o,e.debounce))}function o(){if(clearTimeout(u),u=null,s){const{offsetWidth:v,offsetHeight:a}=s;(v!==t.width||a!==t.height)&&(t={width:v,height:a},n("resize",t))}}const i=ee();if(Object.assign(i.proxy,{trigger:l}),at===!0){let v;return se(()=>{ge(()=>{s=i.proxy.$el.parentNode,s&&(v=new ResizeObserver(l),v.observe(s),o())})}),Z(()=>{clearTimeout(u),v!==void 0&&(v.disconnect!==void 0?v.disconnect():s&&v.unobserve(s))}),Be}else{let O=function(){clearTimeout(u),a!==void 0&&(a.removeEventListener!==void 0&&a.removeEventListener("resize",l,Le.passive),a=void 0)},C=function(){O(),s&&s.contentDocument&&(a=s.contentDocument.defaultView,a.addEventListener("resize",l,Le.passive),o())};const v=Wt();let a;return se(()=>{ge(()=>{s=i.proxy.$el,s&&C()})}),Z(O),()=>{if(v.value===!0)return y("object",{style:Fe.style,tabindex:-1,type:"text/html",data:Fe.url,"aria-hidden":"true",onLoad:C})}}}}),It=N({name:"QHeader",props:{modelValue:{type:Boolean,default:!0},reveal:Boolean,revealOffset:{type:Number,default:250},bordered:Boolean,elevated:Boolean,heightHint:{type:[String,Number],default:50}},emits:["reveal","focusin"],setup(e,{slots:n,emit:u}){const{proxy:{$q:s}}=ee(),t=Me(ye,()=>{console.error("QHeader needs to be child of QLayout")}),l=p(parseInt(e.heightHint,10)),o=p(!0),i=d(()=>e.reveal===!0||t.view.value.indexOf("H")>-1||s.platform.is.ios&&t.isContainer.value===!0),v=d(()=>{if(e.modelValue!==!0)return 0;if(i.value===!0)return o.value===!0?l.value:0;const h=l.value-t.scroll.value.position;return h>0?h:0}),a=d(()=>e.modelValue!==!0||i.value===!0&&o.value!==!0),O=d(()=>e.modelValue===!0&&a.value===!0&&e.reveal===!0),C=d(()=>"q-header q-layout__section--marginal "+(i.value===!0?"fixed":"absolute")+"-top"+(e.bordered===!0?" q-header--bordered":"")+(a.value===!0?" q-header--hidden":"")+(e.modelValue!==!0?" q-layout--prevent-focus":"")),w=d(()=>{const h=t.rows.value.top,P={};return h[0]==="l"&&t.left.space===!0&&(P[s.lang.rtl===!0?"right":"left"]=`${t.left.size}px`),h[2]==="r"&&t.right.space===!0&&(P[s.lang.rtl===!0?"left":"right"]=`${t.right.size}px`),P});function f(h,P){t.update("header",h,P)}function k(h,P){h.value!==P&&(h.value=P)}function L({height:h}){k(l,h),f("size",h)}function _(h){O.value===!0&&k(o,!0),u("focusin",h)}$(()=>e.modelValue,h=>{f("space",h),k(o,!0),t.animate()}),$(v,h=>{f("offset",h)}),$(()=>e.reveal,h=>{h===!1&&k(o,e.modelValue)}),$(o,h=>{t.animate(),u("reveal",h)}),$(t.scroll,h=>{e.reveal===!0&&k(o,h.direction==="up"||h.position<=e.revealOffset||h.position-h.inflectionPoint<100)});const H={};return t.instances.header=H,e.modelValue===!0&&f("size",l.value),f("space",e.modelValue),f("offset",v.value),Z(()=>{t.instances.header===H&&(t.instances.header=void 0,f("size",0),f("offset",0),f("space",!1))}),()=>{const h=gt(n.default,[]);return e.elevated===!0&&h.push(y("div",{class:"q-layout__shadow absolute-full overflow-hidden no-pointer-events"})),h.push(y(ce,{debounce:0,onResize:L})),y("header",{class:C.value,style:w.value,onFocusin:_},h)}}});const{passive:je}=Le,Xt=["both","horizontal","vertical"];var lt=N({name:"QScrollObserver",props:{axis:{type:String,validator:e=>Xt.includes(e),default:"vertical"},debounce:[String,Number],scrollTarget:{default:void 0}},emits:["scroll"],setup(e,{emit:n}){const u={position:{top:0,left:0},direction:"down",directionChanged:!1,delta:{top:0,left:0},inflectionPoint:{top:0,left:0}};let s=null,t,l;$(()=>e.scrollTarget,()=>{v(),i()});function o(){s!==null&&s();const C=Math.max(0,yt(t)),w=pt(t),f={top:C-u.position.top,left:w-u.position.left};if(e.axis==="vertical"&&f.top===0||e.axis==="horizontal"&&f.left===0)return;const k=Math.abs(f.top)>=Math.abs(f.left)?f.top<0?"up":"down":f.left<0?"left":"right";u.position={top:C,left:w},u.directionChanged=u.direction!==k,u.delta=f,u.directionChanged===!0&&(u.direction=k,u.inflectionPoint=u.position),n("scroll",{...u})}function i(){t=bt(l,e.scrollTarget),t.addEventListener("scroll",a,je),a(!0)}function v(){t!==void 0&&(t.removeEventListener("scroll",a,je),t=void 0)}function a(C){if(C===!0||e.debounce===0||e.debounce==="0")o();else if(s===null){const[w,f]=e.debounce?[setTimeout(o,e.debounce),clearTimeout]:[requestAnimationFrame(o),cancelAnimationFrame];s=()=>{f(w),s=null}}}const O=ee();return se(()=>{l=O.proxy.$el.parentNode,i()}),Z(()=>{s!==null&&s(),v()}),Object.assign(O.proxy,{trigger:a,getPosition:()=>u}),Be}});const He={left:!0,right:!0,up:!0,down:!0,horizontal:!0,vertical:!0},Ut=Object.keys(He);He.all=!0;function Ne(e){const n={};for(const u of Ut)e[u]===!0&&(n[u]=!0);return Object.keys(n).length===0?He:(n.horizontal===!0?n.left=n.right=!0:n.left===!0&&n.right===!0&&(n.horizontal=!0),n.vertical===!0?n.up=n.down=!0:n.up===!0&&n.down===!0&&(n.vertical=!0),n.horizontal===!0&&n.vertical===!0&&(n.all=!0),n)}function We(e,n){return n.event===void 0&&e.target!==void 0&&e.target.draggable!==!0&&typeof n.handler=="function"&&e.target.nodeName.toUpperCase()!=="INPUT"&&(e.qClonedBy===void 0||e.qClonedBy.indexOf(n.uid)===-1)}function Oe(e,n,u){const s=Pe(e);let t,l=s.left-n.event.x,o=s.top-n.event.y,i=Math.abs(l),v=Math.abs(o);const a=n.direction;a.horizontal===!0&&a.vertical!==!0?t=l<0?"left":"right":a.horizontal!==!0&&a.vertical===!0?t=o<0?"up":"down":a.up===!0&&o<0?(t="up",i>v&&(a.left===!0&&l<0?t="left":a.right===!0&&l>0&&(t="right"))):a.down===!0&&o>0?(t="down",i>v&&(a.left===!0&&l<0?t="left":a.right===!0&&l>0&&(t="right"))):a.left===!0&&l<0?(t="left",i<v&&(a.up===!0&&o<0?t="up":a.down===!0&&o>0&&(t="down"))):a.right===!0&&l>0&&(t="right",i<v&&(a.up===!0&&o<0?t="up":a.down===!0&&o>0&&(t="down")));let O=!1;if(t===void 0&&u===!1){if(n.event.isFirst===!0||n.event.lastDir===void 0)return{};t=n.event.lastDir,O=!0,t==="left"||t==="right"?(s.left-=l,i=0,l=0):(s.top-=o,v=0,o=0)}return{synthetic:O,payload:{evt:e,touch:n.event.mouse!==!0,mouse:n.event.mouse===!0,position:s,direction:t,isFirst:n.event.isFirst,isFinal:u===!0,duration:Date.now()-n.event.time,distance:{x:i,y:v},offset:{x:l,y:o},delta:{x:s.left-n.event.lastX,y:s.top-n.event.lastY}}}}let Yt=0;var ue=St({name:"touch-pan",beforeMount(e,{value:n,modifiers:u}){if(u.mouse!==!0&&re.has.touch!==!0)return;function s(l,o){u.mouse===!0&&o===!0?wt(l):(u.stop===!0&&Te(l),u.prevent===!0&&Ee(l))}const t={uid:"qvtp_"+Yt++,handler:n,modifiers:u,direction:Ne(u),noop:Be,mouseStart(l){We(l,t)&&zt(l)&&(he(t,"temp",[[document,"mousemove","move","notPassiveCapture"],[document,"mouseup","end","passiveCapture"]]),t.start(l,!0))},touchStart(l){if(We(l,t)){const o=l.target;he(t,"temp",[[o,"touchmove","move","notPassiveCapture"],[o,"touchcancel","end","passiveCapture"],[o,"touchend","end","passiveCapture"]]),t.start(l)}},start(l,o){if(re.is.firefox===!0&&Ce(e,!0),t.lastEvt=l,o===!0||u.stop===!0){if(t.direction.all!==!0&&(o!==!0||t.modifiers.mouseAllDir!==!0)){const a=l.type.indexOf("mouse")>-1?new MouseEvent(l.type,l):new TouchEvent(l.type,l);l.defaultPrevented===!0&&Ee(a),l.cancelBubble===!0&&Te(a),Object.assign(a,{qKeyEvent:l.qKeyEvent,qClickOutside:l.qClickOutside,qAnchorHandled:l.qAnchorHandled,qClonedBy:l.qClonedBy===void 0?[t.uid]:l.qClonedBy.concat(t.uid)}),t.initialEvent={target:l.target,event:a}}Te(l)}const{left:i,top:v}=Pe(l);t.event={x:i,y:v,time:Date.now(),mouse:o===!0,detected:!1,isFirst:!0,isFinal:!1,lastX:i,lastY:v}},move(l){if(t.event===void 0)return;const o=Pe(l),i=o.left-t.event.x,v=o.top-t.event.y;if(i===0&&v===0)return;t.lastEvt=l;const a=t.event.mouse===!0,O=()=>{s(l,a),u.preserveCursor!==!0&&(document.documentElement.style.cursor="grabbing"),a===!0&&document.body.classList.add("no-pointer-events--children"),document.body.classList.add("non-selectable"),Rt(),t.styleCleanup=f=>{if(t.styleCleanup=void 0,u.preserveCursor!==!0&&(document.documentElement.style.cursor=""),document.body.classList.remove("non-selectable"),a===!0){const k=()=>{document.body.classList.remove("no-pointer-events--children")};f!==void 0?setTimeout(()=>{k(),f()},50):k()}else f!==void 0&&f()}};if(t.event.detected===!0){t.event.isFirst!==!0&&s(l,t.event.mouse);const{payload:f,synthetic:k}=Oe(l,t,!1);f!==void 0&&(t.handler(f)===!1?t.end(l):(t.styleCleanup===void 0&&t.event.isFirst===!0&&O(),t.event.lastX=f.position.left,t.event.lastY=f.position.top,t.event.lastDir=k===!0?void 0:f.direction,t.event.isFirst=!1));return}if(t.direction.all===!0||a===!0&&t.modifiers.mouseAllDir===!0){O(),t.event.detected=!0,t.move(l);return}const C=Math.abs(i),w=Math.abs(v);C!==w&&(t.direction.horizontal===!0&&C>w||t.direction.vertical===!0&&C<w||t.direction.up===!0&&C<w&&v<0||t.direction.down===!0&&C<w&&v>0||t.direction.left===!0&&C>w&&i<0||t.direction.right===!0&&C>w&&i>0?(t.event.detected=!0,t.move(l)):t.end(l,!0))},end(l,o){if(t.event!==void 0){if(ke(t,"temp"),re.is.firefox===!0&&Ce(e,!1),o===!0)t.styleCleanup!==void 0&&t.styleCleanup(),t.event.detected!==!0&&t.initialEvent!==void 0&&t.initialEvent.target.dispatchEvent(t.initialEvent.event);else if(t.event.detected===!0){t.event.isFirst===!0&&t.handler(Oe(l===void 0?t.lastEvt:l,t).payload);const{payload:i}=Oe(l===void 0?t.lastEvt:l,t,!0),v=()=>{t.handler(i)};t.styleCleanup!==void 0?t.styleCleanup(v):v()}t.event=void 0,t.initialEvent=void 0,t.lastEvt=void 0}}};e.__qtouchpan=t,u.mouse===!0&&he(t,"main",[[e,"mousedown","mouseStart",`passive${u.mouseCapture===!0?"Capture":""}`]]),re.has.touch===!0&&he(t,"main",[[e,"touchstart","touchStart",`passive${u.capture===!0?"Capture":""}`],[e,"touchmove","noop","notPassiveCapture"]])},updated(e,n){const u=e.__qtouchpan;u!==void 0&&(n.oldValue!==n.value&&(typeof value!="function"&&u.end(),u.handler=n.value),u.direction=Ne(n.modifiers))},beforeUnmount(e){const n=e.__qtouchpan;n!==void 0&&(n.event!==void 0&&n.end(),ke(n,"main"),ke(n,"temp"),re.is.firefox===!0&&Ce(e,!1),n.styleCleanup!==void 0&&n.styleCleanup(),delete e.__qtouchpan)}});const Ie=["vertical","horizontal"],$e={vertical:{offset:"offsetY",scroll:"scrollTop",dir:"down",dist:"y"},horizontal:{offset:"offsetX",scroll:"scrollLeft",dir:"right",dist:"x"}},Xe={prevent:!0,mouse:!0,mouseAllDir:!0},Ue=e=>e>=250?50:Math.ceil(e/5);var Kt=N({name:"QScrollArea",props:{...Ge,thumbStyle:Object,verticalThumbStyle:Object,horizontalThumbStyle:Object,barStyle:[Array,String,Object],verticalBarStyle:[Array,String,Object],horizontalBarStyle:[Array,String,Object],contentStyle:[Array,String,Object],contentActiveStyle:[Array,String,Object],delay:{type:[String,Number],default:1e3},visible:{type:Boolean,default:null},tabindex:[String,Number],onScroll:Function},setup(e,{slots:n,emit:u}){const s=p(!1),t=p(!1),l=p(!1),o={vertical:p(0),horizontal:p(0)},i={vertical:{ref:p(null),position:p(0),size:p(0)},horizontal:{ref:p(null),position:p(0),size:p(0)}},v=ee(),a=Je(e,v.proxy.$q);let O,C;const w=p(null),f=d(()=>"q-scrollarea"+(a.value===!0?" q-scrollarea--dark":""));i.vertical.percentage=d(()=>{const c=i.vertical.size.value-o.vertical.value;if(c<=0)return 0;const g=K(i.vertical.position.value/c,0,1);return Math.round(g*1e4)/1e4}),i.vertical.thumbHidden=d(()=>(e.visible===null?l.value:e.visible)!==!0&&s.value===!1&&t.value===!1||i.vertical.size.value<=o.vertical.value+1),i.vertical.thumbStart=d(()=>i.vertical.percentage.value*(o.vertical.value-i.vertical.thumbSize.value)),i.vertical.thumbSize=d(()=>Math.round(K(o.vertical.value*o.vertical.value/i.vertical.size.value,Ue(o.vertical.value),o.vertical.value))),i.vertical.style=d(()=>({...e.thumbStyle,...e.verticalThumbStyle,top:`${i.vertical.thumbStart.value}px`,height:`${i.vertical.thumbSize.value}px`})),i.vertical.thumbClass=d(()=>"q-scrollarea__thumb q-scrollarea__thumb--v absolute-right"+(i.vertical.thumbHidden.value===!0?" q-scrollarea__thumb--invisible":"")),i.vertical.barClass=d(()=>"q-scrollarea__bar q-scrollarea__bar--v absolute-right"+(i.vertical.thumbHidden.value===!0?" q-scrollarea__bar--invisible":"")),i.horizontal.percentage=d(()=>{const c=i.horizontal.size.value-o.horizontal.value;if(c<=0)return 0;const g=K(i.horizontal.position.value/c,0,1);return Math.round(g*1e4)/1e4}),i.horizontal.thumbHidden=d(()=>(e.visible===null?l.value:e.visible)!==!0&&s.value===!1&&t.value===!1||i.horizontal.size.value<=o.horizontal.value+1),i.horizontal.thumbStart=d(()=>i.horizontal.percentage.value*(o.horizontal.value-i.horizontal.thumbSize.value)),i.horizontal.thumbSize=d(()=>Math.round(K(o.horizontal.value*o.horizontal.value/i.horizontal.size.value,Ue(o.horizontal.value),o.horizontal.value))),i.horizontal.style=d(()=>({...e.thumbStyle,...e.horizontalThumbStyle,left:`${i.horizontal.thumbStart.value}px`,width:`${i.horizontal.thumbSize.value}px`})),i.horizontal.thumbClass=d(()=>"q-scrollarea__thumb q-scrollarea__thumb--h absolute-bottom"+(i.horizontal.thumbHidden.value===!0?" q-scrollarea__thumb--invisible":"")),i.horizontal.barClass=d(()=>"q-scrollarea__bar q-scrollarea__bar--h absolute-bottom"+(i.horizontal.thumbHidden.value===!0?" q-scrollarea__bar--invisible":""));const k=d(()=>i.vertical.thumbHidden.value===!0&&i.horizontal.thumbHidden.value===!0?e.contentStyle:e.contentActiveStyle),L=[[ue,c=>{m(c,"vertical")},void 0,{vertical:!0,...Xe}]],_=[[ue,c=>{m(c,"horizontal")},void 0,{horizontal:!0,...Xe}]];function H(){const c={};return Ie.forEach(g=>{const z=i[g];c[g+"Position"]=z.position.value,c[g+"Percentage"]=z.percentage.value,c[g+"Size"]=z.size.value,c[g+"ContainerSize"]=o[g].value}),c}const h=_t(()=>{const c=H();c.ref=v.proxy,u("scroll",c)},0);function P(c,g,z){if(Ie.includes(c)===!1){console.error("[QScrollArea]: wrong first param of setScrollPosition (vertical/horizontal)");return}(c==="vertical"?Ae:Qe)(w.value,g,z)}function b({height:c,width:g}){let z=!1;o.vertical.value!==c&&(o.vertical.value=c,z=!0),o.horizontal.value!==g&&(o.horizontal.value=g,z=!0),z===!0&&G()}function x({position:c}){let g=!1;i.vertical.position.value!==c.top&&(i.vertical.position.value=c.top,g=!0),i.horizontal.position.value!==c.left&&(i.horizontal.position.value=c.left,g=!0),g===!0&&G()}function E({height:c,width:g}){i.horizontal.size.value!==g&&(i.horizontal.size.value=g,G()),i.vertical.size.value!==c&&(i.vertical.size.value=c,G())}function m(c,g){const z=i[g];if(c.isFirst===!0){if(z.thumbHidden.value===!0)return;C=z.position.value,t.value=!0}else if(t.value!==!0)return;c.isFinal===!0&&(t.value=!1);const F=$e[g],te=o[g].value,pe=(z.size.value-te)/(te-z.thumbSize.value),ve=c.distance[F.dist],Se=C+(c.direction===F.dir?1:-1)*ve*pe;R(Se,g)}function M(c,g){const z=i[g];if(z.thumbHidden.value!==!0){const F=c[$e[g].offset];if(F<z.thumbStart.value||F>z.thumbStart.value+z.thumbSize.value){const te=F-z.thumbSize.value/2;R(te/o[g].value*z.size.value,g)}z.ref.value!==null&&z.ref.value.dispatchEvent(new MouseEvent(c.type,c))}}function B(c){M(c,"vertical")}function W(c){M(c,"horizontal")}function G(){s.value===!0?clearTimeout(O):s.value=!0,O=setTimeout(()=>{s.value=!1},e.delay),e.onScroll!==void 0&&h()}function R(c,g){w.value[$e[g].scroll]=c}function ne(){l.value=!0}function de(){l.value=!1}Object.assign(v.proxy,{getScrollTarget:()=>w.value,getScroll:H,getScrollPosition:()=>({top:i.vertical.position.value,left:i.horizontal.position.value}),getScrollPercentage:()=>({top:i.vertical.percentage.value,left:i.horizontal.percentage.value}),setScrollPosition:P,setScrollPercentage(c,g,z){P(c,g*(i[c].size.value-o[c].value),z)}});let V=null;return qt(()=>{V={top:i.vertical.position.value,left:i.horizontal.position.value}}),Ct(()=>{if(V===null)return;const c=w.value;c!==null&&(Qe(c,V.left),Ae(c,V.top))}),Z(h.cancel),()=>y("div",{class:f.value,onMouseenter:ne,onMouseleave:de},[y("div",{ref:w,class:"q-scrollarea__container scroll relative-position fit hide-scrollbar",tabindex:e.tabindex!==void 0?e.tabindex:void 0},[y("div",{class:"q-scrollarea__content absolute",style:k.value},Ze(n.default,[y(ce,{debounce:0,onResize:E})])),y(lt,{axis:"both",onScroll:x})]),y(ce,{debounce:0,onResize:b}),y("div",{class:i.vertical.barClass.value,style:[e.barStyle,e.verticalBarStyle],"aria-hidden":"true",onMousedown:B}),y("div",{class:i.horizontal.barClass.value,style:[e.barStyle,e.horizontalBarStyle],"aria-hidden":"true",onMousedown:W}),j(y("div",{ref:i.vertical.ref,class:i.vertical.thumbClass.value,style:i.vertical.style.value,"aria-hidden":"true"}),L),j(y("div",{ref:i.horizontal.ref,class:i.horizontal.thumbClass.value,style:i.horizontal.style.value,"aria-hidden":"true"}),_)])}});const Ye=150;var Gt=N({name:"QDrawer",inheritAttrs:!1,props:{...Tt,...Ge,side:{type:String,default:"left",validator:e=>["left","right"].includes(e)},width:{type:Number,default:300},mini:Boolean,miniToOverlay:Boolean,miniWidth:{type:Number,default:57},breakpoint:{type:Number,default:1023},showIfAbove:Boolean,behavior:{type:String,validator:e=>["default","desktop","mobile"].includes(e),default:"default"},bordered:Boolean,elevated:Boolean,overlay:Boolean,persistent:Boolean,noSwipeOpen:Boolean,noSwipeClose:Boolean,noSwipeBackdrop:Boolean},emits:[...kt,"on-layout","mini-state"],setup(e,{slots:n,emit:u,attrs:s}){const t=ee(),{proxy:{$q:l}}=t,o=Je(e,l),{preventBodyScroll:i}=Lt(),{registerTimeout:v}=xt(),a=Me(ye,()=>{console.error("QDrawer needs to be child of QLayout")});let O,C,w;const f=p(e.behavior==="mobile"||e.behavior!=="desktop"&&a.totalWidth.value<=e.breakpoint),k=d(()=>e.mini===!0&&f.value!==!0),L=d(()=>k.value===!0?e.miniWidth:e.width),_=p(e.showIfAbove===!0&&f.value===!1?!0:e.modelValue===!0),H=d(()=>e.persistent!==!0&&(f.value===!0||F.value===!0));function h(r,S){if(E(),r!==!1&&a.animate(),Q(0),f.value===!0){const D=a.instances[V.value];D!==void 0&&D.belowBreakpoint===!0&&D.hide(!1),I(1),a.isContainer.value!==!0&&i(!0)}else I(0),r!==!1&&we(!1);v(()=>{r!==!1&&we(!0),S!==!0&&u("show",r)},Ye)}function P(r,S){m(),r!==!1&&a.animate(),I(0),Q(W.value*L.value),_e(),S!==!0&&v(()=>{u("hide",r)},Ye)}const{show:b,hide:x}=Ot({showing:_,hideOnRouteChange:H,handleShow:h,handleHide:P}),{addToHistory:E,removeFromHistory:m}=$t(_,x,H),M={belowBreakpoint:f,hide:x},B=d(()=>e.side==="right"),W=d(()=>(l.lang.rtl===!0?-1:1)*(B.value===!0?1:-1)),G=p(0),R=p(!1),ne=p(!1),de=p(L.value*W.value),V=d(()=>B.value===!0?"left":"right"),c=d(()=>_.value===!0&&f.value===!1&&e.overlay===!1?e.miniToOverlay===!0?e.miniWidth:L.value:0),g=d(()=>e.overlay===!0||e.miniToOverlay===!0||a.view.value.indexOf(B.value?"R":"L")>-1||l.platform.is.ios===!0&&a.isContainer.value===!0),z=d(()=>e.overlay===!1&&_.value===!0&&f.value===!1),F=d(()=>e.overlay===!0&&_.value===!0&&f.value===!1),te=d(()=>"fullscreen q-drawer__backdrop"+(_.value===!1&&R.value===!1?" hidden":"")),pe=d(()=>({backgroundColor:`rgba(0,0,0,${G.value*.4})`})),ve=d(()=>B.value===!0?a.rows.value.top[2]==="r":a.rows.value.top[0]==="l"),Se=d(()=>B.value===!0?a.rows.value.bottom[2]==="r":a.rows.value.bottom[0]==="l"),it=d(()=>{const r={};return a.header.space===!0&&ve.value===!1&&(g.value===!0?r.top=`${a.header.offset}px`:a.header.space===!0&&(r.top=`${a.header.size}px`)),a.footer.space===!0&&Se.value===!1&&(g.value===!0?r.bottom=`${a.footer.offset}px`:a.footer.space===!0&&(r.bottom=`${a.footer.size}px`)),r}),ot=d(()=>{const r={width:`${L.value}px`,transform:`translateX(${de.value}px)`};return f.value===!0?r:Object.assign(r,it.value)}),nt=d(()=>"q-drawer__content fit "+(a.isContainer.value!==!0?"scroll":"overflow-auto")),rt=d(()=>`q-drawer q-drawer--${e.side}`+(ne.value===!0?" q-drawer--mini-animate":"")+(e.bordered===!0?" q-drawer--bordered":"")+(o.value===!0?" q-drawer--dark q-dark":"")+(R.value===!0?" no-transition":_.value===!0?"":" q-layout--prevent-focus")+(f.value===!0?" fixed q-drawer--on-top q-drawer--mobile q-drawer--top-padding":` q-drawer--${k.value===!0?"mini":"standard"}`+(g.value===!0||z.value!==!0?" fixed":"")+(e.overlay===!0||e.miniToOverlay===!0?" q-drawer--on-top":"")+(ve.value===!0?" q-drawer--top-padding":""))),ut=d(()=>{const r=l.lang.rtl===!0?e.side:V.value;return[[ue,vt,void 0,{[r]:!0,mouse:!0}]]}),st=d(()=>{const r=l.lang.rtl===!0?V.value:e.side;return[[ue,De,void 0,{[r]:!0,mouse:!0}]]}),ct=d(()=>{const r=l.lang.rtl===!0?V.value:e.side;return[[ue,De,void 0,{[r]:!0,mouse:!0,mouseAllDir:!0}]]});function ze(){ft(f,e.behavior==="mobile"||e.behavior!=="desktop"&&a.totalWidth.value<=e.breakpoint)}$(f,r=>{r===!0?(O=_.value,_.value===!0&&x(!1)):e.overlay===!1&&e.behavior!=="mobile"&&O!==!1&&(_.value===!0?(Q(0),I(0),_e()):b(!1))}),$(()=>e.side,(r,S)=>{a.instances[S]===M&&(a.instances[S]=void 0,a[S].space=!1,a[S].offset=0),a.instances[r]=M,a[r].size=L.value,a[r].space=z.value,a[r].offset=c.value}),$(a.totalWidth,()=>{(a.isContainer.value===!0||document.qScrollPrevented!==!0)&&ze()}),$(()=>e.behavior+e.breakpoint,ze),$(a.isContainer,r=>{_.value===!0&&i(r!==!0),r===!0&&ze()}),$(a.scrollbarWidth,()=>{Q(_.value===!0?0:void 0)}),$(c,r=>{X("offset",r)}),$(z,r=>{u("on-layout",r),X("space",r)}),$(B,()=>{Q()}),$(L,r=>{Q(),qe(e.miniToOverlay,r)}),$(()=>e.miniToOverlay,r=>{qe(r,L.value)}),$(()=>l.lang.rtl,()=>{Q()}),$(()=>e.mini,()=>{e.modelValue===!0&&(dt(),a.animate())}),$(k,r=>{u("mini-state",r)});function Q(r){r===void 0?ge(()=>{r=_.value===!0?0:L.value,Q(W.value*r)}):(a.isContainer.value===!0&&B.value===!0&&(f.value===!0||Math.abs(r)===L.value)&&(r+=W.value*a.scrollbarWidth.value),de.value=r)}function I(r){G.value=r}function we(r){const S=r===!0?"remove":a.isContainer.value!==!0?"add":"";S!==""&&document.body.classList[S]("q-body--drawer-toggle")}function dt(){clearTimeout(C),t.proxy&&t.proxy.$el&&t.proxy.$el.classList.add("q-drawer--mini-animate"),ne.value=!0,C=setTimeout(()=>{ne.value=!1,t&&t.proxy&&t.proxy.$el&&t.proxy.$el.classList.remove("q-drawer--mini-animate")},150)}function vt(r){if(_.value!==!1)return;const S=L.value,D=K(r.distance.x,0,S);if(r.isFinal===!0){D>=Math.min(75,S)===!0?b():(a.animate(),I(0),Q(W.value*S)),R.value=!1;return}Q((l.lang.rtl===!0?B.value!==!0:B.value)?Math.max(S-D,0):Math.min(0,D-S)),I(K(D/S,0,1)),r.isFirst===!0&&(R.value=!0)}function De(r){if(_.value!==!0)return;const S=L.value,D=r.direction===e.side,fe=(l.lang.rtl===!0?D!==!0:D)?K(r.distance.x,0,S):0;if(r.isFinal===!0){Math.abs(fe)<Math.min(75,S)===!0?(a.animate(),I(1),Q(0)):x(),R.value=!1;return}Q(W.value*fe),I(K(1-fe/S,0,1)),r.isFirst===!0&&(R.value=!0)}function _e(){i(!1),we(!0)}function X(r,S){a.update(e.side,r,S)}function ft(r,S){r.value!==S&&(r.value=S)}function qe(r,S){X("size",r===!0?e.miniWidth:S)}return a.instances[e.side]=M,qe(e.miniToOverlay,L.value),X("space",z.value),X("offset",c.value),e.showIfAbove===!0&&e.modelValue!==!0&&_.value===!0&&e["onUpdate:modelValue"]!==void 0&&u("update:modelValue",!0),se(()=>{u("on-layout",z.value),u("mini-state",k.value),O=e.showIfAbove===!0;const r=()=>{(_.value===!0?h:P)(!1,!0)};if(a.totalWidth.value!==0){ge(r);return}w=$(a.totalWidth,()=>{w(),w=void 0,_.value===!1&&e.showIfAbove===!0&&f.value===!1?b(!1):r()})}),Z(()=>{w!==void 0&&w(),clearTimeout(C),_.value===!0&&_e(),a.instances[e.side]===M&&(a.instances[e.side]=void 0,X("size",0),X("offset",0),X("space",!1))}),()=>{const r=[];f.value===!0&&(e.noSwipeOpen===!1&&r.push(j(y("div",{key:"open",class:`q-drawer__opener fixed-${e.side}`,"aria-hidden":"true"}),ut.value)),r.push(Re("div",{ref:"backdrop",class:te.value,style:pe.value,"aria-hidden":"true",onClick:x},void 0,"backdrop",e.noSwipeBackdrop!==!0&&_.value===!0,()=>ct.value)));const S=k.value===!0&&n.mini!==void 0,D=[y("div",{...s,key:""+S,class:[nt.value,s.class]},S===!0?n.mini():be(n.default))];return e.elevated===!0&&_.value===!0&&D.push(y("div",{class:"q-layout__shadow absolute-full overflow-hidden no-pointer-events"})),r.push(Re("aside",{ref:"content",class:rt.value,style:ot.value},D,"contentclose",e.noSwipeClose!==!0&&f.value===!0,()=>st.value)),y("div",{class:"q-drawer-container"},r)}}}),Jt=N({name:"QPageContainer",setup(e,{slots:n}){const{proxy:{$q:u}}=ee(),s=Me(ye,()=>{console.error("QPageContainer needs to be child of QLayout")});et(Pt,!0);const t=d(()=>{const l={};return s.header.space===!0&&(l.paddingTop=`${s.header.size}px`),s.right.space===!0&&(l[`padding${u.lang.rtl===!0?"Left":"Right"}`]=`${s.right.size}px`),s.footer.space===!0&&(l.paddingBottom=`${s.footer.size}px`),s.left.space===!0&&(l[`padding${u.lang.rtl===!0?"Right":"Left"}`]=`${s.left.size}px`),l});return()=>y("div",{class:"q-page-container",style:t.value},be(n.default))}}),Zt=N({name:"QLayout",props:{container:Boolean,view:{type:String,default:"hhh lpr fff",validator:e=>/^(h|l)h(h|r) lpr (f|l)f(f|r)$/.test(e.toLowerCase())},onScroll:Function,onScrollHeight:Function,onResize:Function},setup(e,{slots:n,emit:u}){const{proxy:{$q:s}}=ee(),t=p(null),l=p(s.screen.height),o=p(e.container===!0?0:s.screen.width),i=p({position:0,direction:"down",inflectionPoint:0}),v=p(0),a=p(Ke.value===!0?0:xe()),O=d(()=>"q-layout q-layout--"+(e.container===!0?"containerized":"standard")),C=d(()=>e.container===!1?{minHeight:s.screen.height+"px"}:null),w=d(()=>a.value!==0?{[s.lang.rtl===!0?"left":"right"]:`${a.value}px`}:null),f=d(()=>a.value!==0?{[s.lang.rtl===!0?"right":"left"]:0,[s.lang.rtl===!0?"left":"right"]:`-${a.value}px`,width:`calc(100% + ${a.value}px)`}:null);function k(b){if(e.container===!0||document.qScrollPrevented!==!0){const x={position:b.position.top,direction:b.direction,directionChanged:b.directionChanged,inflectionPoint:b.inflectionPoint.top,delta:b.delta.top};i.value=x,e.onScroll!==void 0&&u("scroll",x)}}function L(b){const{height:x,width:E}=b;let m=!1;l.value!==x&&(m=!0,l.value=x,e.onScrollHeight!==void 0&&u("scroll-height",x),H()),o.value!==E&&(m=!0,o.value=E),m===!0&&e.onResize!==void 0&&u("resize",b)}function _({height:b}){v.value!==b&&(v.value=b,H())}function H(){if(e.container===!0){const b=l.value>v.value?xe():0;a.value!==b&&(a.value=b)}}let h;const P={instances:{},view:d(()=>e.view),isContainer:d(()=>e.container),rootRef:t,height:l,containerHeight:v,scrollbarWidth:a,totalWidth:d(()=>o.value+a.value),rows:d(()=>{const b=e.view.toLowerCase().split(" ");return{top:b[0].split(""),middle:b[1].split(""),bottom:b[2].split("")}}),header:me({size:0,offset:0,space:!1}),right:me({size:300,offset:0,space:!1}),footer:me({size:0,offset:0,space:!1}),left:me({size:300,offset:0,space:!1}),scroll:i,animate(){h!==void 0?clearTimeout(h):document.body.classList.add("q-body--layout-animate"),h=setTimeout(()=>{document.body.classList.remove("q-body--layout-animate"),h=void 0},155)},update(b,x,E){P[b][x]=E}};if(et(ye,P),xe()>0){let E=function(){b=null,x.classList.remove("hide-scrollbar")},m=function(){if(b===null){if(x.scrollHeight>s.screen.height)return;x.classList.add("hide-scrollbar")}else clearTimeout(b);b=setTimeout(E,300)},M=function(B){b!==null&&B==="remove"&&(clearTimeout(b),E()),window[`${B}EventListener`]("resize",m)},b=null;const x=document.body;$(()=>e.container!==!0?"add":"remove",M),e.container!==!0&&M("add"),Bt(()=>{M("remove")})}return()=>{const b=Ze(n.default,[y(lt,{onScroll:k}),y(ce,{onResize:L})]),x=y("div",{class:O.value,style:C.value,ref:e.container===!0?void 0:t,tabindex:-1},b);return e.container===!0?y("div",{class:"q-layout-container overflow-hidden",ref:t},[y(ce,{onResize:_}),y("div",{class:"absolute-full",style:w.value},[y("div",{class:"scroll",style:f.value},[x])])]):x}}});tt({name:"EssentialLink",props:{title:{type:String,required:!0},caption:{type:String,default:""},link:{type:String,default:"#"},icon:{type:String,default:""}}});var ea="/spa/assets/mountains2.d1f7cbcc.jpg",ta="/spa/assets/m5.68439674.jpg";const aa=[{title:"Docs",caption:"quasar.dev",icon:"school",link:"https://quasar.dev"},{title:"Github",caption:"github.com/quasarframework",icon:"code",link:"https://github.com/quasarframework"},{title:"Discord Chat Channel",caption:"chat.quasar.dev",icon:"chat",link:"https://chat.quasar.dev"},{title:"Forum",caption:"forum.quasar.dev",icon:"record_voice_over",link:"https://forum.quasar.dev"},{title:"Twitter",caption:"@quasarframework",icon:"rss_feed",link:"https://twitter.quasar.dev"},{title:"Facebook",caption:"@QuasarFramework",icon:"public",link:"https://facebook.quasar.dev"},{title:"Quasar Awesome",caption:"Community Quasar projects",icon:"favorite",link:"https://awesome.quasar.dev"}],la=tt({name:"MainLayout",components:{},setup(){const e=p(!1);return{essentialLinks:aa,leftDrawerOpen:e,toggleLeftDrawer(){e.value=!e.value}}}}),ia=J("div",{class:"q-px-lg q-pt-xl q-mb-md"},[J("div",{class:"text-h3"},"Todo"),J("div",{class:"text-subtitle1"},"Monday 8 August")],-1),oa=oe(" Todo "),na=oe(" Help "),ra=oe(" message "),ua=oe(" login "),sa=oe(" Top "),ca=oe(" Test "),da={class:"absolute-bottom bg-transparent"},va=J("img",{src:"https://w7.pngwing.com/pngs/599/84/png-transparent-homer-simpson-bart-simpson-mr-burns-drooling-sideshow-bob-bart-simpson-food-springfield-cartoon-thumbnail.png"},null,-1),fa=J("div",{class:"text-weight-bold"},"Razvan Outdoor",-1),ha=J("div",null,"@routdoor",-1);function ma(e,n,u,s,t,l){const o=Ht("router-view");return U(),Y(Zt,{view:"lHh Lpr lFf"},{default:T(()=>[q(It,null,{default:T(()=>[q(Vt,null,{default:T(()=>[q(Dt,{flat:"",dense:"",round:"",icon:"menu","aria-label":"Menu",onClick:e.toggleLeftDrawer},null,8,["onClick"])]),_:1}),ia,q(Ve,{src:ea,class:"header-image absolute-top"})]),_:1}),q(Gt,{modelValue:e.leftDrawerOpen,"onUpdate:modelValue":n[0]||(n[0]=i=>e.leftDrawerOpen=i),"show-if-above":"",width:200,breakpoint:600},{default:T(()=>[q(Kt,{style:{height:"calc(100% - 192px)","margin-top":"192px","border-right":"1px solid #ddd"}},{default:T(()=>[q(At,{padding:""},{default:T(()=>[j((U(),Y(ie,{to:"/",exact:"",clickable:""},{default:T(()=>[q(A,{avatar:""},{default:T(()=>[q(ae,{name:"list"})]),_:1}),q(A,null,{default:T(()=>[oa]),_:1})]),_:1})),[[le]]),j((U(),Y(ie,{to:"/help",clickable:""},{default:T(()=>[q(A,{avatar:""},{default:T(()=>[q(ae,{name:"help"})]),_:1}),q(A,null,{default:T(()=>[na]),_:1})]),_:1})),[[le]]),j((U(),Y(ie,{to:"/message",exact:"",clickable:""},{default:T(()=>[q(A,{avatar:""},{default:T(()=>[q(ae,{name:"chat"})]),_:1}),q(A,null,{default:T(()=>[ra]),_:1})]),_:1})),[[le]]),j((U(),Y(ie,{to:"/login",clickable:""},{default:T(()=>[q(A,{avatar:""},{default:T(()=>[q(ae,{name:"login"})]),_:1}),q(A,null,{default:T(()=>[ua]),_:1})]),_:1})),[[le]]),j((U(),Y(ie,{to:"/Top",clickable:""},{default:T(()=>[q(A,{avatar:""},{default:T(()=>[q(ae,{name:"champion"})]),_:1}),q(A,null,{default:T(()=>[sa]),_:1})]),_:1})),[[le]]),j((U(),Y(ie,{to:"/Test",clickable:""},{default:T(()=>[q(A,{avatar:""},{default:T(()=>[q(ae,{name:"T"})]),_:1}),q(A,null,{default:T(()=>[ca]),_:1})]),_:1})),[[le]])]),_:1})]),_:1}),q(Ve,{class:"absolute-top",src:ta,style:{height:"192px"}},{default:T(()=>[J("div",da,[q(Et,{size:"56px",class:"q-mb-sm"},{default:T(()=>[va]),_:1}),fa,ha])]),_:1})]),_:1},8,["modelValue"]),q(Jt,null,{default:T(()=>[(U(),Y(Qt,null,[q(o)],1024))]),_:1})]),_:1})}var za=Mt(la,[["render",ma]]);export{za as default};
