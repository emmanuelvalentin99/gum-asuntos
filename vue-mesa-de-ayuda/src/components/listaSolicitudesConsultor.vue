<template lang="pug">
    div().container
        div().row.col-sm-1.offset-sm-11
            a(href="#" ).btn.btn-dark Atrás
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
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.id}}
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.nombre_agencia}}
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.descripcion}}
                        td
                            div().row
                                div().col-sm-12
                                    button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-detalle-lsc'+solicitud.id").btn.btn-primary Detalles
                                    div(v-bind:id="'modal-detalle-lsc'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                                        div(class="" role="document").modal-dialog.modal-lg.modal-dialog-scrollable
                                            div().modal-content
                                                div().modal-header
                                                    h5(id="exampleModalLabel").modal-title Detalle Solicitud
                                                    button(type="button" data-dismiss="modal" aria-label="Close").close
                                                        span(aria-hidden="true") &times;
                                                div().modal-body
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
                                                                label(for="exampleFormControlTextarea1") Email Contacto
                                                                input(v-bind:value="solicitud.email").form-control
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
                                                                                img(v-bind:src="'img/'+item.ruta" alt="First slide").d-block.w-100
                                                                            div(v-else).carousel-item
                                                                                img(v-bind:src="'img/'+item.ruta").d-block.w-100
                                                                    a(:href="'#carouselExampleIndicators'+solicitud.id" role="button" data-slide="prev").carousel-control-prev
                                                                        span(aria-hidden="true").carousel-control-prev-icon
                                                                        span().sr-only Anterior
                                                                    a(:href="'#carouselExampleIndicators'+solicitud.id" role="button" data-slide="next").carousel-control-next
                                                                        span(aria-hidden="true").carousel-control-next-icon
                                                                        span().sr-only Siguiente
                                                div().modal-footer
                                                    button(type="button" v-on:click="sendAceptar(solicitud)" data-dismiss="modal").btn.btn-success Aceptar
                                                    button(type="button"  data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id" data-dismiss="modal").btn.btn-danger Cerrar
                                div().col-sm-12
                                    button(type="button" v-on:click="sendAceptar(solicitud)" class="" ).btn.btn-success Aceptar                              
                                div().col-sm-12
                                    button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-danger Cerrar                  
                                    div(v-bind:id="'modal-cerrar-lsc'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                                        div(class="" role="document").modal-dialog.modal-lg
                                            div().modal-content
                                                div().modal-header
                                                    h5(id="exampleModalLabel").modal-title Cerrar Solicitud
                                                    button(type="button" data-dismiss="modal" aria-label="Close").close
                                                        span(aria-hidden="true") &times;
                                                div().modal-body
                                                    form(v-on:submit.prevent="sendCerrar(solicitud)")
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlSelect1") Módulo
                                                                select( v-model="json_cerrar.id_motivo_cierre" required).form-control
                                                                    option(v-for="motivo in motivos_cierre" v-bind:value="motivo.id") {{motivo.descripcion}}
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlTextarea1") Detalle de Cierre
                                                                textarea( placeholder="Descripción..." v-model="json_cerrar.detalle_cierre" class="form-control" id="exampleFormControlTextarea1" rows="4" required)
                                                        div().modal-footer
                                                            button(type="submit").btn.btn-danger Cerrar
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.fecha_registro}}
                              
    

</template>

<script>
import $ from "jquery";
//import dt from "datatables.net";

export default {
  data() {
    return {
      json_cerrar: {
        id_solicitud: 0,
        id_motivo_cierre: 0,
        detalle_cierre: ""
      },
      json_aceptar:{
        id_solicitud:0,
        token: "ZW1tYW51ZWw6MjIuMDUuOTdF"
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
      motivos_cierre: [],
      modal: ""
    };
  },
  methods: {
    sendCerrar(solicitud) {
      $("#modal-cerrar-lsc" + solicitud.id).modal("hide");
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
            alert(response);
            this.solicitudes.splice(this.solicitudes.indexOf(solicitud), 1);
            console.log(this.solicitudes);
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
      this.json_aceptar.id_solicitud=solicitud.id;
      //this.json_acpetar.token=window.sessionStorage.token
      this.$http
        .post("api/redmine/aceptar-solicitud", this.json_aceptar, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(response => {
          alert(response);
          this.solicitudes.splice(this.solicitudes.indexOf(solicitud), 1);
        }, response=>{
          alert(response);
        });

      this.json_aceptar.id_solicitud = 0;
      this.json_aceptar.token = "";
    }
  },
  computed: {
    modalFunction() {
      $("#modal1").modal("hide");
      return "";
    }
  },
  mounted() {
    this.$http.get("api/redmine/solicitudes-pendientes").then(respuesta => {
      this.solicitudes = respuesta.body.solicitudes;
      this.motivos_cierre = respuesta.body.motivosCierre;
       
      //console.log(this.solicitudes);
    });

    //$('#listaSolicitudes').DataTable();
  }
};
</script>

<style>
</style>