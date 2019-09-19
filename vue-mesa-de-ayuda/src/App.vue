<template lang="pug">
  div(id="app")
    miscelanea
    router-view
</template>

<script>
import Miscelanea from "./components/Miscelanea.vue";

export default {
  name: "app",
  components: { Miscelanea }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /*text-align: center;*/
  color: #2c3e50;
  margin-top: 60px;
}

body {
  overflow-x: hidden;
}
</style>
