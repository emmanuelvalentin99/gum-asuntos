<template lang="pug">
  div(id="app")

    HelloWorld(msg="")
    solicitud()
    listaSolicitudesConsultor()
    historialSolicitudesConsultor()
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import solicitud from './components/solicitud.vue'
import listaSolicitudesConsultor from './components/listaSolicitudesConsultor.vue'
import historialSolicitudesConsultor from './components/historialSolicitudesConsultor.vue'

export default {
  name: 'app',
  components: {
    HelloWorld,
    solicitud,
    listaSolicitudesConsultor,
    historialSolicitudesConsultor
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /*text-align: center;*/
  color: #2c3e50;
  margin-top: 60px;
}
</style>
