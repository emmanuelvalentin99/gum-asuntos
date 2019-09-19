import Vue from 'vue'
import App from './App.vue'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import vueResource from 'vue-resource'

Vue.config.productionTip = false

Vue.use(vueResource);

new Vue({
  render: h => h(App),
}).$mount('#app')
