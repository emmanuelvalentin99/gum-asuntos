import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    isLoaderShown: 0
  },
  mutations: {
    isLoaderShown(state, value) {
      state.isLoaderShown += value ? 1 : -1;
      if (state.isLoaderShown < 0) state.isLoaderShown = 0;
      let elemento = document.querySelector(":focus");
      if (elemento === null) return;
      elemento.blur();
    }
  },
  actions: {},
  getters: {
    menu(state) {
      if (state._menu && state._menu.length > 0) return state._menu;
      let value = window.sessionStorage.getItem("menu");
      if (value != null) return JSON.parse(value);
    }
  },
});
