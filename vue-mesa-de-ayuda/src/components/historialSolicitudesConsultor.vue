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
                        th(scope="col") Estado de Solicitud
                        th(scope="col") Fecha Actualización
                tbody()
                     tr(v-for="solicitud in solicitudes" v-if="solicitud.estado!='abierta'")
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
                                fieldset(disabled)
                                    div(v-if="solicitud.estado=='aceptada'").col-sm-6
                                        button(type="button" ).btn.btn-success Aceptada
                                    div(v-else).col-sm-6
                                        button(type="button" ).btn.btn-danger Cerrada
                                div().col-sm-6
                                    button(type="button" class="" data-toggle="modal" v-bind:data-target="'#modal-detalle-hsc'+solicitud.id").btn.btn-primary Detalles
                                    div(v-bind:id="'modal-detalle-hsc'+solicitud.id" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true").modal.fade
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
                        td 
                            div().row
                                div().col-sm-12
                                    p {{solicitud.fecha}}
  
</template>

<script>
export default {
  data() {
    return {
      solicitudes: [
        {
          id: 1,
          asunto: "asunto 1",
          estado: "cerrada",
          agencia: {
            nombre: "agencia 1",
            contacto: [
              {
                nombre: "contacto 1.1",
                cargo: "Gerente 1.1",
                email: "email.example1.1@algo.com",
                telefono: "55678907345"
              },
              {
                nombre: "contacto 1.2",
                cargo: "Gerente 1.2",
                email: "email.example1.2@algo.com",
                telefono: "55678907345"
              }
            ]
          },
          modulo: {
            id: 1,
            categoria: "CRM",
            modulo: "Filtros"
          },
          descripcion:
            "1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam iaculis egestas ligula, id mattis sem vehicula ac. Quisque a mollis lorem. Cras dignissim in ante non tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consequat tellus a lectus gravida lacinia. Nunc nulla leo, pulvinar vel ipsum at, efficitur varius nisi. Nullam rutrum urna in mi rhoncus, eu mattis lorem fringilla.",
          email: "contacto1@general",
          fecha: "20190917T04:14:11",
          noOrden: "12345",
          noPlacas: "12345",
          noCita: "12345",
          evidencia: [{}]
        },
        {
          id: 2,
          asunto: "asunto 2",
          estado: "aceptada",
          agencia: {
            nombre: "agencia 2",
            contacto: [
              {
                nombre: "contacto 2.1",
                cargo: "Gerente 2.1",
                email: "email.example2.1@algo.com",
                telefono: "55678907345"
              },
              {
                nombre: "contacto 2.2",
                cargo: "Gerente 2.2",
                email: "email.example2.2@algo.com",
                telefono: "55678907345"
              }
            ]
          },
          modulo: {
            id: 1,
            categoria: "Tableros",
            modulo: "Chips"
          },
          descripcion:
            "2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam iaculis egestas ligula, id mattis sem vehicula ac. Quisque a mollis lorem. Cras dignissim in ante non tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consequat tellus a lectus gravida lacinia. Nunc nulla leo, pulvinar vel ipsum at, efficitur varius nisi. Nullam rutrum urna in mi rhoncus, eu mattis lorem fringilla.",
          email: "contacto2@general",
          fecha: "20190917T04:14:11",
          noOrden: "54321",
          noPlacas: "54321",
          noCita: "54321",
          evidencia: [{}]
        }
      ]
    };
  },
  mounted() {
    // this.$store.commit("isLoaderShown", true); // Esta cosa hace que se muestre el "Cargando..."
    // this.$http.get("api/redmine/solicitudes-pendientes").then(respuesta => 
    // {
    //   this.solicitudes = respuesta.body
    // })
    // this.$store.commit("isLoaderShown", false);
  }
};
</script>

<style>
</style>