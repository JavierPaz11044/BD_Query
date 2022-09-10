/*
• Cobros de cuotas por préstamos, 
• Cobros de cuotas de servicios básicos (Agua, energía eléctrica, telefonía fija), 
• Cobros por servicio de televisión satelital.
• Cobros por pagos a colegios
*/
#insertar intitucion
call insertIntitucion("UNL","Loja", "Benjamin-carrion y Av Universitaria", "00000000", "unl@gmail.com", "2028-05-31 ", "convenio_prueba");
call insertIntitucion("Bernardo","Loja", "Benjamin-carrion y Av Universitaria", "00000000", "unl@gmail.com", "2028-05-31 ", "convenio_prueba2");
call insertIntitucion("Beatriz","Loja", "Benjamin-carrion y Av Universitaria", "00000000", "unl@gmail.com", "2028-05-31 ", "convenio_prueba2");
#insertar tipo de servicio
call inserTypeService("Cobros de cuotas por préstamos");
call inserTypeService("Cobros de cuotas de servicios básicos");
call inserTypeService("Cobros por servicio de televisión satelital");
call inserTypeService("Cobros por pagos a colegios");