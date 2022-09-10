drop procedure if exists insertIntitucion;
use pasantias;
DELIMITER //
CREATE procedure insertIntitucion(
IN nombre varchar(55),
IN ciudad varchar(55),
IN direccion varchar(55),
IN telefono varchar(55),
IN correo varchar(55),
in fecha_fin_correo timestamp,
in nombre_convenio varchar(55)
)
BEGIN
	declare id integer;
    insert into institucion(nombre_intitucion,  ciudad,  direccion,  telefono, correo) values (nombre, ciudad, direccion, telefono, correo);
    select id_institucion into id  from institucion where nombre_intitucion = nombre;
    insert into convenio(id_convenio,nombre_convenio,inicio_convenio,fin_convenio) values (id, nombre_convenio,now(), fecha_fin_correo);
    select * from institucion inner join convenio where institucion.id_institucion = id and convenio.id_convenio = id;
END //
    
DELIMITER ;

DELIMITER //
create procedure inserTypeService(IN typerService varchar(55))
begin
insert into tipo_servicio(nombre) values(typerService);
end//
DELIMITER ;


DELIMITER //
create procedure insertarVendedor(
   cedula varchar(10),
    nombre varchar(55),
    apellidos varchar(55),
    celular integer(10),
    telefono integer(15),
    provincia varchar(55),
    direccion varchar(55),
    correo varchar(55),
    periodo_contrato_fin timestamp,
    cargo varchar(55),
    sueldo integer,
    experiencia varchar(55),
    observaciones varchar(55)
    )
begin
insert into persona
(cedula,nombre, apellidos, celular, telefono, provincia, direccion, correo) 
values (cedula, nombre,apellidos, celular, telefono, provincia, direccion, corre);
insert into 
empleado ( cedula_persona, periodo_contrato_incio, periodo_contrato_fin, cargo, sueldo, experiencia, observaciones) 
values (cedula, now(), "2030-05-31", cargo, sueldo, experiencia, observaciones);
end//
DELIMITER ;

DELIMITER //
create procedure RecaudacionWithNewClient(
   cedula varchar(10),
    nombre varchar(55),
    apellidos varchar(55),
    celular integer(10),
    telefono integer(15),
    provincia varchar(55),
    direccion varchar(55),
    correo varchar(55)
    )
begin
insert into persona
(cedula,nombre, apellidos, celular, telefono, provincia, direccion, correo) 
values (cedula, nombre,apellidos, celular, telefono, provincia, direccion, corre);
insert into 
empleado ( cedula_persona, periodo_contrato_incio, periodo_contrato_fin, cargo, sueldo, experiencia, observaciones) 
values (cedula, now(), "2030-05-31", cargo, sueldo, experiencia, observaciones);
end//
DELIMITER ;

DELIMITER //
create procedure AddNewSeviceWithToIntitutions(
	name_intitucion  varchar(10), 
    type_service_id varchar(10),
    name_cuotes_pay integer,
    total_pay integer
)
begin
DECLARE counter integer;
SET counter = 1;

end//
DELIMITER ;
select * from convenio;



