<template lang="pug">
  div
    div#slide-out.sidenav(:class="{'sidenav-fixed':fixed}")
      div.text-center.m-2: img(src='img/logo.png' style='max-width: 200px;')
      ul
        li(style="padding: 0 30px;") Versión: {{version}}
        li(v-for='(objeto, i) in $store.getters.menu')
          a(data-toggle="collapse" :href="'#collapse'+i") {{objeto.nombre}}
          div.collapse(:id="'collapse'+i" data-parent='#slide-out'): ul: li(v-for='sObjeto in objeto.sub_objetos')
            a(v-if="objeto.nombre=='Otros' && sObjeto.nombre == 'Notificaciones'" href="#" @click.prevent="onClickNotificaciones()") Notificaciones
            a(v-else-if="!sObjeto.externo" :href='sObjeto.url') {{sObjeto.nombre}}
            a(v-else :href="(!sObjeto.url.startsWith('http')&&!sObjeto.url.startsWith('/')?baseUri:'')+sObjeto.url" :target="sObjeto.blank?'_blank':'_self'").font-weight-normal {{sObjeto.nombre}}
        li: a(href='#' @click.prevent='onClickSalir()') Salir
    div(data-target="slide-out").sidenav-overlay.sidenav-trigger
</template>

<style lang="scss">
#slide-out {
  ul {
    list-style-type: none;
    padding-left: 0;
    li a {
      color: rgba(0, 0, 0, 0.87);
      font-weight: 400;
      padding: 0 37.5px 0 45px;
      font-size: 13px;
      line-height: 44px;
      height: 44px;
      display: block;
    }
    li {
      &.active,
      &:hover {
        > a {
          background-color: rgba(50, 50, 50, 0.06);
        }
      }
    }
  }
  > ul > li {
    line-height: 44px;
    > a {
      padding: 0 30px;
      font-weight: 500;
    }
  }
}

.sidenav {
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14),
    0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
  position: fixed;
  width: 300px;
  left: 0;
  top: 0;
  margin: 0;
  transform: translateX(-105%);
  padding-bottom: 60px;
  background-color: #fff;
  z-index: 999;
  overflow-y: auto;
  will-change: transform;
  height: calc(100vh + 60px);
  &.active,
  &.sidenav-fixed {
    transform: translateX(0%);
    box-shadow: none;
  }
}

.sidenav:not(.sidenav-fixed) {
  transition: 250ms transform;
}

.sidenav-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  opacity: 0;
  height: 120vh;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 997;
  display: none;
}

.sidenav.active + .sidenav-overlay {
  display: block;
  opacity: 1;
  transition: 250ms opacity;
}
</style>

<script>
import $ from "jquery";

export default {
  name: "sidenav-menu",
  data() {
    return {
      baseUri: document.baseURI,
      version: process.env.VUE_APP_VERSION.substring(1)
    };
  },
  props: {
    fixed: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    onClickSalir() {
      this.$store.commit("isLoaderShown", true);
      this.$store.commit("setMenu", null);
      this.ajax("salir", {}, () => {
        this.$store.commit("isLoaderShown", false);
        window.location = document.baseURI;
      });
    },
    async onClickNotificaciones() {
      if (!isSecureContext) {
        this.toast("Es necesario un contexto seguro (HTTPS) válido.");
        return;
      }
      let r = await suscripcion.askPermission();
      if (!r) {
        this.toast("Es necesario permitir notificaciones");
        return;
      }
      r = await suscripcion.subscribeUserToPush(this.$store.sWRegistration);
      console.log(r);
      if (r)
        this.toast(
          "Se ha suscrito las notificaciones push y se ha enviado una notificación satisfactoriamente."
        );
      else
        this.toast(
          "Hubo un error mientras se suscribía a las notificaciones push o mientras se enviaba una notificación.",
          "Notificación",
          20000
        );
    }
  },
  async mounted() {
    this.$nextTick(() => {
      $(".collapse").collapse();
      // M.Collapsible.init(document.querySelectorAll("#slide-out .collapsible"));
    });
  }
};
</script>
