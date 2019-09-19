import Vue from "vue";
import Router from "vue-router";
import Login from "./views/Login.vue";
import Solicitud from "./components/solicitud.vue";
import HistorialSolicitudesAgencia from "./components/historialSolicitudesAgencia.vue";
import ListaSolicitudesConsultor from "./components/listaSolicitudesConsultor.vue";
import HistorialSolicitudesConsultor from "./components/historialSolicitudesConsultor.vue";

Vue.use(Router);

export default new Router({
  mode: "hash",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/nueva/:guid",
      name: "nueva-solicitud",
      component: Solicitud
    },
    {
      path: "/login",
      name: "inicio-sesion",
      component: Login
    },
    {
      path: "/historial/:guid",
      name: "historial-agencia",
      component: HistorialSolicitudesAgencia
    },
    {
      path: "/solicitudes",
      name: "lista-consultor",
      component: ListaSolicitudesConsultor
    },
    {
      path: "/historial",
      name: "historial-consultor",
      component: HistorialSolicitudesConsultor
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "about" */ "./views/About.vue")
    }
  ]
});
