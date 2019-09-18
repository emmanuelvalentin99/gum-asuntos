create table ma.perfil(
	id int not null,
	nombre nvarchar (100) not null,
 constraint pk_ma_perfil primary key clustered (id)
 )
create table ma.usuario(
id int not null,
id_perfil int not null,
usuario nvarchar(45),
contrasenia nvarchar(200),
token_redmine nvarchar(200),
nombre nvarchar(60),
email nvarchar(60),
telefono nvarchar(20),
alta bit,
ultima_actividad datetime,
fecha_alta datetime,
fecha_baja datetime,
constraint pk_ma_usuario primary key clustered(id),
constraint fk_ma_perfil_usuario foreign key (id_perfil) references ma.perfil (id)
)

create table ma.agencia(
id int not null,
nombre nvarchar(80),
grupo nvarchar(60),
constraint pk_ma_agencia primary key (id)
)

create table ma.contacto(
id int not null,
nombre nvarchar(80),
telefono nvarchar(20),
email nvarchar(80),
cargo nvarchar(50),
id_agencia int not null
constraint pk_ma_contacto primary key (id),
constraint fk_ma_agencia_contacto foreign key (id_agencia) references ma.agencia(id)
)


create table ma.motivo_cierre(
id int not null,
cve_cierre nvarchar(80),
descripcion nvarchar(500),
constraint pk_ma_motivo_cierre primary key (id)
)

create table ma.modulo(
id int not null,
categoria nvarchar(80),
modulo nvarchar(80),
constraint pk_ma_modulo primary key (id)
)

create table ma.solicitud(
id int not null,
id_agencia int not null,
id_modulo int not null,
id_usuario int,
id_motivo_cierre int,
id_peticion_redmine nvarchar(45),
descripcion nvarchar(500),
no_orden nvarchar(50),
no_cita nvarchar(50),
no_placas nvarchar (50),
email nvarchar(80),
fecha_registro datetime,
fecha_actualizacion datetime,
estado_solicitud nvarchar(50),
constraint pk_ma_solicitud primary key (id),
constraint fk_ma_agencia_solicitud foreign key (id_agencia) references ma.agencia(id),
constraint fk_ma_modulo_solicitud foreign key (id_modulo) references ma.modulo(id),
constraint fk_ma_usuario_solicitud foreign key (id_usuario) references ma.usuario(id),
constraint fk_ma_motivo_cierre_solicitud foreign key (id_motivo_cierre) references ma.motivo_cierre(id)
)

create table ma.evidencia(
id int not null,
id_solicitud int not null,
directorio_imagen nvarchar(50),
constraint pk_ma_evidencia primary key (id),
constraint fk_ma_solicitud_evidencia foreign key (id_solicitud) references ma.solicitud(id)
)

create table ma.comentario_usuario(
fecha_hora datetime not null,
id_usuario int not null,
id_solicitud int not null,
comentario nvarchar(500),
constraint pk_ma_comentario_usuario primary key(fecha_hora,id_usuario,id_solicitud),
constraint fk_ma_usuario_comentario_usuario foreign key (id_usuario) references ma.usuario(id),
constraint fk_ma_solicitud_comentario_usuario foreign key (id_solicitud) references ma.solicitud(id)
)

create table ma.comentario_agencia(
fecha_hora datetime not null,
id_agencia int not null,
id_solicitud int not null,
comentario nvarchar(500),
constraint pk_ma_comentario_agencia primary key(fecha_hora,id_agencia,id_solicitud),
constraint fk_ma_agencia_comentario_agencia foreign key (id_agencia) references ma.agencia(id),
constraint fk_ma_solicitud_comentario_agencia foreign key (id_solicitud) references ma.solicitud(id)
)