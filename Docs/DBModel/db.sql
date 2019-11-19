USE [capnet_ci_cd]
GO
ALTER TABLE [ma].[usuario] DROP CONSTRAINT [fk_ma_perfil_usuario]
GO
ALTER TABLE [ma].[solicitudes] DROP CONSTRAINT [fk_ma_modulo_solicitud]
GO
ALTER TABLE [ma].[solicitudes] DROP CONSTRAINT [fk_ma_agencia_solicitud]
GO
ALTER TABLE [ma].[evidencias] DROP CONSTRAINT [fk_ma_solicitud_evidencia]
GO
ALTER TABLE [ma].[concesionarios_contactos] DROP CONSTRAINT [FK_concesionarios_contactos_concesionarios]
GO
ALTER TABLE [ma].[comentario_usuario] DROP CONSTRAINT [fk_ma_usuario_comentario_usuario]
GO
ALTER TABLE [ma].[comentario_usuario] DROP CONSTRAINT [fk_ma_solicitud_comentario_usuario]
GO
ALTER TABLE [ma].[comentario_agencia] DROP CONSTRAINT [fk_ma_solicitud_comentario_agencia]
GO
ALTER TABLE [ma].[comentario_agencia] DROP CONSTRAINT [fk_ma_agencia_comentario_agencia]
GO
ALTER TABLE [usuarios].[usuarios] DROP CONSTRAINT [DF_usuarios_fecha_alta]
GO
ALTER TABLE [usuarios].[usuarios] DROP CONSTRAINT [DF_usuarios_alta]
GO
/****** Object:  View [usuarios].[v_usuarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP VIEW [usuarios].[v_usuarios]
GO
/****** Object:  View [ma].[solicitudes_estados]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP VIEW [ma].[solicitudes_estados]
GO
/****** Object:  Table [usuarios].[usuarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [usuarios].[usuarios]
GO
/****** Object:  Table [organizaciones].[organizaciones]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [organizaciones].[organizaciones]
GO
/****** Object:  Table [ma].[usuario]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[usuario]
GO
/****** Object:  Table [ma].[solicitudes]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[solicitudes]
GO
/****** Object:  Table [ma].[perfil]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[perfil]
GO
/****** Object:  Table [ma].[motivos_cierre]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[motivos_cierre]
GO
/****** Object:  Table [ma].[modulos]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[modulos]
GO
/****** Object:  Table [ma].[evidencias]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[evidencias]
GO
/****** Object:  Table [ma].[concesionarios_contactos]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[concesionarios_contactos]
GO
/****** Object:  Table [ma].[concesionarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[concesionarios]
GO
/****** Object:  Table [ma].[comentario_usuario]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[comentario_usuario]
GO
/****** Object:  Table [ma].[comentario_agencia]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [ma].[comentario_agencia]
GO
/****** Object:  Table [kpis].[kpis]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [kpis].[kpis]
GO
/****** Object:  Table [kpis].[definiciones]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP TABLE [kpis].[definiciones]
GO
/****** Object:  Schema [usuarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP SCHEMA [usuarios]
GO
/****** Object:  Schema [organizaciones]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP SCHEMA [organizaciones]
GO
/****** Object:  Schema [ma]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP SCHEMA [ma]
GO
/****** Object:  Schema [kpis]    Script Date: 18/11/2019 04:18:20 p.m. ******/
DROP SCHEMA [kpis]
GO
/****** Object:  Schema [kpis]    Script Date: 18/11/2019 04:18:20 p.m. ******/
CREATE SCHEMA [kpis]
GO
/****** Object:  Schema [ma]    Script Date: 18/11/2019 04:18:20 p.m. ******/
CREATE SCHEMA [ma]
GO
/****** Object:  Schema [organizaciones]    Script Date: 18/11/2019 04:18:20 p.m. ******/
CREATE SCHEMA [organizaciones]
GO
/****** Object:  Schema [usuarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
CREATE SCHEMA [usuarios]
GO
/****** Object:  Table [kpis].[definiciones]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kpis].[definiciones](
	[nombre] [nvarchar](250) NOT NULL,
	[definicion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_definiciones] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [kpis].[kpis]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kpis].[kpis](
	[categoria] [nvarchar](50) NOT NULL,
	[id] [nvarchar](50) NOT NULL,
	[orden] [int] NOT NULL,
	[definicion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_kpis] PRIMARY KEY CLUSTERED 
(
	[categoria] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ma].[comentario_agencia]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[comentario_agencia](
	[fecha_hora] [datetime] NOT NULL,
	[id_agencia] [int] NOT NULL,
	[id_solicitud] [int] NOT NULL,
	[comentario] [nvarchar](500) NULL,
 CONSTRAINT [pk_ma_comentario_agencia] PRIMARY KEY CLUSTERED 
(
	[fecha_hora] ASC,
	[id_agencia] ASC,
	[id_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[comentario_usuario]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[comentario_usuario](
	[fecha_hora] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_solicitud] [int] NOT NULL,
	[comentario] [nvarchar](500) NULL,
 CONSTRAINT [pk_ma_comentario_usuario] PRIMARY KEY CLUSTERED 
(
	[fecha_hora] ASC,
	[id_usuario] ASC,
	[id_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[concesionarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[concesionarios](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](80) NULL,
	[grupo] [nvarchar](60) NULL,
	[marca] [nvarchar](50) NULL,
	[id_consultor_redmine] [int] NULL,
	[pais] [nvarchar](100) NULL,
 CONSTRAINT [pk_ma_agencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[concesionarios_contactos]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[concesionarios_contactos](
	[rv] [timestamp] NOT NULL,
	[id_concesionario] [int] NOT NULL,
	[nombre] [nvarchar](500) NOT NULL,
	[cargo] [nvarchar](500) NULL,
	[telefono] [nvarchar](500) NULL,
	[email] [nvarchar](500) NULL,
	[externo] [bit] NULL,
 CONSTRAINT [PK_concesionarios_contactos] PRIMARY KEY CLUSTERED 
(
	[rv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[evidencias]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[evidencias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_solicitud] [int] NOT NULL,
	[ruta] [nvarchar](50) NULL,
 CONSTRAINT [pk_ma_evidencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[modulos]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[modulos](
	[id] [int] NOT NULL,
	[categoria] [nvarchar](80) NULL,
	[modulo] [nvarchar](80) NULL,
	[id_proyecto_redmine] [int] NULL,
	[id_categoria_redmine] [int] NULL,
 CONSTRAINT [pk_ma_modulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[motivos_cierre]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[motivos_cierre](
	[id] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
 CONSTRAINT [pk_ma_motivo_cierre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[perfil]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[perfil](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_ma_perfil] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[solicitudes]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[solicitudes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_agencia] [int] NOT NULL,
	[id_modulo] [int] NOT NULL,
	[usuario_asignado] [nvarchar](50) NULL,
	[motivo_cierre] [nvarchar](50) NULL,
	[id_peticion_redmine] [int] NULL,
	[descripcion] [nvarchar](2000) NULL,
	[no_orden] [nvarchar](50) NULL,
	[no_cita] [nvarchar](50) NULL,
	[no_placas] [nvarchar](50) NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
	[estado] [nvarchar](50) NULL,
	[asunto] [nvarchar](200) NULL,
	[email] [nvarchar](100) NULL,
	[detalle_cierre] [nvarchar](2000) NULL,
 CONSTRAINT [pk_ma_solicitud] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ma].[usuario]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ma].[usuario](
	[id] [int] NOT NULL,
	[id_perfil] [int] NOT NULL,
	[usuario] [nvarchar](45) NULL,
	[contrasenia] [nvarchar](200) NULL,
	[token_redmine] [nvarchar](200) NULL,
	[nombre] [nvarchar](60) NULL,
	[email] [nvarchar](60) NULL,
	[telefono] [nvarchar](20) NULL,
	[alta] [bit] NULL,
	[ultima_actividad] [datetime] NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_baja] [datetime] NULL,
 CONSTRAINT [pk_ma_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [organizaciones].[organizaciones]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [organizaciones].[organizaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_organizaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuarios].[usuarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuarios].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](200) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[email] [varchar](100) NULL,
	[telefono] [varchar](50) NULL,
	[alta] [bit] NOT NULL,
	[token] [varchar](50) NULL,
	[ultima_actividad] [datetime] NULL,
	[fecha_alta] [datetime] NOT NULL,
	[fecha_baja] [datetime] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [ma].[solicitudes_estados]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [ma].[solicitudes_estados] as
select c.id as id_solicitud,
/*a.id*/ '' as id_peticion_redmine, 
isnull(/*b.name*/'', c.estado) as estado,
/*b.is_closed*/ '' as esta_cerrada,
/*a.due_date*/ '' as fecha_fin,
ISNULL(c.fecha_actualizacion,''/*a.updated_on*/) as  fecha_actualizacion

from ma.solicitudes c
--left join redmine.redmine_development..issues a on c.id_peticion_redmine = a.id
--left join redmine.redmine_development..issue_statuses b on a.status_id = b.id
GO
/****** Object:  View [usuarios].[v_usuarios]    Script Date: 18/11/2019 04:18:20 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [usuarios].[v_usuarios] as
select id_perfil = 1, 
  usuario = '', --login, 
  contrasenia = '', 
  nombre = '', --firstname + ' ' + lastname, 
  alta = 1
--from [REDMINE].[redmine]..[users]
--where login <> '' and status = 1
GO
INSERT [kpis].[definiciones] ([nombre], [definicion]) VALUES (N'ssl_estado_de_las_ordenes', N'create view kpis.v_ssl_estado_de_las_ordenes as
with cte as (
	select
		b.id_sucursal,
		b.fecha,
		no_orden = b.NOORDEN,
		no_parte = ''- MO -'',
		solicitud = a.operacion,
		precio = a.mano_obra,
		precio_ref = 0,
		precio_mo = a.mano_obra,
		precio_autorizado = isnull(a.respuesta * a.mano_obra, 0),
		respuesta = case when a.respuesta = 1 then ''Autorizado'' else ''No autorizado'' end
	from ra.ordenes b
	left join ost.ordenes_listas a on a.no_orden = b.NOORDEN
	left join ra.usuarios c on case when b.idasesor = '''' then ''- - -'' else b.idasesor end =
		case when c.cveUsuario = ''admin'' then ''- - -'' else c.cveAsesor end
	where isnull(a.operacion, '''') <> ''''
	union
	select
		b.id_sucursal,
		b.fecha,
		no_orden = b.NOORDEN,
		no_parte = isnull(d.no_parte, d.descripcion),
		solicitud = isnull(nullif(d.nombre, ''''), d.descripcion),
		precio = isnull(d.cantidad * d.precio, 0) + ISNULL(d.mano_obra, 0),
		precio_ref = isnull(d.cantidad * d.precio, 0),
		precio_mo = ISNULL(d.mano_obra, 0),
		precio_autorizado = isnull(d.respuesta * (d.cantidad * d.precio + d.mano_obra), 0),
		respuesta = case when d.respuesta = 1 then ''Autorizado'' else ''No autorizado'' end
	from ra.ordenes b
	left join ost.seguimientos a on a.no_orden = b.NOORDEN
	left join ost.seguimientos_refacciones d on a.id = d.id_seguimiento
	left join ra.usuarios c on case when b.idasesor = '''' then ''- - -'' else b.idasesor end =
		case when c.cveUsuario = ''admin'' then ''- - -'' else c.cveAsesor end
	where d.id is not null and d.ocultar = 0
	union
	select
		b.id_sucursal,
		b.fecha,
		no_orden = b.NOORDEN,
		no_parte = d.no_parte,
		solicitud = d.nombre,
		precio = isnull(d.cantidad * d.precio, 0) + ISNULL(e.mano_obra, 0),
		precio_mo = ISNULL(e.mano_obra, 0),
		precio_ref = isnull(d.cantidad * d.precio, 0),
		precio_autorizado = isnull(e.respuesta * (d.cantidad * d.precio + e.mano_obra), 0),
		respuesta = case when e.respuesta = 1 then ''Autorizado'' else ''No autorizado'' end
	from ra.ordenes b
	left join ost.seguimientos a on a.no_orden = b.NOORDEN
	left join ost.seguimientos_paquetes e on a.id = e.id_seguimiento
	left join ost.seguimientos_paquetes_refacciones d on e.id = d.id_seguimiento_paquete
	where d.id is not null
)
select c.id_sucursal,
	c.fecha, 
	anio = YEAR(c.fecha),
	mes = LEFT(''0''+cast(month(c.fecha) as nvarchar), 2),
	dia = LEFT(''0''+cast(day(c.fecha) as nvarchar), 2),
	asesor = isnull(d.Nombre, ''Inválido''),
	no_orden = c.NOORDEN,
	a.no_parte, a.precio, a.precio_mo, a.precio_ref, a.precio_autorizado,
	a.respuesta, a.solicitud, con_seguimiento = a.no_orden, visitas = b.visitas, b.envios_wa 
from ra.ordenes c
left join cte a on c.fecha = a.fecha and c.NOORDEN = a.no_orden
left join ra.usuarios d on case when c.idasesor = '''' then ''- - -'' else c.idasesor end =
		case when d.cveUsuario = ''admin'' then ''- - -'' else d.cveAsesor end
left join ost.ordenes_listas b on a.no_orden = b.no_orden')
GO
INSERT [kpis].[definiciones] ([nombre], [definicion]) VALUES (N'ssl_estado_de_los_seguimientos', N'create view [kpis].[v_ssl_estado_de_los_seguimientos] as
with cte as (
	select id_sucursal,
		no_orden,
		id_lista,
		fecha_hora_envio = (select max(value) from 
			(values(a.fecha_hora_envio_sms),
				(a.fecha_hora_envio_email),
				(a.fecha_hora_envio_wa)) as all_values(value)),
		fecha_hora_tecnico_inicio
	from ost.ordenes_listas a
	where a.fecha_hora_fin_tecnico is not null
), cte_ref as (
	select
		a.id_sucursal,
		a.no_orden,
		cantidad = case when a.operacion <> '''' then 1 else 0 end +
			b.cantidad + c.cantidad,
		autorizados = case when a.operacion <> '''' and respuesta = 1 then 1 else 0 end +
			b.autorizados + c.autorizados
	from ost.ordenes_listas a
	cross apply (select cantidad = count(*), autorizados = isnull(sum(case when respuesta = 1 then 1 else 0 end), 0)
		from ost.seguimientos b join ost.seguimientos_refacciones c on b.id = c.id_seguimiento
		where b.id_sucursal = a.id_sucursal and b.no_orden = a.no_orden and c.ocultar = 0) b
	cross apply (select cantidad = count(*), autorizados = isnull(sum(case when respuesta = 1 then 1 else 0 end), 0)
		from ost.seguimientos b join ost.seguimientos_paquetes c on b.id = c.id_seguimiento
		join ost.seguimientos_paquetes_refacciones d on c.id = d.id_seguimiento_paquete
		where b.id_sucursal = a.id_sucursal and b.no_orden = a.no_orden and c.ocultar = 0 and d.ocultar = 0) c
)
select 
	a.id_sucursal,
	fecha = cast(isnull(b.fecha_hora_envio, b.fecha_hora_tecnico_inicio) as date),
	anio = year(isnull(b.fecha_hora_envio, b.fecha_hora_tecnico_inicio)),
	mes = month(isnull(b.fecha_hora_envio, b.fecha_hora_tecnico_inicio)),
	dia = day(isnull(b.fecha_hora_envio, b.fecha_hora_tecnico_inicio)),
	asesor = isnull(c.Nombre,''Inválido''),
	b.no_orden,
	b.id_lista,
	tipo = case when b.fecha_hora_envio is null then ''No enviado''
		when d.cantidad = 0 then ''No aplica''
		when d.autorizados = 0 then ''Rechazado''
		when d.cantidad > d.autorizados then ''Parcial''
		when d.cantidad = d.autorizados then ''Autorizado''
		end,
	no_orden_link = concat(''ssl/asesor/sucursal/'', a.id_sucursal, ''/orden/'', b.no_orden, ''/checklist/'', b.id_lista)
from ra.ordenes a
join cte b on a.id_sucursal = b.id_sucursal and a.noorden = b.no_orden
left join ra.usuarios c on a.id_sucursal = c.id_sucursal and a.idasesor = c.cveAsesor
join cte_ref d on d.id_sucursal = a.id_sucursal and d.no_orden = a.noorden')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'customer-relationship-management', N'no-shows', 1, N'{
  "titulo": "Productividad, eficiencia y efectividad. Por día",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Tmp. disponible (hrs.)",
          "campo": "tiempo_disponible_bahia",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. asignado (hrs.)",
          "campo": "tmp_total_asignado",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. improd. (hrs.)",
          "campo": "raw{Tiempo_disponible_bahia-isnull(tmp_total_real,0)",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. real (hrs.)",
          "campo": "tmp_total_real",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Prod. total",
          "campo": "raw{(sum(tmp_total_real+.00)+.00)/(nullif(sum(Tiempo_disponible_bahia),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Efic. total (Rend.)",
          "campo": "raw{(sum(tmp_total_asignado+.00)+.00)/(nullif(sum(tmp_total_real),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion":null,
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Efect. total",
          "campo": "raw{(sum(tmp_total_asignado+.00)+.00)/(nullif(sum(tiempo_disponible_bahia),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion":null,
          "formato": null,
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "fv_hyp_tecnicos_dia",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'hyp', N'dif-entrega', 5, N'{
  "titulo": "Diferencia de Entrega",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
		},
        {
          "nombre": "No. Placas",
          "campo": "noplacas",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [
       
    ],
      "valores": [
        {
					"nombre": "ANTICIPADA",
					"campo": "raw{case when rango = ''ANTICIPADA'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        {
					"nombre": "00 DIAS",
					"campo": "raw{case when rango = ''00 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "01 DIAS",
					"campo": "raw{case when rango = ''01 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "02 DIAS",
					"campo": "raw{case when rango = ''02 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "03 DIAS",
					"campo": "raw{case when rango = ''03 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				
        },
        {
					"nombre": "04 DIAS",
					"campo": "raw{case when rango = ''04 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        {
					"nombre": "05 A 10 DIAS",
					"campo": "raw{case when rango = ''05 A 10 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        {
					"nombre": "11 A 20 DIAS",
					"campo": "raw{case when rango = ''11 A 20 DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        {
					"nombre": "21 MAS DIAS",
					"campo": "raw{case when rango = ''21 MAS DIAS'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "hyp_dif_entrega",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'hyp', N'productividad-eficiencia-efectividad', 2, N'{
  "titulo": "Productividad, eficiencia y efectividad",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Fases",
          "campo": "servicioCapturado",
          "formato": null
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "No. Orden",
          "campo": "noorden",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Cantidad",
          "campo": "noorden",
          "puedeAgregar": true,
          "agregacion": "count(distinct ",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. disponible",
          "campo": "t_disponible",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. asignado",
          "campo": "t_asignado",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. improd.",
          "campo": "raw{sum(t_disponible)-sum(t_real)",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. real",
          "campo": "t_real",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Prod. total",
          "campo": "raw{(sum(t_real+.00)+.00)/(nullif(sum(t_disponible),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Efic. total (Rend.)",
          "campo": "raw{(sum(t_asignado+.00)+.00)/(nullif(sum(t_real),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion":null,
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Efect. total",
          "campo": "raw{(sum(t_asignado+.00)+.00)/(nullif(sum(t_disponible),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion":null,
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "hyp_tecnicos",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'hyp', N'productividad-eficiencia-efectividad-dia', 1, N'{
  "titulo": "Productividad, eficiencia y efectividad. Por día",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Fases",
          "campo": "servicioCapturado",
          "formato": null
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Tmp. disponible (hrs.)",
          "campo": "tiempo_disponible_bahia",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. asignado (hrs.)",
          "campo": "tmp_total_asignado",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. improd. (hrs.)",
          "campo": "raw{Tiempo_disponible_bahia-isnull(tmp_total_real,0)",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Tmp. real (hrs.)",
          "campo": "tmp_total_real",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Prod. total",
          "campo": "raw{(sum(tmp_total_real+.00)+.00)/(nullif(sum(Tiempo_disponible_bahia),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Efic. total (Rend.)",
          "campo": "raw{(sum(tmp_total_asignado+.00)+.00)/(nullif(sum(tmp_total_real),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion":null,
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Efect. total",
          "campo": "raw{(sum(tmp_total_asignado+.00)+.00)/(nullif(sum(tiempo_disponible_bahia),0)+.00)*100",
          "puedeAgregar": true,
          "agregacion":null,
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "hyp_tecnicos_dia",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'hyp', N'uso-tableros-asesor-anfitrion', 6, N'{
  "titulo": "Uso de tableros. Asesor y anfitrión",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Con cita",
          "campo": "concita",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [
       
    ],
      "valores": [
        {
					"nombre": "Cantidad",
					"campo": "cantidad",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Recepciones",
					"campo": "recepcion",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Recep. Asesor",
					"campo": "recepasesor",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Salidas",
					"campo": "salida",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				
        },
        {
					"nombre": "Salidas Totales",
					"campo": "saltotal",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        
        {
          "nombre": "Prom. Esp. Recep.",
          "campo": "tmpesprecepcion",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Prom. Recep.",
          "campo": "tmprecepcion",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "hyp_uso_tableros_asesor_anfitrion",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'hyp', N'uso-tableros-fin', 4, N'{
  "titulo": "Uso de tableros. Fin",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Fases",
          "campo": "servicioCapturado",
          "formato": null
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "No. Orden",
          "campo": "noorden",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [
       
    ],
      "valores": [
        {
					"nombre": "Anticipada",
					"campo": "raw{case when Estatus_Fin = ''Anticipada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Detenida",
					"campo": "raw{case when Estatus_Fin = ''Detenida'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "En Tiempo",
					"campo": "raw{case when Estatus_Fin = ''En Tiempo'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "No Finalizada",
					"campo": "raw{case when Estatus_Fin = ''No Finalizada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				
        },
        {
					"nombre": "T. Original 0",
					"campo": "raw{case when Estatus_Fin = ''T. Original 0'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        
        {
          "nombre": "Cantidad",
          "campo": "cantidad",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Min. tmp. dif. fin.",
          "campo": "tmp_diff_fin",
          "puedeAgregar": true,
          "agregacion": "min(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Max. tmp. dif. fin.",
          "campo": "tmp_diff_fin",
          "puedeAgregar": true,
          "agregacion": "max(",
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "hyp_tiempo_operacion_real",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'hyp', N'uso-tableros-inicio', 3, N'{
  "titulo": "Uso de tableros. Inicio",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "year",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Fases",
          "campo": "servicioCapturado",
          "formato": null
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "No. Orden",
          "campo": "noorden",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [
    ],
      "valores": [
        {
					"nombre": "A Tiempo",
					"campo": "raw{case when Status_Inicio = ''A Tiempo'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Anticipada",
					"campo": "raw{case when Status_Inicio = ''Anticipada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "No iniciada",
					"campo": "raw{case when Status_Inicio = ''No Iniciada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Tardía",
					"campo": "raw{case when Status_Inicio = ''Tardia'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
        {
          "nombre": "Cantidad",
          "campo": "cantidad",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Cantidad iniciada",
          "campo": "inicios",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Cantidad finalizada",
          "campo": "fines",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Prom. tmp. dif. ini. (m)",
          "campo": "tmp_diff_ini",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "hyp_tiempo_operacion_real",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'chips', 8, N'{
  "titulo": "Tablero",
  "layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
      "filas": [
        {
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Técnico",
					"campo": "tecnico",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
        },
        {
					"nombre": "No. Orden",
					"campo": "no_orden",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Tipo de operación",
					"campo": "tipo_operacion",
					"formato": null
				},
				{
					"nombre": "Continuidad",
					"campo": "continuidad",
					"formato": null
				},
				{
					"nombre": "ID",
					"campo": "id",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Asesor",
					"campo": "asesor",
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Tipo de cita",
					"campo": "cita",
					"formato": null,
					"visible": false
				}
      ],
      "columnas": [],
      "valores": [
        {
					"nombre": "Cantidad",
					"campo": "id",
					"puedeAgregar": true,
					"agregacion": "count(",
					"formato": "#,###,##0",
					"_className": "text-right"
				},
				{
					"nombre": "Tiempo asignado",
					"campo": "tiempo_asignado",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": "#,###,##0.00",
					"_className": "text-right"
				},
				{
					"nombre": "Tiempo real",
					"campo": "tiempo_real",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": "#,###,##0.00",
					"_className": "text-right"
				},
				{
					"nombre": "Eficiencia",
					"campo": "eficiencia",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": "0.00%",
					"_className": "text-right"
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "ra_tablero",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'citas', 7, N'{
  "titulo": "Citas",
  "layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
      "filas": [
        {
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Usuario",
					"campo": "usuario",
					"formato": null
				},
				{
					"nombre": "Clasificación",
					"campo": "clasificacion",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
        },
        {
					"nombre": "Tipo",
					"campo": "tipo_cita",
					"formato": null
				},
				{
					"nombre": "No. de cita",
					"campo": "no_cita",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "No. Placas",
					"campo": "noplacas",
					"formato": null,
					"_type": "num"
				}
      ],
      "columnas": [],
      "valores": [
        {
					"nombre": "Cantidad",
					"campo": "cantidad",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				},
				{
					"nombre": "Fecha de agendamiento",
					"campo": "fecha_agendamiento",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Fecha de la cita",
					"campo": "fecha_cita",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Técnico asignado",
					"campo": "tecnico",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Operación",
					"campo": "operacion",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Asesor",
					"campo": "asesor",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Placas",
					"campo": "placas",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Show",
					"campo": "show",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"visible": false
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "ra_citas",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'detenidos', 9, N'{
  "titulo": "Detenidos",
  "layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
      "filas": [
        {
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Técnico",
					"campo": "tecnico",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
        },
        {
					"nombre": "No. Orden",
					"campo": "no_orden",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Tipo de operación",
					"campo": "tipo_operacion",
					"formato": null
				},
				{
					"nombre": "Continuidad",
					"campo": "continuidad",
					"formato": null
				},
				{
					"nombre": "ID",
					"campo": "id",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Asesor",
					"campo": "asesor",
					"formato": null,
					"visible": false
				},
				{
					"nombre": "Tipo de cita",
					"campo": "cita",
					"formato": null,
					"visible": false
				}
      ],
      "columnas": [],
      "valores": [
        {
					"nombre": "Cantidad",
					"campo": "id",
					"puedeAgregar": true,
					"agregacion": "count(",
					"formato": "#,###,##0",
					"_className": "text-right"
				},
				{
					"nombre": "Tiempo asignado",
					"campo": "tiempo_asignado",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": "0.00"
				},
				{
					"nombre": "Tiempo real",
					"campo": "tiempo_real",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": "0.00"
				},
				{
					"nombre": "Eficiencia",
					"campo": "eficiencia",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": "0.00%"
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "ra_tablero",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'entradas-al-taller', 2, N'{
  "titulo": "Entradas al taller",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Cant. de citas",
          "campo": "cita",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Shows",
          "campo": "show",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "% Shows",
          "campo": "referencia{(sum({1})+0.00)/nullif(sum({0}), 0)*100",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00''%''",
          "_className": "text-right"
        },
        {
          "nombre": "No Shows",
          "campo": "no_show",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "% No Shows",
          "campo": "referencia{(sum({3})+0.0)/nullif(sum({0}),0)*100",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00''%''",
          "_className": "text-right"
        },
        {
          "nombre": "Sin cita",
          "campo": "sin_cita",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Total de entradas",
          "campo": "entrada",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Cant. de citas por internet",
          "campo": "cita_internet",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "Mezcla (80/20)",
          "campo": "referencia{(sum({0})+0.0)/nullif(sum({6}),0)*100",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00''%''",
          "_className": "text-right"
        }
      ]
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round((sum(cita)+0.0)/nullif(sum(entrada),0)*100, 2)",
      "sufijo": "%",
      "titulo": "Mezcla 80/20",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 100,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.7, "#DDDF0D"], [0.8, "#55BF3B"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round((sum(show)+0.00)/nullif(sum(cita), 0)*100, 2)",
      "sufijo": "%",
      "titulo": "% Shows",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 100,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.7, "#DF5353"], [0.85, "#DDDF0D"], [1, "#55BF3B"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    }
  ],
  "modelo": {
    "tabla": "ra_entradas_al_taller",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'lavados', 9, N'{
  "titulo": "Lavados",
  "layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
      "filas": [
        {
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Lavador",
					"campo": "lavador",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
        },
        {
					"nombre": "No. Orden",
					"campo": "no_orden",
					"formato": null,
					"_type": "num"
				}
      ],
      "columnas": [],
      "valores": [
        {
					"nombre": "Cantidad",
					"campo": "no_orden",
					"puedeAgregar": true,
					"agregacion": "count(",
					"formato": "#,###,##0",
					"_className": "text-right"
				},
				{
					"nombre": "Cantidad lavada",
					"campo": "lavado",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": "#,###,##0",
					"_className": "text-right"
				},
				{
					"nombre": "Cantidad entregada",
					"campo": "entregado",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": "#,###,##0",
					"_className": "text-right"
				},
				{
					"nombre": "% Lavado",
					"campo": "referencia{(sum({1})+0.0)/nullif(count({0}),0)",
					"puedeAgregar": true,
					"agregacion": null,
					"formato": "0.00%",
					"_className": "text-right"
				},
				{
					"nombre": "% Entregado",
					"campo": "referencia{(sum({2})+0.0)/nullif(count({0}),0)",
					"puedeAgregar": true,
					"agregacion": null,
					"formato": "0.00%",
					"_className": "text-right"
				},
				{
					"nombre": "Tiempo promedio (min.)",
					"campo": "tiempo_real",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": "0.00",
					"_className": "text-right"
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "ra_lavados",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'productividad-eficiencia-y-efectividad', 4, N'{
  "titulo": "Productividad, eficiencia y efectividad",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "T. Disponible (hr.)",
          "campo": "t_disponible",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Asignado (hr.)",
          "campo": "t_asignado",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Improductivo (hr.)",
          "campo": "t_improductivo",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Real (hr.)",
          "campo": "t_real",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Productividad",
          "campo": "referencia{{3}/nullif({0},0)",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00%",
          "_className": "text-right"
        },
        {
          "nombre": "Eficiencia",
          "campo": "referencia{{1}/nullif({3},0)",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00%",
          "_className": "text-right"
        },
        {
          "nombre": "Efectividad",
          "campo": "referencia{{1}/nullif({0},0)",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00%",
          "_className": "text-right"
        }
      ]
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(isnull(avg(t_real/nullif(t_disponible, 0)), 0) * 100, 2)",
      "sufijo": "%",
      "titulo": "Estancia",
      "tituloTooltip": "Estancia = Real / Disponible",
      "grafico": {
        "min": 0,
        "max": 100,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.8, "#DF5353"], [0.9, "#DDDF0D"], [1, "#55BF3B"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(isnull(avg(t_asignado/nullif(t_real, 0)), 0) * 100, 2)",
      "sufijo": "%",
      "titulo": "Eficiencia",
      "tituloTooltip": "Eficiencia = Asignado / Real",
      "grafico": {
        "min": 0,
        "max": 200,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [
              [0.4, "#DF5353"],
              [0.5, "#DDDF0D"],
              [0.5, "#55BF3B"],
              [1, "#3A55BF"]
            ],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(isnull(avg(t_asignado/nullif(t_disponible, 0)), 0) * 100, 2)",
      "sufijo": "%",
      "titulo": "Productividad",
      "tituloTooltip": "Productividad = Asignado / Disponible",
      "grafico": {
        "min": 0,
        "max": 150,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.5333, "#DF5353"], [0.6667, "#DDDF0D"], [1, "#55BF3B"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    }
  ],
  "modelo": {
    "tabla": "ra_productividad_eficiencia_y_efectividad",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'promedio-de-tiempos', 1, N'{
  "titulo": "Promedio de tiempos",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Clasificación",
          "campo": "clasificacion",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "No. Orden",
          "campo": "noorden",
          "formato": null,
          "_type": "num",
          "filtrable": false
        },
        {
          "nombre": "No. Placas",
          "campo": "noplacas",
          "formato": null,
          "_type": "num",
          "filtrable": false
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Vehículos",
          "campo": "vehiculo",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "T. Espera (m)",
          "campo": "t_espera",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Recepción (m)",
          "campo": "t_recepcion",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Esp. Serv. (m)",
          "campo": "t_esp_serv",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Taller (hr)",
          "campo": "t_taller",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Esp. Lav. (min)",
          "campo": "t_esp_lav",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Lavado (min)",
          "campo": "t_lavado",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Total (hr)",
          "campo": "t_total",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_espera), 2)",
      "sufijo": " min.",
      "titulo": "T. Espera",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 60,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.1667, "#55BF3B"], [0.3333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_recepcion), 2)",
      "sufijo": " min.",
      "titulo": "T. Recepción",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 60,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.25, "#55BF3B"], [0.6667, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_esp_serv), 2)",
      "sufijo": " min.",
      "titulo": "T. E. Servicio",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 180,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.3333, "#55BF3B"], [0.6667, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_taller), 2)",
      "sufijo": " hr.",
      "titulo": "T. Taller",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 72,
        "splitNumber": 9,
        "axisLine": {
          "lineStyle": {
            "color": [[0.1111, "#55BF3B"], [0.3333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_esp_lav), 2)",
      "sufijo": " min.",
      "titulo": "T. E. Lavado",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 120,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.5, "#55BF3B"], [0.75, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_lavado), 2)",
      "sufijo": " min.",
      "titulo": "T. Lavado",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 60,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.6667, "#55BF3B"], [0.8333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_total), 2)",
      "sufijo": " hr.",
      "titulo": "T. Total",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 72,
        "splitNumber": 9,
        "axisLine": {
          "lineStyle": {
            "color": [[0.1111, "#55BF3B"], [0.3333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    }
  ],
  "modelo": {
    "tabla": "ra_promedio_de_tiempos",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'tiempo-de-estancia', 3, N'{
	"titulo": "Tiempo de estancia",
	"layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
			"filas": [
				{
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Asesor",
					"campo": "asesor",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
				}
			],
			"columnas": [
				{
					"nombre": "Tiempo",
					"campo": "tiempo"
				}
			],
			"valores": [
				{
					"nombre": "Vehículos",
					"campo": "fecha",
					"agregacion": "count(",
					"puedeAgregar": true,
					"formato": null,
					"_className": "text-right"
				}
			]
		}
	],
	"modelo": {
		"tabla": "ra_tiempo_de_estancia",
		"condiciones": [],
		"timeout": 600
	}
}')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'uso-de-tableros-fin', 6, N'{
  "titulo": "Uso de tableros. Fin",
  "layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
      "filas": [
        {
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Técnico",
					"campo": "tecnico",
					"formato": null
				},
				{
					"nombre": "Clasificación",
					"campo": "clasificacion",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "No. Placas",
					"campo": "noplacas",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "No. Orden",
					"campo": "noorden",
					"formato": null,
					"_type": "num"
				}
      ],
      "columnas": [],
      "valores": [
       
        {
					"nombre": "Cantidad de chips",
					"campo": "chip",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
         {
					"nombre": "Prom. duración (hrs.)",
					"campo": "t_real",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": "0.00",
					"_className": "text-right"
        },
        {
					"nombre": "Prom. tmp. dif. fin (min.)",
					"campo": "diferencia_fin",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "A Tiempo",
					"campo": "raw{case when tipo_fin = ''a tiempo'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Anticipada",
					"campo": "raw{case when tipo_fin = ''anticipada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Detenida",
					"campo": "raw{case when tipo_fin = ''detenida'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "No iniciada",
					"campo": "raw{case when tipo_fin = ''no iniciada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "No finalizada",
					"campo": "raw{case when tipo_fin = ''no finalizada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Tardía",
					"campo": "raw{case when tipo_fin = ''tardía'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "ra_uso_de_tableros",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada', N'uso-de-tableros-inicio', 5, N'{
  "titulo": "Uso de tableros. Inicio",
  "layout": "flow",
	"elementos": [
		{
			"layout": {
				"s": 12
			},
			"tipo": "tabla",
      "filas": [
        {
					"nombre": "Año",
					"campo": "anio",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Mes",
					"campo": "mes",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "Técnico",
					"campo": "tecnico",
					"formato": null
				},
				{
					"nombre": "Clasificación",
					"campo": "clasificacion",
					"formato": null
				},
				{
					"nombre": "Día",
					"campo": "dia",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "No. Placas",
					"campo": "noplacas",
					"formato": null,
					"_type": "num"
				},
				{
					"nombre": "No. Orden",
					"campo": "noorden",
					"formato": null,
					"_type": "num"
				}
      ],
      "columnas": [],
      "valores": [
      
        {
					"nombre": "Cantidad de chips",
					"campo": "chip",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
          {
					"nombre": "Prom. duración (hrs.)",
					"campo": "t_real",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": "0.00",
					"_className": "text-right"
        },
        {
					"nombre": "Prom. tmp. dif. ini. (min.)",
					"campo": "diferencia_inicio",
					"puedeAgregar": true,
					"agregacion": "avg(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "A Tiempo",
					"campo": "raw{case when tipo_inicio = ''a tiempo'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Anticipada",
					"campo": "raw{case when tipo_inicio = ''anticipada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "No iniciada",
					"campo": "raw{case when tipo_inicio = ''no iniciada'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Tardía",
					"campo": "raw{case when tipo_inicio = ''tardía'' then 1 else 0 end",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
				}
      ]
    }
  ],
  "modelo": {
    "tabla": "ra_uso_de_tableros",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada-express', N'promedio-de-tiempos', 1, N'{
  "titulo": "Promedio de tiempos. Express",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Vehículos",
          "campo": "vehiculo",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": null,
          "_className": "text-right"
        },
        {
          "nombre": "T. Recepción (m)",
          "campo": "t_recepcion",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Técnico (m)",
          "campo": "t_taller",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Lavado (m)",
          "campo": "t_lavado",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Entrega (m)",
          "campo": "t_entrega",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Total (m)",
          "campo": "t_total",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00",
          "_className": "text-right"
        }
      ]
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_recepcion), 2)",
      "sufijo": " min.",
      "titulo": "T. Recepción",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 60,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.25, "#55BF3B"], [0.6667, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_taller), 2)",
      "sufijo": " hr.",
      "titulo": "T. Técnico",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 72,
        "splitNumber": 9,
        "axisLine": {
          "lineStyle": {
            "color": [[0.1111, "#55BF3B"], [0.3333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_lavado), 2)",
      "sufijo": " min.",
      "titulo": "T. Lavado",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 60,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.6667, "#55BF3B"], [0.8333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_entrega), 2)",
      "sufijo": " min.",
      "titulo": "T. Entrega",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 60,
        "splitNumber": 12,
        "axisLine": {
          "lineStyle": {
            "color": [[0.6667, "#55BF3B"], [0.8333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(avg(t_total), 2)",
      "sufijo": " hr.",
      "titulo": "T. Total",
      "tituloTooltip": "",
      "grafico": {
        "min": 0,
        "max": 72,
        "splitNumber": 9,
        "axisLine": {
          "lineStyle": {
            "color": [[0.1111, "#55BF3B"], [0.3333, "#DDDF0D"], [1, "#DF5353"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    }
  ],
  "modelo": {
    "tabla": "ra_promedio_de_tiempos_express",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'reservacion-avanzada-mazda', N'estancia-eficiencia-y-productividad', 4, N'{
  "titulo": "Estancia, eficiencia y productividad",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Técnico",
          "campo": "tecnico",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "T. Disponible (hr.)",
          "campo": "t_disponible",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Asignado (hr.)",
          "campo": "t_asignado",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Improductivo (hr.)",
          "campo": "t_improductivo",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "T. Real (hr.)",
          "campo": "t_real",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Estancia",
          "campo": "raw{sum(t_real)/nullif(sum(t_disponible),0)",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00%",
          "_className": "text-right"
        },
        {
          "nombre": "Eficiencia",
          "campo": "referencia{{1}/nullif({3},0)",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00%",
          "_className": "text-right"
        },
        {
          "nombre": "Productividad",
          "campo": "referencia{{1}/nullif({0},0)",
          "puedeAgregar": true,
          "agregacion": "avg(",
          "formato": "0.00%",
          "_className": "text-right"
        }
      ]
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(isnull(avg(t_real/nullif(t_disponible, 0)), 0) * 100, 2)",
      "sufijo": "%",
      "titulo": "Estancia",
      "tituloTooltip": "Estancia = Real / Disponible",
      "grafico": {
        "min": 0,
        "max": 100,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.8, "#DF5353"], [0.9, "#DDDF0D"], [1, "#55BF3B"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(isnull(avg(t_asignado/nullif(t_real, 0)), 0) * 100, 2)",
      "sufijo": "%",
      "titulo": "Eficiencia",
      "tituloTooltip": "Eficiencia = Asignado / Real",
      "grafico": {
        "min": 0,
        "max": 200,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.4, "#DF5353"], [0.5, "#DDDF0D"], [0.5, "#55BF3B"], [1, "#3A55BF"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    },
    {
      "layout": {
        "s": 2
      },
      "altura": "190px",
      "tipo": "gauge",
      "valor": "round(isnull(avg(t_asignado/nullif(t_disponible, 0)), 0) * 100, 2)",
      "sufijo": "%",
      "titulo": "Productividad",
      "tituloTooltip": "Productividad = Asignado / Disponible",
      "grafico": {
        "min": 0,
        "max": 150,
        "splitNumber": 10,
        "axisLine": {
          "lineStyle": {
            "color": [[0.5333, "#DF5353"], [0.6667, "#DDDF0D"], [1, "#55BF3B"]],
            "width": 15
          }
        },
        "splitLine": {
          "length": 15
        },
        "detail": {
          "fontSize": 15
        },
        "tooltip": {
          "position": "right"
        }
      }
    }
  ],
  "modelo": {
    "tabla": "ra_estancia_eficiencia_y_productividad",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'ri', N'porcentaje-uso', 1, N'{
  "titulo": "Porcentaje Recepcion Interactiva",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "nombre_asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "No. Orden",
          "campo": "no_orden",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [
       
    ],
      "valores": [
        {
					"nombre": "No. Placas",
					"campo": "no_placas",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Cant. Total",
					"campo": "cantidad",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
					"nombre": "Cant. RI",
					"campo": "ri_cantidad",
					"puedeAgregar": true,
					"agregacion": "sum(",
					"formato": null,
					"_className": "text-right"
        },
        {
                    "nombre": "% con RI",
                    "campo": "raw{((sum(ri_cantidad)+.00)/(sum(cantidad)+.00))",
                    "puedeAgregar": true,
                    "agregacion": null,
                    "formato": "0.00%",
                    "_className": "text-right"
        },
        {
					"nombre": "Kilometraje",
					"campo": "kilometraje",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": "#,###,##0",
					"_className": "text-right"
        },
        {
					"nombre": "Hora de inicio",
					"campo": "hora_inicio",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": "HH:mm:ss",
					"_className": "text-right"
        },
        {
					"nombre": "Hora de fin",
					"campo": "hora_fin",
					"puedeAgregar": false,
					"agregacion": null,
					"formato": "HH:mm:ss",
					"_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "ri_porcentaje_uso",
    "condiciones": [],
    "timeout": 600
  }
}

')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'ssl', N'estado-de-las-ordenes', 1, N'{
  "$schema": "./kpi.schema.json",
  "titulo": "Estado de las ordenes",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "No. Orden",
          "campo": "no_orden",
          "formato": null,
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Cant. Ordenes",
          "campo": "no_orden",
          "puedeAgregar": true,
          "agregacion": "count(distinct ",
          "formato": "#,###,##0",
          "_className": "text-right"
        },
        {
          "nombre": "Cant. Ord. con Seguimiento",
          "campo": "con_seguimiento",
          "puedeAgregar": true,
          "agregacion": "count(distinct ",
          "formato": "#,###,##0",
          "_className": "text-right"
        },
        {
          "nombre": "T. Conversión",
          "campo": "raw{count(distinct con_seguimiento)/nullif(count(distinct no_orden)+0.0,0)",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00%",
          "_className": "text-right"
        },
        {
          "nombre": "Monto Ref.",
          "campo": "precio_ref",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "#,###,##0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Monto MO",
          "campo": "precio_mo",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "#,###,##0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Monto Total",
          "campo": "precio",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "#,###,##0.00",
          "_className": "text-right"
        },
        {
          "nombre": "Monto Total Autorizado",
          "campo": "precio_autorizado",
          "puedeAgregar": true,
          "agregacion": "sum(",
          "formato": "#,###,##0.00",
          "_className": "text-right"
        },
        {
          "nombre": "% Autorizado",
          "campo": "raw{sum(precio_autorizado)/nullif(sum(precio), 0)",
          "puedeAgregar": true,
          "agregacion": null,
          "formato": "0.00%",
          "_className": "text-right"
        },
        {
          "nombre": "Respuesta",
          "campo": "respuesta",
          "puedeAgregar": false,
          "formato": null
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "ssl_estado_de_las_ordenes",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [kpis].[kpis] ([categoria], [id], [orden], [definicion]) VALUES (N'ssl', N'estado-de-los-seguimientos', 2, N'{
  "$schema": "./kpi.schema.json",
  "titulo": "Estado de los seguimientos",
  "layout": "flow",
  "elementos": [
    {
      "layout": {
        "s": 12
      },
      "tipo": "tabla",
      "filas": [
        {
          "nombre": "Año",
          "campo": "anio",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Mes",
          "campo": "mes",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "Tipo",
          "campo": "tipo",
          "formato": null
        },
        {
          "nombre": "Asesor",
          "campo": "asesor",
          "formato": null
        },
        {
          "nombre": "Día",
          "campo": "dia",
          "formato": null,
          "_type": "num"
        },
        {
          "nombre": "No. Orden",
          "campo": "no_orden",
          "formato": null,
          "link": {
            "blank": true,
            "externo": false,
            "url": "raw{max(concat(''ssl/asesor/sucursal/{idSucursal}/orden/'', no_orden, ''/checklist/'', id_lista, ''\\?exitIfOpener&columnas=%5B%22!rvt%22%5D''))"
          },
          "_type": "num"
        }
      ],
      "columnas": [],
      "valores": [
        {
          "nombre": "Cant. Ordenes",
          "campo": "no_orden",
          "puedeAgregar": true,
          "agregacion": "count(",
          "formato": "#,###,##0",
          "_className": "text-right"
        }
      ]
    }
  ],
  "modelo": {
    "tabla": "ssl_estado_de_los_seguimientos",
    "condiciones": [],
    "timeout": 600
  }
}
')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (1, N'Audi Santa Fe', N'Audi Santa Fe', N'Audi', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (2, N'Automotores de León', N'Automotores de León', N'Automotores', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (3, N'Autonal La Felicidad', N'Autonal La Felicidad', N'Autonal', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (4, N'BMW Aguascalientes', N'BMW Aguascalientes', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (5, N'BMW Autobahn Interlomas', N'BMW Autobahn Interlomas', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (6, N'BMW Autowelt', N'BMW Autowelt', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (7, N'BMW Caletto Motors SLP', N'BMW Caletto Motors SLP', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (8, N'BMW Cancún', N'BMW Cancún', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (9, N'BMW Carmen Motors', N'BMW Carmen Motors', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (10, N'BMW Cever San Antonio', N'BMW Cever San Antonio', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (11, N'BMW Coapa Motors', N'BMW Coapa Motors', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (12, N'BMW Euromotors de Monterrey', N'BMW Euromotors de Monterrey', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (13, N'BMW Esmeralda Motors', N'BMW Esmeralda Motors', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (14, N'BMW Guadalajara', N'BMW Guadalajara', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (15, N'BMW Imagen Motors', N'BMW Imagen Motors', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (16, N'BMW León', N'BMW León', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (17, N'BMW Lerma', N'BMW Lerma', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (18, N'BMW Mérida', N'BMW Mérida', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (19, N'BMW Momentum Satélite', N'BMW Momentum Satélite', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (20, N'BMW München Motors Santa Fé', N'BMW München Motors Santa Fé', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (21, N'BMW Premier Valle', N'BMW Premier Valle', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (22, N'BMW Queretaro', N'BMW Queretaro', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (23, N'BMW Qro Suc Juriquilla', N'BMW Qro Suc Juriquilla', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (24, N'BMW Río Mayo Cuernavaca Morelos', N'BMW Río Mayo Cuernavaca Morelos', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (25, N'BMW Servicio Central Polanco', N'BMW Servicio Central Polanco', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (26, N'BMW VECSA Puebla', N'BMW VECSA Puebla', N'BMW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (27, N'Baic Puebla', N'Baic Puebla', N'Baic', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (28, N'Buick GMC Irapuato', N'Buick GMC Irapuato', N'Buick', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (29, N'Buick GMC León', N'Buick GMC León', N'Buick', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (30, N'Camiones Aeropuerto', N'Camiones Aeropuerto', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (31, N'Camiones Astrocamiones', N'Camiones Astrocamiones', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (32, N'Camiones Hino', N'Camiones Hino', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (33, N'Camiones León', N'Camiones León', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (34, N'Camiones MBenz-Chihuahuenses', N'Camiones MBenz-Chihuahuenses', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (35, N'Camiones M Benz-Vallejo', N'Camiones M Benz-Vallejo', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (36, N'Camiones Mercedes Benz-Del GOLFO', N'Camiones Mercedes Benz-Del GOLFO', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (37, N'Camiones Monterrey', N'Camiones Monterrey', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (38, N'Camiones Rivera', N'Camiones Rivera', N'Camiones', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (39, N'Can-Am Ssandier', N'Can-Am Ssandier', N'Can', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (40, N'Chevrolet Autos GP', N'Chevrolet Autos GP', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (41, N'Chevrolet Campestre', N'Chevrolet Campestre', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (42, N'Chevrolet Campestre Suc LAGOS', N'Chevrolet Campestre Suc LAGOS', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (43, N'Chevrolet Del Parque', N'Chevrolet Del Parque', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (44, N'Chevrolet DIAUTOS Ver', N'Chevrolet DIAUTOS Ver', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (45, N'Chevrolet SS Qro', N'Chevrolet SS Qro', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (46, N'Chevrolet SuperMotors', N'Chevrolet SuperMotors', N'Chevrolet', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (47, N'Chrysler Automotores de León', N'Chrysler Automotores de León', N'Chrysler', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (48, N'Chrysler Automotores Guanajuato', N'Chrysler Automotores Guanajuato', N'Chrysler', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (49, N'Chrysler Autos Finos de Irapuato', N'Chrysler Autos Finos de Irapuato', N'Chrysler', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (50, N'Chrysler Syscmotors GDL', N'Chrysler Syscmotors GDL', N'Chrysler', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (51, N'Chrysler Zaragoza', N'Chrysler Zaragoza', N'Chrysler', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (52, N'Christian Automotors', N'Christian Automotors', N'Christian', NULL, N'Bolivia')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (53, N'Derco Janna', N'Derco Janna', N'Derco', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (54, N'Flecha Roja-Taller V C', N'Flecha Roja-Taller V C', N'Flecha', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (55, N'Ford Aguascalientes', N'Ford Aguascalientes', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (56, N'Ford Alden Condesa', N'Ford Alden Condesa', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (57, N'Ford Alden Cuauhtémoc', N'Ford Alden Cuauhtémoc', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (58, N'Ford Alden Tlalpan', N'Ford Alden Tlalpan', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (59, N'Ford Autoland Bogotá', N'Ford Autoland Bogotá', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (60, N'Ford Caborca', N'Ford Caborca', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (61, N'Ford Christian Motors Busch', N'Ford Christian Motors Busch', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (62, N'Ford Christian Motors Cochabamba', N'Ford Christian Motors Cochabamba', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (63, N'Ford Christian Motors Norte', N'Ford Christian Motors Norte', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (64, N'Ford Comagro Quick Lane', N'Ford Comagro Quick Lane', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (65, N'Ford Country Motors', N'Ford Country Motors', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (66, N'Ford Country Zoo Motors', N'Ford Country Zoo Motors', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (67, N'Ford Cumbres', N'Ford Cumbres', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (68, N'Ford Jalbra Cholula', N'Ford Jalbra Cholula', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (69, N'Ford Jalbra Puebla', N'Ford Jalbra Puebla', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (70, N'Ford Janna Motor Cartagena', N'Ford Janna Motor Cartagena', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (71, N'Ford Janna Motor Santa Marta', N'Ford Janna Motor Santa Marta', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (72, N'Ford Janna Motor Valledupar', N'Ford Janna Motor Valledupar', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (73, N'Ford JC Colombia', N'Ford JC Colombia', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (74, N'Ford Jorge Cortes Morato', N'Ford Jorge Cortes Morato', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (75, N'Ford Mexicali', N'Ford Mexicali', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (76, N'Ford Monterrey', N'Ford Monterrey', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (77, N'Ford Sánchez Automotriz', N'Ford Sánchez Automotriz', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (78, N'Ford Satélite', N'Ford Satélite', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (79, N'Ford Vehículos del Camino', N'Ford Vehículos del Camino', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (80, N'Ford Vehículos del Camino Torre', N'Ford Vehículos del Camino Torre', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (81, N'Ford Z Atizapán', N'Ford Z Atizapán', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (82, N'Ford Z Pachuca', N'Ford Z Pachuca', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (83, N'Ford Z Texcoco', N'Ford Z Texcoco', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (84, N'Ford Z Tlalnepantla', N'Ford Z Tlalnepantla', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (85, N'Ford Z Tula', N'Ford Z Tula', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (86, N'GM Campestre León', N'GM Campestre León', N'GM', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (87, N'Grupo Alden', N'Grupo Alden', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (88, N'Grupo BMW', N'Grupo BMW', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (89, N'Grupo Ford', N'Grupo Ford', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (90, N'Grupo Jaguar', N'Grupo Jaguar', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (91, N'Grupo KIA', N'Grupo KIA', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (92, N'Grupo Mazda México', N'Grupo Mazda México', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (93, N'Grupo Satélite', N'Grupo Satélite', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (94, N'Grupo Zanella', N'Grupo Zanella', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (95, N'Grupo Zapata', N'Grupo Zapata', N'Grupo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (96, N'Honda Aguascalientes', N'Honda Aguascalientes', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (97, N'Honda Argenta', N'Honda Argenta', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (98, N'Honda Ecatepec', N'Honda Ecatepec', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (99, N'Honda La Villa', N'Honda La Villa', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (100, N'Honda Pachuca', N'Honda Pachuca', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (101, N'Honda Santa Clara', N'Honda Santa Clara', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (102, N'Honda Vallejo', N'Honda Vallejo', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (103, N'Honda Zacatecas', N'Honda Zacatecas', N'Honda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (104, N'Hyundai Hamke Pachuca', N'Hyundai Hamke Pachuca', N'Hyundai', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (105, N'Hyundai León', N'Hyundai León', N'Hyundai', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (106, N'Hyundai Lomas Verdes', N'Hyundai Lomas Verdes', N'Hyundai', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (107, N'Hyundai Madiautos', N'Hyundai Madiautos', N'Hyundai', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (108, N'Hyundai Querétaro', N'Hyundai Querétaro', N'Hyundai', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (109, N'Jaguar Cuajimalpa', N'Jaguar Cuajimalpa', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (110, N'Jaguar Culiacán', N'Jaguar Culiacán', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (111, N'Jaguar Gdl', N'Jaguar Gdl', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (112, N'Jaguar León', N'Jaguar León', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (113, N'Jaguar Laguna Torreón Surman', N'Jaguar Laguna Torreón Surman', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (114, N'Jaguar Mérida', N'Jaguar Mérida', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (115, N'Jaguar LR-MTY', N'Jaguar LR-MTY', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (116, N'Jaguar Pedregal', N'Jaguar Pedregal', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (117, N'Jaguar Puebla', N'Jaguar Puebla', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (118, N'Jaguar San Luis', N'Jaguar San Luis', N'Jaguar', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (119, N'KIA Aeropuerto', N'KIA Aeropuerto', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (120, N'KIA Coapa', N'KIA Coapa', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (121, N'KIA Cuautitlán I', N'KIA Cuautitlán I', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (122, N'KIA Galerias', N'KIA Galerias', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (123, N'KIA Linda Vista Mty', N'KIA Linda Vista Mty', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (124, N'KIA Patria', N'KIA Patria', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (125, N'KIA Queretaro', N'KIA Queretaro', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (126, N'KIA Satélite', N'KIA Satélite', N'KIA', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (127, N'Mazda Acapulco', N'Mazda Acapulco', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (128, N'Mazda Acueducto', N'Mazda Acueducto', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (129, N'Mazda Aguascalientes', N'Mazda Aguascalientes', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (130, N'Mazda Alciautos Bogotá', N'Mazda Alciautos Bogotá', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (131, N'Mazda Américas', N'Mazda Américas', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (132, N'Mazda Angelopolis', N'Mazda Angelopolis', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (133, N'Mazda Autobol Col', N'Mazda Autobol Col', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (134, N'Mazda Autocorp', N'Mazda Autocorp', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (135, N'Mazda Automontaña Col', N'Mazda Automontaña Col', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (136, N'Mazda Barrancabermeja', N'Mazda Barrancabermeja', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (137, N'Mazda Campeche', N'Mazda Campeche', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (138, N'Mazda Cancún', N'Mazda Cancún', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (139, N'Mazda Carmen', N'Mazda Carmen', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (140, N'Mazda Carrazos', N'Mazda Carrazos', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (141, N'Mazda CasaToro Calle 155', N'Mazda CasaToro Calle 155', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (142, N'Mazda CasaToro Carrera 50', N'Mazda CasaToro Carrera 50', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (143, N'Mazda CasaToro Ibague', N'Mazda CasaToro Ibague', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (144, N'Mazda CasaToro Neiva', N'Mazda CasaToro Neiva', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (145, N'Mazda CasaToro Villavicencio', N'Mazda CasaToro Villavicencio', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (146, N'Mazda Celaya', N'Mazda Celaya', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (147, N'Mazda Chiapas', N'Mazda Chiapas', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (148, N'Mazda Chihuahua', N'Mazda Chihuahua', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (149, N'Mazda Colalutos Manizales', N'Mazda Colalutos Manizales', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (150, N'Mazda Collision Center Zapata', N'Mazda Collision Center Zapata', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (151, N'Mazda Churubusco', N'Mazda Churubusco', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (152, N'Mazda Ciudad Juárez', N'Mazda Ciudad Juárez', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (153, N'Mazda Coatzacoalcos', N'Mazda Coatzacoalcos', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (154, N'Mazda Colima', N'Mazda Colima', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (155, N'Mazda Colombia', N'Mazda Colombia', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (156, N'Mazda Cuautitlán I', N'Mazda Cuautitlán I', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (157, N'Mazda Cúcuta', N'Mazda Cúcuta', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (158, N'Mazda Culiacán', N'Mazda Culiacán', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (159, N'Mazda Cumbres', N'Mazda Cumbres', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (160, N'Mazda Durango', N'Mazda Durango', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (161, N'Mazda Galerías', N'Mazda Galerías', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (162, N'Mazda Germania Col', N'Mazda Germania Col', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (163, N'Mazda Gonzalitos', N'Mazda Gonzalitos', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (164, N'Mazda Hermosillo', N'Mazda Hermosillo', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (165, N'Mazda Juárez', N'Mazda Juárez', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (166, N'Mazda Janna M Country', N'Mazda Janna M Country', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (167, N'Mazda Janna Motors', N'Mazda Janna Motors', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (168, N'Mazda Jorge Cortés', N'Mazda Jorge Cortés', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (169, N'Mazda Kyoto', N'Mazda Kyoto', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (170, N'Mazda Las Torres', N'Mazda Las Torres', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (171, N'Mazda Laguna', N'Mazda Laguna', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (172, N'Mazda Lindavista DF', N'Mazda Lindavista DF', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (173, N'Mazda Lindavista-MTY', N'Mazda Lindavista-MTY', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (174, N'Mazda Madiautos Bogota', N'Mazda Madiautos Bogota', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (175, N'Mazda Manzanillo', N'Mazda Manzanillo', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (176, N'Mazda Mayorautos', N'Mazda Mayorautos', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (177, N'Mazda Mazco Bogota', N'Mazda Mazco Bogota', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (178, N'Mazda Mazco Cali', N'Mazda Mazco Cali', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (179, N'Mazda Metepec', N'Mazda Metepec', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (180, N'Mazda Mexicali', N'Mazda Mexicali', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (181, N'Mazda Monclova', N'Mazda Monclova', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (182, N'Mazda Motovalle', N'Mazda Motovalle', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (183, N'Mazda Neiva', N'Mazda Neiva', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (184, N'Mazda Oaxaca', N'Mazda Oaxaca', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (185, N'Mazda Obregón', N'Mazda Obregón', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (186, N'Mazda Picacho Cuernavaca', N'Mazda Picacho Cuernavaca', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (187, N'Mazda Picacho DF', N'Mazda Picacho DF', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (188, N'Mazda Piedras Negras', N'Mazda Piedras Negras', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (189, N'Mazda Plascencia-Gdl', N'Mazda Plascencia-Gdl', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (190, N'Mazda Puerto Vallarta', N'Mazda Puerto Vallarta', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (191, N'Mazda Queretaro', N'Mazda Queretaro', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (192, N'Mazda Ral Bajío', N'Mazda Ral Bajío', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (193, N'Mazda Ral Sur', N'Mazda Ral Sur', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (194, N'Mazda Ral Tlahuac', N'Mazda Ral Tlahuac', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (195, N'Mazda Ravisa Coacalco', N'Mazda Ravisa Coacalco', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (196, N'Mazda Ravisa Morelia', N'Mazda Ravisa Morelia', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (197, N'Mazda Ravisa Uruapan', N'Mazda Ravisa Uruapan', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (198, N'Mazda Reynosa', N'Mazda Reynosa', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (199, N'Mazda Salamanca', N'Mazda Salamanca', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (200, N'Mazda Saltillo', N'Mazda Saltillo', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (201, N'Mazda San Luis P', N'Mazda San Luis P', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (202, N'Mazda Santa Anita', N'Mazda Santa Anita', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (203, N'Mazda Santa Fe', N'Mazda Santa Fe', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (204, N'Mazda Santa Marta CM', N'Mazda Santa Marta CM', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (205, N'Mazda Serdán', N'Mazda Serdán', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (206, N'Mazda Sureste', N'Mazda Sureste', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (207, N'Mazda Tabasco', N'Mazda Tabasco', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (208, N'Mazda Tampico', N'Mazda Tampico', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (209, N'Mazda Tepic', N'Mazda Tepic', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (210, N'Mazda Tijuana', N'Mazda Tijuana', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (211, N'Mazda Tlalnepantla', N'Mazda Tlalnepantla', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (212, N'Mazda Torre Norte', N'Mazda Torre Norte', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (213, N'Mazda Valledupar', N'Mazda Valledupar', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (214, N'Mazda Valle Oriente', N'Mazda Valle Oriente', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (215, N'Mazda Vardi', N'Mazda Vardi', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (216, N'Mazda Vehículos del Camino', N'Mazda Vehículos del Camino', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (217, N'Mazda Vehículos del Camino Llano Grande', N'Mazda Vehículos del Camino Llano Grande', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (218, N'Mazda Veracruz', N'Mazda Veracruz', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (219, N'Mazda Xalapa', N'Mazda Xalapa', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (220, N'Mazda Zacatecas', N'Mazda Zacatecas', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (221, N'Mercedez Benz-Vallejo', N'Mercedez Benz-Vallejo', N'Mercedez', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (222, N'Mitsubishi León', N'Mitsubishi León', N'Mitsubishi', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (223, N'Nissan Daosa Country', N'Nissan Daosa Country', N'Nissan', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (224, N'Nissan Daosa Vallarta', N'Nissan Daosa Vallarta', N'Nissan', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (225, N'Nissan Ecatepec', N'Nissan Ecatepec', N'Nissan', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (226, N'Nissan Ecatepec_HyP', N'Nissan Ecatepec_HyP', N'Nissan', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (227, N'Nissan Geisha-Cuitláhuac', N'Nissan Geisha-Cuitláhuac', N'Nissan', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (228, N'Peugeot Lomas Verdes', N'Peugeot Lomas Verdes', N'Peugeot', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (229, N'Peugeot Querétaro', N'Peugeot Querétaro', N'Peugeot', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (230, N'Renault Aeropuerto', N'Renault Aeropuerto', N'Renault', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (231, N'Renault Cuautitlan', N'Renault Cuautitlan', N'Renault', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (232, N'Renault Queretaro', N'Renault Queretaro', N'Renault', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (233, N'Renault Sátelite', N'Renault Sátelite', N'Renault', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (234, N'Renault Tlalnepantla', N'Renault Tlalnepantla', N'Renault', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (235, N'Seat Apizaco', N'Seat Apizaco', N'Seat', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (236, N'Seat Autoforum Puebla', N'Seat Autoforum Puebla', N'Seat', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (237, N'Seat Autoforum Veracruz', N'Seat Autoforum Veracruz', N'Seat', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (238, N'Seat Santa Fe', N'Seat Santa Fe', N'Seat', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (239, N'Seat Tehuacan', N'Seat Tehuacan', N'Seat', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (240, N'Suzuki Aeropuerto', N'Suzuki Aeropuerto', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (241, N'Suzuki Cuernavaca', N'Suzuki Cuernavaca', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (242, N'Suzuki López Mateos', N'Suzuki López Mateos', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (243, N'Suzuki Polanco', N'Suzuki Polanco', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (244, N'Suzuki Sátelite', N'Suzuki Sátelite', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (245, N'Suzuki Tlalnepantla', N'Suzuki Tlalnepantla', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (246, N'Suzuki Toluca', N'Suzuki Toluca', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (247, N'Suzuki Vallarta', N'Suzuki Vallarta', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (248, N'Suzuki Vehículos del Camino Medellin', N'Suzuki Vehículos del Camino Medellin', N'Suzuki', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (249, N'Toyota Acueducto', N'Toyota Acueducto', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (250, N'Toyota Angelopolis-Puebla', N'Toyota Angelopolis-Puebla', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (251, N'Toyota Bajío', N'Toyota Bajío', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (252, N'Toyota Colima', N'Toyota Colima', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (253, N'Toyota Country', N'Toyota Country', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (254, N'Toyota Cuautitlán', N'Toyota Cuautitlán', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (255, N'Toyota Guanajuato', N'Toyota Guanajuato', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (256, N'Toyota Irapuato', N'Toyota Irapuato', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (257, N'Toyota Lomas Verdes', N'Toyota Lomas Verdes', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (258, N'Toyota Polanco', N'Toyota Polanco', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (259, N'Toyota Querétaro', N'Toyota Querétaro', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (260, N'Toyota Satélite', N'Toyota Satélite', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (261, N'Toyota Sur', N'Toyota Sur', N'Toyota', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (262, N'Volvo Autonal', N'Volvo Autonal', N'Volvo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (263, N'Volvo Suecia Car León', N'Volvo Suecia Car León', N'Volvo', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (264, N'VW Auto Blitz', N'VW Auto Blitz', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (265, N'VW Alden Vallejo', N'VW Alden Vallejo', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (266, N'VW Aldyxa', N'VW Aldyxa', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (267, N'VW Autonal', N'VW Autonal', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (268, N'VW Europremium', N'VW Europremium', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (269, N'VW Naucalpan', N'VW Naucalpan', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (270, N'VW Pachuca', N'VW Pachuca', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (271, N'VW Z Motors México', N'VW Z Motors México', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (272, N'VW Z Motors Puebla', N'VW Z Motors Puebla', N'VW', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (273, N'Agencias Suzuki', N'Agencias Suzuki', N'Agencias', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (274, N'Mazda Mazautos', N'Mazda Mazautos', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (275, N'Mazda Valledupar', N'Mazda Valledupar', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (276, N'Ford Motovalle', N'Ford Motovalle', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (277, N'Mazda Pasto', N'Mazda Pasto', N'Mazda', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (278, N'Ford Pasto', N'Ford Pasto', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (279, N'Ford Autonal', N'Ford Autonal', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios] ([id], [nombre], [grupo], [marca], [id_consultor_redmine], [pais]) VALUES (280, N'Ford Comagro', N'Ford Comagro', N'Ford', NULL, N'México')
GO
INSERT [ma].[concesionarios_contactos] ([id_concesionario], [nombre], [cargo], [telefono], [email], [externo]) VALUES (1, N'Angel', N'Prueba', NULL, N'desarrollo@capitalnetwork.com.mx', 1)
GO
INSERT [ma].[concesionarios_contactos] ([id_concesionario], [nombre], [cargo], [telefono], [email], [externo]) VALUES (1, N'Angel', N'Prueba', NULL, N'desarrollo@capitalnetwork.com.mx', 0)
GO
INSERT [ma].[concesionarios_contactos] ([id_concesionario], [nombre], [cargo], [telefono], [email], [externo]) VALUES (1, N'José', N'Prueba', NULL, N'jose.sanchez@capitalnetwork.com.mx', 1)
GO
INSERT [ma].[concesionarios_contactos] ([id_concesionario], [nombre], [cargo], [telefono], [email], [externo]) VALUES (1, N'José', N'Prueba', NULL, N'jose.sanchez@capitalnetwork.com.mx', 0)
GO
SET IDENTITY_INSERT [ma].[evidencias] ON 
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (1, 6, N'2019-09-19/b22c229dd35f47efa107d57aedb9fb18.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (2, 6, N'2019-09-19/cf10d99277d1462984e7fa95b8467f77.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (3, 7, N'2019-09-23/e015559787d646d4ae2d384409e6f2f8.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (4, 7, N'2019-09-23/06aed1902986462b9983fbde58ccff55.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (5, 8, N'2019-09-25/ca3eace2f27644f2958429410a471795.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (6, 8, N'2019-09-25/b2dd6d0ae9c74b10829833e7105238ff.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (7, 8, N'2019-09-25/86cd5c60ea3d497e8bcf22ab74c5498b.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (8, 9, N'2019-09-25/f752bfeb959d4531ad05bb072b43a082.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (9, 9, N'2019-09-25/6e6ec9a69fe04948a5935f7ec70ee651.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (10, 10, N'2019-10-03/857fb64ece824190ba243031be1d21f9.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (11, 11, N'2019-10-03/c135b0839c2447438bf70fac2908618b.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (12, 11, N'2019-10-03/bd2632fc7c424c4287f1e0a505788ae9.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (13, 12, N'2019-10-03/2d2fe689666c4318893f0853540e8235.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (14, 12, N'2019-10-03/7ed5bba90195481380509223be46daa9.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (15, 12, N'2019-10-03/1cb0e30686a24c639c2f57fa54d2c679.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (16, 13, N'2019-10-03/087caa9a957e402e8a997c7d55b89da4.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (17, 14, N'2019-10-03/ca2177d93eaf4134aeabc4356d52a797.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (18, 14, N'2019-10-03/3e43f4f3b0e54fcd8b0d3cfceb5b6af6.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (19, 14, N'2019-10-03/7e5ac65316a045dda1ea27e69be6ba64.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (20, 15, N'2019-10-03/5d1aadaf110345ff95400828efefca4b.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (21, 15, N'2019-10-03/9848ae0476eb41bf95e7c04cfa2738f1.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (22, 16, N'2019-10-03/cddb720f30f14325b8239ba7888933f0.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (23, 16, N'2019-10-03/1a7050cc1ab54129adbae038899e6fd1.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (24, 16, N'2019-10-03/21066654c92e4874a91b09fa58f4c79d.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (25, 17, N'2019-10-03/39fecc465ee8407eb24ff6e5cbb724fa.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (26, 17, N'2019-10-03/94a4630ce96d4c668b48d045c615ed2f.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (27, 18, N'2019-10-03/35cf7d36b7164473bcc154abb4d15916.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (28, 18, N'2019-10-03/6e5388681c944db29e82bd7fa492209f.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (29, 18, N'2019-10-03/5270f1e39a1f41bf956c0d51e531ef23.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (30, 19, N'2019-10-03/9acfcb45e26c496ba06eeceba018db4f.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (31, 19, N'2019-10-03/f1cc3c584c594a9b892ac0c63435affe.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (32, 20, N'2019-10-04/e918cf41e3b2488dbfba961d5307dae2.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (33, 21, N'2019-10-05/e09371a346ab4894a3ab0d1f2350c374.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (34, 22, N'2019-10-05/b8c73073fe2f468fb3d0ba5ccca62556.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (35, 23, N'2019-10-05/136d8fa2f22246d9a34a0d100b52ae22.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (36, 24, N'2019-10-05/8105a55fe469409db5dd9ba26a7f497f.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (37, 25, N'2019-10-05/2b56e5fa1762415f8de59f2136368ae4.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (38, 25, N'2019-10-05/fc5f9b1e43bf4b66a0a1892316edc6b3.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (39, 26, N'2019-10-19/66c8f831460d45a68c32399b9824d6a1.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (40, 28, N'2019-10-26/9a3e33fe3d82486c9cfa155f5229555c.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (41, 28, N'2019-10-26/fda27b0eda1346b09d47363d37f100c4.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (42, 31, N'2019-11-02/a566d575ed514b6090c67c1ccbcae3b2.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (43, 32, N'2019-11-02/ae1c7f7fd973426a81dff28f99f98c3a.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (44, 32, N'2019-11-02/8d834d4458574ebb812e363a77539529.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (45, 32, N'2019-11-02/b509195221fd43e7ba1250e26926dc32.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (46, 33, N'2019-11-02/51b2899e1ca84fb98432e36d3131cea3.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (47, 33, N'2019-11-02/ca455cd1614549b6bb6b69a3d5a6999a.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (48, 34, N'2019-11-05/38c560ea1fcb4012b35fe30da967146b.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (49, 34, N'2019-11-05/3d780ce0f59d4b71b81a8a72e825f7c3.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (50, 34, N'2019-11-05/7c34212baf0b4d4f85e3c7636c1760b9.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (51, 35, N'2019-11-05/ef3e4d4a014d4a1fae234254afffaf69.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (52, 35, N'2019-11-05/42c08bb626024fbdaed6c8f3d02ac0ac.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (53, 35, N'2019-11-05/7a6cbe4ce10640bd87feebbca0608658.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (54, 36, N'2019-11-05/57a88251d0484e399a516dbb3129d31a.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (55, 36, N'2019-11-05/1d86e5af355940eda56a337c593bbab8.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (56, 36, N'2019-11-05/26b1ea5b71f1405a9091ea566a162061.jpeg')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (57, 37, N'2019-11-07/ebc366d91bfe4a3b8f32a0ca05917951.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (58, 37, N'2019-11-07/56bed262ccff43fd9eec0fd5a0e6b8dc.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (59, 37, N'2019-11-07/c5601feee864474a93f6ac84959b569f.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (60, 38, N'2019-11-07/83c337ebb6bb4fddbb75b833c948adc2.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (61, 38, N'2019-11-07/97f0814fba874cd58a91859b8216d81b.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (62, 38, N'2019-11-07/96241ddfc28746deae4d4a80151a8fdf.png')
GO
INSERT [ma].[evidencias] ([id], [id_solicitud], [ruta]) VALUES (63, 38, N'2019-11-07/c6c76c4b3e054b25aeb06d56422d4ca5.png')
GO
SET IDENTITY_INSERT [ma].[evidencias] OFF
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (1, N'Tablero', N' Recepción', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (2, N'Tablero', N' Recepción Asesores', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (3, N'Tablero', N' Recepción Pantalla de Bienvenida', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (4, N'Tablero', N' Citas Control Citas c Asesores', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (5, N'Tablero', N' Citas Prepicking', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (6, N'Tablero', N' Asesores Progreso de Trabajo', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (7, N'Tablero', N' Asesores Progreso y Entregas ', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (8, N'Tablero', N' Asesores Tablero Estados', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (9, N'Tablero', N' Técnicos Ausencias', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (10, N'Tablero', N' Técnicos Planeador ', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (11, N'Tablero', N' Técnicos Tablero de Calidad', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (12, N'Tablero', N' Pullsystem ', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (13, N'Tablero', N' Pullsystem Entregas', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (14, N'Tablero', N' Pullsystem Pantalla de Bienvenida', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (15, N'Tablero', N' Lavado Planeador', 1, 3)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (16, N'Tablero', N' Lavado', 1, 3)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (17, N'Tablero', N' Lavado Lista', 1, 3)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (18, N'Tablero', N' Configuración Permisos', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (19, N'Tablero', N' Configuración de Tableros', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (20, N'Tablero', N' Configuración Registro de Actividad', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (21, N'Tablero', N' Configuración Permisos chips', 1, 1)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (22, N'Tablero', N' KPI Servicio Express. Promedio de Tiempos', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (23, N'Tablero', N' KPI Promedio de Tiempos', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (24, N'Tablero', N' KPI Entradas al Taller', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (25, N'Tablero', N' KPI Tiempo Estancia', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (26, N'Tablero', N' KPI Estancia, Eficiencia y Productividad', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (27, N'Tablero', N' KPI Uso Tablero Inicio', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (28, N'Tablero', N' KPI Uso Tablero Fin', 1, 10)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (29, N'Tablero HyP (Collision)', N'Recepción', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (30, N'Tablero HyP (Collision)', N'Recepción Valuación ', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (31, N'Tablero HyP (Collision)', N'Técnicos Ausencias', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (32, N'Tablero HyP (Collision)', N'Técnicos Programación de Trabajo', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (33, N'Tablero HyP (Collision)', N'Técnicos Jefe de Taller', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (34, N'Tablero HyP (Collision)', N'Técnicos', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (35, N'Tablero HyP (Collision)', N'Técnicos Retrabajos', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (36, N'Tablero HyP (Collision)', N'Técnicos Detenidos', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (37, N'Tablero HyP (Collision)', N'Técnicos Lavado Planeador', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (38, N'Tablero HyP (Collision)', N'Técnicos Lavado', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (39, N'Tablero HyP (Collision)', N'Técnicos Tablero Estados', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (40, N'Tablero HyP (Collision)', N'Pullsystem ', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (41, N'CRM/CDN', N'Configuración CRM', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (42, N'CRM/CDN', N'Configuración General', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (43, N'CRM/CDN', N'Configuración Menú', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (44, N'CRM/CDN', N'Configuración Perfiles', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (45, N'CRM/CDN', N'Configuración Permisos', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (46, N'CRM/CDN', N'Configuración SSL', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (47, N'CRM/CDN', N'Configuración SSL PDF Checklist', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (48, N'CRM/CDN', N'Configuración Usuarios', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (49, N'CRM/CDN', N'Operativo', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (50, N'CRM/CDN', N'Quejas', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (51, N'CRM/CDN', N'Seguimiento de Citas', 4, 12)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (52, N'CRM/CDN', N'KPI Productividad', 4, 11)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (53, N'CRM/CDN', N'KPI Facturación Detallada', 4, 11)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (54, N'CRM/CDN', N'KPI Avance diario de Contacto', 4, 11)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (55, N'CRM/CDN', N'KPI Histórico de retención de Postventa - Nuevos', 4, 11)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (56, N'CRM/CDN', N'KPI Tasa del primer servicio de mantenimiento', 4, 11)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (57, N'CRM/CDN', N'KPI Estado de las Estrategias', 4, 11)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (58, N'CRM/CDN', N'CSL Administración', 4, 15)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (59, N'CRM/CDN', N'Dashboards', 4, 15)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (60, N'CRM/CDN', N'Otros Notificaciones', 4, 15)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (61, N'CRM/CDN', N'SSL Asesor ', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (62, N'CRM/CDN', N'SSL Control de Calidad', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (63, N'CRM/CDN', N'SSL Control de Calidad (Móvil)', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (64, N'CRM/CDN', N'SSL Gerente de Servicio', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (65, N'CRM/CDN', N'SSL Histórico de Presupuestos', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (66, N'CRM/CDN', N'SSL Jefe de Taller', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (67, N'CRM/CDN', N'SSL KPIs', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (68, N'CRM/CDN', N'SSL Refacciones', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (69, N'CRM/CDN', N'SSL Técnicos', 4, 17)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (70, N'Valuación HyP (Collision)', N'Usuarios', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (71, N'Valuación HyP (Collision)', N'Recepción Asesor', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (72, N'Valuación HyP (Collision)', N'Recepción Modificación de Información', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (73, N'Valuación HyP (Collision)', N'Recepción Recepción Asesor', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (74, N'Valuación HyP (Collision)', N'Recepción Ver Fotos Asesor', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (75, N'Valuación HyP (Collision)', N'Recepción Recepción Valuador', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (76, N'Valuación HyP (Collision)', N'Recepción Ver Fotos Valuador', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (77, N'Valuación HyP (Collision)', N'Valuación HyP', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (78, N'Valuación HyP (Collision)', N'Valuación Mecánica', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (79, N'Valuación HyP (Collision)', N'Valuación Descarga Completa', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (80, N'Valuación HyP (Collision)', N'Valuación WEB Asignación de MO', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (81, N'Valuación HyP (Collision)', N'Valuación WEB Envió Aseguradora', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (82, N'Valuación HyP (Collision)', N'Valuación WEB Aseguradora', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (83, N'Valuación HyP (Collision)', N'Refacciones Planear Refacciones', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (84, N'Valuación HyP (Collision)', N'Estatus Bitácora Patio', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (85, N'Valuación HyP (Collision)', N'Estatus Bitácora Calle', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (86, N'Valuación HyP (Collision)', N'Estatus Seguimiento', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (87, N'Valuación HyP (Collision)', N'Estatus', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (88, N'Valuación HyP (Collision)', N'Indicadores Tablero Aseguradoras', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (89, N'Valuación HyP (Collision)', N'Indicadores Tablero Recepción', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (90, N'Valuación HyP (Collision)', N'Indicadores Tablero Asesores', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (91, N'Valuación HyP (Collision)', N'Cotizados Agregar Refacciones', 6, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (92, N'Recepción Interactiva(RI)', N'Inicio de inventario ', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (93, N'Recepción Interactiva(RI)', N'Anexo comentarios', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (94, N'Recepción Interactiva(RI)', N'Visualización previa de Inventario', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (95, N'Recepción Interactiva(RI)', N'Firma Inventario', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (96, N'Recepción Interactiva(RI)', N'Vista evidencia Fotográfica', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (97, N'Recepción Interactiva(RI)', N'Firma Evidencia Fotográfica', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (98, N'Recepción Interactiva(RI)', N'Vista Orden Digital', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (99, N'Recepción Interactiva(RI)', N'Firma Orden Digital', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (100, N'Recepción Interactiva(RI)', N'Voz de Cliente', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (101, N'Recepción Interactiva(RI)', N'Firma Voz de cliente', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (102, N'Recepción Interactiva(RI)', N'Envió de Documentos', 4, 20)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (103, N'Tableros Mini', N'Inicio de operaciones', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (104, N'Tableros Mini', N'Detencion de Operacion', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (105, N'Tableros Mini', N'Finalizacion de Operacion', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (106, N'Tableros Mini', N'Check box de Envio a Calidad ', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (107, N'Tableros Mini', N'Orden Digital', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (108, N'Tableros Mini', N'Oasis Digital', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (109, N'Tableros Mini', N'Mltipuntos Calificación de punto', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (110, N'Tableros Mini', N'Mltipuntos Llenado de Cotizar Refacciones', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (111, N'Tableros Mini', N'Mltipuntos Toma de Evidencia Fotográfica', 1, NULL)
GO
INSERT [ma].[modulos] ([id], [categoria], [modulo], [id_proyecto_redmine], [id_categoria_redmine]) VALUES (112, N'Tableros Mini', N'Mltipuntos Guardado de Información ', 1, NULL)
GO
INSERT [ma].[motivos_cierre] ([id], [descripcion]) VALUES (N'1', N'Duda de Operación')
GO
INSERT [ma].[motivos_cierre] ([id], [descripcion]) VALUES (N'2', N'Error de Proceso')
GO
INSERT [ma].[motivos_cierre] ([id], [descripcion]) VALUES (N'3', N'Duda de Proceso')
GO
SET IDENTITY_INSERT [ma].[solicitudes] ON 
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (2, 1, 1, NULL, N'Duda de Proceso', 9590, N'asdfasdfasdf', N'1231234', N'12341234', N'sadf', CAST(N'2019-09-19T06:52:16.350' AS DateTime), CAST(N'2019-09-25T03:34:24.790' AS DateTime), N'aceptada', N'Hola mundo', NULL, N'Prueba 2')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (3, 1, 1, NULL, N'Error de Proceso', 9591, N'asdfasdfasdf', N'123123', N'12312312', N'asdf322134', CAST(N'2019-09-19T06:54:00.073' AS DateTime), CAST(N'2019-09-25T03:44:50.780' AS DateTime), N'aceptada', N'adfasdfasdf', NULL, N'asdasd')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (4, 1, 1, NULL, N'Error de Proceso', 9598, N'asdfasdfsdf', N'123123', N'123123', N'sadfasf23', CAST(N'2019-09-19T06:54:27.813' AS DateTime), CAST(N'2019-10-05T17:35:19.757' AS DateTime), N'aceptada', N'adfasdfasdf', NULL, N'asdasd')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (6, 1, 1, NULL, N'Error de Proceso', NULL, N'asdfasdfasdf', N'123123', N'432131', N'xcxvz233', CAST(N'2019-09-19T07:02:24.110' AS DateTime), CAST(N'2019-10-05T17:35:41.603' AS DateTime), N'cerrada', N'Prueba vue ', NULL, N'Prueba cierre')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (7, 2, 3, N'Manuel', N'Duda de Operación', NULL, N'asdfasdf', N'3123123', N'31234123', N'asdf33234', CAST(N'2019-09-23T00:52:21.490' AS DateTime), CAST(N'2019-11-08T01:37:18.350' AS DateTime), N'cerrada', N'Prueba vue', NULL, N'nbdfac')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (8, 1, 4, NULL, NULL, 9592, N'DESCRIOCION PRUEBA', N'1234123', N'42141234', N'sdkfjj34435', CAST(N'2019-09-25T04:09:40.207' AS DateTime), CAST(N'2019-09-25T04:10:14.313' AS DateTime), N'aceptada', N'Prueba imágenes', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (9, 1, 2, NULL, NULL, 9594, N'asdsaf', N'123123', N'1234234', N'214sggg', CAST(N'2019-09-25T04:25:51.993' AS DateTime), CAST(N'2019-09-25T04:55:03.600' AS DateTime), N'aceptada', N'Prueba imagenes 3', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (10, 1, 3, NULL, N'Error de Proceso', NULL, N'asdqwerwer', N'12312', N'123123', N'1242dsf', CAST(N'2019-10-03T20:37:47.370' AS DateTime), CAST(N'2019-10-03T21:26:23.650' AS DateTime), N'cerrada', N'Prueba', NULL, N'prueba cierre ')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (11, 1, 2, N'EldinV', NULL, NULL, N'asdfasdfasdf', N'12341234', N'12341234', N'asdf34', CAST(N'2019-10-03T20:38:21.350' AS DateTime), CAST(N'2019-10-03T20:38:21.350' AS DateTime), N'abierta', N'Prueba 2', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (12, 1, 4, NULL, NULL, NULL, N'ASDAsdASD', N'123123', N'123123', N'asdASD', CAST(N'2019-10-03T20:39:54.943' AS DateTime), CAST(N'2019-10-03T20:39:54.943' AS DateTime), N'abierta', N'Prueba alert ', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (13, 1, 3, NULL, NULL, NULL, N'fasdfasdf', N'123123', N'3123123', N'saD24234', CAST(N'2019-10-03T20:43:16.593' AS DateTime), CAST(N'2019-10-03T20:43:16.593' AS DateTime), N'abierta', N'Prueba dismiss ', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (14, 1, 2, NULL, NULL, 9595, N'sfdasdfsdf', N'123123', N'12341234', N'asdfsad234234', CAST(N'2019-10-03T20:46:39.953' AS DateTime), CAST(N'2019-10-03T21:18:27.937' AS DateTime), N'aceptada', N'Prueba dismiss 2', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (15, 1, 2, NULL, NULL, NULL, N'asdasd', N'123123', N'32213123', N'asdf23432', CAST(N'2019-10-03T20:48:34.237' AS DateTime), CAST(N'2019-10-03T20:48:34.237' AS DateTime), N'abierta', N'Prueba dismiss 3', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (16, 1, 1, NULL, NULL, NULL, N'asdfsdfasdf', N'123123123', N'1231231', N'asdfsd123213', CAST(N'2019-10-03T20:48:59.780' AS DateTime), CAST(N'2019-10-03T20:48:59.780' AS DateTime), N'abierta', N'Prueba dismiss 4', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (17, 1, 3, NULL, NULL, NULL, N'afasdfsadf', N'123123', N'4213412', N'asda2312312', CAST(N'2019-10-03T20:52:27.640' AS DateTime), CAST(N'2019-10-03T20:52:27.640' AS DateTime), N'abierta', N'Prueba dismiss 5', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (18, 1, 2, NULL, NULL, 9596, N'adfasdfsadf', N'123123', N'42141234', N'asdfsadf123123', CAST(N'2019-10-03T20:53:45.130' AS DateTime), CAST(N'2019-10-03T21:25:51.273' AS DateTime), N'aceptada', N'Prueba dismiss 6', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (19, 1, 4, NULL, N'Error de Proceso', NULL, N'asdfasdf', N'123123123', N'asdfs23123', N'afdasdf123123', CAST(N'2019-10-03T20:54:13.583' AS DateTime), CAST(N'2019-10-04T16:51:57.243' AS DateTime), N'cerrada', N'Prueba dismiss 7', NULL, N'El problema lo estará revisando el area de soporte')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (20, 1, 3, NULL, NULL, 9597, N'no sube el chip al tablero', N'123455', NULL, N'hfdghj', CAST(N'2019-10-04T16:46:16.617' AS DateTime), CAST(N'2019-10-04T16:48:39.157' AS DateTime), N'aceptada', N'No sube un chip', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (21, 1, 1, N'OscarM', NULL, NULL, N'Prueba .', N'1', N'1', N'1', CAST(N'2019-10-05T02:32:39.157' AS DateTime), CAST(N'2019-10-05T02:32:39.157' AS DateTime), N'abierta', N'Prueba Angel', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (22, 1, 2, NULL, NULL, NULL, N'lorem ipsum', N'1', N'2', N'3', CAST(N'2019-10-05T02:35:49.960' AS DateTime), CAST(N'2019-10-05T02:35:49.960' AS DateTime), N'abierta', N'Prueba Angel', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (23, 1, 3, N'emmanuel', NULL, NULL, N'AAAA BBBB CCC', N'1', N'3', N'4', CAST(N'2019-10-05T02:47:29.113' AS DateTime), CAST(N'2019-10-05T02:47:29.113' AS DateTime), N'abierta', N'Prueba Angel 2', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (24, 1, 1, NULL, NULL, NULL, N'CCC DDD EEE', N'4', N'5', N'6', CAST(N'2019-10-05T02:51:53.820' AS DateTime), CAST(N'2019-10-05T02:51:53.820' AS DateTime), N'abierta', N'Prueba 3 Angel', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (25, 1, 4, NULL, NULL, 9599, N'No puedo grabar la cita', N'12', N'14', NULL, CAST(N'2019-10-05T17:51:04.837' AS DateTime), CAST(N'2019-10-05T18:06:51.940' AS DateTime), N'aceptada', N'No sube el chip :C', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (26, 1, 1, NULL, NULL, 9600, N'No puedo subir un chip', N'1243', N'11', N'ABCD12', CAST(N'2019-10-19T15:40:42.030' AS DateTime), CAST(N'2019-10-19T16:30:28.530' AS DateTime), N'aceptada', N'No sube un chip', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (27, 1, 9, NULL, NULL, 9601, N'asdfasdfsdaf', N'123213412', N'123421', N'asdf123', CAST(N'2019-10-26T16:45:00.320' AS DateTime), CAST(N'2019-10-26T16:46:36.437' AS DateTime), N'aceptada', N'No sube la foto en tablero', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (28, 1, 2, NULL, NULL, 9602, N'Hola mundo, XD', NULL, NULL, NULL, CAST(N'2019-10-26T17:38:32.797' AS DateTime), CAST(N'2019-10-26T17:55:52.830' AS DateTime), N'aceptada', N'Prueba capital ', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (29, 1, 105, NULL, NULL, 9603, N'Al finalizar y guardar la hoja multipuntos, este presenta un error en la pantalla como "error 0"', N'415007', N'11552', N'ABC123D', CAST(N'2019-11-02T15:26:31.843' AS DateTime), CAST(N'2019-11-02T15:28:36.420' AS DateTime), N'aceptada', N'Prueba 1 del área de calidad', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (30, 1, 78, NULL, NULL, 9604, N'Alguna descripcion....', N'4321', N'43231', N'ogfi2312', CAST(N'2019-11-02T15:52:42.997' AS DateTime), CAST(N'2019-11-02T15:53:20.723' AS DateTime), N'aceptada', N'No sube chip x2', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (31, 1, 105, N'victor', NULL, NULL, N'Al momento de guardar, me aparece un error 0', N'5556', N'1598', N'CDB123D', CAST(N'2019-11-02T18:03:06.990' AS DateTime), CAST(N'2019-11-02T18:03:06.990' AS DateTime), N'abierta', N'Prueba Calidad 1', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (32, 1, 99, N'victor', NULL, 9606, N'LA firma del asesor no es la correcta. ', N'98345', N'4321', N'fgr234', CAST(N'2019-11-02T18:11:37.983' AS DateTime), CAST(N'2019-11-02T18:33:06.440' AS DateTime), N'aceptada', N'Firma asesor incorrecta.', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (33, 1, 38, NULL, NULL, 9605, N'sdghfjgkhljñljhgfadSAz>SDFGHYJTUIO235467', N'212345', N'12345', N'gfd345', CAST(N'2019-11-02T18:16:55.450' AS DateTime), CAST(N'2019-11-02T18:27:37.333' AS DateTime), N'aceptada', N'la otra prueba', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (34, 1, 97, N'victor', NULL, NULL, N'Se toma evidencia fotografica para poder señalar puntos dañados pero no aparece en la evidencia electronica', N'15544', N'12885', N'ABC123D', CAST(N'2019-11-05T17:10:15.030' AS DateTime), CAST(N'2019-11-05T17:10:15.030' AS DateTime), N'abierta', N'Error en la pantalla de recepcion interactiva, no carga evidencias', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (35, 1, 12, NULL, NULL, 9607, N'Prueba de capnet', N'15154', N'55855', N'HFH152R', CAST(N'2019-11-05T17:19:31.983' AS DateTime), CAST(N'2019-11-05T17:32:38.153' AS DateTime), N'aceptada', N'Evidencia2', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (36, 1, 109, NULL, N'Error de Proceso', NULL, N'Prueba capnet', N'99895', N'65554', N'RTV589R', CAST(N'2019-11-05T17:20:45.817' AS DateTime), CAST(N'2019-11-05T17:37:00.700' AS DateTime), N'cerrada', N'Evidencia2', NULL, N'Esto se debe a que el usuario esta ingresando mal, la evidencia, ya que cuando se toma una evidencia fotográfica, no le da clic en el botón de aceptar en la parte superior')
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (37, 1, 2, NULL, NULL, 9608, N'Hola mundo', N'12345', N'3212345', N'dfg234', CAST(N'2019-11-07T00:44:22.290' AS DateTime), CAST(N'2019-11-07T00:48:33.250' AS DateTime), N'aceptada', N'Prueba Foster', NULL, NULL)
GO
INSERT [ma].[solicitudes] ([id], [id_agencia], [id_modulo], [usuario_asignado], [motivo_cierre], [id_peticion_redmine], [descripcion], [no_orden], [no_cita], [no_placas], [fecha_registro], [fecha_actualizacion], [estado], [asunto], [email], [detalle_cierre]) VALUES (38, 1, 35, N'eliu', NULL, NULL, N'Prueba para mandar a redmine después de ser asignado. ', N'12456', N'23456', N'dfgf345', CAST(N'2019-11-07T22:58:45.373' AS DateTime), CAST(N'2019-11-07T22:58:45.373' AS DateTime), N'abierta', N'Dirigido a consultor', NULL, NULL)
GO
SET IDENTITY_INSERT [ma].[solicitudes] OFF
GO
SET IDENTITY_INSERT [organizaciones].[organizaciones] ON 
GO
INSERT [organizaciones].[organizaciones] ([id], [nombre]) VALUES (1, N'Plasencia')
GO
SET IDENTITY_INSERT [organizaciones].[organizaciones] OFF
GO
ALTER TABLE [usuarios].[usuarios] ADD  CONSTRAINT [DF_usuarios_alta]  DEFAULT ((1)) FOR [alta]
GO
ALTER TABLE [usuarios].[usuarios] ADD  CONSTRAINT [DF_usuarios_fecha_alta]  DEFAULT (getdate()) FOR [fecha_alta]
GO
ALTER TABLE [ma].[comentario_agencia]  WITH CHECK ADD  CONSTRAINT [fk_ma_agencia_comentario_agencia] FOREIGN KEY([id_agencia])
REFERENCES [ma].[concesionarios] ([id])
GO
ALTER TABLE [ma].[comentario_agencia] CHECK CONSTRAINT [fk_ma_agencia_comentario_agencia]
GO
ALTER TABLE [ma].[comentario_agencia]  WITH CHECK ADD  CONSTRAINT [fk_ma_solicitud_comentario_agencia] FOREIGN KEY([id_solicitud])
REFERENCES [ma].[solicitudes] ([id])
GO
ALTER TABLE [ma].[comentario_agencia] CHECK CONSTRAINT [fk_ma_solicitud_comentario_agencia]
GO
ALTER TABLE [ma].[comentario_usuario]  WITH CHECK ADD  CONSTRAINT [fk_ma_solicitud_comentario_usuario] FOREIGN KEY([id_solicitud])
REFERENCES [ma].[solicitudes] ([id])
GO
ALTER TABLE [ma].[comentario_usuario] CHECK CONSTRAINT [fk_ma_solicitud_comentario_usuario]
GO
ALTER TABLE [ma].[comentario_usuario]  WITH CHECK ADD  CONSTRAINT [fk_ma_usuario_comentario_usuario] FOREIGN KEY([id_usuario])
REFERENCES [ma].[usuario] ([id])
GO
ALTER TABLE [ma].[comentario_usuario] CHECK CONSTRAINT [fk_ma_usuario_comentario_usuario]
GO
ALTER TABLE [ma].[concesionarios_contactos]  WITH CHECK ADD  CONSTRAINT [FK_concesionarios_contactos_concesionarios] FOREIGN KEY([id_concesionario])
REFERENCES [ma].[concesionarios] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ma].[concesionarios_contactos] CHECK CONSTRAINT [FK_concesionarios_contactos_concesionarios]
GO
ALTER TABLE [ma].[evidencias]  WITH CHECK ADD  CONSTRAINT [fk_ma_solicitud_evidencia] FOREIGN KEY([id_solicitud])
REFERENCES [ma].[solicitudes] ([id])
GO
ALTER TABLE [ma].[evidencias] CHECK CONSTRAINT [fk_ma_solicitud_evidencia]
GO
ALTER TABLE [ma].[solicitudes]  WITH NOCHECK ADD  CONSTRAINT [fk_ma_agencia_solicitud] FOREIGN KEY([id_agencia])
REFERENCES [ma].[concesionarios] ([id])
GO
ALTER TABLE [ma].[solicitudes] CHECK CONSTRAINT [fk_ma_agencia_solicitud]
GO
ALTER TABLE [ma].[solicitudes]  WITH NOCHECK ADD  CONSTRAINT [fk_ma_modulo_solicitud] FOREIGN KEY([id_modulo])
REFERENCES [ma].[modulos] ([id])
GO
ALTER TABLE [ma].[solicitudes] CHECK CONSTRAINT [fk_ma_modulo_solicitud]
GO
ALTER TABLE [ma].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_ma_perfil_usuario] FOREIGN KEY([id_perfil])
REFERENCES [ma].[perfil] ([id])
GO
ALTER TABLE [ma].[usuario] CHECK CONSTRAINT [fk_ma_perfil_usuario]
GO
