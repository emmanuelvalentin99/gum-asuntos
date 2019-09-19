using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Dynamic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using System.Text;
using Microsoft.AspNetCore.Cors;
namespace Nueva_carpeta.Controllers
{
    [Route("api/redmine")]
    [ApiController]
    public class RedmineController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }
        
        public class crearPeticionModel{
            
            
            public string asunto{get;set;}
            public string categoria{get;set;}
            public string modulo{get;set;}
            public string descripcion{get;set;}
            public List<IFormFile> evidencias{get;set;}
            
        }

        // POST api/values
        [EnableCors("AllowOrigin")]
        [HttpPost("crearPeticion")]
        public async Task<object> crearPeticion([FromForm] crearPeticionModel payloadJO)
        {
            
            var client = new HttpClient();
            var byteArray = Encoding.ASCII.GetBytes("emmanuel:22.05.97E");
            var request = new HttpRequestMessage(HttpMethod.Post, "http://capnet2.ddns.net:3101/issues.json");
            request.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(byteArray));// recuerda convertir esto a base 64, no sé si escrib
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

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
