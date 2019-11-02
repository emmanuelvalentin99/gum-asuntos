<template lang="pug">
  div
    app-header(titulo="Mesa de Ayuda" modulo="Capital Network" :showMenuToggler="false")
    div.container
      div.row: div(v-if="liga_incorrecta").col-sm-12
        div(role="alert").alert.alert-danger.alert-dismissible.fade.show
          strong ¡Liga no configurada!
          p Verifica tu enlace o intenta acceder desde Tableros.
          button(data-dismiss="alert" type="button"  aria-label="Close" disabled).close
            span(aria-hidden="true") &times;
      div.row: div.col-sm-12: div(v-show="send_solicitud").alert.alert-success.alert-dismissible.fade.show#alert-solicitud-enviada
          strong ¡Solicitud registrada!
          button(@click.prevent="send_solicitud = false").close: span &times;
      div.row: div.col-sm-8
        h4(v-show="nombre_agencia") {{nombre_agencia}}
      div.row: div(class="col-sm-12")
        fieldset(v-bind:disabled="liga_incorrecta")
          form(v-on:submit.prevent="sendSolicitud()")
            div(class="form-row")
              div( class="form-group col-sm-12") *Asunto:
                input( v-model="form.asunto" type="test" class="form-control" placeholder="Asunto" required)
            fieldset(v-bind:disabled="email_configurado")
              div(class="form-row")
                  div( class="form-group col-sm-6") *Nombre:
                    input( v-model="form.nombre" type="test" class="form-control" placeholder="Nombre" required)
                  div( class="form-group col-sm-6") *Email:
                    input( v-model="form.email" type="email" class="form-control" placeholder="correo@example.com" required)
            div(class="form-row")
              div( class="form-group col-sm-4") No. Orden:
                input( v-model="form.no_orden" type="test" class="form-control" placeholder="12345" )
              div( class="form-group col-sm-4") No. Cita:
                input( v-model="form.no_cita" type="test" class="form-control" placeholder="12345" )
              div( class="form-group col-sm-4") No. Placas:
                input( v-model="form.no_placas" type="test" class="form-control" placeholder="HFG1234" )
            div(class="form-row")
              div(class="form-group col-sm-6")
                label() *Módulo:
                select( v-model="categoria"  required).form-control
                  option(v-for="cat in categorias" v-bind:value="cat") {{cat}}
              div(class="form-group col-sm-6")
                label() *Sección/Pantalla:
                select( v-model="form.id_modulo" required).form-control
                  option(v-for="mod in modulosFiltrados" v-bind:value="mod.id") {{mod.modulo}}
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
        id_agencia: 0,
        id_modulo: 0,
        no_orden: "",
        no_cita: "",
        no_placas: "",
        asunto: "",
        email: "",
        nombre:"",
        descripcion: "",
        evidencias: []
      }
    };
  },
  http: {
    root: document.baseURI
  },
  computed: {
    modulosFiltrados() {
      return this.modulos.filter(
        modulos => modulos.categoria == this.categoria
      );
    }
  },
  methods: {
    sendSolicitud() {
      var formData = new FormData();

      for (let element in this.form) {
        if (element == "evidencias") {
          for (let value of this.form[element]) formData.append(element, value);
        } else {
          formData.append(element, this.form[element]);
        }
      }
      this.$store.commit("isLoaderShown", true);
      this.$http
        .post("api/redmine/crearSolicitud", formData, {
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
            this.form.email = "";
            this.form.no_placas = "";
            this.form.no_cita = "";
            this.form.no_orden = "";
            this.categoria = "";
            this.modulo = "";
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
    this.$store.commit("isLoaderShown", true);
    if(this.$route.query.email!=null){
      this.email_configurado=true;
     this.form.email=this.$route.query.email;
    this.form.nombre=this.$route.query.nombre;
    }else{
      this.email_configurado=false;
    }
    console.log(JSON.stringify(this.form) ) ;
    this.$http
      .get("api/redmine/inicializacion?guid=" + this.$route.params.guid)
      .then(
        response => {
          let data = response.body;
          if (data.modulos == null) {
            this.liga_incorrecta = true;
          } else {
            this.liga_incorrecta = false;
            this.form.id_agencia = data.id_agencia;
            this.nombre_agencia = data.nombre_agencia;
            this.modulos = data.modulos;
            for (let mod of data.modulos) {
              if (this.categorias.indexOf(mod.categoria) == -1) {
                this.categorias.push(mod.categoria);
              }
            }
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