<template lang="pug">
  //- h5(style="padding: 0.5rem; margin: 0; background-color: rgb(35, 62, 95); color: #fff; font-weight: 500; height: 48px;").mb-2
  h5(style="padding: 0.5rem; margin: 0; background-color: #000; color: #fff; font-weight: 500; height: 48px; position: fixed; left: 0; top: 0; width: 100%; z-index: 2;")#app-header.mb-2
    a(v-show="showMenuToggler" href="#" data-target="slide-out" style="text-decoration: none; position: relative;").text-white.sidenav-trigger
      i(style="font-size: 32px; vertical-align: middle;").material-icons.pl-1.pr-1 menu
    |  {{titulo}} 
    small(style="color: #6c757d;") {{modulo}}
    a(v-show="!exitIfOpenerQ && !exitIfOpener && showBackButton" href="javascript:history.back()").btn.btn-sm.float-right.btn-outline-light Atrás
    a(v-show="(exitIfOpenerQ || exitIfOpener) && showBackButton" href="javascript:window.close();").btn.btn-sm.float-right.btn-outline-light Salir
</template>

<style lang="scss">
body {
  padding-top: 48px;
}

#app-header + div {
  margin-top: 0.5rem;
}
</style>

<script>
import $ from "jquery";

export default {
  name: "app-header",
  data() {
    return {
      exitIfOpenerQ: false
    };
  },
  props: {
    modulo: String,
    titulo: String,
    showMenuToggler: {
      type: Boolean,
      default: true
    },
    showBackButton: {
      type: Boolean,
      default: true
    },
    exitIfOpener: {
      type: Boolean,
      default: false
    }
  },
  mounted() {
    // if ("exitIfOpener" in this.$route.query) this.exitIfOpenerQ = true;
    this.$nextTick(() => {
      $(".sidenav-trigger").click(function(e) {
        e.preventDefault();
        $("#" + this.dataset.target).toggleClass("active");
      });
    });
  }
};
</script>
