using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System.IO;
using Microsoft.AspNetCore.Routing;

namespace dotnet_mesa_de_ayuda
{
  public class Startup
  {
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
      services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IHostingEnvironment env)
    {
      app.UsePathBase((string)Miscelanea.Configuracion.Get.baseURI);
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }
      else
      {
        // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
        app.UseHsts();
      }

      app.UseHttpsRedirection();
      app.UseMvc();
      app.UseDefaultFiles();
      dynamic paginas = Miscelanea.Util.JsonParse(System.IO.File.ReadAllText("paginas.json"));
      Func<string, RequestDelegate> handler = archivo =>
        context =>
          context.Response.WriteAsync(
            Middlewares.FileServerMiddleware.GetPaginaHTML(
              Path.Join("wwwroot", archivo)));
      var routeBuilder = new RouteBuilder(app);
      foreach (List<object> pagina in paginas)
      {
        if (pagina[0].GetType() == typeof(List<object>))
          foreach (string subpagina in (List<object>)pagina[0])
          {
            routeBuilder.MapGet(subpagina, handler((string)pagina[1]));
          }
        else routeBuilder.MapGet((string)pagina[0], handler((string)pagina[1]));
      }
      var routes = routeBuilder.Build();
      app.UseRouter(routes);
      app.UseStaticFiles();
    }
  }
}
