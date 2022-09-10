DROP database if exists pasantias;
CREATE DATABASE IF NOT EXISTS pasantias;
use pasantias;

create table if not exists  persona(
	id_persona integer PRIMARY KEY auto_increment,
    cedula varchar(10) not null,
    nombre varchar(55) not null,
    apellidos varchar(55) not null,
    celular integer(10) not null,
    telefono integer(15) not null,
    provincia varchar(55) not null,
    direccion varchar(55) not null,
    correo varchar(55) not null
);

create table if not exists cliente (
	id_cliente integer PRIMARY KEY auto_increment,
    id_persona integer default null,
    calificacion varchar(55) default null
);

create table if not exists empleado (
	id_empleado integer primary key auto_increment,
    id_persona integer default null,
    periodo_contrato_inicio timestamp default now(),
    periodo_contrato_fin timestamp default now(),
    cargo varchar(55),
    sueldo integer default 0,
    experiencia varchar(55) default null,
    observaciones varchar(55) default null
);

/*create table if not exists rol(
id_rol integer primary key auto_increment,
nombre varchar(55)
);*/

create table if not exists tipo_servicio(
id_tipo_servicio integer primary key auto_increment,
nombre varchar(55) not null
);

create table if not exists servicio(
id_servicio integer primary key auto_increment,
id_institucion integer not null,
id_tipo_servicio integer not null,
periodo_servicio datetime default now()
);

create table  if not exists recaudacion(
id_recaudacion integer primary key auto_increment,
id_servicio integer not null,
id_persona integer not null,
id_empleado integer not null,
fecha_limite_recaudacion datetime default now(),
id_recargo integer not null, 
descripcion_recaudacion varchar(255) default null, 
lugar_recaudacion varchar(55),
id_cuota integer not null,
id_pago integer not null
);

create table if not exists pago(
id_pago integer primary key auto_increment,
id_metodo_pago integer not null, 
valor_pagado decimal(10,2),
fecha_pago datetime default now()
);

create table if not exists metodo_pago(
id_metodo_pago integer primary key auto_increment,
nombre varchar(55)
);


create table if not exists gestion_recargo(
id_recargo integer primary key auto_increment,
catidad_cobro decimal(10,2),
fecha_gestion_recargo datetime default now()
);



create table if not exists reporte(
id_reporte integer primary key auto_increment,
id_institucion integer not null,
periodo_inicio datetime default now(),
periodo_fin datetime default now(),
catidad_recaudada decimal(10,2),
fecha_reporte datetime default now()
);
create table if not exists institucion(
id_institucion integer primary key auto_increment,
nombre_intitucion varchar(55),
ciudad varchar(55),
direccion varchar(55),
telefono varchar(55),
correo varchar(55)
);


create table if not exists convenio(
id_convenio integer primary key auto_increment,
nombre_convenio varchar(55),
inicio_convenio datetime default now(),
fin_convenio datetime default now()
);

create table if not exists cuota(
id_cuota integer primary key auto_increment,
cantidad_total decimal(10,2),
valor_cuota decimal(10,2),
valor_restante decimal(10,2)
);


#alter table persona add constraint  persona_rol_fk foreign key (id_rol) references rol(id_rol) on delete no action on update cascade;
#alter table empleado add constraint  persona_empleado_fk foreign key (id_empleado) references persona(id_persona) on delete no action on update cascade;
#alter table cliente add constraint  persona_cliente_fk foreign key (id_cliente) references persona(id_persona) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_persona_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_cuota_fk foreign key (id_cuota) references cuota(id_cuota) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_recargo_fk foreign key (id_recargo) references gestion_recargo(id_recargo) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_servicio_fk foreign key (id_servicio) references servicio(id_servicio) on delete no action on update cascade;
alter table servicio add constraint servicio_tipo_servicio_fk foreign key (id_tipo_servicio) references tipo_servicio(id_tipo_servicio) on delete no action on update cascade;
alter table servicio add constraint servicio_institucion_fk foreign key (id_institucion) references institucion(id_institucion) on delete no action on update cascade;
alter table convenio add constraint convenio_intitucion_fk foreign key (id_convenio) references institucion(id_institucion) on delete no action on update cascade;
alter table reporte add constraint reporte_institucion_fk foreign key (id_institucion) references institucion(id_institucion) on delete no action on update cascade;
alter table empleado add constraint persona_empleado_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;
alter table cliente add constraint persona_cliente_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;
alter table pago add constraint id_metodo_pago_fk foreign key (id_metodo_pago) references metodo_pago(id_metodo_pago) on delete no action on update cascade;

select * from pago;

select * From metodo_pago;
select * from reporte;
# Rellenando datos a la tabla

select * from tipo_servicio;

insert into  tipo_servicio (nombre) values ("TipoServicio-1");
insert into  tipo_servicio (nombre) values ("TipoServicio-2");
insert into  tipo_servicio (nombre) values ("TipoServicio-3");
insert into  tipo_servicio (nombre) values ("TipoServicio-4");

#Delete from tipo_servicio;


# Tabla Servicio

