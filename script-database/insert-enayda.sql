USE [the_walking_bugs];

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
/*1 accidentes de resbalon
* - 2 caidas(desde las alturas o desde un andamio)
* - 3 caidas de escombros u objetos
* - 4 electrocutacion,incendio u explocion
* - 5 accidentes de atrapamiento
* - 6 accidente con maquinaria
* - 7 accidentes vehiculares*/
PRINT 'insertando datos a la  tabla ACCIDENTTYPE...';
SET IDENTITY_INSERT [dbo].[AccidentType]  ON
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(100,'ACCIDENTES DE RESBALON','ACT1' );
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(101,'CAIDAS (DESDE ALTURAS O ANDAMIOS)','ACT2' );
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(102,'CAIDAS DE ESCOMBROS Y/O OBJETOS','ACT3' );
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(103,'ELECTROCUTACION, INCENDIO Y/O EXPLOCION','ACT4' );
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(104,'ACCIDENTES DE ATRAPAMIENTO','ACT5' );
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(105,'ACCIDENTES DE CON MAQUINARIA ','ACT6' );
insert into [dbo].[AccidentType] ([accidentTypeID],[name_type_accident],[code_type_accident] )
						   values(106,'ACCIDENTES VEHICULARES','ACT7');
SET IDENTITY_INSERT  [dbo].[AccidentType] OFF;
PRINT ' TABLA ACCIDENTTYPE lleno!!!!';


PRINT 'insertando datos a la  tabla ACCIDENT...';
SET IDENTITY_INSERT[dbo].[Accident] ON
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(500,'Edilberto choque','2018-06-18 ','12:38','planta baja','fractura','se deslizo de altura 2 mets',100,null );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(501,'Juan Carlos Balderrama','2018-06-18 ','12:38','planta dos','quemadura','se quemolos pies lado muslo',100,null );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(502,'Camilo Juentes','2018-06-18 ','12:38','plata baja','leve','choque movilidad contra la pared',101,null );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(503,'esteban Miroslava','2018-06-18 ','12:38','terrasa','leve','caida de tablas sobre el empleado',101,null );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(504,'Martin Cardenas','2018-06-18 ','12:38','reparacion de vivienda medias aguas','quemaduras de nuvel 2','electrocutacion en el cambio de cables',102,1 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(505,'Luis Alverto Cardenas','2018-06-18 ','12:38','excabacion de simientos terreno','mano cortada','maquina en deterioro y mal uso',102,2);
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(506,'Felipe Romero','2018-06-18 ','12:38','pario de la construccion','fractura de rodilla','cayo unas maderas sobre el empelado',102,3 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(507,'Carlos Aptamirano','2018-06-18 ','12:38','planta baja','lecion leve en la munieca derecha','de cayo de altura de 2mrts',103,4 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(508,'Bladimir Antezada','2018-06-18 ','12:38','planta baja','lecion de craneo','caida de movilidad (tractor)',103,5 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(509,'Fernando quispe','2018-06-18 ','12:38','planta nro 3','cortadura de pierna','maquinaria mal manejo ',104,6);
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(510,'Limber Quinteros','2018-06-18 ','12:38','plabta baja','rotura de brazo','se deslizo la madera no asegurada de una altura 3mtrs.',104,1 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(511,'Daniel Aquillada','2018-06-18 ','12:38','planta nro 3','fractura de ombro','gargando cemento se leciono por sobre peso',105,1 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(512,'Ruben Cantaro','2018-06-18  ','12:38','patio de construccion','lecion leve','descargando pachones y ladrillos',105,2 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(513,'Bruno Perez','2018-06-18  ','12:38','planta nro 5','danio de columna','se a caido de una altura de 1.5mtrs.',106,3 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(514,'Alvaro CAnde','2018-06-18  ','12:38','planta nro3','golpe de cabeza','caida de tablon',106,4 );
INSERT into [dbo].[Accident]([accidentID],[nameAccidentado],[date_accident],[hour_accident],[place_accident],[gravity_accident],[description_accident],[accidentTypeID], [areaID] )
					 values(515,'Frid gonzales','2018-06-18  ','12:38','patio de remolques','fractura','atropello de vehiculo en la trasportacion',106,5 );

SET IDENTITY_INSERT [dbo].[Accident]  OFF;
PRINT ' TABLA ACCIDENT lleno!!!!';


PRINT 'insertando datos a la  tabla ACCIDENTCAUSEGROUP...';
SET IDENTITY_INSERT [dbo].[AccidentCauseGroup]  ON
insert into [dbo].[AccidentCauseGroup] ([accidentCauseGroupID],[title] )
								values (200,'FACTORES PERSONALES' );
insert into [dbo].[AccidentCauseGroup] ([accidentCauseGroupID],[title] )
								values (201,'FACTORES RELATIVOS AL AMBIENTE Y LUGAR DE TRABAJO' );
insert into [dbo].[AccidentCauseGroup] ([accidentCauseGroupID],[title]  )
								values (202,'ACCIONES Y CONDICIONES SUBSTANDARES' );
insert into [dbo].[AccidentCauseGroup] ([accidentCauseGroupID],[title] )
								values (203,'TIPO DE CONTACTO' );

SET IDENTITY_INSERT [dbo].[AccidentCauseGroup] OFF;
PRINT ' TABLA ACCIDENTCAUSEGROUP lleno!!!!';



PRINT 'insertando datos a la  tabla ACCIDENTCAUSE...';
SET IDENTITY_INSERT [dbo].[AccidentCause] ON
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(300,'FALTA DE EXPERIENCIA EN EL CARGO',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID])
						   values(301,'DEFICIENCIA FISICA PARA LA LABOR',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(302,'NO ACATAR ORDENES DE SU SUPERIOR',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(303,'USO INADECUADO DE LOS EPP PROPORCIONADOS POR LA EMPRESA',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(304,'NO USO DE LO EPP PROPORCIONADOS POR LA EMPRESA',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(305,'TENSION',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(306,'MOTIVACION DEFICIENTE',200 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(307,'FALTA DE HABILIDAD',200 );



insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(308,'FALTA O EXCESO DE ILUMINACION',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(309,'FALTA O EXCESO  DE VENTILACION',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(310,'VENTIALCION DEFICIENTE',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(311,'TAREA CON SOBRECARGA(ROTMO, MONOTONIA, ENTRE OTROS)',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(312,'FALTA DE COMUNICANCION/FALTA DE EXPLICAICON DE LA TAREA ASIGNADA',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(313,'FALTA DE ORDEN Y LIMPIEZA EN EL PUESTO DE TRABAJO',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(314,'SUPERVISION INADECUADA',201 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(315,'ABUSO Y MALTRATO',201 );



insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(316,'USO DE HERRAMIENTAS Y EQUIPOS INADECUADOS',202 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(317,'NO ASEGURAR EL AREA DE TRABAJO',202 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(318,'NO ADVERTIR',202);
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(319,'EXCESO DE VELOCIDAD',202 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(320,'EXCESO DE CONFIANZA',202);
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(321,'USO DE EQUIPOS DEFECTUAOSOS',202);
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(322,'UBICACION INADECUADA DE EQUIPOS Y HERRAMINETAS',202 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(323,'LEVANTAMIENTO INADECUADO',202 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(324,'BROMAS',202  );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(325,'INFLUENCIA DE BEBIDAS EMBRIAGANTES',202 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(326,'EXPOSICION AL RUIDO',202 );


insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(327,'GOLPEADO CONTRA:',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(328,'GOLPEADO POR:',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(329,'ATRAPADO EN:',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(330,'ATRAPADO SOBRE:',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(331,'ATRAPADO ENTRE:',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(332,'RESBALON',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(333,'CAIDA A UN DISTINTO NIVEL',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(334,'CAIDA A UN MISMO NIVEL',203 );
insert into [dbo].[AccidentCause]([accidentCauseID],[descripcion],[accidentCauseGroupID] )
						   values(335,'SOBRE ESFUERZO',203 );

SET IDENTITY_INSERT [dbo].[AccidentCause] OFF;
PRINT ' TABLA ACCIDENTCAUSE lleno!!!!';



PRINT 'insertando datos a la  tabla ACCIDENTACCIDENTCAUSE...';
SET IDENTITY_INSERT [dbo].[Accident_causes] ON
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (1,500, 300, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');

insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (2,500 ,301, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (3, 500,302, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (4, 501,308, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (5,  501,309, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (6, 501,310, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (7, 502 ,316, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (8, 502 ,317, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (9,  503,318, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (10, 503,329, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (11, 503,331, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (12, 504,335, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38' );
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (13, 504,334, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38' );
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (14,  504,303, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (15, 504,304, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38' );
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (16, 505,312, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38' );
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (17, 505,313 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (18, 505,319 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (19,506 ,320, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (20,  506,329, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (21, 507,300, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (22,507 ,301, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (23, 507,302, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (24, 508,308, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (25,  508,309, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (26, 508,310, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (27, 508,316 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (28, 509,317 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (29,  509,318, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (30, 509,329, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (31, 510,331, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (32,510,335 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (33,510,334 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (34,  511,303, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (35, 511,304, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (36, 511,312 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (37, 512,313 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (38, 512,319 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (39,512,320, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (40,  513,329, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (41, 513,334, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38' );
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (42,  513,303, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (43, 514,304, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (44, 514 ,312, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause],[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate] )
								  values (45, 514,313 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (46,515,319 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (47,515,320, 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
insert into [dbo].[accident_causes]([id],[id_accident ],[id_cause] ,[status],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate])
								  values (48,515, 329 , 1,1,'2018-06-24 19:38',1,'2018-06-24 19:38');
SET IDENTITY_INSERT [dbo].[Accident_causes] ON
PRINT ' TABLA ACCIDENTACCIDENTCAUSE lleno!!!!';



