USE the_walking_bugs;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Insert data into the type_equipment table...';
GO
SET IDENTITY_INSERT dbo.type_equipment ON
INSERT INTO dbo.type_equipment (id, description_type_equipment, name)
VALUES (1, 'Heavy Machinary for Operator', 'Heavy Machinary');
INSERT INTO dbo.type_equipment (id, description_type_equipment, name)
VALUES (2, 'Light Machinary for Builders', 'Light Machinary');
INSERT INTO dbo.type_equipment (id, description_type_equipment, name)
VALUES (3, 'Construction Equipment  for Builders', 'Construction Equipment ');
INSERT INTO dbo.type_equipment (id, description_type_equipment, name)
VALUES (4, 'Equipment Safety  for Builders', 'Equipment Safety ');
SET IDENTITY_INSERT dbo.type_equipment OFF;
PRINT 'type_equipment table done...'



PRINT 'Insert data into the equipment table...';
GO
SET IDENTITY_INSERT dbo.equipment ON
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(1,'John Deere','EXCD', '2017-04-03', 'Sirve para abrir surcos para tuberias y drenajes', NULL, 'USA', 'Excavadora', 'Activa', '5 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(2,'CAT', 'RTXV', '2015-11-22', 'Sirve para abrir surcos en la superficies', NULL, 'USA', 'Retroexcavadora', 'Activa', '4 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(3,'Valtra', 'DRGS', '2017-06-09', 'Sirve para cabar agujeros redondos', NULL, 'Francia', 'Dragas', 'Activa', '5 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(4,'Deutz', 'PVMT', '2014-08-06', 'Sirve para pavimentar suelo', NULL, 'Aleman', 'Pavimentadora', 'Activa','6 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(5,'CAT','CMPT', '2018-01-03', 'Sirve para compactar el suelo blando', NULL, 'USA', 'Compactadora', 'Activa','4 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(6,'Valtra','MTNV', '2017-01-11', 'Sirve para nivelar terrenos ', NULL, 'Francia', 'Motoniveladora', 'Activa','4 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(7,'Deutz','CTNA', '2016-12-26', 'Sirve para transportar agua', NULL, 'Aleman', 'Cisternas', 'Activa','5 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(8,'CAT','VLQT','2017-05-03', 'Sirve para transportar material de construccion', NULL, 'USA', 'Volqueta', 'Activa','5 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(9,'CAT', 'TRCT', '2017-08-13', 'Se usa para arrastrar o empujar' , NULL, 'USA', 'Tractor', 'Activa','4 años', 1 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(10,'John Deere','CGDR', '2017-02-08', 'Sirve para cargar material a una volqueta', NULL, 'USA', 'Cargadora', 'Activa','3 años', 1 );

INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(11,'John Deere','MZCD', '2016-12-09', 'Sirve para mezclar cemento', NULL, 'USA', 'Mezcladora', 'Activa', '5 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(12,'CAT', 'NVLD', '2016-11-25', 'Sirve para nivelar la superficie', NULL, 'USA', 'Niveladora', 'Activa', '4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(13,'Valtra', 'CRTL', '2017-11-09', 'Sirve para traslado de material liviano', NULL, 'Francia', 'Carretila', 'Activa', '4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(14,'Deutz', 'ESLR', '2016-05-06', 'Sirve para subir niveles ', NULL, 'Aleman', 'Escalera', 'Activa','4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(15,'CAT','VBDR', '2017-09-09', 'Sirve para vibrar el cemto en un vaciado', NULL, 'USA', 'Regla Vibradora', 'Activa','4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(16,'Valtra','MTPF', '2017-12-11', 'Sirve para perforar concreto ', NULL, 'Francia', 'Martillos perforadores', 'Activa','4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(17,'Deutz','MTDL', '2016-12-26', 'Sirve para demoler estructuras de hormigon', NULL, 'Aleman', 'Martillos demoledores', 'Activa','4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(18,'CAT','VDCT','2017-05-09', 'Sirve para vibrar concreto antes de demoler', NULL, 'USA', 'Vibradores de concreto', 'Activa','3 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(19,'CAT', 'CTMT', '2017-12-13', 'Se usa para cortar todo tipo de metal' , NULL, 'USA', 'Cortadoras de metales', 'Activa','4 años', 2 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(20,'John Deere','SPLT', '2017-09-08', 'Sirve para pintar a base de aire', NULL, 'USA', 'Sopletes', 'Activa','4 años', 2 );

INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(21,'Bosch','TLDR', '2017-05-03', 'Sirve para realizar agujeros con brocas', NULL, 'USA', 'Taladro', 'Activa', '4 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(22,'Trupper', 'AMDR', '2016-11-23', 'Sirve para desgastar o cortar fierro', NULL, 'USA', 'Amoladora', 'Activa', '4 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(23,'Skyll', 'PRSA', '2018-09-15', 'Sirve para apretar material', NULL, 'Francia', 'Prensa', 'Activa', '3 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(24,'DeWalt', 'EMRL', '2017-09-15', 'Sirve para afilar o desgaste fino', NULL, 'Aleman', 'Esmeril', 'Activa','3 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(25,'Hitachi','VBDR', '2017-12-25', 'Sirve para vibrar la mezcla de cemento', NULL, 'USA', 'Vibradora', 'Activa','2 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(26,'BlackDecker','GNCH', '2016-11-23', 'Sirve para jalar peso con una rondana ', NULL, 'Francia', 'Ginche', 'Activa','4 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(27,'Stanley','SREL', '2018-01-16', 'Sirve para realizar cortes en madera o fierro', NULL, 'Aleman', 'Sierra Eléctrica', 'Activa','2 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(28,'Makita','ARCO','2017-09-13', 'Sirve para soldar fierro', NULL, 'USA', 'Arco', 'Activa','4 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(29,'Hercules', 'OXGN', '2017-09-19', 'Se usa para soldar fierrros finos' , NULL, 'USA', 'Oxigeno', 'Activa','4 años', 3 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(30,'Gamma','CPSR', '2017-09-24', 'Sirve para expulsar aire , pintar con soplete', NULL, 'USA', 'Compresora', 'Activa','3 años', 3 );

INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(31,'3M','GFAS', '2018-01-16', 'Sirve para proteger los ojos de astillas o polvo', NULL, 'USA', 'Gafas', 'Activa', '1 año', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(32,'Manaco', 'BTAS', '2018-01-15', 'Sirve para protección de los pies', NULL, 'Bolivia', 'Botas', 'Activa', '1 año', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(33,'Magesa', 'GTES', '2018-02-15', 'Sirve para protección de las manos', NULL, 'China', 'Guantes', 'Activa', '6 Meses', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(34,'Brasbel', 'CSCO', '2017-12-25', 'Sirve para proteger la cabeza', NULL, 'Brasil', 'Casco', 'Activa','1 año', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(35,'Magesa','TPNE', '2018-05-25', 'Sirve para proteger los oidos de ruidos', NULL, 'China', 'Tapones', 'Activa','3 Meses', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(36,'Magesa','FAJA', '2017-11-23', 'Sirve para protección se la espalda baja ', NULL, 'China', 'Faja', 'Activa','1 año', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(37,'Stanley','ARNZ', '2018-01-16', 'Sirve para realizar asegurar una persona a un punto fijo', NULL, 'Alemania', 'Arnez', 'Activa','2 años', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(38,'Makita','BBJO','2018-01-13', 'Sirve para bloquear inpureza en el aire que se respira', NULL, 'China', 'Barbijo', 'Activa','6 meses', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(39,'Hercules', 'MSCR', '2017-09-19', 'Se usa para protección del rostro contra soladura' , NULL, 'USA', 'Mascara', 'Activa','1 año', 4 );
INSERT INTO dbo.equipment (id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id )
VALUES(40,'Gamma','CJCO', '2018-04-24', 'Sirve para identificaión de personal activo en una obra', NULL, 'USA', 'Chaleco', 'Activa','1 año', 4 );

SET IDENTITY_INSERT dbo.equipment OFF;
PRINT 'equipment table done...';

COMMIT TRANSACTION;

