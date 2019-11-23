using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Dynamic;
using System.Net.Http;
using System.IO;
using Microsoft.AspNetCore.Http;
using System.Text;

namespace dotnet_mesa_de_ayuda.Controllers
{
  [Route("api/redmine")]
  [ApiController]
  public class RedmineController : ControllerBase
  {
    private QueryBuilder.QueryBuilder _DB;
    private QueryBuilder.QueryBuilder db
    {
      get
      {
        if (_DB == null) _DB = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
        return _DB;
      }
    }

    private void EnviarEmail(long id_solicitud, string asunto, string plantilla, bool externo = true)
    {
      var data = db.Table("ma.solicitudes as s")
        .LeftJoin("ma.concesionarios as c", "s.id_agencia", "c.id")
        .Select("s.*", "c.nombre as nombre_concesionario")
        .Where("s.id", id_solicitud)
        .ExecuteListDynamic()[0];
      plantilla = Miscelanea.Util.ReplaceObject(plantilla, data);
      var correos = new List<string>();
      if (externo && data.email != null) correos.Add((string)data.email);
      correos.AddRange(db.Table("ma.concesionarios_contactos")
        .Select("email")
        .Where("externo", externo)
        .ExecuteListDynamic().Select(elem => (string)elem.email));
      if (correos.Count == 0)
        return;
      // throw new ArgumentException("El concesionario relacionado a la solicitud, no tiene correos electrónicos de contacto.", "id_solicitud");
      var conf = new Miscelanea.Util.CorreoConfig
      {
        MensajeTo = correos.Take(1),
        MensajeCC = correos.Skip(1),
        MensajeFromAddress = Miscelanea.Configuracion.Get.email.from.address,
        MensajeFromName = Miscelanea.Configuracion.Get.email.from.name,
        MensajeHtml = plantilla,
        MensajeSubject = asunto,
        TransporterAuthPass = Miscelanea.Configuracion.Get.email.transporter.auth.pass,
        TransporterAuthUser = Miscelanea.Configuracion.Get.email.transporter.auth.user,
        TransporterHost = Miscelanea.Configuracion.Get.email.transporter.host,
        TransporterPort = (int)Miscelanea.Configuracion.Get.email.transporter.port,
        TransporterSecure = Miscelanea.Configuracion.Get.email.transporter.secure
      };
      Miscelanea.Util.EnviarCorreo(conf);
    }
    [HttpGet("login-config")]
    public object loginConfig([FromQuery] string token)
    {
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      var bitesToken= Convert.FromBase64String(token);
      var strToken= System.Text.ASCIIEncoding.ASCII.GetString(bitesToken);
      var usuario= strToken.Split(':')[0];
      var user = qb.Table("ma.usuario")
        .Where("usuario",usuario)
        .Where("token",token)
        .Select("id","id_perfil","id_area","id_departamento","nombre","usuario")
        .ExecuteListDynamic();
      if (user.Count != 1) 
        return new{
          usuario=(object)null,
          usuarios=(object)null,
          departamentos=(object)null
        };
      else
        return new{
          usuario=user,
          area=qb.Table("ma.area")
          .Where("id",user[0].id_area)
          .Select("id","nombre")
          .ExecuteListDynamic(),
          usuarios=qb.Table("ma.usuario")
          .Where("id_area",user[0].id_area)
          .Select("id","nombre","id_departamento","usuario")
          .ExecuteListDynamic(),
          departamentos= qb.Table("ma.departamento")
          .Select("id","nombre")
          .ExecuteListDynamic()
          };

    }

    [HttpGet("inicializacion")]
    public async Task<object> GetInicializacion([FromQuery] string guid)
    {
      guid = guid.ToLower();
      var client = new HttpClient();
      var request = new HttpRequestMessage(HttpMethod.Get, (string)Miscelanea.Configuracion.Get.api + "custom_fields.json");
      request.Headers.Add("Authorization", "Basic YWRtaW46YW51bHZlaGU=");
      var respuesta = await client.SendAsync(request);
      dynamic payloadRespuesta = JObject.Parse(await respuesta.Content.ReadAsStringAsync()).ToObject(typeof(ExpandoObject));
      var concesionarios = ((List<dynamic>)((List<dynamic>)payloadRespuesta.custom_fields)
        .Find(elem => elem.name == "Agencia").possible_values)
        .FindAll(elem => Miscelanea.Util.StringToSha1(elem.value).ToLower().StartsWith(guid))
        .Select(elem => (string)elem.value)
        .ToList();
      if (concesionarios.Count != 1)
      {
        return new
        {
          id_agencia = 0,
          modulos = (object)null
        };
      }
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      var ids = qb.Table("ma.concesionarios")
        .Where("nombre", concesionarios[0])
        .Select("id")
        .ExecuteListDynamic();
      if (ids.Count != 1) return new
      {
        id_agencia = 0,
        modulos = (object)null
      };
      return new
      {
        id_agencia = ids[0].id,
        nombre_agencia = concesionarios[0],
        modulos = qb.Table("ma.modulos")
          .Select("id", "categoria", "modulo")
          .ExecuteListDynamic()
      };
    }

    [HttpGet("validar-token")]
    public async Task<object> GetValidarToken([FromQuery] string token)
    {
      var client = new HttpClient();
      var request = new HttpRequestMessage(HttpMethod.Get, (string)Miscelanea.Configuracion.Get.api + "users/current.json?limit=1");
      request.Headers.Add("Authorization", "Basic " + token);
      var respuesta = await client.SendAsync(request);
      if (respuesta.StatusCode == System.Net.HttpStatusCode.Unauthorized) return false;
      return true;
    }

    public class CrearSolicitudModel
    {
      public float id_agencia { get; set; }
      public float id_modulo { get; set; }
      public string asunto { get; set; }
      public string descripcion { get; set; }
      public string no_orden { get; set; }
      public string no_cita { get; set; }
      public string no_placas { get; set; }
      public string email { get; set; }
      public List<IFormFile> evidencias { get; set; }
    }
    public class CrearAsuntoModel
    {
      public float  id_area { get; set; }
      public float  id_departamento { get; set; }
      public string usuario_asignado { get; set; }
      public string descripcion { get; set; }
      public float interno_externo { get; set; }
      public string fecha_fin { get; set; }
      public string asunto { get; set; }
      public List<IFormFile> evidencias { get; set; }
    }


    [HttpPost("crearAsunto")]
    public object CrearAsunto([FromForm] CrearAsuntoModel payload){
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      int id = 0;
      DateTime fecha_fin = DateTime.ParseExact(payload.fecha_fin, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
      qb.Transaction(trx =>
      {
        id = trx.Table("ma.asuntos")
          .Insert(new
          {
            payload.id_area,
            payload.id_departamento,
            payload.usuario_asignado,
            payload.descripcion,
            payload.interno_externo,
            fecha_fin,
            payload.asunto,
            fecha_registro = trx.Raw("getutcdate()"),
            fecha_actualizacion = trx.Raw("getutcdate()"),
            estado = "abierta"
          }, new string[] { "inserted.id" })
          .ExecuteListDynamic()[0].id;
        if (payload.evidencias != null)
        {
          if (!Directory.Exists("wwwroot/img/" + DateTime.UtcNow.ToString("yyyy-MM-dd")))
            Directory.CreateDirectory("wwwroot/img/" + DateTime.UtcNow.ToString("yyyy-MM-dd"));
          foreach (var elem in payload.evidencias)
          {
            var archivo = DateTime.UtcNow.ToString("yyyy-MM-dd") + "/" + Guid.NewGuid().ToString("N") + "." + HeyRed.Mime.MimeTypesMap.GetExtension(elem.ContentType);
            using (var fs = new FileStream("wwwroot/img/" + archivo, FileMode.Create))
              elem.CopyTo(fs);
            trx.Table("ma.evidencias")
              .Insert(new
              {
                id_solicitud = id,
                ruta = archivo
              })
              .Execute();
          }
        }
      });
      return null;
    }
    [HttpPost("crearSolicitud")]
    public object CrearSolicitud([FromForm] CrearSolicitudModel payload)
    {
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      int id = 0;
      qb.Transaction(trx =>
      {
        id = trx.Table("ma.solicitudes")
          .Insert(new
          {
            payload.id_agencia,
            payload.id_modulo,
            payload.asunto,
            payload.descripcion,
            payload.no_cita,
            payload.no_orden,
            payload.no_placas,
            fecha_registro = trx.Raw("getutcdate()"),
            fecha_actualizacion = trx.Raw("getutcdate()"),
            estado = "abierta"
          }, new string[] { "inserted.id" })
          .ExecuteListDynamic()[0].id;
        if (payload.evidencias != null)
        {
          if (!Directory.Exists("wwwroot/img/" + DateTime.UtcNow.ToString("yyyy-MM-dd")))
            Directory.CreateDirectory("wwwroot/img/" + DateTime.UtcNow.ToString("yyyy-MM-dd"));
          foreach (var elem in payload.evidencias)
          {
            var archivo = DateTime.UtcNow.ToString("yyyy-MM-dd") + "/" + Guid.NewGuid().ToString("N") + "." + HeyRed.Mime.MimeTypesMap.GetExtension(elem.ContentType);
            using (var fs = new FileStream("wwwroot/img/" + archivo, FileMode.Create))
              elem.CopyTo(fs);
            trx.Table("ma.evidencias")
              .Insert(new
              {
                id_solicitud = id,
                ruta = archivo
              })
              .Execute();
          }
        }
      });
      EnviarEmail(id, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudRegistrada.asunto, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudRegistrada.cuerpo, true);
      EnviarEmail(id, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudRegistradaInterno.asunto, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudRegistradaInterno.cuerpo, false);
      return null;
    }

    public async Task CrearPeticion(string token, int id_solicitud)
    {
      var client = new HttpClient();
      HttpRequestMessage request;
      HttpResponseMessage respuesta;
      dynamic payloadRespuesta;
      var evidencias = db.Table("ma.evidencias")
        .Where("id_solicitud", id_solicitud)
        .Select("ruta")
        .ExecuteListDynamic()
        .Select(elem => (string)elem.ruta);
      var tokensEvidencia = new List<object>();
      foreach (var elem in evidencias)
      {
        request = new HttpRequestMessage(HttpMethod.Post, (string)Miscelanea.Configuracion.Get.api + "uploads.json?filename=" + elem.Substring(11));
        request.Headers.Add("Authorization", "Basic " + token);
        request.Content = new StreamContent(System.IO.File.OpenRead(Path.Join("wwwroot", "img", elem)));
        ((StreamContent)request.Content).Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/octet-stream");
        respuesta = await client.SendAsync(request);
        payloadRespuesta = JObject.Parse(await respuesta.Content.ReadAsStringAsync()).ToObject(typeof(ExpandoObject));
        tokensEvidencia.Add(new
        {
          token = payloadRespuesta.upload.token,
          filename = elem.Substring(11),
          content_type = HeyRed.Mime.MimeTypesMap.GetMimeType(elem.Substring(11))
        });
      }
      // var byteArray = Encoding.ASCII.GetBytes("emmanuel:22.05.97E");
      request = new HttpRequestMessage(HttpMethod.Post, (string)Miscelanea.Configuracion.Get.api + "issues.json");
      request.Headers.Add("Authorization", "Basic " + token);
      var solicitud = db.Table("ma.solicitudes as s")
        .Join("ma.modulos as m", "m.id", "s.id_modulo")
        .Join("ma.concesionarios as c", "c.id", "s.id_agencia")
        .Where("s.id", id_solicitud)
        .Select("s.*", "m.id_proyecto_redmine", "m.id_categoria_redmine", "c.nombre as nombre_concesionario", "c.id_consultor_redmine")
        .ExecuteListDynamic()[0];
      var body = JObject.FromObject(new
      {
        issue = new
        {
          project_id = solicitud.id_proyecto_redmine,
          tracker_id = Miscelanea.Configuracion.Get.idPeticionTipoSoporteRedmine,
          subject = solicitud.nombre_concesionario+" / "+solicitud.asunto,
          description = solicitud.descripcion,
          category_id = solicitud.id_categoria_redmine,
          custom_fields = new object[] {
            new {
              id = Miscelanea.Configuracion.Get.idCampoConsultorRedmine,
              value = solicitud.id_consultor_redmine
            },
            new {
              id = Miscelanea.Configuracion.Get.idCampoConcesionarioRedmine,
              value = solicitud.nombre_concesionario
            }
          },
          uploads = tokensEvidencia
          // watcher_user_ids: [] // Lista de usuarios seguidores
        }
      }).ToString();
      request.Content = new StringContent(body, Encoding.UTF8, "application/json");
      respuesta = await client.SendAsync(request);
      payloadRespuesta = JObject.Parse(await respuesta.Content.ReadAsStringAsync()).ToObject(typeof(ExpandoObject));
      long idPeticion = payloadRespuesta.issue.id;
      db.Table("ma.solicitudes")
        .Update(new
        {
          id_peticion_redmine = idPeticion,
          estado = "aceptada",
          fecha_actualizacion = db.Raw("getutcdate()")
        })
        .Where("id", id_solicitud)
        .Execute();
    }

    [HttpPost("asuntos-pendientes")]
    public object GetSolicitudesPendientes([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      
      var qSolicitudes = qb.Table("ma.solicitudes as s")
        .Join("ma.concesionarios as c", "s.id_agencia", "c.id")
        .Join("ma.modulos as m", "s.id_modulo", "m.id")
        .Join("ma.solicitudes_estados as se", "s.id", "se.id_solicitud")
        .LeftJoin("usuarios.v_usuarios as u", "u.usuario", "s.usuario_asignado")
        .Select("s.id",
          "s.asunto",
          "se.estado",
          "s.id_agencia",
          "c.nombre as nombre_agencia",
          "m.id as id_modulo",
          "m.categoria as nombre_categoria",
          "m.modulo as nombre_modulo",
          "s.descripcion",
          "s.email",
          "s.fecha_registro",
          "se.fecha_actualizacion",
          "se.id_peticion_redmine",
          "s.no_orden",
          "s.no_placas",
          "s.no_cita",
          "s.motivo_cierre",
          "s.detalle_cierre",
          "s.usuario_asignado",
          "u.nombre as nombre_usuario_asignado",
          "se.fecha_fin")
        .Where("s.estado", "abierta");
        if ((int)payload.idAgencia!=0){
          qSolicitudes.Where("s.id_agencia",payload.idAgencia);
        }
        if (!string.IsNullOrWhiteSpace((string)payload.usuario)){
          qSolicitudes.Where("s.usuario_asignado", (string)payload.usuario);
        }
      var solicitudes=qSolicitudes.ExecuteListDynamic();
      foreach (var solicitud in solicitudes)
      {
        var ds = (IDictionary<string, object>)solicitud;
        ds["contactos"] = qb.Table("ma.concesionarios_contactos")
          .Where("id_concesionario", ds["id_agencia"])
          .Select("rv", "nombre", "cargo", "telefono", "email")
          .ExecuteListDynamic();
        ds["evidencias"] = qb.Table("ma.evidencias")
          .Where("id_solicitud", ds["id"])
          .Select("id", "ruta")
          .ExecuteListDynamic();
      }
      return new
      {
        solicitudes,
        motivosCierre = db.Table("ma.motivos_cierre")
          .Select("id", "descripcion")
          .ExecuteDataTable(),
        usuarios = db.Table("usuarios.v_usuarios")
          .Select("usuario", "nombre")
          .ExecuteDataTable()
      };
    }

    [HttpPost("solicitudes-pendientes")]
    public object GetSolicitudesPendientes([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      
      var qSolicitudes = qb.Table("ma.solicitudes as s")
        .Join("ma.concesionarios as c", "s.id_agencia", "c.id")
        .Join("ma.modulos as m", "s.id_modulo", "m.id")
        .Join("ma.solicitudes_estados as se", "s.id", "se.id_solicitud")
        .LeftJoin("usuarios.v_usuarios as u", "u.usuario", "s.usuario_asignado")
        .Select("s.id",
          "s.asunto",
          "se.estado",
          "s.id_agencia",
          "c.nombre as nombre_agencia",
          "m.id as id_modulo",
          "m.categoria as nombre_categoria",
          "m.modulo as nombre_modulo",
          "s.descripcion",
          "s.email",
          "s.fecha_registro",
          "se.fecha_actualizacion",
          "se.id_peticion_redmine",
          "s.no_orden",
          "s.no_placas",
          "s.no_cita",
          "s.motivo_cierre",
          "s.detalle_cierre",
          "s.usuario_asignado",
          "u.nombre as nombre_usuario_asignado",
          "se.fecha_fin")
        .Where("s.estado", "abierta");
        if ((int)payload.idAgencia!=0){
          qSolicitudes.Where("s.id_agencia",payload.idAgencia);
        }
        if (!string.IsNullOrWhiteSpace((string)payload.usuario)){
          qSolicitudes.Where("s.usuario_asignado", (string)payload.usuario);
        }
      var solicitudes=qSolicitudes.ExecuteListDynamic();
      foreach (var solicitud in solicitudes)
      {
        var ds = (IDictionary<string, object>)solicitud;
        ds["contactos"] = qb.Table("ma.concesionarios_contactos")
          .Where("id_concesionario", ds["id_agencia"])
          .Select("rv", "nombre", "cargo", "telefono", "email")
          .ExecuteListDynamic();
        ds["evidencias"] = qb.Table("ma.evidencias")
          .Where("id_solicitud", ds["id"])
          .Select("id", "ruta")
          .ExecuteListDynamic();
      }
      return new
      {
        solicitudes,
        motivosCierre = db.Table("ma.motivos_cierre")
          .Select("id", "descripcion")
          .ExecuteDataTable(),
        usuarios = db.Table("usuarios.v_usuarios")
          .Select("usuario", "nombre")
          .ExecuteDataTable()
      };
    }

    [HttpPost("solicitudes")]
    public object Solicitudes([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      var qSolicitudes = qb.Table("ma.solicitudes as s")
        .Join("ma.concesionarios as c", "s.id_agencia", "c.id")
        .Join("ma.modulos as m", "s.id_modulo", "m.id")
        .Join("ma.solicitudes_estados as se", "s.id", "se.id_solicitud")
        .LeftJoin("usuarios.v_usuarios as u", "u.usuario", "s.usuario_asignado")
        .Select("s.id",
          "s.asunto",
          "se.estado",
          "s.id_agencia",
          "c.nombre as nombre_agencia",
          "m.id as id_modulo",
          "m.categoria as nombre_categoria",
          "m.modulo as nombre_modulo",
          "s.descripcion",
          "s.email",
          "s.fecha_registro",
          "se.id_peticion_redmine",
          "se.fecha_actualizacion",
          "s.no_orden",
          "s.no_placas",
          "s.no_cita",
          "s.motivo_cierre",
          "s.detalle_cierre",
          "s.usuario_asignado",
          "u.nombre as nombre_usuario_asignado",
          "se.fecha_fin");
      if (((IDictionary<string, object>)payload).ContainsKey("idAgencia") && payload.idAgencia!=0)
          qSolicitudes.Where("s.id_agencia", (object)payload.idAgencia);
        DateTime? fechaInicio = !string.IsNullOrWhiteSpace((string)payload.fechaInicio) ?
          DateTime.ParseExact(payload.fechaInicio, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) :
          null;
        DateTime? fechaFin = !string.IsNullOrWhiteSpace((string)payload.fechaFin) ?
          DateTime.ParseExact(payload.fechaFin, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) :
          null;
        if (fechaInicio == null && fechaFin != null)
        {
          fechaInicio = fechaFin;
          fechaFin = null;
        }
        if (fechaInicio != null && fechaFin != null)
          qSolicitudes.WhereRaw("cast(?? as date) between ? and ?", "s.fecha_registro", fechaInicio, fechaFin);
        else if (fechaInicio != null && fechaFin == null)
          qSolicitudes.WhereRaw("cast(?? as date) = ?", "s.fecha_registro", fechaInicio);
        else
          qSolicitudes.Limit(100);
        if (!string.IsNullOrWhiteSpace((string)payload.pais))
          qSolicitudes.Where("c.pais", (string)payload.pais);
        if (!string.IsNullOrWhiteSpace((string)payload.marca))
          qSolicitudes.Where("c.marca", (string)payload.marca);
        if (!string.IsNullOrWhiteSpace((string)payload.grupo))
          qSolicitudes.Where("c.grupo", (string)payload.grupo);
        if (!string.IsNullOrWhiteSpace((string)payload.estado))
          qSolicitudes.Where("se.estado", (string)payload.estado);
    
      var solicitudes = qSolicitudes.ExecuteListDynamic();
      foreach (var solicitud in solicitudes)
      {
        var ds = (IDictionary<string, object>)solicitud;
        ds["contactos"] = qb.Table("ma.concesionarios_contactos")
          .Where("id_concesionario", ds["id_agencia"])
          .Select("rv", "nombre", "cargo", "telefono", "email")
          .ExecuteListDynamic();
        ds["evidencias"] = qb.Table("ma.evidencias")
          .Where("id_solicitud", ds["id"])
          .Select("id", "ruta")
          .ExecuteListDynamic();
      }
      return new
      {
        solicitudes,
        motivosCierre = db.Table("ma.motivos_cierre")
          .Select("id", "descripcion")
          .ExecuteDataTable(),
        usuarios = db.Table("usuarios.v_usuarios")
          .Select("usuario", "nombre")
          .ExecuteDataTable()
      };
    }

    [HttpPost("cerrar-solicitud")]
    public object CerrarSolicitud([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));
      var motivos_cierre = db.Table("ma.motivos_cierre")
        .Select("descripcion")
        .Where("id", (object)payload.id_motivo_cierre)
        .ExecuteListDynamic();
      if (motivos_cierre.Count != 1) throw new ArgumentException("El valor del argumento no es correcto.", "payloadJO.id_motivo_cierre");
      db.Table("ma.solicitudes")
        .Update(new
        {
          motivo_cierre = motivos_cierre[0].descripcion,
          detalle_cierre = payload.detalle_cierre,
          estado = "cerrada",
          fecha_actualizacion = db.Raw("getutcdate()")
        })
        .Where("id", (object)payload.id_solicitud)
        .Execute();
      EnviarEmail((long)payload.id_solicitud, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudCerrada.asunto, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudCerrada.cuerpo, true);
      return null;
    }

    [HttpPost("aceptar-solicitud")]
    public object AceptarSolicitud([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));
      CrearPeticion((string)payload.token, (int)(long)payload.id_solicitud).Wait();
      EnviarEmail((long)payload.id_solicitud, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudAceptada.asunto, Miscelanea.Configuracion.Get.plantillasCorreo.solicitudAceptada.cuerpo, true);
      return null;
    }

    [HttpGet("valores-filtros")]
    public object GetValoresFiltros()
    {
      return db.Table("ma.concesionarios")
        .Select()
        .ExecuteListDynamic();
    }

    [HttpPost("asignar-solicitud")]
    public object AsignarSolicitud([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));
      db.Table("ma.solicitudes")
        .Update(new
        {
          usuario_asignado = payload.usuarioAsignado
        })
        .Where("id", (object)payload.idSolicitud)
        .Execute();
      return null;
    }
    [HttpGet("login")]
    public object ValidarToken([FromQuery] string token)
    {
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      var bitesToken= Convert.FromBase64String(token);
      var strToken= System.Text.ASCIIEncoding.ASCII.GetString(bitesToken);
      var usuario= strToken.Split(':')[0];
      var user = qb.Table("ma.usuario")
        .Where("usuario",usuario)
        .Where("token",token)
        .Select("id")
        .ExecuteListDynamic();
      if (user.Count != 1) 
        return false;
      else
        return true;
      /*return null;*/
    }
  }
}
