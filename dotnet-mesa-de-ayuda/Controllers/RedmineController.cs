﻿using System;
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
using Microsoft.AspNetCore.Cors;

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

    private void EnviarEmail(long id_solicitud, string plantilla, bool externo = true)
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
      var conf = new Miscelanea.Util.CorreoConfig {
        MensajeTo = correos.Take(1),
        MensajeCC = correos.Skip(1),
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
        modulos = qb.Table("ma.modulos")
          .Select("id", "categoria", "modulo")
          .ExecuteListDynamic()
      };
    }

    [HttpGet("validar-token")]
    public async Task<object> GetValidarToken([FromQuery] string token)
    {
      var client = new HttpClient();
      var request = new HttpRequestMessage(HttpMethod.Get, (string)Miscelanea.Configuracion.Get.api + "issues.json?limit=1");
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
      EnviarEmail(id, Miscelanea.Configuracion.Get.plantillasCorreo.registroSolicitud, true);
      return null;
    }

    public async Task<object> crearPeticion([FromForm] CrearSolicitudModel payloadJO)
    {

      var client = new HttpClient();
      var byteArray = Encoding.ASCII.GetBytes("emmanuel:22.05.97E");
      var request = new HttpRequestMessage(HttpMethod.Post, "http://capnet2.ddns.net:3101/issues.json");
      request.Headers.Add("Authorization", "Basic YWRtaW46YW51bHZlaGU=");
      var body = JObject.FromObject(new
      {
        issue = new
        {
          project_id = 1,
          subject = payloadJO.asunto,
          description = payloadJO.descripcion
        }
      }).ToString();
      request.Content = new StringContent(body, Encoding.UTF8, "application/json");
      var respuesta = await client.SendAsync(request);
      dynamic payloadRespuesta = JObject.Parse(await respuesta.Content.ReadAsStringAsync()).ToObject(typeof(ExpandoObject));
      return "La petición ha sido creada con el ID de redmine " + payloadRespuesta.issue.id.ToString();
    }

    [HttpGet("solicitudes-pendientes")]
    public object GetSolicitudesPendientes()
    {
      var qb = new QueryBuilder.QueryBuilder((string)Miscelanea.Configuracion.Get.connections.capnet);
      var solicitudes = qb.Table("ma.solicitudes as s")
        .Join("ma.concesionarios as c", "s.id_agencia", "c.id")
        .Join("ma.modulos as m", "s.id_modulo", "m.id")
        .Select("s.id",
          "s.asunto",
          "s.estado",
          "s.id_agencia",
          "c.nombre as nombre_agencia",
          "m.id as id_modulo",
          "m.categoria as nombre_categoria",
          "m.modulo as nombre_modulo",
          "s.descripcion",
          "s.email",
          "s.fecha_registro",
          "s.no_orden",
          "s.no_placas",
          "s.no_cita")
        .Where("s.estado", "abierta")
        .ExecuteListDynamic();
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
          estado = "cerrada"
        })
        .Where("id", (object)payload.id_solicitud)
        .Execute();
      // WIP: Enviar correo
      return null;
    }

    [HttpPost("aceptar-solicitud")]
    public object AceptarSolicitud([FromBody] JObject payloadJO)
    {
      dynamic payload = payloadJO.ToObject(typeof(ExpandoObject));

      return null;
    }
  }
}
