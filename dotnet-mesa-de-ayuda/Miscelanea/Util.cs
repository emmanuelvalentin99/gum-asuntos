using System;
using System.Linq;
using System.Data;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Text;
using MailKit.Net.Smtp;
using MimeKit;
using MimeKit.Text;
using Newtonsoft.Json.Linq;

namespace dotnet_mesa_de_ayuda.Miscelanea
{
  public class Util
  {
    public static dynamic JsonParse(string json)
    {
      return JToken.Parse(json).ToObject(typeof(System.Dynamic.ExpandoObject));
    }

    public static string StringToSha1(string cadena)
    {
      byte[] hash;
      using (var sha1 = new SHA1Managed())
      {
        hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(cadena));
      }
      return string.Concat(hash.Select(b => b.ToString("x2")));
    }

    public class CorreoConfig
    {
      public string MensajeFromAddress { get; set; }
      public string MensajeFromName { get; set; }
      public IEnumerable<string> MensajeTo { get; set; }
      public IEnumerable<string> MensajeCC { get; set; }
      public string MensajeSubject { get; set; }
      public string MensajeHtml { get; set; }
      public IEnumerable<string> MensajeReplyTo { get; set; }
      public string TransporterHost { get; set; }
      public int TransporterPort { get; set; }
      public bool TransporterSecure { get; set; }
      public string TransporterAuthUser { get; set; }
      public string TransporterAuthPass { get; set; }
    }

    public static void EnviarCorreo(CorreoConfig config)
    {
      var message = new MimeMessage();
      message.From.Add(new MailboxAddress(config.MensajeFromName, config.MensajeFromAddress));
      foreach (var elem in config.MensajeTo) message.To.Add(new MailboxAddress(elem));
      if (config.MensajeCC != null) foreach (var elem in config.MensajeCC) message.ResentCc.Add(new MailboxAddress(elem));
      message.Subject = config.MensajeSubject;
      if (config.MensajeReplyTo != null) message.ReplyTo.AddRange(config.MensajeReplyTo.Select(elem => new MailboxAddress(elem)));
      message.Body = new TextPart(TextFormat.Html)
      {
        Text = config.MensajeHtml
      };
      using (var transporter = new SmtpClient())
      {
        transporter.ServerCertificateValidationCallback = (s, c, h, e) => true;
        transporter.Connect(config.TransporterHost, config.TransporterPort, config.TransporterSecure);
        transporter.Authenticate(config.TransporterAuthUser, config.TransporterAuthPass);
        transporter.Send(message);
        transporter.Disconnect(true);
      }
    }

    public static string ReplaceObject(string cadena, IDictionary<string, object> objeto, IEnumerable<string> clavesOmitidas = null, string prefix = "")
    {
      return Regex.Replace(cadena, "(^|[^{])\\{" + prefix + "((?:::|{{|}}|[^}{:])+)(?::((?:}}|[^}])+))?}", m =>
      {
        try
        {
          if (clavesOmitidas?.Contains(m.Groups[2].Value) ?? false || !objeto.Keys.Contains(m.Groups[2].Value))
            return m.Value;
          if (m.Groups[3].Length != 0)
            return m.Groups[1].Value + string.Format((string) Configuracion.Get.culture, "{0:" + m.Groups[3].Value.Replace("}}", "'}'") + "}", objeto[m.Groups[2].Value.Replace("{{", "{").Replace("::", ":")]);
          return m.Groups[1].Value + ((object)objeto[m.Groups[2].Value] ?? "").ToString();
        }
        catch (NullReferenceException ex)
        {
          throw new NullReferenceException("No se pudo reemplazar la etiqueta " + m.Groups[0].Value + " en la cadena " + cadena, ex);
        }
      });
    }

    public static string ReplaceDataRow(string cadena, DataRow objeto, IEnumerable<string> clavesOmitidas = null, string prefix = "")
    {
      var d = new Dictionary<string, object>();
      foreach (DataColumn c in objeto.Table.Columns) d[c.ColumnName] = objeto[c.ColumnName];
      return ReplaceObject(cadena, d, clavesOmitidas, prefix);
    }

    public static string ReplaceString(string cadena, string llave, object reemplazo, string prefix = "")
    {
      var obj = new Dictionary<string, object>();
      obj[llave] = reemplazo;
      return ReplaceObject(cadena, obj, null, prefix);
    }
  }
}