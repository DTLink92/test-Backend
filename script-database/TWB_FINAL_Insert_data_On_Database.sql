--================================================================================================================================================================
-- MARCELO START
--================================================================================================================================================================
USE the_walking_bugs
GO
SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
SET IDENTITY_INSERT [dbo].[Project]  ON
print 'insertando Projectos...'
INSERT INTO [Project]([id], [created_on], [updated_on], [version], [delivery_date], [economic_loss], [estimated_date], [gestion], [inversion], [name]) 
VALUES (1, '2010-06-04 00:00:00.000', '2011-12-04 00:00:00.000', 3, '2012-12-04 00:00:00.000', 698000, '2011-12-04 00:00:00.000', '2010-2012', 650000, 'Vivienda Av. suecia')
INSERT INTO [Project]([id], [created_on], [updated_on], [version], [delivery_date], [economic_loss], [estimated_date], [gestion], [inversion], [name]) 
VALUES (2, '2011-06-04 00:00:00.000', NULL, 1, '2012-06-04 00:00:00.000', 658700, '2017-06-04 00:00:00.000', '2011-2012', 650000, 'Edificio Palmas')
SET IDENTITY_INSERT [dbo].[Project]  OFF
print '...OK'

SET IDENTITY_INSERT [dbo].[Area]  ON
print 'insertando Areas'
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (1, '2010-06-04 00:00:00.000', NULL, 1, 'Construccion obra gruesa ', 'Construccion gruesa')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (2, '2010-06-04 00:00:00.000', NULL, 1, 'Electricidad ', 'Electricidad')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (3, '2010-06-04 00:00:00.000', NULL, 1, 'Plomeria ', ' Plomeria')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (4, '2010-12-04 00:00:00.000', NULL, 1, 'Fachado area externa', 'Fachado')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (5, '2010-12-04 00:00:00.000', NULL, 1, 'Pintado de interior y fachado', 'Pintura')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (6, '2010-12-04 00:00:00.000', NULL, 1, 'Construccin Obra fina', 'Construccioin fina')
SET IDENTITY_INSERT [dbo].[Area]  OFF
print '...OK'

SET IDENTITY_INSERT [dbo].[Area_Asign_Project]  ON
print 'insertando Area_Asign_Project...'
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (1, '2013-04-06 00:00:00.000', NULL, 1, 1, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (2, '2013-04-06 00:00:00.000', NULL, 1, 2, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (3, '2013-04-06 00:00:00.000', NULL, 1, 3, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (4, '2013-04-06 00:00:00.000', NULL, 1, 4, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (5, '2013-04-06 00:00:00.000', NULL, 1, 5, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (6, '2013-04-06 00:00:00.000', NULL, 1, 6, 1)

INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (7, '2013-04-06 00:00:00.000', NULL, 1, 1, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (8, '2013-04-06 00:00:00.000', NULL, 1, 2, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (9, '2013-04-06 00:00:00.000', NULL, 1, 3, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (10, '2013-04-06 00:00:00.000', NULL, 1, 4, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (11, '2013-04-06 00:00:00.000', NULL, 1, 5, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (12, '2013-04-06 00:00:00.000', NULL, 1, 6, 2)
print '...OK'
SET IDENTITY_INSERT [dbo].[Area_Asign_Project]  OFF


--================================================================================================================================================================
-- MARCELO END
--================================================================================================================================================================

--================================================================================================================================================================
-- LAURA START
--================================================================================================================================================================

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
SET IDENTITY_INSERT [dbo].[recruitmentprofile]  ON

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (1, 0 , N'Educacion'	  , N'Titulo de Ingeniero Industrial en mencion gerencial', N'Titulo'							          , 2)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (2, 0 , N'Experiencia'	, N'10 anios minimo en funciones similares'    			    , N'Certificacion y experiencia'	, 2)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (3, 0 , N'Otros'			  , N'Recomenciones numeros telefonicos'					        , N'referencias'					        , 2)

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (4, 0 , N'Educacion'	  , N'Titulo profesional de Arquitectura'					        , N'Titulo'							          , 3)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (5, 0 , N'Experiencia'	, N'7 anios minimo en funciones similares'				      , N'Demostrar proyectos'			    , 3)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (6, 0 , N'Otros'			  , N'Conocer las obras'									                , N'Certificaciones o referencias', 3)

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (7, 0 , N'Educacion'	  , N'Lic. Administracion de empresas'					          , N'Titulo o Anios de Expriencia'	, 4)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (8, 0 , N'Experiencia'	, N'5 anios minimo en funciones similares'				      , N'Certificacion'					      , 4)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (9, 0 , N'Otros'			  , N'Referencias practicas'								              , N'Certificaciones o referencias', 4)

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (10, 0, N'Educacion'	  , N'Oficio de Albanil'									                , N'Titulo de tecnico superior'		, 5)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (11, 0, N'Experiencia'	, N'10 anios de experiencia'							              , N'Cartas de recomendacion u obras', 5)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (12, 0, N'Otros'			  , N'Conocer Obras '										                  , N'Referencias de las obras'		   , 5)

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (13, 0, N'Educacion'	  , N'Oficio de albanil'									                , N'Anios de Experiencia'			      , 6)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (14, 0, N'Experiencia'	, N'5 anios de experiencia'								              , N'Cartas de recomendacion'		    , 6)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (15, 0, N'Otros'			  , N'Conocer Obras'										                  , N'Referencias de las Obras'		    , 6)

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (16, 0, N'Educacion'	  , N'Ninguno'											                      , N'Ninguna'						            , 7)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (17, 0, N'Experiencia'	, N'6 meses de experiencia'								              , N'Ninguna'						            , 7)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (18, 0, N'Otros'			  , N'nivel de educacion'									                , N'Registrar el nivel de educacion', 7)

INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (19, 0, N'Educacion'	  , N'Oficio de Mecanico Soldador'						            , N'Titulo de tecnico superior'		  , 8)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (20, 0, N'Experiencia'	, N'10 anios de experiencia'							              , N'Referencias'					          , 8)
INSERT [dbo].[recruitmentprofile] ([id],  [version], [description], [requirement], [verification], [position_id]) VALUES (21, 0, N'Otros'			  , N'Cartas de recomendacion'							              , N'Referencias'					          , 8)
SET IDENTITY_INSERT [dbo].[recruitmentprofile]  OFF;
PRINT 'Insert data into the recruitment_profile table DONE...';

--================================================================================================================================================================
-- BRIAN START
--================================================================================================================================================================


/*
------------------------------------------------------------------------------------------------
---------------------------------Inicializacion Roles-------------------------------------------
------------------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT Rol ON
INSERT INTO Rol(id,Name) 
VALUES (1,'Administrator')

INSERT INTO Rol(id,Name) 
VALUES (2,'SuperUser')

INSERT INTO Rol(id,Name) 
VALUES (3,'RegularUser')
SET IDENTITY_INSERT Rol off
/*
------------------------------------------------------------------------------------------------
---------------------------------Inicializacion Usuarios---------------------------------------
------------------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT System_Project_User ON
/*Adminnistradores*/
INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (1,'Admin','Admin','Admin123','1234administrator',1)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (2,'Brian','Perez','bp1992','02101992Pbrian',1)

/*SuperUser*/
INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (3,'Juan','Mejia','elMejia123','789Mejia',2)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (4,'Marcelo','Ramos','marshello56','mRamos789',2)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (5,'Laura','Tucuman','laura123','123tucuman',2)

/*RegularUser*/
INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (6,'Farid','Orellana','farid7456','F78945rid',3)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (7,'Enayda','Quispe','enayda789','quisPe789',3)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (8,'Lurdes','Choque','lurdesC123','789choquE',3)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (9,'Fernando','Orellana','FOrellana','Fer758Or',3)

INSERT INTO System_Project_User(id, Name, last_name, user_login, user_password, rol_id) 
VALUES (10,'Carla','Valdez','carlitaV','Car758Or',3)
SET IDENTITY_INSERT System_Project_User off

/*
------------------------------------------------------------------------------------------------
---------------------------------Inicializacion Empleados---------------------------------------
------------------------------------------------------------------------------------------------
*/

SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (1,'Ricardo','Vallarta','Av.Oquendo#231',7930324,4554055,'Casado/a','1991-7-26',2,'Ninguna','Masculino',NULL,'RicVal4554055@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (2,'Pamela','Cisneros','Av.Oquendo#411',7930325,4554056,'Casado/a','1995-11-20',2,'Ninguna','Femenino',NULL,'PamCis4554056@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (3,'Sabrina','Vallejo','Av.America#386',7930326,4554057,'Soltero/a','1984-9-15',3,'Ninguna','Femenino',NULL,'SabVal4554057@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (4,'Rosana','Moras','Av.Pando#720',7930327,4554058,'Divorciado/a','1981-7-9',3,'Ninguna','Femenino',NULL,'RosMor4554058@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (5,'Carla','Valles','Av.Heroinas#957',7930328,4554059,'Soltero/a','1981-7-19',2,'Ninguna','Femenino',NULL,'CarVal4554059@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (6,'Micaela','Morado','Av.Ayacucho#627',7930329,4554060,'Casado/a','1990-2-7',0,'Ninguna','Femenino',NULL,'MicMor4554060@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (7,'Alvaro','Cistos','Av.Pando#973',7930330,4554061,'Soltero/a','1991-12-17',2,'Ninguna','Masculino',NULL,'AlvCis4554061@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (8,'Sara','Valles','Av.Libertadores#242',7930331,4554062,'Viudo/a','1991-12-23',2,'Ninguna','Femenino',NULL,'SarVal4554062@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (9,'Gary','Moral','Av.Ramon Rivero#890',7930332,4554063,'Viudo/a','1986-7-2',2,'Ninguna','Masculino',NULL,'GarMor4554063@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (10,'Leda','Esqueda','Av.Ayacucho#565',7930333,4554064,'Casado/a','1982-10-4',1,'Ninguna','Femenino',NULL,'LedEsq4554064@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (11,'Guadalupe','Aboites','Av.San Martin#325',7930334,4554065,'Soltero/a','1991-4-23',0,'Ninguna','Femenino',NULL,'GuaAbo4554065@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (12,'Agustin','Valles','Av.Heroinas#602',7930335,4554066,'Viudo/a','1989-4-10',2,'Ninguna','Masculino',NULL,'AguVal4554066@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (13,'Pablo','Morado','Av.Beijing#961',7930336,4554067,'Viudo/a','1989-5-14',1,'Ninguna','Masculino',NULL,'PabMor4554067@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (14,'Moises','Cirilo','Av.San Martin#584',7930337,4554068,'Casado/a','1983-1-24',3,'Ninguna','Masculino',NULL,'MoiCir4554068@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (15,'Aaron','Valeriano','Av.Peru#586',7930338,4554069,'Casado/a','1984-12-18',0,'Ninguna','Masculino',NULL,'AarVal4554069@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (16,'Catalina','Bera','Av.Ramon Rivero#644',7930339,4554070,'Casado/a','1991-10-19',2,'Ninguna','Femenino',NULL,'CatBer4554070@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (17,'Tania','Esquibel','Av.Oquendo#453',7930340,4554071,'Viudo/a','1991-11-22',0,'Ninguna','Femenino',NULL,'TanEsq4554071@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (18,'Trinidad','Benegas','Av.Peru#119',7930341,4554072,'Divorciado/a','1992-7-13',2,'Ninguna','Femenino',NULL,'TriBen4554072@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (19,'Ana','Belos','Av.Libertadores#153',7930342,4554073,'Soltero/a','1981-7-4',1,'Ninguna','Femenino',NULL,'AnaBel4554073@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (20,'Royer','Abad','Av.Ayacucho#205',7930343,4554074,'Divorciado/a','1991-12-11',3,'Ninguna','Masculino',NULL,'RoyAba4554074@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (21,'Julia','Samorano','Av.Oquendo#201',7930344,4554075,'Soltero/a','1987-9-30',0,'Ninguna','Femenino',NULL,'JulSam4554075@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (22,'Pablo','Bera','Av.Pando#911',7930345,4554076,'Divorciado/a','1984-11-16',1,'Ninguna','Masculino',NULL,'PabBer4554076@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (23,'Samuel','Samudio','Av.America#133',7930346,4554077,'Divorciado/a','1995-11-16',1,'Ninguna','Masculino',NULL,'SamSam4554077@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (24,'Manuel','Espitia','Av.San Martin#434',7930347,4554078,'Soltero/a','1988-3-13',0,'Ninguna','Masculino',NULL,'ManEsp4554078@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (25,'Valeria','Morales','Av.Oquendo#621',7930348,4554079,'Casado/a','1987-12-22',0,'Ninguna','Femenino',NULL,'ValMor4554079@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (26,'Diego','Valle','Av.San Martin#656',7930349,4554080,'Casado/a','1994-9-3',1,'Ninguna','Masculino',NULL,'DieVal4554080@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (27,'Moises','Belos','Av.Beijing#916',7930350,4554081,'Casado/a','1985-3-4',1,'Ninguna','Masculino',NULL,'MoiBel4554081@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (28,'Diego','Samudio','Av.Ayacucho#545',7930351,4554082,'Soltero/a','1992-5-4',1,'Ninguna','Masculino',NULL,'DieSam4554082@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (29,'Clara','Clemente','Av.Beijing#869',7930352,4554083,'Casado/a','1993-2-18',2,'Ninguna','Femenino',NULL,'ClaCle4554083@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (30,'Ariel','Abendano','Av.Pando#281',7930353,4554084,'Soltero/a','1990-2-11',2,'Ninguna','Masculino',NULL,'AriAbe4554084@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (31,'Lucas','Abarca','Av.America#406',7930354,4554085,'Viudo/a','1995-10-7',2,'Ninguna','Masculino',NULL,'LucAba4554085@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (32,'Anastasia','Bentura','Av.Peru#915',7930355,4554086,'Viudo/a','1986-5-2',0,'Ninguna','Femenino',NULL,'AnaBen4554086@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (33,'Greta','Abitua','Av.Ustariz#955',7930356,4554087,'Soltero/a','1991-4-4',0,'Ninguna','Femenino',NULL,'GreAbi4554087@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (34,'William','Abarca','Av.Pando#629',7930357,4554088,'Viudo/a','1990-6-6',3,'Ninguna','Masculino',NULL,'WilAba4554088@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (35,'Roberto','Sanabria','Av.Oquendo#916',7930358,4554089,'Casado/a','1987-6-11',0,'Ninguna','Masculino',NULL,'RobSan4554089@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (36,'Agustin','Espitia','Av.Pando#253',7930359,4554090,'Divorciado/a','1992-2-2',0,'Ninguna','Masculino',NULL,'AguEsp4554090@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (37,'Sergio','Moreno','Av.Beijing#310',7930360,4554091,'Casado/a','1995-7-26',1,'Ninguna','Masculino',NULL,'SerMor4554091@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (38,'Einar','Mora','Av.Ayacucho#275',7930361,4554092,'Casado/a','1990-9-10',3,'Ninguna','Masculino',NULL,'EinMor4554092@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (39,'Thiago','Morales','Av.Heroinas#208',7930362,4554093,'Divorciado/a','1984-12-30',0,'Ninguna','Masculino',NULL,'ThiMor4554093@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (40,'Lia','Montufar','Av.America#247',7930363,4554094,'Divorciado/a','1995-8-6',3,'Ninguna','Femenino',NULL,'LiaMon4554094@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (41,'Gael','Bentura','Av.Heroinas#404',7930364,4554095,'Casado/a','1994-10-28',3,'Ninguna','Masculino',NULL,'GaeBen4554095@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (42,'Cesar','Abrego','Av.Peru#905',7930365,4554096,'Viudo/a','1992-8-7',1,'Ninguna','Masculino',NULL,'CesAbr4554096@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (43,'Olga','Abendano','Av.Beijing#618',7930366,4554097,'Soltero/a','1995-2-18',2,'Ninguna','Femenino',NULL,'OlgAbe4554097@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (44,'Brian','Valesquez','Av.America#295',7930367,4554098,'Divorciado/a','1993-3-29',2,'Ninguna','Masculino',NULL,'BriVal4554098@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (45,'Leonardo','Samudio','Av.Blanco Galindo#726',7930368,4554099,'Divorciado/a','1981-3-30',3,'Ninguna','Masculino',NULL,'LeoSam4554099@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (46,'Felix','Montufar','Av.Libertadores#586',7930369,4554100,'Casado/a','1987-4-10',1,'Ninguna','Masculino',NULL,'FelMon4554100@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (47,'Vicente','Sanabia','Av.America#202',7930370,4554101,'Viudo/a','1987-9-7',1,'Ninguna','Masculino',NULL,'VicSan4554101@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (48,'Samuel','Valensia','Av.Pando#716',7930371,4554102,'Divorciado/a','1990-1-6',2,'Ninguna','Masculino',NULL,'SamVal4554102@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (49,'Minerva','Abonce','Av.Beijing#814',7930372,4554103,'Casado/a','1986-5-19',1,'Ninguna','Femenino',NULL,'MinAbo4554103@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (50,'Pablo','Moral','Av.Ramon Rivero#567',7930373,4554104,'Casado/a','1992-7-5',1,'Ninguna','Masculino',NULL,'PabMor4554104@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (51,'Rosaura','Benegas','Av.Pando#148',7930374,4554105,'Soltero/a','1987-5-9',1,'Ninguna','Femenino',NULL,'RosBen4554105@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (52,'Gemma','Cimental','Av.Oquendo#975',7930375,4554106,'Casado/a','1995-12-17',1,'Ninguna','Femenino',NULL,'GemCim4554106@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (53,'Josue','Abitua','Av.Pando#260',7930376,4554107,'Viudo/a','1987-6-10',1,'Ninguna','Masculino',NULL,'JosAbi4554107@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (54,'Felicidad','Esquibel','Av.Libertadores#530',7930377,4554108,'Divorciado/a','1987-1-27',3,'Ninguna','Femenino',NULL,'FelEsq4554108@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (55,'Salome','Moras','Av.Libertadores#260',7930378,4554109,'Divorciado/a','1981-12-3',0,'Ninguna','Femenino',NULL,'SalMor4554109@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (56,'Lia','Samorano','Av.Oquendo#536',7930379,4554110,'Divorciado/a','1995-4-8',2,'Ninguna','Femenino',NULL,'LiaSam4554110@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (57,'Irene','Morelos','Av.Ramon Rivero#697',7930380,4554111,'Divorciado/a','1992-5-7',3,'Ninguna','Femenino',NULL,'IreMor4554111@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (58,'Rosana','Abalos','Av.Heroinas#708',7930381,4554112,'Soltero/a','1989-7-2',3,'Ninguna','Femenino',NULL,'RosAba4554112@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (59,'Salome','Valeria','Av.Blanco Galindo#694',7930382,4554113,'Divorciado/a','1988-5-13',1,'Ninguna','Femenino',NULL,'SalVal4554113@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (60,'Veronica','Moras','Av.Heroinas#829',7930383,4554114,'Soltero/a','1989-2-26',3,'Ninguna','Femenino',NULL,'VerMor4554114@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (61,'Zacarias','Abila','Av.Pando#889',7930384,4554115,'Casado/a','1993-12-1',0,'Ninguna','Masculino',NULL,'ZacAbi4554115@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (62,'Adam','Berber','Av.Pando#625',7930385,4554116,'Casado/a','1990-1-24',2,'Ninguna','Masculino',NULL,'AdaBer4554116@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (63,'Lorete','Morado','Av.Peru#266',7930386,4554117,'Casado/a','1995-2-15',3,'Ninguna','Femenino',NULL,'LorMor4554117@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (64,'Matias','Samaniego','Av.Ayacucho#186',7930387,4554118,'Divorciado/a','1984-10-13',2,'Ninguna','Masculino',NULL,'MatSam4554118@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (65,'Ismael','Montoya','Av.Blanco Galindo#878',7930388,4554119,'Divorciado/a','1982-5-27',1,'Ninguna','Masculino',NULL,'IsmMon4554119@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (66,'Royer','Abonce','Av.Blanco Galindo#997',7930389,4554120,'Divorciado/a','1986-7-1',2,'Ninguna','Masculino',NULL,'RoyAbo4554120@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (67,'Pedro','Morelos','Av.Peru#726',7930390,4554121,'Soltero/a','1995-6-25',2,'Ninguna','Masculino',NULL,'PedMor4554121@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (68,'Thiago','Sanabria','Av.Oquendo#902',7930391,4554122,'Soltero/a','1989-8-25',3,'Ninguna','Masculino',NULL,'ThiSan4554122@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (69,'Santiago','Berdin','Av.America#648',7930392,4554123,'Casado/a','1993-5-16',1,'Ninguna','Masculino',NULL,'SanBer4554123@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (70,'Emma','Benito','Av.Libertadores#574',7930393,4554124,'Viudo/a','1991-7-2',0,'Ninguna','Femenino',NULL,'EmmBen4554124@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (71,'William','Valesquez','Av.Heroinas#702',7930394,4554125,'Divorciado/a','1984-5-24',2,'Ninguna','Masculino',NULL,'WilVal4554125@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (72,'Lea','Cimental','Av.Beijing#473',7930395,4554126,'Soltero/a','1984-5-10',2,'Ninguna','Femenino',NULL,'LeaCim4554126@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (73,'Ramiro','Vallarta','Av.Beijing#406',7930396,4554127,'Soltero/a','1983-12-26',2,'Ninguna','Masculino',NULL,'RamVal4554127@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (74,'Adolfo','Valesquez','Av.San Martin#581',7930397,4554128,'Soltero/a','1987-5-18',2,'Ninguna','Masculino',NULL,'AdoVal4554128@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (75,'Rocío','Mora','Av.Ustariz#560',7930398,4554129,'Divorciado/a','1987-7-17',3,'Ninguna','Femenino',NULL,'RocMor4554129@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (76,'Agustina','Abrego','Av.Oquendo#954',7930399,4554130,'Casado/a','1983-3-10',0,'Ninguna','Femenino',NULL,'AguAbr4554130@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (77,'Lorena','Esquibias','Av.Beijing#409',7930400,4554131,'Soltero/a','1987-7-8',2,'Ninguna','Femenino',NULL,'LorEsq4554131@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (78,'Julia','Bera','Av.Peru#617',7930401,4554132,'Viudo/a','1990-5-17',0,'Ninguna','Femenino',NULL,'JulBer4554132@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (79,'Adriana','Bentura','Av.Beijing#412',7930402,4554133,'Casado/a','1993-12-15',0,'Ninguna','Femenino',NULL,'AdrBen4554133@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (80,'Dante','Benito','Av.Heroinas#646',7930403,4554134,'Soltero/a','1986-7-5',0,'Ninguna','Masculino',NULL,'DanBen4554134@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (81,'Madalena','Samarron','Av.Beijing#117',7930404,4554135,'Divorciado/a','1995-6-26',1,'Ninguna','Femenino',NULL,'MadSam4554135@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (82,'Daniel','Samores','Av.Libertadores#997',7930405,4554136,'Soltero/a','1995-10-3',1,'Ninguna','Masculino',NULL,'DanSam4554136@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (83,'Gloria','Moral','Av.Ayacucho#222',7930406,4554137,'Soltero/a','1985-2-4',0,'Ninguna','Femenino',NULL,'GloMor4554137@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (84,'Sabrina','Belos','Av.Oquendo#419',7930407,4554138,'Soltero/a','1995-2-13',2,'Ninguna','Femenino',NULL,'SabBel4554138@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (85,'Ramiro','Moreno','Av.Oquendo#992',7930408,4554139,'Casado/a','1990-2-6',0,'Ninguna','Masculino',NULL,'RamMor4554139@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (86,'Victoria','Morantes','Av.Ramon Rivero#319',7930409,4554140,'Casado/a','1989-2-28',3,'Ninguna','Femenino',NULL,'VicMor4554140@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (87,'Erica','Sanabria','Av.Blanco Galindo#921',7930410,4554141,'Soltero/a','1981-2-23',1,'Ninguna','Femenino',NULL,'EriSan4554141@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (88,'Salome','Vallarta','Av.America#960',7930411,4554142,'Casado/a','1985-8-15',3,'Ninguna','Femenino',NULL,'SalVal4554142@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (89,'Angeles','Samano','Av.Libertadores#226',7930412,4554143,'Viudo/a','1994-3-17',2,'Ninguna','Femenino',NULL,'AngSam4554143@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (90,'Vicente','Abitua','Av.Oquendo#336',7930413,4554144,'Divorciado/a','1981-7-7',0,'Ninguna','Masculino',NULL,'VicAbi4554144@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (91,'Diego','Valles','Av.Ustariz#138',7930414,4554145,'Viudo/a','1988-3-1',3,'Ninguna','Masculino',NULL,'DieVal4554145@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (92,'Eduardo','Abad','Av.Peru#372',7930415,4554146,'Viudo/a','1982-10-10',1,'Ninguna','Masculino',NULL,'EduAba4554146@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (93,'Felipe','Montoya','Av.Ramon Rivero#327',7930416,4554147,'Soltero/a','1993-3-3',1,'Ninguna','Masculino',NULL,'FelMon4554147@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (94,'Alvaro','Monzon','Av.San Martin#600',7930417,4554148,'Casado/a','1985-4-10',3,'Ninguna','Masculino',NULL,'AlvMon4554148@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (95,'Francisco','Sanabia','Av.San Martin#742',7930418,4554149,'Divorciado/a','1992-3-7',2,'Ninguna','Masculino',NULL,'FraSan4554149@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (96,'Sonia','Esquivias','Av.Pando#411',7930419,4554150,'Divorciado/a','1988-12-5',3,'Ninguna','Femenino',NULL,'SonEsq4554150@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (97,'Ivan','Samarron','Av.Beijing#695',7930420,4554151,'Divorciado/a','1988-11-25',2,'Ninguna','Masculino',NULL,'IvaSam4554151@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (98,'Ernesto','Benito','Av.Beijing#636',7930421,4554152,'Soltero/a','1987-10-9',3,'Ninguna','Masculino',NULL,'ErnBen4554152@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (99,'Israel','Samorano','Av.Ayacucho#169',7930422,4554153,'Divorciado/a','1981-12-3',2,'Ninguna','Masculino',NULL,'IsrSam4554153@gmail.com')
INSERT INTO [dbo].[Employee](id, first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email)
VALUES (100,'Miranda','Clark','Av.America#945',7930423,4554154,'Divorciado/a','1995-10-13',2,'Ninguna','Femenino',NULL,'MirCla4554154@gmail.com')
SET IDENTITY_INSERT [dbo].[Employee] off

/*----------------Inicializacion Contratos----------------------------------------*/
SET IDENTITY_INSERT [dbo].[Project_Contract] on

/*-----------------------------------------------------1-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (1,'Contrato Basico', '2013-12-1', '2021-12-1',12500,1,1, NULL,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (2,'Contrato Basico', '2006-6-13', '2026-6-13',12500,1,2, NULL,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (3,'Contrato Basico', '2012-8-27', '2032-8-27',12500,1,3, NULL,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (4,'Contrato Basico', '2015-1-15', '2026-1-15',12500,1,4, NULL,2)
/*-----------------------------------------------------2-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (5,'Contrato Basico', '2010-5-21', '2021-5-21',7500,2,5, 1,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (6,'Contrato Basico', '2013-9-15', '2026-9-15',7500,2,6, 2,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (7,'Contrato Basico', '2008-4-10', '2025-4-10',7500,2,7, 3,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (8,'Contrato Basico', '2005-9-10', '2026-9-10',7500,2,8, 4,2)
/*-----------------------------------------------------3-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (9,'Contrato Basico', '2015-6-8', '2031-6-8',5833,3,9, 5,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (10,'Contrato Basico', '2007-5-4', '2031-5-4',5833,3,10, 6,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (11,'Contrato Basico', '2015-1-1', '2022-1-1',5833,3,11, 7,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (12,'Contrato Basico', '2013-11-26', '2021-11-26',5833,3,12, 8,2)
 /*-----------------------------------------------------4-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (13,'Contrato Basico', '2008-1-14', '2024-1-14',5000,4,13, 9,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (14,'Contrato Basico', '2016-2-6', '2031-2-6',5000,4,14, 10,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (15,'Contrato Basico', '2013-7-9', '2023-7-9',5000,4,15, 11,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (16,'Contrato Basico', '2015-10-25', '2020-10-25',5000,4,16, 12,2)
/*-----------------------------------------------------5-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (17,'Contrato Basico', '2006-12-8', '2026-12-8',4500,5,17, 9,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (18,'Contrato Basico', '2016-6-19', '2024-6-19',4500,5,18, 10,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (19,'Contrato Basico', '2006-4-10', '2029-4-10',4500,5,19, 11,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (20,'Contrato Basico', '2016-9-21', '2030-9-21',4500,5,20, 12,2)
 /*-----------------------------------------------------6-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (21,'Contrato Basico', '2015-7-27', '2027-7-27',4167,6,21, 13,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (22,'Contrato Basico', '2005-10-18', '2021-10-18',4167,6,22, 14,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (23,'Contrato Basico', '2015-7-1', '2030-7-1',4167,6,23, 15,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (24,'Contrato Basico', '2005-12-12', '2021-12-12',4167,6,24, 16,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (25,'Contrato Basico', '2016-8-13', '2027-8-13',4167,6,25, 13,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (26,'Contrato Basico', '2014-11-6', '2030-11-6',4167,6,26, 14,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (27,'Contrato Basico', '2016-11-16', '2025-11-16',4167,6,27, 15,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (28,'Contrato Basico', '2007-12-22', '2023-12-22',4167,6,28, 16,2)
/*-----------------------------------------------------7-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (29,'Contrato Basico', '2009-11-22', '2029-11-22',3929,7,29, 17,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (30,'Contrato Basico', '2009-10-30', '2027-10-30',3929,7,30, 18,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (31,'Contrato Basico', '2005-4-6', '2026-4-6',3929,7,31, 19,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (32,'Contrato Basico', '2005-3-19', '2025-3-19',3929,7,32, 20,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (33,'Contrato Basico', '2011-2-23', '2028-2-23',3929,7,33, 17,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (34,'Contrato Basico', '2018-3-22', '2030-3-22',3929,7,34, 18,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (35,'Contrato Basico', '2010-10-22', '2026-10-22',3929,7,35, 19,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (36,'Contrato Basico', '2010-5-28', '2031-5-28',3929,7,36, 20,2)
/*-----------------------------------------------------8-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (37,'Contrato Basico', '2015-5-10', '2020-5-10',3750,8,37, 21,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (38,'Contrato Basico', '2016-6-10', '2031-6-10',3750,8,38, 22,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (39,'Contrato Basico', '2013-10-10', '2021-10-10',3750,8,39, 23,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (40,'Contrato Basico', '2012-3-14', '2023-3-14',3750,8,40, 24,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (41,'Contrato Basico', '2014-10-16', '2029-10-16',3750,8,41, 25,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (42,'Contrato Basico', '2007-8-13', '2025-8-13',3750,8,42, 26,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (43,'Contrato Basico', '2016-3-7', '2031-3-7',3750,8,43, 27,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (44,'Contrato Basico', '2006-11-12', '2024-11-12',3750,8,44, 28,2)
/*-----------------------------------------------------9-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (45,'Contrato Basico', '2010-5-11', '2033-5-11',3611,9,45, 29,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (46,'Contrato Basico', '2008-2-2', '2031-2-2',3611,9,46, 30,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (47,'Contrato Basico', '2013-11-30', '2020-11-30',3611,9,47, 31,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (48,'Contrato Basico', '2010-2-8', '2030-2-8',3611,9,48, 32,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (49,'Contrato Basico', '2012-12-4', '2021-12-4',3611,9,49, 33,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (50,'Contrato Basico', '2012-9-19', '2027-9-19',3611,9,50, 34,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (51,'Contrato Basico', '2015-10-20', '2032-10-20',3611,9,51, 35,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (52,'Contrato Basico', '2011-8-3', '2025-8-3',3611,9,52, 36,2)
/*-----------------------------------------------------10-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (53,'Contrato Basico', '2017-7-11', '2031-7-11',3500,10,53, 37,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (54,'Contrato Basico', '2008-2-5', '2029-2-5',3500,10,54, 38,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (55,'Contrato Basico', '2014-8-17', '2024-8-17',3500,10,55, 39,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (56,'Contrato Basico', '2011-6-14', '2025-6-14',3500,10,56, 40,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (57,'Contrato Basico', '2012-8-8', '2026-8-8',3500,10,57, 41,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (58,'Contrato Basico', '2005-1-24', '2025-1-24',3500,10,58, 42,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (59,'Contrato Basico', '2017-6-17', '2026-6-17',3500,10,59, 43,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (60,'Contrato Basico', '2015-11-18', '2025-11-18',3500,10,60, 44,2)
/*-----------------------------------------------------11-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (61,'Contrato Basico', '2017-5-23', '2029-5-23',3409,11,61, 45,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (62,'Contrato Basico', '2009-11-29', '2025-11-29',3409,11,62, 46,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (63,'Contrato Basico', '2009-7-13', '2025-7-13',3409,11,63, 47,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (64,'Contrato Basico', '2011-8-11', '2033-8-11',3409,11,64, 48,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (65,'Contrato Basico', '2006-2-18', '2033-2-18',3409,11,65, 49,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (66,'Contrato Basico', '2005-11-20', '2024-11-20',3409,11,66, 50,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (67,'Contrato Basico', '2010-11-18', '2025-11-18',3409,11,67, 51,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (68,'Contrato Basico', '2010-7-21', '2027-7-21',3409,11,68, 52,2)
 /*-----------------------------------------------------12-----------------------------------------------------------------------*/
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (69,'Contrato Basico', '2016-1-5', '2025-1-5',3333,12,69, 61,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (70,'Contrato Basico', '2009-8-20', '2032-8-20',3333,12,70, 62,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (71,'Contrato Basico', '2018-5-10', '2031-5-10',3333,12,71, 63,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (72,'Contrato Basico', '2014-3-9', '2029-3-9',3333,12,72, 64,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (73,'Contrato Basico', '2005-12-14', '2027-12-14',3333,12,73, 65,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (74,'Contrato Basico', '2016-5-1', '2025-5-1',3333,12,74, 66,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (75,'Contrato Basico', '2018-5-27', '2030-5-27',3333,12,75, 67,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (76,'Contrato Basico', '2017-12-11', '2031-12-11',3333,12,76, 68,2)
/*-----------------------------------------------------13-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (77,'Contrato Basico', '2014-9-2', '2020-9-2',3269,13,77, 69,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (78,'Contrato Basico', '2012-6-22', '2033-6-22',3269,13,78, 70,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (79,'Contrato Basico', '2006-7-13', '2028-7-13',3269,13,79, 71,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (80,'Contrato Basico', '2008-5-9', '2028-5-9',3269,13,80, 72,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (81,'Contrato Basico', '2015-2-7', '2020-2-7',3269,13,81, 73,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (82,'Contrato Basico', '2015-10-28', '2032-10-28',3269,13,82, 74,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (83,'Contrato Basico', '2011-7-25', '2033-7-25',3269,13,83, 75,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (84,'Contrato Basico', '2014-2-17', '2029-2-17',3269,13,84, 76,2)
/*-----------------------------------------------------14-----------------------------------------------------------------------*/
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (85,'Contrato Basico', '2011-7-30', '2024-7-30',3214,14,85, 77,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (86,'Contrato Basico', '2006-10-21', '2022-10-21',3214,14,86, 78,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (87,'Contrato Basico', '2014-6-6', '2029-6-6',3214,14,87, 79,1)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (88,'Contrato Basico', '2007-3-29', '2020-3-29',3214,14,88, 80,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (89,'Contrato Basico', '2016-7-2', '2028-7-2',3214,14,89, 81,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (90,'Contrato Basico', '2017-10-18', '2022-10-18',3214,14,90, 82,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (91,'Contrato Basico', '2005-3-19', '2030-3-19',3214,14,91, 83,2)
 INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (92,'Contrato Basico', '2016-7-23', '2033-7-23',3214,14,92, 84,2)
/*-----------------------------------------------------15-----------------------------------------------------------------------*/
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (93,'Contrato Basico', '2015-7-13', '2020-7-13',3167,15,93, 85,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (94,'Contrato Basico', '2018-7-2', '2029-7-2',3167,15,94, 86,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (95,'Contrato Basico', '2007-7-9', '2020-7-9',3167,15,95, 87,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (96,'Contrato Basico', '2013-9-29', '2024-9-29',3167,15,96, 88,1)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (97,'Contrato Basico', '2018-1-22', '2025-1-22',3167,15,97, 89,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (98,'Contrato Basico', '2007-10-22', '2027-10-22',3167,15,98, 90,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (99,'Contrato Basico', '2007-8-25', '2027-8-25',3167,15,99, 91,2)
INSERT INTO [dbo].[Project_Contract](id, contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, project_id) VALUES (100,'Contrato Basico', '2008-12-16', '2020-12-16',3167,15,100, 92,2)

SET IDENTITY_INSERT [dbo].[Project_Contract] off


--================================================================================================================================================================
-- BRIAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- LAURA START
--================================================================================================================================================================

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



--================================================================================================================================================================
-- LAURA END
--================================================================================================================================================================

--================================================================================================================================================================
-- ENAYDA START
--================================================================================================================================================================

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
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (300, 500);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (301,500 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (302, 500);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (308, 501);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (309,  501);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (310, 501);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (316, 502 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (317, 502 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (318,  503);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (329, 503);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (331, 503);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (335, 504 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (334, 504 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (303,  504);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (304, 504 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (312, 505 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (313, 505 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (319, 505 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (320,506 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (329,  506);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (300, 507);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (301,507 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (302, 507);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (308, 508);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (309,  508);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (310, 508);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (316, 508 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (317, 509 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (318,  509);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (329, 509);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (331, 510);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (335, 510 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (334, 510 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (303,  511);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (304, 511);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (312, 511 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (313, 512 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (319, 512 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (320,512);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (329,  513);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (334, 513 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (303,  513);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (304, 514);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (312, 514 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (313, 514 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (319, 515 );
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (320,515);
insert into [dbo].[accident_causes]([id_cause],[id_accident])
								  values (329,  515);

PRINT ' TABLA ACCIDENTACCIDENTCAUSE lleno!!!!';



--================================================================================================================================================================
-- ENAYDA END
--================================================================================================================================================================

--================================================================================================================================================================
-- JUAN START
--================================================================================================================================================================

PRINT 'tabla employee_accident inserts';
SET IDENTITY_INSERT dbo.employee_accident ON;
insert into employee_accident(id, id_employee,id_accident, detalle_lesion,tipo_lesion, zona_lesion)
         values (1,1,500,'caida de andamio', 'lesion en la rodilla','rodilla'),
		        (2,2,500,'caida de andamio', 'lesion en el tendon de aquiles','tendon de aquiles'),
				(3,3,500,'caida de andamio', 'lesion en la canilla','canilla'),
				(4,4,501,'barandillas defectuosas', 'lesion en el brazo','brazo'),
				(5,5,501,'barandillas defectuosas', 'lesion en la rodilla','rodilla'),
				(6,6,502,'no uso de arnes', 'lesion en la columna','columna'),
				(7,7,502,'no uso de arnes', 'lesion en la cadera','cadera'),
				(8,8,502,'no uso de arnes', 'lesion en la columna','columna'),
				(9,9,502,'no uso de arnes', 'lesion en la columna','columna'),
				(10,10,503,'caida de escalera', 'lesion en las piernas','piernas'),
				(11,11,503,'caida de escalera', 'lesion en las piernas','piernas'),
				(12,12,503,'caida de escalera', 'lesion en las piernas','piernas'),
				(13,13,503,'caida de escalera', 'lesion en las piernas','piernas'),
				(14,14,503,'caida de escalera', 'lesion en las piernas ','piernas'),
				(15,15,504,'uso inadecuado de arnez', 'lesion en el tobillo','tobillo'),
				(16,16,504,'uso inadecuado de arnez', 'torsedura en el tobillo','tobillo'),
				(17,17,505,'uso inadecuado de la cuerda de seguridad', 'lesion en la espalda','espalda'),
				(18,18,506,'trabajadores siendo golpeados por equipo pesado', 'lesion en la columna','columna'),
				(19,19,506,'trabajadores siendo golpeados por equipo pesado', 'lesion en espalda','espalda'),
				(20,1,506,'trabajadores siendo golpeados por equipo pesado', 'lesion en la espalda','espalda'),
				(21,2,506,'trabajadores siendo golpeados por equipo pesado', 'lesion en la columna','columna'),
				(22,20,506,'trabajadores siendo golpeados por equipo pesado', 'lesion en la pierna','pierna'),
				(23,21,506,'trabajadores siendo golpeados por equipo pesado', 'lesion en la pierna','pierna'),
				(24,22,507,'trabajadores arrollados por vehiculos', 'lesion en pierna','pierna'),
				(25,23,507,'trabajadores arrollados por vehiculos', 'lesion en la cadera','cadera'),
				(26,24,507,'trabajadores arrollados por vehiculos', 'lesion en la pierna','pierna'),
				(27,25,507,'trabajadores arrollados por vehiculos', 'lesion en la columna','columna'),
				(28,1,507,'trabajadores arrollados por vehiculos', 'lesion en la espalda','espalda'),
				(29,26,507,'trabajadores arrollados por vehiculos', 'lesion en la cadera','cadera'),
				(30,10,507,'trabajadores arrollados por vehiculos', 'lesion en la cadera','cadera'),
				(31,11,508,'accidente de gruas', 'golpe en las extremidades infereiores','piernas'),
				(32,1,509,'superficies resbalones', 'lesion en la cadera','cadera'),
				(33,2,510,'objeto cae desde grandes alturas', 'golpe en la cabeza','cabeza');

SET IDENTITY_INSERT dbo.employee_accident OFF;
PRINT 'tabla employee_accident terminada';

--================================================================================================================================================================
-- JUAN END
--================================================================================================================================================================
--================================================================================================================================================================
-- FADIR START


PRINT 'Insert data into the type_equipment table...';

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




--================================================================================================================================================================
-- FADIR END
--================================================================================================================================================================

--================================================================================================================================================================
-- LOURDES START
--================================================================================================================================================================
/******************************************************************************
**  Desc.: Datos para assign_equipment, detail_assign_equip, position_equip
*******************************************************************************/


PRINT 'Insertar dato dentro de assign_equipment...';
SET IDENTITY_INSERT [dbo].[assign_equipment]  ON
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (1, 1, '2018-04-14', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (2, 2, '2018-04-14', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (3, 3, '2018-05-14', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (4, 4, '2018-05-15', 'Equipo en estado deficiente');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (5, 5, '2018-05-15', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (6, 6, '2018-05-15', 'Equipo necesita manteniemiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (7, 7, '2018-06-15', 'Equipo presenta daño');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (8, 8, '2018-06-16', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (9, 9, '2018-06-16', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment(id, employee_id, date_assign, description)
VALUES (10, 10, '2018-06-16', 'Equipo presenta daño');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (11, 11, '2018-06-16', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (12, 12, '2018-07-16', 'Equipo en estado deficiente');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (13, 13, '2018-07-17', 'Equipo con averías en estructura');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (14, 14, '2018-07-17', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (15, 15, '2018-07-17', 'Equipo necesita manteniemiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (16, 16, '2018-08-17', 'Equipo presenta daño severo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (17, 17, '2018-08-17', 'Equipo con daños leves');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (18, 18, '2018-08-17', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (19, 19, '2018-09-18', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (20, 20, '2018-09-18', 'Equipo con fallas leves');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (21, 21, '2018-09-18', 'Equipo con falla mecánica');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (22, 22, '2018-10-18', 'Equipo nuevo');
SET IDENTITY_INSERT [dbo].[assign_equipment]  OFF;
PRINT 'Tabla assign_equipment hecho...';

PRINT 'Insertar dato dentro de detail_assign_equipment...';
SET IDENTITY_INSERT [dbo].[detail_assign_equipment]  ON
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (1, 1, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (2, 1, 5);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (3, 1, 2);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (4, 2, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (5, 2, 6);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (6, 3, 7);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (7, 3, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (8, 4, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (9, 4, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (10, 5, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (11, 5, 11);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (12, 5, 5);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (13, 6, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (14, 6, 9);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (15, 7, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (16, 7, 2);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (17, 8, 9);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (18, 9, 12);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (19, 10, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (20, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (21, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (22, 10, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (23, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (24, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (25, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (26, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (27, 10, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (28, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (29, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (30, 13, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (31, 13, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (32, 14, 7);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (33, 14, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (34, 15, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (35, 15, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (36, 15, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (37, 16, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (38, 16, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (39, 17, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (40, 18, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (41, 19, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (42, 19, 2);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (43, 20, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (44, 20, 5);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (45, 20, 3);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (46, 21, 11);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (47, 22, 9);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (48, 22, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (49, 22, 10);
SET IDENTITY_INSERT [dbo].[detail_assign_equipment]  OFF;
PRINT 'Tabla detail_assign_equipment hecho...';

PRINT 'Insertar dato dentro de position_equipment...';
SET IDENTITY_INSERT [dbo].[position_equipment]  ON
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (1, 2, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (2, 2, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (3, 2, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (4, 2, 40);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (5, 3, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (6, 3, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (7, 3, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (8, 3, 34);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (9, 3, 40);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (10, 4, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (11, 4, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (12, 4, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (13, 4, 34);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (14, 4, 36);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (15, 4, 38);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (16, 4, 39);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (17, 5, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (18, 5, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (19, 5, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (20, 5, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (21, 5, 34);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (22, 5, 36);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (23, 5, 38);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (24, 5, 39);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (25, 5, 40);
SET IDENTITY_INSERT [dbo].[position_equipment]  OFF;
PRINT 'Tabla position_equipment hecho...';


COMMIT TRANSACTION;
GO
--================================================================================================================================================================
-- LOURDES END
--================================================================================================================================================================

