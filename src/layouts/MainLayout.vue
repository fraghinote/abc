<template>
  <q-layout view="lHh Lpr lFf">
    <q-header>

      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleOpen"
        />
      </q-toolbar>
        <div class="q-px-lg q-pt-xl q-mt-xl">
<!--        <div class="text-h3"></div>-->
<!--        <div class="text-subtitle1">Monday 8 August</div>-->
          <p id="clock" ></p>
        </div>
        <q-img
          src="../statics/t6.jpg"
          class="header-image absolute-top" />


    </q-header>

<q-drawer
        v-model="leftDrawerOpen"
        show-if-above
        :width="200"
        :breakpoint="600"
      >


        <q-scroll-area style="height: calc(100% - 192px); margin-top: 192px; border-right: 1px solid #ddd">
            {{isAuthed}}
          <q-list padding >
            <q-item v-if="isAuthed"
              to="/"
              exact
              clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="list" />
              </q-item-section>

              <q-item-section>
                Todo
              </q-item-section>
            </q-item>

            <q-item v-if="isAuthed"
              to="/help"
              clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="help_outline" />
              </q-item-section>

              <q-item-section>
                Help
              </q-item-section>
            </q-item>

            <q-item v-if="!isAuthed"
              to="/login"
              clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="login" />
              </q-item-section>
              <q-item-section>
                login
              </q-item-section>
            </q-item>

              <q-item v-if="!isAuthed"
                      to="/login1"
                      clickable v-ripple>
                  <q-item-section avatar>
                      <q-icon name="login" />
                  </q-item-section>
                  <q-item-section>
                      login
                  </q-item-section>
              </q-item>

              <q-item v-if="!isAuthed"
                      to="/LoginOOOOO"
                      clickable v-ripple>
                  <q-item-section avatar>
                      <q-icon name="login" />
                  </q-item-section>
                  <q-item-section>
                      loginOOOOO
                  </q-item-section>
              </q-item>



              <q-item v-if="isAuthed"
                  to="/IP"
                  clickable v-ripple>
                  <q-item-section avatar>
                      <q-icon name="search" />
                  </q-item-section>
                  <q-item-section>
                      IP
                  </q-item-section>
              </q-item>

              <q-item v-if="isAuthed"
                  to="/Top"
                  clickable v-ripple>
                  <q-item-section avatar>
                      <q-icon name="vertical_align_top" />
                  </q-item-section>
                  <q-item-section>
                      Top
                  </q-item-section>
              </q-item>

            <q-item v-if="isAuthed"
              to="/ConsumerDetails"
              exact
              clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="description"/>
              </q-item-section>
              <q-item-section>
                Consumer Details
              </q-item-section>
            </q-item>

            <q-item v-if="isAuthed"
              to="/shop"
              clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="shopping_cart" />
              </q-item-section>
              <q-item-section>
                shop
              </q-item-section>
            </q-item>

            <q-item v-if="isAuthed"
              to="/HelpTest"
              clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="mode_edit" />
              </q-item-section>
              <q-item-section>
                HelpTest
              </q-item-section>
            </q-item>


              <q-item v-if="isAuthed"
                  to="/Logout"
                  clickable v-ripple>
                  <q-item-section avatar>
                      <q-icon name="logout" />
                  </q-item-section>
                  <q-item-section>
                      Logout
                  </q-item-section>
              </q-item>


          </q-list>
        </q-scroll-area>
        <q-img class="absolute-top" src="../statics/mountains3.jpg" style="height: 192px">
          <div class="absolute-bottom bg-transparent">
            <q-avatar size="56px" class="q-mb-sm">
              <img src="https://pic.pimg.tw/open3313/1200131041.jpg">
            </q-avatar>
<!--            <div class="text-weight-bold">🙈🙉🙊🐵</div>-->
            <div>{{surveyUser.surveyUserid}}</div>
          </div>
        </q-img>

      </q-drawer>


    <q-page-container>

        <router-view />

    </q-page-container>

  </q-layout>
</template>
<script setup>
import { defineComponent, ref } from 'vue'

import {userStat} from "stores/userStat";
const store = userStat();
import { storeToRefs } from 'pinia';
import {useIsAuthed} from "stores/isAuthed";
const { isLogin } = storeToRefs(store);
const { isAuthed,surveyUser } = storeToRefs(useIsAuthed())
const {checkSession}  = useIsAuthed()

const leftDrawerOpen = ref(false)

const toggleOpen = ()=>{
    leftDrawerOpen.value = !leftDrawerOpen.value;
    console.log(leftDrawerOpen.value)
}
const linksList = ref([
    {
        title: 'Docs',
        caption: 'quasar.dev',
        icon: 'school',
        link: 'https://quasar.dev'
    },
    {
        title: 'Github',
        caption: 'github.com/quasarframework',
        icon: 'code',
        link: 'https://github.com/quasarframework'
    },
    {
        title: 'Discord Chat Channel',
        caption: 'chat.quasar.dev',
        icon: 'chat',
        link: 'https://chat.quasar.dev'
    },
    {
        title: 'Forum',
        caption: 'forum.quasar.dev',
        icon: 'record_voice_over',
        link: 'https://forum.quasar.dev'
    },
    {
        title: 'Twitter',
        caption: '@quasarframework',
        icon: 'rss_feed',
        link: 'https://twitter.quasar.dev'
    },
    {
        title: 'Facebook',
        caption: '@QuasarFramework',
        icon: 'public',
        link: 'https://facebook.quasar.dev'
    },
    {
        title: 'Quasar Awesome',
        caption: 'Community Quasar projects',
        icon: 'favorite',
        link: 'https://awesome.quasar.dev'
    }
])

const clock = function () {
    let getDate = new Date();
    document.getElementById("clock").innerHTML = getDate.toLocaleTimeString(
        [],
        { hour: "2-digit", minute: "2-digit", second: "2-digit" }

    );
};
setInterval(function () {
    clock();
}, 1000);


</script>


<style lang="css">
  .header-image{
    height: 100%;
    z-index: -1;
    opacity: 0.8;

  }
</style>

