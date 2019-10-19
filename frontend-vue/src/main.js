import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueSession from 'vue-session'


import axios from 'axios';
import VueAxios from 'vue-axios';

import bootstrap from 'bootstrap'
import BootstrapVue from 'bootstrap-vue'

Vue.prototype.$http = axios;
const token = localStorage.getItem('token');
if (token) {
    Vue.prototype.$http.defaults.headers.common['Authorization'] = token
}



Vue.use(VueSession)
Vue.use(VueAxios, axios);
Vue.use(BootstrapVue);
Vue.use(require('vue-moment'));


import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'bootstrap/dist/js/bootstrap.js'




Vue.config.productionTip = false


new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')