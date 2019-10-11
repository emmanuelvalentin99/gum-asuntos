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
