using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace dotnet_mesa_de_ayuda.Miscelanea
{
  public class Util
  {
    public static string StringToSha1(string cadena)
    {
      byte[] hash;
      using (var sha1 = new SHA1Managed())
      {
        hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(cadena));
      }
      return string.Concat(hash.Select(b => b.ToString("x2")));
    }
  }
}