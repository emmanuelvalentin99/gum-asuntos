<template lang="pug">
  div
    app-header(titulo="Administración de Asuntos" modulo="Registro" :showMenuToggler="false")
    div.container
      div.row: div(v-if="liga_incorrecta").col-sm-12
        div(role="alert").alert.alert-danger.alert-dismissible.fade.show
          strong ¡Liga no configurada!
          p Verifica tu enlace o intenta acceder desde Tableros.
          button(data-dismiss="alert" type="button"  aria-label="Close" disabled).close
            span(aria-hidden="true") &times;
      div.row: div.col-sm-12: div(v-show="send_solicitud").alert.alert-success.alert-dismissible.fade.show#alert-solicitud-enviada
          strong ¡Asunto registrado!
          button(@click.prevent="send_solicitud = false").close: span &times;
      div.row: div.col-sm-8
        h4(v-show="nombre_agencia") {{nombre_agencia}}
      div.row: div(class="col-sm-12")
        fieldset(v-bind:disabled="liga_incorrecta")
          form(v-on:submit.prevent="sendSolicitud()")
            div(class="form-row")
              div( class="form-group col-sm-12") *Asunto:
                input( v-model="form.asunto" type="test" class="form-control" placeholder="Asunto" required)
            div(class="form-row")
              div(class="form-group col-sm-6") *Área:
                  input( v-model="area_activa.nombre" type="test" class="form-control" placeholder="Área" required disabled)
              div( class="form-group col-sm-6") *Procedencia:
                  select( v-model="form.procedencia"  required).form-control
                    option(value=2) Externo
                    option(value=1) Interno
            fieldset(v-bind:disabled="email_configurado")
              div(class="form-row")
                  div( class="form-group col-sm-4") *Responsable:
                    select( v-model="usuario_asignado" required).form-control
                      option(v-for="user in usuarios" v-bind:value="user") {{user.nombre}}
                  div(class="form-group col-sm-4") *Departamento:
                    select( v-model="form.id_departamento" required).form-control
                      option(v-for="dep in departamentoFiltrado" v-bind:value="dep.id") {{dep.nombre}}
                  div( class="form-group col-sm-4") *Fecha de Término:
                    input(type="date" v-model="form.fecha_fin" required).form-control
        
            div(class="form-row")
              div(class="form-group col-sm-12")
                label() *Descripción:
                textarea( placeholder="Descripción..." v-model="form.descripcion" class="form-control"  rows="4" required)
            div(class="form-row")
              div(class="form-group col-sm-12")
                label Evidencias:
                div(class="custom-file")
                  input(type="file" multiple data-show-upload="true" data-show-caption="true" @change="onFileSelected($event.target)" class="custom-file-input" aria-describedby="Examinar" accept="image/*") 
                  label(class="custom-file-label" for="inputGroupFile04") Escoge tus imagenes
                        //input(id="input-2"  type="file" class="file" multiple data-show-upload="true" data-show-caption="true")
            div(class="form-row")
              div(class="form-group col-sm-6")
                ul                    
                  li(v-for="evidencia in evidencias") 
                    img(v-bind:src="dataURL(evidencia)" class="align-self-start mr-3") 
                    a( href="#" v-on:click="deleteEvidencia(evidencia)" class="btn btn-danger btn-sm") Eliminar
            div.row: div.col-sm-12.text-center
                button(type="submit" class="btn btn-primary") Enviar
                  
</template>

<script>
import $ from "jquery";
import AppHeader from "./Header.vue";

export default {
  components: { AppHeader },
  data() {
    return {
      liga_incorrecta: false,
      usuario_activo:{},    
      area_activa:{},    
      usuarios:[],
      usuario_asignado:{},
      departamentos:[],
      email_configurado: false,
      send_solicitud: false,
      data_response: {},
      categoria: "",
      modulo: "",
      categorias: [],
      modulos: [],
      evidencias: [],
      nombre_agencia: "",
      form: {
        id_area:0,
        id_departamento:0 ,
        usuario_asignado:"",
        descripcion:"",
        interno_externo:0,
        fecha_fin:"",
        asunto:"",
        evidencias: []
      }
    };
  },
  http: {
    root: document.baseURI
  },
  computed: {
    departamentoFiltrado() {
      
       
      return this.departamentos.filter(
        departamentos => departamentos.id == this.usuario_asignado.id_departamento
      );
      
    }
  },
  methods: {
    sendSolicitud() {
      var formData = new FormData();
      this.form.usuario_asignado=this.usuario_asignado.usuario;
      for (let element in this.form) {
        if (element == "evidencias") {
          for (let value of this.form[element]) formData.append(element, value);
        } else {
          formData.append(element, this.form[element]);
        }
      }
      
      this.$store.commit("isLoaderShown", true);
      //console.log(this.form); 
      //this.$store.commit("isLoaderShown", false);
      
      this.$http
        .post("api/redmine/crearAsunto", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(
          response => {
            this.$store.commit("isLoaderShown", false);
            this.send_solicitud = true;
            this.form.evidencias = [];
            this.form.asunto = "";
            this.form.id_area = 0;
            this.form.id_departamento = 0;
            this.form.usuario_asignado = "";
            this.usuario_asignado={};
            this.form.interno_externo=0;
            this.form.fecha_fin="";
            this.form.descripcion = "";
            this.evidencias = [];
            this.$nextTick(() => {
              document
                .querySelector("#alert-solicitud-enviada")
                .scrollIntoView();
              window.scrollBy(0, -56);
            });
          },
          response => {
            alert(response);
          }
        );
    },
    deleteEvidencia(evidencia) {
      this.evidencias.splice(this.evidencias.indexOf(evidencia), 1);
      this.form.evidencias.splice(this.form.evidencias.indexOf(evidencia), 1);
    },
    dataURL(file) {
      return URL.createObjectURL(file); // el problema es que llega al return antes de que termine o se procese el onloadend
    },
    onFileSelected(input) {
      var i = 0;
      if (input.files.length > 0) {
        for (i = 0; i < input.files.length; i++) {
          
          this.evidencias.push(input.files[i]);
          this.form.evidencias.push(input.files[i]);
        }
      }
      input.type = "";
      input.type = "file";
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
   
    console.log(JSON.stringify(this.form) ) ;
    this.$http
      .get("api/redmine/login-config?token="+window.sessionStorage.getItem("token"))
      .then(
        response => {
          let data = response.body;
          if (data.usuarios == null) {
            this.liga_incorrecta = true;
          } else {
            this.liga_incorrecta = false;
            this.departamentos=data.departamentos;
            this.usuarios = data.usuarios;
            this.usuario_activo=data.usuario[0];
            this.area_activa=data.area[0];
            this.form.id_area=this.area_activa.id;
          }
          this.$store.commit("isLoaderShown", false);
        },
        response => {
          this.liga_incorrecta = true;
          
          this.$store.commit("isLoaderShown", false);
        }
      );
  }
};
</script>

<style  scoped>
img {
  width: 70px;
  height: 70px;
}
li {
  margin: 2px;
}
</style>