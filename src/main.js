import Vue from 'vue';
import Vuetify from 'vuetify';
import VueRouter from 'vue-router';
import App from './App.vue';
import router from './router';
import './registerServiceWorker';
import { VuejsDatatableFactory } from 'vuejs-datatable';
 
Vue.use( VuejsDatatableFactory );
Vue.use(Vuetify);
Vue.use(VueRouter);

new Vue({ 
  el: '#app',
  router,
  render: h => h(App),
});
