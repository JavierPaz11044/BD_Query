-------------- VISTAS ----------------
CREATE VIEW Cantidad_Recolecion_Servicio_Diario  AS
select 
	id_servicio, 
	count(id_servicio) cantidad, 
	sum(valor_pagado) ValorRecaudado
from recaudacion 
	inner join  pago on recaudacion.id_recaudacion = pago.id_pago
		where pago.fecha_pago 
			between 
				concat(CURDATE(), ' 00:00:00') 
					and
				concat(CURDATE(), ' 23:59:59') 
    group by id_servicio having cantidad>=1;

select * from Cantidad_Recolecion_Servicio_Diario;

CREATE VIEW Cantidad_Recolecion_Servicio_Semanal  AS
select 
    id_servicio, 
    count(id_servicio) cantidad, 
    sum(valor_pagado) ValorRecaudado
from recaudacion 
	inner join  pago on recaudacion.id_recaudacion = pago.id_pago
		where pago.fecha_pago 
			between 
				DATE_SUB(concat(CURDATE(), ' 00:00:00'), INTERVAL 1 WEEK) 
					AND 
				concat(CURDATE(), ' 23:59:59')
    group by id_servicio having cantidad>=1;

select * from Cantidad_Recolecion_Servicio_Semanal;


/*
	Una lista de los cobradores con más recuperación realizada en el periodo de
	tiempo que el usuario defina
    
    Empleado  NumeroRecaudaciones CantidadRecuperada	
    Juan 		2						200
*/


CREATE VIEW ListaEmpleadosMayorRecuperacion  AS
select 
    recaudacion.id_empleado, 
    persona.cedula,
    persona.nombre,
    persona.correo,
    count(id_empleado) NumeroRecaudaciones, 
    sum(valor_pagado) CantidadRecuperada
from recaudacion 
	inner join  pago on recaudacion.id_recaudacion = pago.id_pago
    inner join persona on recaudacion.id_empleado = persona.id_persona
		where pago.fecha_pago 
			between GetFechaInicial() and GetFechaFin()
    group by id_empleado having NumeroRecaudaciones>=1    
	order by CantidadRecuperada DESC; 

CREATE FUNCTION GetFechaInicial() RETURNS DATETIME DETERMINISTIC NO SQL RETURN @FechaInicial;
CREATE FUNCTION GetFechaFin() RETURNS DATETIME DETERMINISTIC NO SQL RETURN @FechaFin;

select * from 
	( select 
		@FechaInicial := '2022-09-04 00:00:00' Fecha_Inicio, 
		@FechaFin := 	 '2022-09-10 00:00:00' Fecha_Fin 
	) 
Lista, ListaEmpleadosMayorRecuperacion;