<template lang="pug">
  div.row.mt-4
    div.col-sm-4.offset-sm-4.col-s12
      div.text-center.mb-2: img(src="img/logo.png"  style="max-width: calc(100% - 50px); max-height: 100px;")
      //- div.text-center.mb-2 {{locales[$store.state.locale].text}}
      div.card
        div.card-body: form(@submit.prevent="onSubmit()")
          div.form-group
            label(for="usuario") Usuario:
            input#usuario(type="text" v-model="usuario.usuario" required).form-control.form-control-sm
          div.form-group
            label(for="password") Contraseña:
            input#password(type="password" v-model="usuario.contrasenia" required).form-control.form-control-sm
          div.text-center: div.btn-group.btn-group-sm
            button.btn.btn-primary Iniciar sesión
            //- coment
            //- div.btn-group
            //-   button(data-toggle="dropdown").btn.btn-primary.btn-sm: i.material-icons language
            //-   div.dropdown-menu
            //-     a(v-for="locale in locales" href="#" @click.prevent="onClickLocale(locale.locale)").dropdown-item {{locale.locale}}
          div(v-show="!isValid").text-danger.mt-2 Usuario o contraseñas incorrectos.
</template>

<script>
export default {
  data() {
    return {
      isValid: true,
      usuario: {
        usuario: "",
        contrasenia: ""
      }
    };
  },
  methods: {
    async onSubmit() {
      this.$store.commit("isLoaderShown", true);
      let token = window.btoa(
        this.usuario.usuario + ":" + this.usuario.contrasenia
      );
      let respuesta = await this.$http.get("/api/redmine/login", {
        params: {
          token: token
        }
      });
      this.$store.commit("isLoaderShown", false);
      this.isValid = respuesta.body;
      if (this.isValid) {
        window.sessionStorage.setItem("token", token);
        this.$router.push({ name: "asuntos-pendientes" });
      }
    }
  }
};
</script>