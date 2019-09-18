<template lang="pug">
    div().container
        div().row.col-sm-1.offset-sm-11
            a(href="#" ).btn.btn-dark Atrás
        div().row
            table().table.table-striped
                thead().thead-dark
                    tr()
                        th(scope="col") #
                        th(scope="col") Agencia
                        th(scope="col") Descripcion
                        th(scope="col") 
                        th(scope="col") Fecha Actualización
                tbody()
                    tr(v-for="solicitud in solicitudes")
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.id}}
                        td  
                            div().row
                                div().col-sm-12
                                    p {{solicitud.agencia.nombre}}
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.descripcion}}
                        td
                            div().row
                                div().col-sm-12
                                    button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-detalle-'+solicitud.id").btn.btn-primary Detalles
                                    div(v-bind:id="'modal-detalle-'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                                        div(class="" role="document").modal-dialog.modal-lg
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
                                                                input(v-bind:value="solicitud.modulo.categoria").form-control
                                                            div().form-group.col-sm-6
                                                                label(for="exampleFormControlTextarea1") Modulo
                                                                input(v-bind:value="solicitud.modulo.modulo").form-control
                                                        div().form-row
                                                            div().form-group.col-sm-4
                                                                label(for="exampleFormControlTextarea1") No. Cita
                                                                input(v-bind:value="solicitud.noCita").form-control
                                                            div().form-group.col-sm-4
                                                                label(for="exampleFormControlTextarea1") No. Orden
                                                                input(v-bind:value="solicitud.noOrden").form-control
                                                            div().form-group.col-sm-4
                                                                label(for="exampleFormControlTextarea1") No. Placas
                                                                input(v-bind:value="solicitud.noPlacas").form-control
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlTextarea1") Email Contacto
                                                                input(v-bind:value="solicitud.email").form-control
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlTextarea1") Descripción
                                                                textarea(v-bind:value="solicitud.descripcion" rows="4").form-control
                                                        div().form-row
                                                            div().form-group.col-sm-12
                                                                label(for="exampleFormControlTextarea1") Evidencias
                                                                textarea(v-bind:value="solicitud.evidencia" rows="4").form-control
                                                div().modal-footer
                                                    button(type="button" ).btn.btn-success Aceptar
                                                    button(type="button"  data-dismiss="modal").btn.btn-danger Cerrar
                                div().col-sm-12
                                    button(type="button" class="" ).btn.btn-success Aceptar                              
                                div().col-sm-12
                                    button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-cerrar-'+solicitud.id").btn.btn-danger Cerrar                  
                                    div(v-bind:id="'modal-cerrar-'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
                                        div(class="" role="document").modal-dialog.modal-lg
                                            div().modal-content
                                                div().modal-header
                                                    h5(id="exampleModalLabel").modal-title Cerrar Solicitud
                                                    button(type="button" data-dismiss="modal" aria-label="Close").close
                                                        span(aria-hidden="true") &times;
                                                div().modal-body
                                                    div().form-row
                                                        div().form-group.col-sm-12
                                                            label(for="exampleFormControlSelect1") Módulo
                                                            select( v-model="form.motivoCierre" ).form-control
                                                                option(v-for="motivo in dataResponse" v-bind:value="motivo.id") {{motivo.motivoCierre}}
                                                    div().form-row
                                                        div().form-group.col-sm-12
                                                            label(for="exampleFormControlTextarea1") Detalle de Cierre
                                                            textarea( placeholder="Descripción..." v-model="form.detalleCierre" class="form-control" id="exampleFormControlTextarea1" rows="4")
                                                div().modal-footer
                                                    button(type="button"  data-dismiss="modal").btn.btn-danger Cerrar
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.fecha}}
                              
    

</template>

<script>
import $ from 'jquery'
export default {
    data(){
        return {
            dataResponse:[
                { id:1,
                motivoCierre: "Duda de Operación"},
                { id:2,
                motivoCierre: "Error de Proceso"},
                { id:3,
                motivoCierre: "Duda de Proceso"}]
                
            ,
            form: { 
                motivoCierre:"",
                detalleCierre:""
            },
            solicitudes:[
            {
                id:1,
                asunto:"asunto 1",
                agencia:{
                    nombre:"agencia 1",
                     contacto:[
                        {nombre: "contacto 1.1",
                        cargo:"Gerente 1.1",
                        email: "email.example1.1@algo.com",
                        telefono: "55678907345"},
                        {nombre: "contacto 1.2",
                        cargo:"Gerente 1.2",
                        email: "email.example1.2@algo.com",
                        telefono: "55678907345"}
                    ]
                },
                modulo:{
                    id:1,
                    categoria:"CRM",
                    modulo: "Filtros"
                },
                descripcion:"1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam iaculis egestas ligula, id mattis sem vehicula ac. Quisque a mollis lorem. Cras dignissim in ante non tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consequat tellus a lectus gravida lacinia. Nunc nulla leo, pulvinar vel ipsum at, efficitur varius nisi. Nullam rutrum urna in mi rhoncus, eu mattis lorem fringilla.",
                email:"contacto1@general",
                fecha:"20190917T04:14:11",
                noOrden: "12345",
                noPlacas:"12345",
                noCita:"12345",
                evidencia:[{

                }]
            },{
                id:2,
                asunto:"asunto 2",
                agencia:{
                    nombre:"agencia 2",
                    contacto:[
                        {nombre: "contacto 2.1",
                        cargo:"Gerente 2.1",
                        email: "email.example2.1@algo.com",
                        telefono: "55678907345"},
                        {nombre: "contacto 2.2",
                        cargo:"Gerente 2.2",
                        email: "email.example2.2@algo.com",
                        telefono: "55678907345"}
                    ]
                    
                },
                modulo:{
                    id:1,
                    categoria:"Tableros",
                    modulo: "Chips"
                },
                descripcion:"2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam iaculis egestas ligula, id mattis sem vehicula ac. Quisque a mollis lorem. Cras dignissim in ante non tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consequat tellus a lectus gravida lacinia. Nunc nulla leo, pulvinar vel ipsum at, efficitur varius nisi. Nullam rutrum urna in mi rhoncus, eu mattis lorem fringilla.",
                email:"contacto2@general",
                fecha:"20190917T04:14:11",
                noOrden: "54321",
                noPlacas:"54321",
                noCita:"54321",
                evidencia:[{

                }]
            }]
        };
    },
    methods:{
        sendCierre(){
                var formData = new FormData(); 
                
                for(let element  in this.form){
                    if(element=="evidencias"){
                        for(let value of this.form[element])
                        formData.append(element,value)
                    }else{
                    formData.append(element,this.form[element]);
                    }
                    
                }
                
                // Display the key/value pairs
                // for (var pair of formData.entries()) {
                //     console.log(pair[0]+ ', ' + pair[1]); 
                // }
                this.$http.post('https://localhost:5001/api/redmine/crearPeticion', formData, {
                    headers: {
                        'Access-Control-Allow-Origin': '*',
                        'Content-Type': 'multipart/form-data'
                        }}).then(response => {                  
                        alert(response);
                });
                
                this.form.evidencias=[];
                this.form.asunto="";
                this.form.email="";
                this.form.categoria="";
                this.form.modulo="";
                this.form.descripcion="";
                this.evidencias=[];
                
                }
    },
    computed:{
        modalFunction(){
            $("#modal1").modal('hide');
            return"";
        }
    }
}
</script>

<style>

</style>