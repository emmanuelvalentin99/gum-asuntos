<template lang="pug">
  div
    app-header(titulo="Mesa de Ayuda" modulo="Capital Network" :showMenuToggler="false")
    div().container
      div().row
        div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
            div().input-group-prepend
              span().input-group-text.form-control-sm Consesionario
            select( v-model="json_filtros.idAgencia" required).form-control.form-control-sm
              option(v-for="solicitud in solicitudesFiltradas" v-bind:value="solicitud.id_agencia") {{solicitud.nombre_agencia}}
        div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
            div().input-group-prepend
              span().input-group-text.form-control-sm Usuario
            select( v-model="json_filtros.usuario" required).form-control.form-control-sm
              option(v-for="usuario in usuarios" v-bind:value="usuario.usuario") {{usuario.nombre}}
        button(type="button" v-on:click="applyFilter()" class="" ).btn.btn-light.btn-sm Aplicar
      div().row
        table(id="listaSolicitudes").table.table-striped
          thead().thead-dark
            tr()
              th(scope="col") #
              th(scope="col") Agencia
              th(scope="col") Descripcion
              th(scope="col") 
              th(scope="col") Fecha Actualización
          tbody()
            tr(v-for="(solicitud, indexSolicitud) in solicitudes" v-if="solicitud.estado=='abierta'")
              td {{solicitud.id}}
              td {{solicitud.nombre_agencia}}
              td {{solicitud.descripcion}}
              td
                div.btn-group-sm.btn-group-vertical
                  button(type="button" data-toggle="modal" v-bind:data-target="'#modal-detalle-lsc'+solicitud.id").btn.btn-primary Detalles
                  //button(type="button" v-on:click="sendAceptar(solicitud)").btn.btn-success Aceptar
                  //button(type="button" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-danger Cerrar
                div(v-bind:id="'modal-detalle-lsc'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                    div(class="" role="document").modal-dialog.modal-lg.modal-dialog-scrollable
                        div().modal-content
                            div().modal-header
                                h5(id="exampleModalLabel").modal-title Detalle Solicitud
                                button(type="button" data-dismiss="modal" aria-label="Close").close
                                    span(aria-hidden="true") &times;
                            div().modal-body
                              div().form-row
                                  div().form-group.col-sm-12
                                      button(type="button" data-toggle="collapse" v-bind:data-target="'#collapse-lsc-'+solicitud.id" aria-expanded="false" v-bind:aria-controls="'collapse-lsc-'+solicitud.id").btn.btn-info Contactos
                                      div(v-bind:id="'collapse-lsc-'+solicitud.id").collapse
                                          div().card.card-body
                                            fieldset(disabled)
                                              div(v-for="(contacto, indexContacto) in solicitud.contactos").form-row    
                                                div().form-group.col-sm-3
                                                    label(  for="exampleFormControlTextarea1") Cargo
                                                    input(v-bind:value="contacto.cargo").form-control
                                                div().form-group.col-sm-3
                                                    label(  for="exampleFormControlTextarea1") Nombre
                                                    input(v-bind:value="contacto.nombre").form-control
                                                div().form-group.col-sm-3
                                                    label(  for="exampleFormControlTextarea1") Telefono
                                                    input(v-bind:value="contacto.telefono").form-control
                                                div().form-group.col-sm-3
                                                    label(  for="exampleFormControlTextarea1") Email
                                                    input(v-bind:value="contacto.email").form-control
                              div().form-row
                                      div().form-group.col-sm-12
                                          label(  for="exampleFormControlTextarea1") Usuario Asignado 
                                          select( v-model="solicitud.usuario_asignado").form-control
                                            option(v-for="usuario in usuarios" v-bind:value="usuario.usuario") {{usuario.nombre}}
                              fieldset(disabled)                                  
                                  div().form-row
                                      div().form-group.col-sm-12
                                          label(  for="exampleFormControlTextarea1") Asunto
                                          input(v-bind:value="solicitud.asunto").form-control
                                  div().form-row
                                      div().form-group.col-sm-6
                                          label(for="exampleFormControlTextarea1") Categoria
                                          input(v-bind:value="solicitud.nombre_categoria").form-control
                                      div().form-group.col-sm-6
                                          label(for="exampleFormControlTextarea1") Modulo
                                          input(v-bind:value="solicitud.nombre_modulo").form-control 
                                  div().form-row
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") No. Cita
                                          input(v-bind:value="solicitud.no_cita").form-control
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") No. Orden
                                          input(v-bind:value="solicitud.no_orden").form-control
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") No. Placas
                                          input(v-bind:value="solicitud.no_placas").form-control
                                  div().form-row
                                      div().form-group.col-sm-12
                                          label(for="exampleFormControlTextarea1") Descripción
                                          textarea(v-bind:value="solicitud.descripcion" rows="4").form-control
                                  div.form-row
                                      div.form-group.col-sm-12
                                          div(:id="'carouselExampleIndicators'+solicitud.id" data-ride="carousel").carousel.slide
                                              ol.carousel-indicators
                                                  li(v-for="(item, index) in solicitud.evidencias" v-bind:data-target="'#carouselExampleIndicators'+solicitud.id" v-bind:data-slide-to="index")
                                              div.carousel-inner
                                                  template(v-for="(item, index) in solicitud.evidencias")
                                                      div(v-if="index==0").carousel-item.active
                                                          img(v-bind:src="'img/'+item.ruta" alt="First slide").d-block.w-50
                                                      div(v-else).carousel-item
                                                          img(v-bind:src="'img/'+item.ruta").d-block.w-50
                                              a(:href="'#carouselExampleIndicators'+solicitud.id" role="button" data-slide="prev").carousel-control-prev
                                                  span(aria-hidden="true").carousel-control-prev-icon
                                                  span().sr-only Anterior
                                              a(:href="'#carouselExampleIndicators'+solicitud.id" role="button" data-slide="next").carousel-control-next
                                                  span(aria-hidden="true").carousel-control-next-icon
                                                  span().sr-only Siguiente
                            div().modal-footer
                                button(type="button" v-on:click="sendAsignarUsuario(solicitud)" data-dismiss="modal").btn.btn-primary Asignar Usuario
                                button(type="button" v-on:click="sendAceptar(solicitud)" data-dismiss="modal").btn.btn-success Redmine
                                button(type="button"  data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id" data-dismiss="modal").btn.btn-danger Responder
                div(v-bind:id="'modal-cerrar-lsc'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                    div(class="" role="document").modal-dialog.modal-lg
                        div().modal-content
                            div().modal-header
                                h5(id="exampleModalLabel").modal-title Responder a Distribuidor
                                button(type="button" data-dismiss="modal" aria-label="Close").close
                                    span(aria-hidden="true") &times;
                            div().modal-body
                                form(v-on:submit.prevent="sendCerrar(solicitud)")
                                    div().form-row
                                        div().form-group.col-sm-12
                                            label(for="exampleFormControlSelect1") Motivo Cierre
                                            select( v-model="json_cerrar.id_motivo_cierre" required).form-control
                                                option(v-for="motivo in motivos_cierre" v-bind:value="motivo.id") {{motivo.descripcion}}
                                    div().form-row
                                        div().form-group.col-sm-12
                                            label(for="exampleFormControlTextarea1") Detalle de Cierre
                                            textarea( placeholder="Descripción..." v-model="json_cerrar.detalle_cierre" class="form-control" id="exampleFormControlTextarea1" rows="4" required)
                                    div().modal-footer
                                        button(type="submit").btn.btn-danger Responder
              td 
                  div().row
                      div().col-sm-12
                          p {{solicitud.fecha_actualizacion}}
                    


</template>

<script>
import $ from "jquery";
import AppHeader from "./Header.vue";
//import dt from "datatables.net";

export default {
  components: { AppHeader },
  data() {
    return {
      json_filtros:{
        idAgencia:0,
        usuario:""
      },
      json_cerrar: {
        id_solicitud: 0,
        id_motivo_cierre: 0,
        detalle_cierre: ""
      },
      json_asignar_usuario: {
        usuarioAsignado: "",
        idSolicitud: 0
      },
      json_aceptar: {
        id_solicitud: 0,
        token: window.sessionStorage.getItem("token")
      },
      form_aceptar: {
        id_agencia: 0,
        id_modulo: 0,
        no_orden: "",
        no_cita: "",
        no_placas: "",
        asunto: "",
        email: "",
        descripcion: "",
        evidencias: []
      },
      solicitudes: [],
      consesionarios:[],
      usuarios:[],
      motivos_cierre: [],
      modal: ""
    };
  },
  methods: {
    applyFilter() {
      this.$store.commit("isLoaderShown", true); // Esta cosa hace que se muestre el "Cargando..."
      this.$http
        .post("api/redmine/solicitudes-pendientes", this.json_filtros, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            //alert(response);
            this.solicitudes = response.body.solicitudes;
            this.json_filtros.idAgencia = 0;
            this.json_filtros.usuario = "";
            //console.log(this.json_filtros);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );
    },
    sendCerrar(solicitud) {
      $("#modal-cerrar-lsc" + solicitud.id).modal("hide");
      this.$store.commit("isLoaderShown", true);
      this.json_cerrar.id_solicitud = solicitud.id;
      this.$http
        .post("api/redmine/cerrar-solicitud", this.json_cerrar, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.solicitudes.splice(this.solicitudes.indexOf(solicitud), 1);
            //console.log(this.solicitudes);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );

      this.json_cerrar.id_motivo_cierre = 0;
      this.json_cerrar.detalle_cierre = "";
    },
    sendAceptar(solicitud) {
      //Display the key/value pairs
      // for (var pair of formData.entries()) {
      //     console.log(pair[0]+ ', ' + pair[1]);
      // }
      this.$store.commit("isLoaderShown", true);
      this.json_aceptar.id_solicitud = solicitud.id;
      //this.json_acpetar.token=window.sessionStorage.token
      this.$http
        .post("api/redmine/aceptar-solicitud", this.json_aceptar, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.solicitudes.splice(this.solicitudes.indexOf(solicitud), 1);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );

      this.json_aceptar.id_solicitud = 0;
      this.json_aceptar.token = "";
    },
    sendAsignarUsuario(solicitud) {
       this.$store.commit("isLoaderShown", true);
        this.json_asignar_usuario.idSolicitud=solicitud.id;
        this.json_asignar_usuario.usuarioAsignado=solicitud.usuario_asignado;
         this.$http
        .post("api/redmine/asignar-solicitud", this.json_asignar_usuario, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            this.$store.commit("isLoaderShown", false);
            
          },
          response => {
            alert(response);
          }
        );
    }
  },
  http: {
    root: document.baseURI
  },
  computed: {
    modalFunction() {
      $("#modal1").modal("hide");
      return "";
    },
    solicitudesFiltradas(){
       let solicitudesFiltradas = [];
      for (let solicitud of this.consesionarios) {
        if (solicitudesFiltradas.findIndex(elem => elem.id_agencia == solicitud.id_agencia) == -1) {
          solicitudesFiltradas.push(solicitud);
        }
      }
      return solicitudesFiltradas;
    }
  },
  mounted() {
    if (
      !window.sessionStorage.getItem("token") ||
      window.sessionStorage.getItem("token") == ""
    ) {
      location = "/login";
      return;
    }
    this.$store.commit("isLoaderShown", true);
    this.$http.post("api/redmine/solicitudes-pendientes",this.json_filtros, {
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json"
        }
      }).then(respuesta => {
      let usuario=atob(window.sessionStorage.getItem("token")).split(":")[0];
      
      this.solicitudes = respuesta.body.solicitudes;
      this.consesionarios = respuesta.body.solicitudes;
      this.usuarios = respuesta.body.usuarios;
      this.usuarios.push({usuario:usuario,nombre:"yo mismo"});
      this.motivos_cierre = respuesta.body.motivosCierre;
      this.$store.commit("isLoaderShown", false);
    });
  }
};
</script>

<style>
</style>