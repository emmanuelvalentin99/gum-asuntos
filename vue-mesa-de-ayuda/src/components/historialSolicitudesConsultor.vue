<template lang="pug">
  div  
    app-header(titulo="Mesa de Ayuda" modulo="Capital Network" :showMenuToggler="false")
    div().container
        div()
            div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
                div().input-group-prepend: span().input-group-text.form-control-sm País
                select( v-model="json_filtros.pais"  required).form-control.form-control-sm.w-auto
                    option(v-for="pais in paisesFiltrados" v-bind:value="pais.pais") {{pais.pais}}
            div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
                div().input-group-prepend
                    span().input-group-text.form-control-sm Marca
                select( v-model="json_filtros.marca" required).form-control.form-control-sm
                    option(v-for="marca in marcasFiltrados" v-bind:value="marca.marca") {{marca.marca}}
            div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
                div().input-group-prepend
                    span().input-group-text.form-control-sm Grupo
                select( v-model="json_filtros.grupo" required).form-control.form-control-sm
                    option(v-for="cons in gruposFiltrados" v-bind:value="cons.grupo") {{cons.grupo}}
            div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
                div().input-group-prepend
                    span().input-group-text.form-control-sm Consesionario
                select( v-model="json_filtros.idConcesionario" required).form-control.form-control-sm
                    option(v-for="cons in consesionariosFiltrados" v-bind:value="cons.id") {{cons.nombre}}
            div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
                div().input-group-prepend
                    span().input-group-text.form-control-sm Desde
                input(type="date" v-model="json_filtros.fechaInicio").form-control.form-control-sm
            div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
                div().input-group-prepend
                    span().input-group-text.form-control-sm Hasta
                input(type="date" v-model="json_filtros.fechaFin").form-control.form-control-sm
            button(type="button" v-on:click="applyFilter()" class="" ).btn.btn-light.btn-sm Aplicar
        div().row
            table().table.table-striped
                thead().thead-dark
                    tr()
                        th(scope="col") #
                        th(scope="col") # Redmine
                        th(scope="col") Agencia
                        th(scope="col") Asunto
                        th(scope="col") Estado de Solicitud
                        th(scope="col") Fecha Actualización
                        th(scope="col") Fecha Fin
                tbody()                     
                      tr(v-for="(solicitud, indexSolicitud) in solicitudes" v-if="solicitud.estado!='abierta'")
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.id}}
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.id_peticion_redmine}}
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.nombre_agencia}}
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.asunto}}
                        td
                            div().row
                                div().col-sm-12
                                    div(v-if="solicitud.estado!='abierta' && solicitud.estado!='cerrada'").col-sm-12
                                      span().font-weight-bold.mr-2 {{solicitud.estado}}
                                      button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-detalle-lsc'+solicitud.id").btn.btn-primary Detalles
                                    div(v-if="solicitud.estado=='cerrada'").col-sm-12
                                        span().font-weight-bold.mr-2 Cerrada
                                        button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-detalle-lsc'+solicitud.id").btn.btn-primary Detalles                 
                                    div(v-if="solicitud.estado=='abierta'").col-sm-12
                                        span().font-weight-bold.mr-2 Espera
                                        button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-detalle-lsc'+solicitud.id").btn.btn-primary Detalles               
                                    div(v-bind:id="'modal-detalle-lsc'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                                        div(class="" role="document").modal-dialog.modal-lg.modal-dialog-scrollable
                                            div().modal-content
                                                div().modal-header
                                                    div().row
                                                        div().col-sm-5
                                                            h5(id="exampleModalLabel").modal-title Detalle Solicitud 
                                                        div().col-sm-6
                                                            h6() REDMINE # {{solicitud.id_peticion_redmine}}
                                                        div().col-sm-1
                                                                    fieldset(disabled)                                  
                                                                        div(v-if="solicitud.estado!='abierta' && solicitud.estado!='cerrada'").col-sm-12
                                                                            button(type="button" v-on:click="sendAceptar(solicitud)" class="" ).btn.btn-success {{solicitud.estado}}
                                                                        div(v-if="solicitud.estado=='cerrada'").col-sm-12
                                                                            button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-danger Cerrada                  
                                                                        div(v-if="solicitud.estado=='abierta'").col-sm-12
                                                                            button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-warning Espera                  
                                                        
                                                    button(type="button" data-dismiss="modal" aria-label="Close").close
                                                        span(aria-hidden="true") &times;
                                                div().modal-body
                                                    div().form-row
                                                        div().form-group.col-sm-12
                                                            button( type="button" data-toggle="collapse" v-bind:data-target="'#collapse-lsc-'+solicitud.id" aria-expanded="false" v-bind:aria-controls="'collapse-lsc-'+solicitud.id").btn.btn-info Contactos
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
                                                    fieldset(disabled)
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(  for="exampleFormControlTextarea1") Usuario Asignado
                                                                input(v-bind:value="solicitud.nombre_usuario_asignado").form-control
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
                                                    

                                      
                                
                                    
                                    
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.fecha_actualizacion}}
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.fecha_fin}}
  
</template>

<script>
import AppHeader from "./Header.vue";
export default {
  components: { AppHeader },
  data() {
    return {
      json_filtros: {
        pais: "",
        marca: "",
        grupo: "",
        idConcesionario: 0,
        fechaInicio: "",
        fechaFin: ""
      },
      filtros: [
        /* {
        id:0,
        nombre:"Tlalne",
        grupo:"Alden",
        marca:"Mazda",
        pais:"México"
      },{id:1,
        nombre:"Satelite",
        grupo: "Alden",
        marca:"Toyota",
        pais:"México"},{id:4,
        nombre:"Satelite",
        grupo: "Alden",
        marca:"Toyota",
        pais:"México"},{id:2,
        nombre:"Madiautos",
        grupo:"Bogota",
        marca:"Mazda",
        pais:"Colombia"
      },{id:3,
        nombre:"Janna",
        grupo:"Bogota",
        marca:"Ford",
        pais:"Colombia"}*/
      ],
      solicitudes: []
    };
  },
  computed: {
    paisesFiltrados() {
      let marcasFiltradas = [];
      for (let marca of this.filtros) {
        if (marcasFiltradas.findIndex(elem => elem.pais == marca.pais) == -1) {
          marcasFiltradas.push(marca);
        }
      }
      return marcasFiltradas;
    },
    marcasFiltrados() {
      let marcas = this.filtros.filter(
        filtros => filtros.pais == this.json_filtros.pais
      );
      let marcasFiltradas = [];
      for (let marca of marcas) {
        if (marcasFiltradas.findIndex(elem => elem.marca == marca.marca) == -1) {
          marcasFiltradas.push(marca);
        }
      }
      return marcasFiltradas;
    },
    gruposFiltrados() {
      let marcas = this.filtros.filter(
        filtros =>
          filtros.pais == this.json_filtros.pais &&
          filtros.marca == this.json_filtros.marca
      );
      let marcasFiltradas = [];
      for (let marca of marcas) {
        if (marcasFiltradas.findIndex(elem => elem.grupo == marca.grupo) == -1) {
          marcasFiltradas.push(marca);
        }
      }
      return marcasFiltradas;
    },
    consesionariosFiltrados() {
      return this.filtros.filter(
        filtros =>
          filtros.pais == this.json_filtros.pais &&
          filtros.marca == this.json_filtros.marca &&
          filtros.grupo == this.json_filtros.grupo
      );
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
    this.$store.commit("isLoaderShown", true); // Esta cosa hace que se muestre el "Cargando..."

    this.$http.get("api/redmine/valores-filtros").then(
      response => {
        //alert(response);
        let data = response.body;
        this.filtros = response.body;
        //this.solicitudes=response.body.solicitudes;
        //console.log(response);
        //this.$store.commit("isLoaderShown", false);
      },
      response => {
        alert(response);
      }
    );
    this.$http
      .post("api/redmine/solicitudes", this.json_filtros, {
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json"
        }
      })
      .then(
        response => {
          //alert(response);
          this.solicitudes = response.body.solicitudes;
          //console.log(this.json_filtros);
          this.$store.commit("isLoaderShown", false);
        },
        response => {
          alert(response);
        }
      );
  },
  http: {
    root: document.baseURI
  },
  methods: {
    applyFilter() {
      this.$store.commit("isLoaderShown", true); // Esta cosa hace que se muestre el "Cargando..."
      this.$http
        .post("api/redmine/solicitudes", this.json_filtros, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            //alert(response);
            this.solicitudes = response.body.solicitudes;
            this.json_filtros.fechaInicio = "";
            this.json_filtros.fechaFin = "";
            //console.log(this.json_filtros);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );
    }
  }
};
</script>

<style>
</style>