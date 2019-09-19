import Vue from "vue";
import App from "./App.vue";
import "bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import vueResource from "vue-resource";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

Vue.use(vueResource);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
