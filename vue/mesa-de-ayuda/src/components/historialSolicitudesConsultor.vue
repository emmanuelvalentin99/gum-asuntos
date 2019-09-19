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
  
</template>

<script>
export default {
    data(){
        return {  solicitudes:[
            {
                id:1,
                asunto:"asunto 1",
                estado: "abierta",
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
                estado: "abierta",
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
    }
}
</script>

<style>

</style>