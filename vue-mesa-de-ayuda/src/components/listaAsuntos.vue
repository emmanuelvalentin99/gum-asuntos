<template lang="pug">
  div
    app-header(titulo="Administración de Asuntos" modulo="Pendientes" :showMenuToggler="false")
    div().container
      div.row: div.col-sm-8
        h6(v-show="usuario_activo.nombre") Bienvenido: {{usuario_activo.nombre}}
      div().row
        div.w-auto.d-inline-block.mr-2: div().input-group.input-group-sm
            div().input-group-prepend
              span().input-group-text.form-control-sm Área
            select( v-model="json_filtros.idAgencia" required).form-control.form-control-sm
              option(v-for="area in areas" v-bind:value="area.id") {{area.nombre}}
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
              th(scope="col") Asunto
              th(scope="col") Estado
              th(scope="col") Área
              th(scope="col") Departamento
              th(scope="col") 
              th(scope="col") Fecha Registro
          tbody()
            tr(v-for="(asunto, indexAsunto) in asuntos" v-if="asunto.estado!='cancelado' || asunto.estado!='suspendido' || asunto.estado!='validado'")
              td {{asunto.id}}
              td {{asunto.asunto}}
              td {{asunto.estado}}
              td {{asunto.nombre_area}}
              td {{asunto.nombre_departamento}}
              td
                div.btn-group-sm.btn-group-vertical
                  button(type="button" data-toggle="modal" v-bind:data-target="'#modal-detalle-lsc'+asunto.id").btn.btn-primary Detalles
                  //button(type="button" v-on:click="sendAceptar(solicitud)").btn.btn-success Aceptar
                  //button(type="button" data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+solicitud.id").btn.btn-danger Cerrar
                div(v-bind:id="'modal-detalle-lsc'+asunto.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                    div(class="" role="document").modal-dialog.modal-lg.modal-dialog-scrollable
                        div().modal-content
                            div().modal-header
                                h5(id="exampleModalLabel").modal-title Detalle Asunto
                                button(type="button" data-dismiss="modal" aria-label="Close").close
                                    span(aria-hidden="true") &times;
                            div().modal-body
                              div().form-row
                                  div().form-group.col-sm-12
                                      button(type="button" data-toggle="collapse" v-bind:data-target="'#collapse-lsc-'+asunto.id" aria-expanded="false" v-bind:aria-controls="'collapse-lsc-'+asunto.id").btn.btn-info Contactos
                                      div(v-bind:id="'collapse-lsc-'+asunto.id").collapse
                                          div().card.card-body
                                            fieldset(disabled)
                                              div(v-for="(contacto, indexContacto) in asunto.contactos").form-row    
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
                                  div().form-group.col-sm-4
                                      label(  for="exampleFormControlTextarea1") Usuario
                                      select( v-model="json_asignar_usuario.usuario").form-control
                                        option(v-for="usuario in todos_usuarios" v-bind:value="usuario") {{usuario.nombre}}
                                  div().form-group.col-sm-4
                                      label(  for="exampleFormControlTextarea1") Área 
                                      select( v-model="json_asignar_usuario.id_area").form-control
                                        option(v-for="area in areaFiltrada" v-bind:value="area.id") {{area.nombre}}
                                  div().form-group.col-sm-4
                                      label(  for="exampleFormControlTextarea1") Departamento 
                                      select( v-model="json_asignar_usuario.id_departamento").form-control
                                        option(v-for="departamento in departamentoFiltrado" v-bind:value="departamento.id") {{departamento.nombre}}
                              fieldset(disabled)                                  
                                  div().form-row
                                      div().form-group.col-sm-12
                                          label(  for="exampleFormControlTextarea1") Asunto
                                          input(v-bind:value="asunto.asunto").form-control
                                  div().form-row
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") Usuario Asignado
                                          input(v-bind:value="usuario_activo.nombre").form-control
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") Área
                                          input(v-bind:value="asunto.nombre_area").form-control
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") Departamento
                                          input(v-bind:value="asunto.nombre_departamento").form-control 
                                  div().form-row
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") Fecha Registro
                                          input(v-bind:value="asunto.fecha_registro").form-control
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") Fecha Termino
                                          input(v-bind:value="asunto.fecha_fin").form-control
                                      div().form-group.col-sm-4
                                          label(for="exampleFormControlTextarea1") Fecha Actualización
                                          input(v-bind:value="asunto.fecha_actualizacion").form-control
                                  div().form-row
                                      div().form-group.col-sm-12
                                          label(for="exampleFormControlTextarea1") Descripción
                                          textarea(v-bind:value="asunto.descripcion" rows="4").form-control
                                  div.form-row
                                      div.form-group.col-sm-12
                                          div(:id="'carouselExampleIndicators'+asunto.id" data-ride="carousel").carousel.slide
                                              ol.carousel-indicators
                                                  li(v-for="(item, index) in asunto.evidencias" v-bind:data-target="'#carouselExampleIndicators'+asunto.id" v-bind:data-slide-to="index")
                                              div.carousel-inner
                                                  template(v-for="(item, index) in asunto.evidencias")
                                                      div(v-if="index==0").carousel-item.active
                                                          img(v-bind:src="'img/'+item.ruta" alt="First slide").d-block.w-50
                                                      div(v-else).carousel-item
                                                          img(v-bind:src="'img/'+item.ruta").d-block.w-50
                                              a(:href="'#carouselExampleIndicators'+asunto.id" role="button" data-slide="prev").carousel-control-prev
                                                  span(aria-hidden="true").carousel-control-prev-icon
                                                  span().sr-only Anterior
                                              a(:href="'#carouselExampleIndicators'+asunto.id" role="button" data-slide="next").carousel-control-next
                                                  span(aria-hidden="true").carousel-control-next-icon
                                                  span().sr-only Siguiente
                            div(v-if="usuario_activo.id_perfil <=2").modal-footer
                                button(type="button" v-on:click="sendAsignarUsuario(asunto)" data-dismiss="modal").btn.btn-primary Turnar
                                button(type="button" v-on:click="sendValidar(asunto)" data-dismiss="modal").btn.btn-success Validar
                                button(type="button" v-on:click="sendSolicitarInformacion(asunto)" data-dismiss="modal").btn.btn-info Solicitar Información
                                button(type="button" v-on:click="sendRechazar(asunto)" data-dismiss="modal").btn.btn-warning Rechazar
                                button(type="button"  data-toggle="modal" v-bind:data-target="'#modal-cerrar-lsc'+asunto.id" data-dismiss="modal").btn.btn-danger Cancelar/Suspender
                            div(v-if="usuario_activo.id_perfil >2").modal-footer
                                button(type="button" v-on:click="sendAsignarUsuario(asunto)" data-dismiss="modal").btn.btn-primary Turnar
                                button(type="button" v-on:click="sendTerminar(asunto)" data-dismiss="modal").btn.btn-success Terminar
                                button(type="button" v-on:click="sendSolicitarInformacion(asunto)" data-dismiss="modal").btn.btn-info Solicitar Información
                                button(type="button" v-on:click="sendRechazar(asunto)" data-dismiss="modal").btn.btn-warning Rechazar
                div(v-bind:id="'modal-cerrar-lsc'+asunto.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                    div(class="" role="document").modal-dialog.modal-lg
                        div().modal-content
                            div().modal-header
                                h5(id="exampleModalLabel").modal-title Cancelar o Suspender
                                button(type="button" data-dismiss="modal" aria-label="Close").close
                                    span(aria-hidden="true") &times;
                            div().modal-body
                              div().form-row
                                  div().form-group.col-sm-12
                                      label(for="exampleFormControlTextarea1") Comentario (Cancelación/Suspensión)
                                      textarea( placeholder="Descripción..." v-model="json_cancelar_suspender.detalle" class="form-control" id="exampleFormControlTextarea1" rows="4" required)
                            div().modal-footer
                                button(type="button" v-on:click="sendCancelar(asunto)" data-dismiss="modal").btn.btn-danger Cancelar
                                button(type="button" v-on:click="sendSuspender(asunto)" data-dismiss="modal").btn.btn-danger Suspender
              td 
                  div().row
                      div().col-sm-12
                          p {{asunto.fecha_registro}}
                    


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
        fecha_desde:"",
        fecha_hasta:"",
        usuario: ""
      },
      json_cancelar_suspender: {
        id_asunto: 0,
        id_usuario: 0,
        id_area: 0,
        id_departamento: 0,
        detalle: ""
      },
      json_asignar_usuario: {
        usuario: {},
        usuario_asignado:"",
        id_area: 0,
        id_departamento: 0,
        id_asunto: 0
      },
      json_validar_terminar_rechazar: {
        id_asunto: 0,
        id_usuario:0,
        id_area: 0 ,
        id_departamento: 0

      },
     asuntos:[],
     departamentos: [],
     areas: [],
     usuarios:[],
     todos_usuarios:[],
     usuario_activo:{},
     area_activa: {},
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
    sendCancelar(asunto) {
      $("#modal-cerrar-lsc" + asunto.id).modal("hide");
      this.$store.commit("isLoaderShown", true);
      this.json_cancelar_suspender.id_asunto = asunto.id;
      this.json_cancelar_suspender.id_departamento = this.usuario_activo.id_departamento;
      this.json_cancelar_suspender.id_area = this.usuario_activo.id_area;
      this.json_cancelar_suspender.id_usuario = this.usuario_activo.id;
      this.$http
        .post("api/redmine/cancelar-asunto", this.json_cancelar_suspender, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
            //console.log(this.solicitudes);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );   
      this.json_cancelar_suspender.detalle = "";
    },sendSuspender(asunto) {
        $("#modal-cerrar-lsc" + asunto.id).modal("hide");
      this.$store.commit("isLoaderShown", true);
      this.json_cancelar_suspender.id_asunto = asunto.id;
      this.json_cancelar_suspender.id_departamento = this.usuario_activo.id_departamento;
      this.json_cancelar_suspender.id_area = this.usuario_activo.id_area;
      this.json_cancelar_suspender.id_usuario = this.usuario_activo.id;
      this.$http
        .post("api/redmine/suspender-asunto", this.json_cancelar_suspender, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
            //console.log(this.solicitudes);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );   
      this.json_cancelar_suspender.detalle = "";
    },
    sendValidar(asunto) {
      this.$store.commit("isLoaderShown", true);
      this.json_validar_terminar_rechazar.id_asunto = asunto.id;
      this.json_validar_terminar_rechazar.id_departamento = this.usuario_activo.id_departamento;
      this.json_validar_terminar_rechazar.id_area = this.usuario_activo.id_area;
      this.json_validar_terminar_rechazar.id_usuario = this.usuario_activo.id;
      this.$http
        .post("api/redmine/validar-asunto", this.json_validar_terminar_rechazar, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
            //console.log(this.solicitudes);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );   
      
    },
    sendTerminar(asunto) {
      this.$store.commit("isLoaderShown", true);
      this.json_validar_terminar_rechazar.id_asunto = asunto.id;
      this.json_validar_terminar_rechazar.id_departamento = this.usuario_activo.id_departamento;
      this.json_validar_terminar_rechazar.id_area = this.usuario_activo.id_area;
      this.json_validar_terminar_rechazar.id_usuario = this.usuario_activo.id;
      this.$http
        .post("api/redmine/terminar-asunto", this.json_validar_terminar_rechazar, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
            //console.log(this.solicitudes);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );   
      
    },
     sendRechazar(asunto) {
      this.$store.commit("isLoaderShown", true);
      this.json_validar_terminar_rechazar.id_asunto = asunto.id;
      this.json_validar_terminar_rechazar.id_departamento = this.usuario_activo.id_departamento;
      this.json_validar_terminar_rechazar.id_area = this.usuario_activo.id_area;
      this.json_validar_terminar_rechazar.id_usuario = this.usuario_activo.id;
      this.$http
        .post("api/redmine/rechazar-asunto", this.json_validar_terminar_rechazar, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
            
            this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
            //console.log(this.solicitudes);
            this.$store.commit("isLoaderShown", false);
          },
          response => {
            alert(response);
          }
        );   
      
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
    sendAsignarUsuario(asunto) {
       this.$store.commit("isLoaderShown", true);
        this.json_asignar_usuario.id_asunto=asunto.id;
        this.json_asignar_usuario.usuario_asignado=this.json_asignar_usuario.usuario.usuario;
         this.$http
        .post("api/redmine/asignar-asunto", this.json_asignar_usuario, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
             this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
            this.$store.commit("isLoaderShown", false);
            
          },
          response => {
            alert(response);
          }
        );
    },
    sendSolicitarInformacion(asunto) {
       this.$store.commit("isLoaderShown", true);
        this.json_asignar_usuario.id_asunto=asunto.id;
        this.json_asignar_usuario.usuario_asignado=this.json_asignar_usuario.usuario.usuario;
         this.$http
        .post("api/redmine/informacion-asunto", this.json_asignar_usuario, {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          }
        })
        .then(
          response => {
             this.asuntos.splice(this.asuntos.indexOf(asunto), 1);
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
    areaFiltrada(){
       return this.areas.filter(
        areas => areas.id == this.json_asignar_usuario.usuario.id_area
      );
    },
    departamentoFiltrado(){
       return this.departamentos.filter(
        departamentos => departamentos.id == this.json_asignar_usuario.usuario.id_departamento
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
    this.$store.commit("isLoaderShown", true);
    this.$http
      .get("api/redmine/login-config?token="+window.sessionStorage.getItem("token"))
      .then(
        response => {
          let data = response.body;
          if (data.usuarios == null) {
            this.liga_incorrecta = true;
          } else {
            //this.liga_incorrecta = false;
            this.departamentos=data.departamentos;
            this.areas=data.areas;
            this.usuarios = data.usuarios;
            this.usuario_activo=data.usuario[0];
            this.area_activa=data.area[0];
            //this.form.id_area=this.area_activa.id;
          }
          this.json_filtros.usuario=this.usuario_activo.usuario;
          this.json_asignar_usuario.usuario=this.usuario_activo;
           this.$http.post("api/redmine/asuntos-pendientes",this.json_filtros, {
                headers: {
                  "Access-Control-Allow-Origin": "*",
                  "Content-Type": "application/json"
                }
              }).then(respuesta => {
              
              this.asuntos = respuesta.body.asuntos;
              //this.consesionarios = respuesta.body.solicitudes;
              this.todos_usuarios = respuesta.body.todos_usuarios;
                this.todos_usuarios.push({
                  id: this.usuario_activo.id,
                  id_area: this.usuario_activo.id_area,
                  id_departamento: this.usuario_activo.id_departamento,
                  id_perfil: this.usuario_activo.id_perfil,
                  nombre: "Yo mismo",
                  usuario: this.usuario_activo.usuario});
              this.motivos_cierre = respuesta.body.motivos_cierre;
              

            });
          this.$store.commit("isLoaderShown", false);
        },
        response => {
          //this.liga_incorrecta = true;
        }
      );

    


   
  }
};
</script>

<style>
</style>