using System.Text.RegularExpressions;

namespace dotnet_mesa_de_ayuda.Middlewares
{
  public static class FileServerMiddleware
  {
    public static string GetPaginaHTML(string archivo)
    {
      return Regex.Replace(System.IO.File.ReadAllText(archivo), "(<[^>]+(?:href|src|content)=\"?)/", $"$1{Miscelanea.Configuracion.Get.baseURI}/");
    }
  }
}