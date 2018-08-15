USE [the_walking_bugs];

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
--======================================================================================================
-- POSITION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the Position table...';
--																																																																																																			AreaId, HigherPositionId,PerfomanceId			
SET IDENTITY_INSERT [dbo].[position]  ON
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (1,  0, N'Default Gerencia',  N'Default Gerencia',				  N'Default Gerencia'	, N'Generente de la empresa'										                  , 1, NULL)
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (2,  0, N'CD-01', 			      N'Gerente de proyecto', 			N'Operativo'		    , N'Responsable de la construccion'									              , 1, 1	 )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (3,  0, N'CD-02', 			      N'Arquitecto', 						    N'Disenio'		      , N'Responsable del disenio de la obra y verificacion'				    , 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (4,  0, N'CD-03', 			      N'Supervisor de obra', 				N'misional'			    , N'Controlar y verificar segun especificaciones de la obra'		  , 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (5,  0, N'CD-04', 			      N'Maestro Albanil', 				  N'Contruccion'		  , N'Montaje y verificacion la contruccion en la obra'				      , 1, 4   )

INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (6,  0, N'CD-04', 			      N'Contra Maestro de Albanil', N'Contruccion'		  , N'Montaje de obra gruesa'											                  , 1, 5   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (7,  0, N'CD-06', 			      N'ayudante de Albanil', 			N'Contruccion'		  , N'Proveer material para la construccion'							          , 1, 5   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (8,  0, N'CD-07', 			      N'Maestro soldador', 				  N'Contruccion'		  , N'Montaje de esctructuras Metalicas y verificacion'				      , 1, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (9,  0, N'CD-08', 			      N'Contra Maestro Soldador', 	N'Contruccion'		  , N'Montaje de estructura metalica'									              , 1, 8   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (10, 0, N'CD-09', 			      N'Ayudante de Soldador', 			N'Contruccion'		  , N'Preparar material para soldar'									              , 1, 8   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (11, 0, N'CD-10', 			      N'Plomero', 						      N'Contruccion'		  , N'Responsable de instalaciones de agua y acantarillado'			    , 3, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (12, 0, N'CD-11', 			      N'Electricista', 					    N'Contruccion'		  , N'Instalacion electrica en la obra'								              , 2, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (13, 0, N'CD-12', 			      N'Contratista', 					    N'Contruccion'		  , N'Encargado de contratacion de personal'							          , 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (14, 0, N'CD-13', 			      N'Secretaria', 						    N'Operativo'		    , N'Registrar y gestionar la informacion de la obra'				      , 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (15, 0, N'CD-14', 			      N'Auxiliar de Recursos Humanos',N'Operativo'		  , N'Engardado de permisos y problemas del personal'					      , 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (16, 0, N'CD-15', 			      N'Conductor categoria A', 			N'Contruccion'	  , N'Conductor con categoria A'										                , 1, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (17, 0, N'CD-16', 			      N'Conductor categoria B', 			N'Contruccion'	  , N'Conductor con categoria B'										                , 1, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (18, 0, N'CD-17', 			      N'Conductor categoria C', 			N'Contruccion'	  , N'Conductor con categoria C'										                , 1, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (19, 0, N'CD-18', 			      N'Ingeniero Civil', 				    N'Operativo'		  , N'Responsable de la construccion de la obra'						        , 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (20, 0, N'CD-19', 			      N'Ingeniero de Infrainstructura',N'Operativo'		  , N'Responsable de la construccion de la infraestructura de la obra', 1, 2   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (21, 0, N'CD-20', 			      N'Capataz', 						         N'misional'		  , N'Controlar a los ayudantes de la obra'							              , 1, 4   )
INSERT [dbo].[position] ([id],  [version], [code], [name], [process], [purpose], [area_id], [higher_work_position_id]) VALUES (22, 0, N'CD-21', 			      N'Pintura', 						         N'Disenio'			  , N'Encargado de pintar la obra'							                      , 1, 4   )

SET IDENTITY_INSERT [dbo].[position]  OFF;
PRINT 'Insert data into the Position table DONE...';
--======================================================================================================
-- FUNCTION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the Function table...';
SET IDENTITY_INSERT [dbo].[Function]  ON
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(1, 0,'adminsitrar la obra'						          ,'diario'				        ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(2, 0,'contruir muros segun especificaciones'    ,'diario'				        ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(3, 0,'Leer planos de contruccion'				        ,'diario'				        ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(4, 0,'diseniar planos de contruccion'			      ,'cuando se requiera'	  ,'media',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(5, 0,'levantar requisitios del cliente'			    ,'cuando se requiera'	  ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(6, 0,'Realizar operaciones de administracion'   ,'diario'				        ,'baja',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(7, 0,'gestionar necesidades del empleado'		    ,'cuando se requiera'	  ,'media',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(8, 0,'construir y armar estructuras metalicas'  ,'diario'				        ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(9, 0,'analisis de edificicacion '				        ,'cuando se requiera'	  ,'media',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(10,0,'ayudar en el alcanze de materiales en obra','diario'				      ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(11,0,'pintar paredes'    						            ,'cuando se requiera'	  ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(12,0,'afinar paredes'							              ,'cuando se requiera'	  ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(13,0,'conducir autos menores a 2 Tn'			      ,'cuando se requiera'	  ,'media',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(14,0,'conducir autos mayores a 2 Tn'			      ,'diario'				        ,'alta',1)
INSERT INTO [dbo].[Function]([id],[version],[description],[frecuency],[contribution],[Is_important]) VALUES(15,0,'conducir maquinaria pesada'				        ,'cuando se requiera'	  ,'alta',1)

SET IDENTITY_INSERT [dbo].[Function]  OFF;
PRINT 'Insert data into the Function table DONE...';

--======================================================================================================
-- POSITION_ASSIGNED_POSITION RELATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================

PRINT 'Insert data into the Function_Assigned_Position table...';
SET IDENTITY_INSERT [dbo].[Function_Assigned_Position]  ON
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (1, 0 ,2 ,1)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (2, 0 ,5 ,2)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (3, 0 ,5 ,3)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (4, 0 ,3 ,4)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (5, 0 ,3 ,5)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (6, 0 ,14 ,6)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (7, 0 ,15 ,7)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (8, 0 ,8 ,8)
--INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (9, 0 ,19 ,9)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (10, 0 ,7 ,10)
--INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (11, 0 ,22 ,11)
INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (12, 0 ,5 ,12)
--INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (13, 0 ,16 ,13)
--INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (14, 0 ,17 ,14)
--INSERT INTO [dbo].[Function_Assigned_Position] ([id], [version] ,[position_id] ,[function_id]) VALUES (15, 0 ,18 ,15)

SET IDENTITY_INSERT [dbo].[Function_Assigned_Position]  OFF;
PRINT 'Insert data into the Function_Assigned_Position table DONE...';
--======================================================================================================
-- RECRUITMENT PROFILE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the recruitment_profile table...';
SET IDENTITY_INSERT [dbo].[recruitment_profile]  ON

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (1, 0 , N'Educacion'	  , N'Titulo de Ingeniero Industrial en mencion gerencial', N'Titulo'							          , 2)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (2, 0 , N'Experiencia'	, N'10 anios minimo en funciones similares'    			    , N'Certificacion y experiencia'	, 2)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (3, 0 , N'Otros'			  , N'Recomenciones numeros telefonicos'					        , N'referencias'					        , 2)

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (4, 0 , N'Educacion'	  , N'Titulo profesional de Arquitectura'					        , N'Titulo'							          , 3)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (5, 0 , N'Experiencia'	, N'7 anios minimo en funciones similares'				      , N'Demostrar proyectos'			    , 3)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (6, 0 , N'Otros'			  , N'Conocer las obras'									                , N'Certificaciones o referencias', 3)

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (7, 0 , N'Educacion'	  , N'Lic. Administracion de empresas'					          , N'Titulo o Anios de Expriencia'	, 4)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (8, 0 , N'Experiencia'	, N'5 anios minimo en funciones similares'				      , N'Certificacion'					      , 4)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (9, 0 , N'Otros'			  , N'Referencias practicas'								              , N'Certificaciones o referencias', 4)

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (10, 0, N'Educacion'	  , N'Oficio de Albanil'									                , N'Titulo de tecnico superior'		, 5)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (11, 0, N'Experiencia'	, N'10 anios de experiencia'							              , N'Cartas de recomendacion u obras', 5)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (12, 0, N'Otros'			  , N'Conocer Obras '										                  , N'Referencias de las obras'		   , 5)

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (13, 0, N'Educacion'	  , N'Oficio de albanil'									                , N'Anios de Experiencia'			      , 6)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (14, 0, N'Experiencia'	, N'5 anios de experiencia'								              , N'Cartas de recomendacion'		    , 6)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (15, 0, N'Otros'			  , N'Conocer Obras'										                  , N'Referencias de las Obras'		    , 6)

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (16, 0, N'Educacion'	  , N'Ninguno'											                      , N'Ninguna'						            , 7)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (17, 0, N'Experiencia'	, N'6 meses de experiencia'								              , N'Ninguna'						            , 7)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (18, 0, N'Otros'			  , N'nivel de educacion'									                , N'Registrar el nivel de educacion', 7)

INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (19, 0, N'Educacion'	  , N'Oficio de Mecanico Soldador'						            , N'Titulo de tecnico superior'		  , 8)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (20, 0, N'Experiencia'	, N'10 anios de experiencia'							              , N'Referencias'					          , 8)
INSERT [dbo].[recruitment_profile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (21, 0, N'Otros'			  , N'Cartas de recomendacion'							              , N'Referencias'					          , 8)
SET IDENTITY_INSERT [dbo].[recruitment_profile]  OFF;
PRINT 'Insert data into the recruitment_profile table DONE...';

--======================================================================================================
-- TYPE_EVALUATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the type_evaluator table...';
SET IDENTITY_INSERT [dbo].[type_evaluator]  ON
INSERT [dbo].[type_evaluator] ([id],  [version], [description]) VALUES (27, 0, N'Jefe Inmediato')
INSERT [dbo].[type_evaluator] ([id],  [version], [description]) VALUES (28, 0, N'Supervisor')
INSERT [dbo].[type_evaluator] ([id],  [version], [description]) VALUES (29, 0, N'Colega(par)')
SET IDENTITY_INSERT [dbo].[type_evaluator]  OFF;
PRINT 'Insert data into the type_evaluator table DONE...';

--======================================================================================================
-- EVALUATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the evaluation table...';
SET IDENTITY_INSERT [dbo].[evaluation]  ON
INSERT [dbo].[evaluation] ([id],  [version], [evaluated_id], [evaluator_id], [type_id]) VALUES (34 , 0, 1, 2, 27)
INSERT [dbo].[evaluation] ([id],  [version], [evaluated_id], [evaluator_id], [type_id]) VALUES (99 , 0, 3, 4, 28)
INSERT [dbo].[evaluation] ([id],  [version], [evaluated_id], [evaluator_id], [type_id]) VALUES (164, 0, 5, 6, 29)
SET IDENTITY_INSERT [dbo].[evaluation]  OFF;
PRINT 'Insert data into the evaluation table DONE...';
--======================================================================================================
-- EVALUATION_METRIC TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the evaluation_metric table...';
SET IDENTITY_INSERT [dbo].[evaluation_metric]  ON
INSERT [dbo].[evaluation_metric] ([id],  [version], [description], [value]) VALUES (20, 0, N'Excelente'	, 100)
INSERT [dbo].[evaluation_metric] ([id],  [version], [description], [value]) VALUES (21, 0, N'Muy bueno'	, 85)
INSERT [dbo].[evaluation_metric] ([id],  [version], [description], [value]) VALUES (22, 0, N'Bueno'		, 75)
INSERT [dbo].[evaluation_metric] ([id],  [version], [description], [value]) VALUES (23, 0, N'Regular'	, 65)
INSERT [dbo].[evaluation_metric] ([id],  [version], [description], [value]) VALUES (24, 0, N'Deficiente', 45)
SET IDENTITY_INSERT [dbo].[evaluation_metric]  OFF;
PRINT 'Insert data into the evaluation_metric table DONE...';
--======================================================================================================
-- MANAGEMENT_INDICATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the management_indicator table...';
SET IDENTITY_INSERT [dbo].[management_indicator]  ON
INSERT [dbo].[management_indicator] ([id],  [version], [competence], [criteria]) VALUES (25,  0, N'Calidad y conocimiento', N'Posee conocimiento y destresas que le permitan ejercer efectivamente su puesto?')
INSERT [dbo].[management_indicator] ([id],  [version], [competence], [criteria]) VALUES (26,  0, N'Trabajo en Equipo'	  , N'Solicita participacion de')
SET IDENTITY_INSERT [dbo].[management_indicator]  OFF
PRINT 'Insert data into the management_indicator table DONE...'
--======================================================================================================
-- INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the indicator_value table...';
SET IDENTITY_INSERT [dbo].[indicator_value] ON
INSERT [dbo].[indicator_value] ([id],  [version], [management_indicator_id], [metric_id]) VALUES (32, 0, 25, 20)
INSERT [dbo].[indicator_value] ([id],  [version], [management_indicator_id], [metric_id]) VALUES (33, 0, 26, 23)
SET IDENTITY_INSERT [dbo].[indicator_value] OFF
PRINT 'Insert data into the indicator_value table DONE...';
--======================================================================================================
-- EVALUATION_INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Insert data
--======================================================================================================
PRINT 'Insert data into the evaluation_indicator_values table...';
SET IDENTITY_INSERT [dbo].[evaluation_indicator_values]  ON
INSERT [dbo].[evaluation_indicator_values] ([evaluation_id], [indicator_values_id]) VALUES (34, 32)
SET IDENTITY_INSERT [dbo].[evaluation_indicator_values]  OFF
PRINT 'Insert data into the evaluation_indicator_values table DONE...';


COMMIT TRANSACTION;