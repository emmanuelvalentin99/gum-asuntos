<template lang="pug">
  div
    div#loader(:hidden="!$store.state.isLoaderShown")
      div
        div: div(style="width: 75px; height: 75px;").spinner-border.text-light
        | Cargando...
    div(style="position: fixed; top: 0; right: 0; z-index: 1150;")#toasts
</template>

<style lang="scss">
#loader {
  width: 100vw;
  height: 100vh;
  position: fixed;
  left: 0;
  top: 0;
  z-index: 60000;
  background-color: rgba(0, 0, 0, 0.6);

  > div {
    background-color: #000;
    height: calc(91px + 2rem);
    width: calc(75px + 2rem);
    color: #fff;
    padding: 1rem;
    border-radius: 1rem;
    position: fixed;
    left: calc(50vw - 1rem - 37.5px);
    top: calc(50vh - 1rem - 45.5px);
  }
}
</style>

<script>
export default {
  name: "miscelanea"
};
</script>
