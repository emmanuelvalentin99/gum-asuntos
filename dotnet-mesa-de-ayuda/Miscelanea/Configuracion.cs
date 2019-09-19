using Newtonsoft.Json.Linq;
using System.IO;
using System.Dynamic;

namespace dotnet_mesa_de_ayuda.Miscelanea
{
  public class Configuracion
  {
    private static dynamic _Get;
    public static dynamic Get
    {
      get
      {
        if (_Get == null)
        {
          _Get = JObject.Parse(File.ReadAllText("configuracion.json")).ToObject(typeof(ExpandoObject));
        }
        return _Get;
      }
    }

    public static void Recargar()
    {
      _Get = null;
    }
  }
}