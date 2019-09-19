<template lang="pug">
    div(class="container")
        div().row.col-sm-1.offset-sm-11
            a(href="#" ).btn.btn-dark Atrás
        div(class="col-sm12")
            form(v-on:submit.prevent="sendSolicitud()")
                div(class="form-row")
                  div( class="form-group col-sm-12") Asunto
                    input( v-model="form.asunto" type="test" class="form-control" placeholder="Asunto" required)
                div(class="form-row")
                  div( class="form-group col-sm-4") No. Orden
                    input( v-model="form.no_orden" type="test" class="form-control" placeholder="12345" )
                  div( class="form-group col-sm-4") No. Cita
                    input( v-model="form.no_cita" type="test" class="form-control" placeholder="12345" )
                  div( class="form-group col-sm-4") No. Placas
                    input( v-model="form.no_placas" type="test" class="form-control" placeholder="HFG1234" )
                div(class="form-row")
                  div(class="form-group col-sm-6")
                    label() Categoria
                    select( v-model="categoria"  required).form-control
                      option(v-for="cat in categorias" v-bind:value="cat") {{cat}}
                  div(class="form-group col-sm-6")
                    label() Módulo
                    select( v-model="form.id_modulo" required).form-control
                      option(v-for="mod in modulosFiltrados" v-bind:value="mod.id") {{mod.modulo}}
                div(class="form-row")
                  div(class="form-group col-sm-12")
                    label() Descripcion
                    textarea( placeholder="Descripción..." v-model="form.descripcion" class="form-control"  rows="4" required)
                div(class="form-row")
                  div(class="form-group col-sm-12")
                      div(class="custom-file")
                        input(type="file" multiple data-show-upload="true" data-show-caption="true" @change="onFileSelected($event.target)" class="custom-file-input" aria-describedby="Examinar") 
                        label(class="custom-file-label" for="inputGroupFile04") Escoge tus imagenes
                              //input(id="input-2"  type="file" class="file" multiple data-show-upload="true" data-show-caption="true")
                div(class="form-row")
                  div(class="form-group col-sm-6")
                    ul                    
                      li(v-for="evidencia in evidencias") 
                        img(v-bind:src="dataURL(evidencia)" class="align-self-start mr-3") 
                        a( href="#" v-on:click="deleteEvidencia(evidencia)" class="btn btn-danger btn-sm") Eliminar
                div(class="form-row")
                  div(class="form-group offset-sm-5")
                    button(type="submit" class="btn btn-primary") Enviar
                      
</template>

<script>
export default {
  data() {
    return {
      data_response: {},
      categoria: "",
      modulo: "",
      categorias:[],     
      modulos:[],
      evidencias: [],
      form: {
        id_agencia: 0,
        id_modulo: 0,
        no_orden:"",
        no_cita:"",
        no_placas:"",
        asunto: "",
        email: "",
        descripcion: "",
        evidencias: []
      }
    };
  },
  computed: {
    modulosFiltrados() {
        
      return this.modulos.filter(modulos => modulos.categoria==this.categoria);
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
      
      //Display the key/value pairs
      // for (var pair of formData.entries()) {
      //     console.log(pair[0]+ ', ' + pair[1]);
      // }
      this.$http
        .post("api/redmine/crearSolicitud", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(response => {
          console.log(response);
        });

      this.form.evidencias = [];
      this.form.asunto = "";
      this.form.email = "";
      this.form.no_placas="";
      this.form.no_cita="";
      this.form.no_orden="";
      this.categoria = "";
      this.modulo = "";
      this.form.descripcion = "";
      this.evidencias = [];
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
      /*
      Entonces la idea del flujo de la selección de imágenes es la siguiente:
      1. Selecciona varias imágenes
      2. Dispara el evento @change, te llega al input.files
      3. Compruebas que tenga imágenes seleccionadas (input.files.length != 0)
      4. Si hay imágenes, iteras sobre el arreglo files y lo añades a this.evidencias.
        Para este caso, this.evidencias es un arreglo de File (File hereda de Blob)
      5. "Reinicias" el input para limpiar los archivos que seleccionó (que es lo que puse con el input.type = "")

      6. Poner algo con v-for dónde iteres sobre evidencias para mostrar las imagenes, pero no puedes poner blobs directamente en el src de un img 
      7. Entonces te vas a googlear que hacer en esos casos y encontrarás una muy bonita función que dice toDataURL()

      8. Entonces en el <img> , en el v-bind:src="evidencia.toDataURL()" y así ya puedes mostrar lo que se va almacenando en el arreglo this.evidencias
      
      */
    }
  },
  mounted() {
    this.$http
      .get("api/redmine/inicializacion?guid=" + this.$route.params.guid)
      .then(response => {
        let data = response.body;
        if(data.modulos==null){
          alert("Su liga es incorrecta, por favor intente acceder desde tableros");
        }
        else{
          this.form.id_agencia=data.id_agencia;
          this.modulos=data.modulos;
          for(let mod of data.modulos){
            if (this.categorias.indexOf(mod.categoria)==-1){
                this.categorias.push(mod.categoria);
            }
          }
              
        }
        
        /* 
      {
        id_agencia: 2,
        modulos: [{
          ...
        }]
      }
      */
      });
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