<template lang="pug">
    div().container
        div(v-if="liga_incorrecta").row.col-sm-12
            div(role="alert").alert.alert-danger.alert-dismissible.fade.show
                strong Liga no configurada!
                p Verifica tu enlace o intenta acceder desde Tableros.
                button(data-dismiss="alert" type="button"  aria-label="Close" disabled).close
                    span(aria-hidden="true") &times;
        div().row.col-sm-1.offset-sm-11
            a(href="#" ).btn.btn-dark Atrás
        div().input-group.row
            div().input-group-prepend
                <span class="input-group-text">Fecha Inicio</span>
                input(type="date" v-model="json_historial.fechaInicio").form-control
        div().input-group.row
            div().input-group-prepend
                <span class="input-group-text">Fecha Fin</span>
                input(type="date" v-model="json_historial.fechaFin").form-control
        div().row
            button(type="button" v-on:click="applyFilter()" class="" ).btn.btn-light Aplicar
        div().row
            table().table.table-striped
                thead().thead-dark
                    tr()
                        th(scope="col") #
                        th(scope="col") Asunto
                        th(scope="col") Descripción
                        th(scope="col") Estado de Solicitud
                        th(scope="col") Fecha Actualización
                tbody()                     
                      tr(v-for="(solicitud, indexSolicitud) in solicitudes" )
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.id}}
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.asunto}}
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
                                                                                img(v-bind:src="'img/'+item.ruta" alt="First slide").d-block.w-50
                                                                            div(v-else).carousel-item
                                                                                img(v-bind:src="'img/'+item.ruta").d-block.w-50
                                                                    a(:href="'#carouselExampleIndicators'+solicitud.id" role="button" data-slide="prev").carousel-control-prev
                                                                        span(aria-hidden="true").carousel-control-prev-icon
                                                                        span().sr-only Anterior
                                                                    a(:href="'#carouselExampleIndicators'+solicitud.id" role="button" data-slide="next").carousel-control-next
                                                                        span(aria-hidden="true").carousel-control-next-icon
                                                                        span().sr-only Siguiente
                                                    hr()
                                                    h5(v-if="solicitud.estado=='cerrada'")  Detalle Cierre
                                                    fieldset(v-if="solicitud.estado=='cerrada'" disabled)
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlTextarea1") Motivo Cierre
                                                                input(v-bind:value="solicitud.motivo_cierre").form-control
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlTextarea1") Detalle Cierre
                                                                textarea(v-bind:value="solicitud.detalle_cierre" rows="4").form-control
                                                            
                                                div().modal-footer
                                                    
                                                    
                                fieldset(disabled)                                  
                                    div(v-if="solicitud.estado=='aceptada'").col-sm-12
                                        button(type="button" v-on:click="sendAceptar(solicitud)" class="" ).btn.btn-success Aceptada                              
                                    div(v-if="solicitud.estado=='cerrada'").col-sm-12
                                        button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-danger Cerrada                  
                                    div(v-if="solicitud.estado=='abierta'").col-sm-12
                                        button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-warning Espera                  
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.fecha_registro}}
  
</template>

<script>
export default {
  data() {
    return {
      liga_incorrecta: false,
      solicitudes: [],
      json_historial:{
          idAgencia:0
      }
    };
  },
  http: {
    root: document.baseURI
  },
  mounted() {
   this.$store.commit("isLoaderShown", true); // Esta cosa hace que se muestre el "Cargando..."
    this.$http
      .get("api/redmine/inicializacion?guid=" + this.$route.params.guid)
      .then(response => {
        let data = response.body;
        if (data.id_agencia == null || data.id_agencia<=0) {
          this.liga_incorrecta = true;
        } else {
          this.liga_incorrecta = false;
          this.json_historial.idAgencia = data.id_agencia;
          this.$http.post("api/redmine/solicitudes", this.json_historial, {
                headers: {
                    "Access-Control-Allow-Origin": "*",
                    "Content-Type": "application/json"
                }
                })
                .then(
                response => {
                    //alert(response);
                    this.solicitudes=response.body.solicitudes;
                    //console.log(this.json_historial);
                     this.$store.commit("isLoaderShown", false);
                },
                response => {
                    alert(response);
                }
                );
         // console.log(this.json_historial);
        }
      },response=>{
          this.liga_incorrecta = true;
      });
     
   
  }
};
</script>

<style>
</style>