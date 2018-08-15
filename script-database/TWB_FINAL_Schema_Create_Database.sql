USE [the_walking_bugs]
GO
--================================================================================================================================================================
-- MARCELO START
--================================================================================================================================================================
PRINT 'Creado la tabla Area...';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Area]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Area](id int  IDENTITY(1,1) NOT NULL,
  								  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  								  updated_on datetime NULL DEFAULT NULL,
  								  version bigint NOT NULL,
  								  detail varchar(255)  NULL DEFAULT NULL,
  							      name varchar(100)  NULL,  								
		 CONSTRAINT [pk_area] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Area Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Area ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla Project...';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Project]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Project]( id int IDENTITY(1,1) NOT NULL,
  									  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  									  updated_on datetime NULL DEFAULT NULL,
  									  version bigint NOT NULL,
  									  delivery_date datetime NULL DEFAULT NULL,
  									  economic_loss float NOT NULL ,
  									  estimated_date datetime NULL DEFAULT NULL,
  									  gestion varchar(10) NOT NULL,
  									  inversion float  NULL DEFAULT NULL,
  									  name varchar(50)   NOT NULL ,
		 CONSTRAINT [pk_project] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Project Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Project ya existe en la Base de datos: ""';
	END
GO

PRINT 'Creado la tabla Area_Asign_Project..';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Area_Asign_Project]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Area_Asign_Project]( id int IDENTITY(1,1) NOT NULL,
  									  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  									  updated_on datetime NULL DEFAULT NULL,
  									  version bigint NOT NULL,
  									  area_id int NOT NULL,
  									  project_id int NOT NULL,							 
		 CONSTRAINT [pk_Area_Asign_project] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Area_Asign_Project Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Area_Asign_Project ya existe en la Base de datos: ""';
	END
GO
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
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================
PRINT 'Creado la tabla Position...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Position]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[Position](
		[id] 						            [bigint] IDENTITY(1,1) 	NOT NULL,
		[version] 			            [bigint] 				    NOT NULL,
		[code] 					            [varchar](255) 			NULL,
		[name] 					            [varchar](255) 			NULL,
		[process] 			            [varchar](255) 			NULL,
		[purpose] 			            [varchar](255) 			NULL,
		[area_id] 			            [int] 					    NULL,
		[higher_work_position_id] 	[bigint] 				    NULL,
		CONSTRAINT [pk_position] 	PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table Position Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Position ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- RECRUITMENT PROFILE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================
PRINT 'Creado la tabla Recruitment_Profile...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[recruitmentprofile]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[RecruitmentProfile](
			[id] 			      [bigint] IDENTITY(1,1) 	NOT NULL,
			[version] 		  [bigint] 				    NOT NULL,
			[description] 	[varchar](255) 			NULL,
			[requirement] 	[varchar](255) 			NULL,
			[verification] 	[varchar](255) 			NULL,
			[position_id] 	[bigint] 				    NULL,
			CONSTRAINT [pk_RecruitmentProfile] PRIMARY KEY
			(
				[id] ASC
			));	
		PRINT 'Table Recruitment_Profile Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Recruitment_Profile ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- FUNCTION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================
PRINT 'Creado la tabla Function...';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[FUNCTION]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Function](
			[Id] 			      [bigint] IDENTITY(1,1) 	NOT NULL,
  		[Version] 		  [bigint] 				    NOT NULL,
			[Description] 	[varchar](255)  		NULL,
			[Frecuency] 	  [varchar](255)			NULL,
			[Contribution] 	[varchar](255) 			NULL,
			[Is_important] 	[bit] 					    NOT NULL,
		 CONSTRAINT [pk_function] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Function Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Function ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION RELATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================
PRINT 'Creado la tabla Function_Assigned_Position...';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Function_Assigned_Position]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Function_Assigned_Position](
			id 				    [bigint] IDENTITY(1,1) 	NOT NULL,
  		version 		  [bigint] 				NOT NULL,
  		position_id 	[bigint] 				NOT NULL,
			function_id 	[bigint] 				NOT NULL,
		 CONSTRAINT [pk_Position_Function] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Function_Assigned_Position Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Function_Assigned_Position ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- EVALUATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table -- initial version
--======================================================================================================

PRINT 'Creado la tabla Evaluation...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Evaluation]')
		       AND type in (N'U'))
 BEGIN
			CREATE TABLE [dbo].[Evaluation](
			[id] 			      [bigint] IDENTITY(1,1) 	NOT NULL,
			[version] 		  [bigint] 				NOT NULL,
			[evaluated_id] 	[bigint] 					NOT NULL,
			[evaluator_id] 	[bigint] 					NOT NULL,
			[type_id] 		  [bigint] 				NOT NULL,
			CONSTRAINT [pk_evaluationId] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table Evaluation Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Evaluation ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- TYPE_EVALUATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

PRINT 'Creado la tabla Type_Evaluator...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Type_Evaluator]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Type_Evaluator](
			[id] 			      [bigint] IDENTITY(1,1) 	NOT NULL,
			[version] 		  [bigint] 				    NOT NULL,
			[description] 	[varchar](255) 			NULL,
			CONSTRAINT [pk_typeId] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table Type_Evaluator Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Type_Evaluator ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- EVALUATION_INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

PRINT 'Creado la tabla evaluation_indicator_values...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[evaluation_indicator_values]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[evaluation_indicator_values](
			[evaluation_id] 		    [bigint] IDENTITY(1,1)  NOT NULL,
			[indicator_values_id] 	[bigint] 				        NOT NULL,
			CONSTRAINT [pk_indicatorId] PRIMARY KEY
			(
				[evaluation_id] ASC
			));
		PRINT 'Table evaluation_indicator_values Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table evaluation_indicator_values ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

PRINT 'Creado la tabla indicator_value...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[indicator_value]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[indicator_value](
		[id] 						            [bigint] IDENTITY(1,1)  NOT NULL,
		[version] 					        [bigint] 				NOT NULL,
		[management_indicator_id] 	[bigint] 				NOT NULL,
		[metric_id] 				        [bigint] 				NOT NULL,
			CONSTRAINT [pk_valueId] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table indicator_value Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table indicator_value ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- MANAGEMENT_INDICATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

PRINT 'Creado la tabla management_indicator...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[management_indicator]')
		       AND type in (N'U'))
 BEGIN
			CREATE TABLE [dbo].[management_indicator](
			[id] 					    [bigint] IDENTITY(1,1) 	NOT NULL,
			[version] 				[bigint] 				NOT NULL,
			[competence] 			[varchar](255) 			NULL,
			[criteria] 				[varchar](255) 			NULL,
			CONSTRAINT [pk_managementid] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table management_indicator Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table management_indicator ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
-- EVALUATION_METRIC TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

PRINT 'Creado la tabla evaluation_metric...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[evaluation_metric]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[evaluation_metric](
			[id] 					    [bigint] IDENTITY(1,1) 	NOT NULL,
			[version] 				[bigint] 				    NOT NULL,
			[description] 		[varchar](255) 			NULL,
			[value] 				  [int] 					    NOT NULL,
			CONSTRAINT [pk_metricId] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table evaluation_metric Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table evaluation_metric ya existe en la Base de datos: ';
	END
GO

--================================================================================================================================================================
-- LAURA END
--================================================================================================================================================================

--================================================================================================================================================================
-- BRIAN START
--================================================================================================================================================================
PRINT 'Creating the Employee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') 
		      AND type in (N'U'))
 BEGIN
		CREATE TABLE employee (
		  id bigint IDENTITY (1,1) PRIMARY KEY,
		  version bigint DEFAULT 1,
		  birthdate datetime DEFAULT NULL,
		  ci bigint DEFAULT NULL,
		  civil_state varchar(255) DEFAULT '',
		  dependencies_amount int DEFAULT 0,
		  experience varchar(255) DEFAULT '',
		  first_name varchar(255) DEFAULT '',
		  gender varchar(255) DEFAULT '',
		  last_name varchar(255) DEFAULT '',
		  email varchar(255),
		  employee_address varchar(max),
		  phone_number bigint DEFAULT 0,
		  profile_image varbinary(max) 
		)
		PRINT 'Table Employee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END

GO

PRINT 'Creating the Project_Contract table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Project_Contract]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.project_contract(
			id bigint IDENTITY (1,1) PRIMARY KEY,
			version bigint DEFAULT 1, 
			contract_description VARCHAR(MAX),
			hire_date DATE NOT NULL,
			end_date DATE,
			salary BIGINT NOT NULL,
			position_id bigint NOT NULL,
			supervisor_id bigint, 
			employee_id bigint NOT NULL)

		PRINT 'Table Project_Contract created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Project_Contract already exists into the database';
	END

GO

PRINT 'Creating the System_Project_User table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[System_Project_User]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.system_project_user(
			id bigint IDENTITY (1,1) PRIMARY KEY,
			version bigint DEFAULT 1,
			name VARCHAR(50) NOT NULL,
			last_name VARCHAR(50) NOT NULL,
			user_login VARCHAR(100) UNIQUE NOT NULL 
			CHECK (user_login <> ''),
			user_password VARCHAR(100) NOT NULL
			CHECK (user_password <> ''))

		PRINT 'Table System_Project_User created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table System_Project_User already exists into the database';
	END

GO


PRINT 'Creating the Rol table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Rol]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.Rol(
			id bigint IDENTITY (1,1) PRIMARY KEY,
			version bigint DEFAULT 1,
			name VARCHAR(50) UNIQUE NOT NULL)

		PRINT 'Table Rol created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Rol already exists into the database';
	END

GO
--================================================================================================================================================================
-- BRIAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- ENAYDA START
--================================================================================================================================================================
PRINT 'CREANDO LA TABLA AccidentType....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AccidentType]')
		       AND type in (N'U'))
 BEGIN
	create table AccidentType (accidentTypeID int  IDENTITY(1,1) not null,
						 name_type_accident nvarchar(200),
						 code_type_accident nvarchar(10),



		 CONSTRAINT [PK_the_walking_bugs.AccidentType] PRIMARY KEY
		(
			[accidentTypeID] ASC
		));
		PRINT 'La tabla ACCIDENTTYPE se a creado exitosamente!';
	END
 ELSE
	BEGIN
		PRINT 'Table ACCIDENTTYPE ya existe en la  base de datos';
	END
GO

PRINT 'CREANDO LA TABLA Accident....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Accident]')
		       AND type in (N'U'))
 BEGIN
	create table Accident (accidentID int  IDENTITY(1,1) not null,
						 nameAccidentado nvarchar(100),
						 date_accident date,
						  hour_accident time,
						   place_accident nvarchar(500),
						  gravity_accident nvarchar(500),
						  description_accident nvarchar(1000),
						 accidentTypeID int ,
						 areaID int,




		 CONSTRAINT [PK_the_walking_bugs.Accident] PRIMARY KEY
		(
			[accidentID] ASC
		));
		PRINT 'La tabla ACCIDENT se a creado exitosamente!';
	END
 ELSE
	BEGIN
		PRINT 'Table ACCIDENT ya existe en la  base de datos';
	END
GO

/*
PRINT 'CREANDO LA TABLA "AccidentAccidentCause"....';

*/
PRINT 'CREANDO LA TABLA "AccidentCause"....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AccidentCause]')
		       AND type in (N'U'))
 BEGIN
	create table AccidentCause  (accidentCauseID int IDENTITY(1,1) not null,
							descripcion nvarchar (300),
						    accidentCauseGroupID int,




		 CONSTRAINT [PK_the_walking_bugs.AccidentCause] PRIMARY KEY
		(
			[accidentCauseID] ASC
		));
		PRINT 'La tabla "AccidentCause" se a creado exitosamente!';
	END
 ELSE
	BEGIN
		PRINT 'Table "AccidentCause" ya existe en la  base de datos';
	END
GO


PRINT 'CREANDO LA TABLA AccidentCauseGroup....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[AccidentCauseGroup]')
		       AND type in (N'U'))
 BEGIN
	create table AccidentCauseGroup( accidentCauseGroupID int IDENTITY(1,1)  not null,
												 title nvarchar (500),




		 CONSTRAINT [PK_the_walking_bugs.AccidentCauseGroup] PRIMARY KEY
		(
			[accidentCauseGroupID] ASC
		));
		PRINT 'La tabla "AccidentCauseGroup" se a creado exitosamente!';
	END
 ELSE
	BEGIN
		PRINT 'Table "AccidentCauseGroup" ya existe en la  base de datos';
	END
GO
--================================================================================================================================================================
-- ENAYDA END
--================================================================================================================================================================

--================================================================================================================================================================
-- JUAN START
--================================================================================================================================================================
PRINT 'Creando la tabla employee accidents  ....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[employee_accident]') 
		       AND type in (N'U'))
  BEGIN
	create table employee_accident(
		id int IDENTITY(1,1),
		id_employee bigint,
		id_accident int,
		detalle_lesion varchar(max) constraint NN_employee_accident not null,
		tipo_lesion varchar(50) constraint NN_employee_accident_tipo_lesion not null,
		zona_lesion varchar(250) constraint NN_employee_zona_accident_lesion not null,
		
		CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()),
		CONSTRAINT PK_employee_accident PRIMARY KEY ( id ASC )
	)
	PRINT 'tabla employee accident creada';
  END
ELSE 
	BEGIN
		PRINT 'Tabla employee accident ya existe en la base de datos';
	END
GO

PRINT 'Creando la tabla accident causes  ....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[accident_causes]') 
		       AND type in (N'U'))
  BEGIN
	create table accident_causes(
		id int IDENTITY(1,1),
		id_accident int,
		id_cause int,
		status int constraint DF_accident_cause_estado default 1 not null,		
		CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()),
		CONSTRAINT PK_accident_causes PRIMARY KEY ( id ASC )
	)
	PRINT 'tabla accident causes creada';
  END
ELSE 
	BEGIN
		PRINT 'Tabla accident causes ya existe en la base de datos';
	END
GO
--================================================================================================================================================================
-- JUAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- LOURDES START
--================================================================================================================================================================
PRINT 'Creando tabla assign_equipment....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[assign_equipment]')
		       AND type in (N'U'))
	BEGIN

		CREATE TABLE assign_equipment(id BIGINT IDENTITY(1,1) CONSTRAINT PK_AssignEquipID PRIMARY KEY
							, version BIGINT CONSTRAINT DF_VersionAssignEquip DEFAULT(1)
							, date_assign DATE CONSTRAINT NN_DateAssign NULL
							, date_return DATE CONSTRAINT NN_DateReturn NULL
							, description VARCHAR(255) CONSTRAINT DF_DescriptionAssignEquip DEFAULT 'Sin observaciones'
							, status_employee INT CONSTRAINT DF_StatusAssignEquip DEFAULT (1)
							, employee_id BIGINT CONSTRAINT NN_EmployeeID NOT NULL);
		PRINT 'Tabla assign_equipment creada!';
	END
 ELSE
	BEGIN
		PRINT 'Tabla assign_equipment ya existe en la Base de Datos';
	END
GO


PRINT 'Creando tabla detail_assign_equipment....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]')
		       AND type in (N'U'))
	BEGIN

		CREATE TABLE detail_assign_equipment(id BIGINT IDENTITY(1,1) CONSTRAINT PK_DetailAssignEquipID1 PRIMARY KEY
							, version BIGINT CONSTRAINT DF_VersionDetailEquip DEFAULT(1)
							, assign_equipment_id BIGINT CONSTRAINT NN_DetailAssignEquipID NOT NULL
							, equipment_id BIGINT CONSTRAINT NN_DetailEquipID NOT NULL);
		PRINT 'Tabla detail_assign_equipment creada!';
	END
 ELSE
	BEGIN
		PRINT 'Tabla detail_assign_equipment ya existe en la Base de Datos';
	END
GO

PRINT 'Creando tabla position_equipment....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[position_equipment]')
		       AND type in (N'U'))
	BEGIN

		CREATE TABLE position_equipment(id BIGINT IDENTITY(1,1) CONSTRAINT PK_DetailAssignEquipID PRIMARY KEY
							, version BIGINT CONSTRAINT DF_PositionEquip DEFAULT(1)
							, equipment_id BIGINT CONSTRAINT NN_PositionEquipID NOT NULL
							, position_id BIGINT CONSTRAINT NN_PositionAssignEquipID NOT NULL);
		PRINT 'Tabla position_equipment creada!';
	END
 ELSE
	BEGIN
		PRINT 'Tabla position_equipment ya existe en la Base de Datos';
	END
GO
--================================================================================================================================================================
-- LOURDES END
--================================================================================================================================================================

--================================================================================================================================================================
-- FADIR START
--================================================================================================================================================================
PRINT 'Creado la tabla type_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[type_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE type_equipment(id bigint IDENTITY(1,1) CONSTRAINT pk_type_equipment PRIMARY KEY
					  ,version bigint DEFAULT 1
		              ,description_type_equipment VARCHAR (255) CONSTRAINT NN_description_type_equipment NOT NULL
					  ,name VARCHAR (255) CONSTRAINT NN_name NOT NULL);
		              					  
		PRINT 'Table type_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table type_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[equipment]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE equipment(id bigint IDENTITY(1,1) CONSTRAINT pk_equipment PRIMARY KEY
					 ,version bigint DEFAULT 1
	                 ,brand VARCHAR (255) CONSTRAINT NN_brand NOT NULL
					 ,code  VARCHAR (255) CONSTRAINT NN_code NOT NULL
					 ,dateofpurchase DATE CONSTRAINT NN_dateofpurchase  NULL
					 ,description VARCHAR (255) CONSTRAINT NN_description NOT NULL
					 ,image_equipment VARBINARY(MAX) CONSTRAINT NN_image_equipment  NULL
					 ,manufactured VARCHAR (255) CONSTRAINT NN_manufactured NOT NULL
					 ,name VARCHAR (255) CONSTRAINT NN_name NOT NULL
					 ,status VARCHAR (255) CONSTRAINT NN_status NOT NULL
					 ,warranty VARCHAR (255) CONSTRAINT NN_warranty NOT NULL
					 ,type_equipment_id BIGINT CONSTRAINT NN_type_equipment_id NOT NULL);

					 
     PRINT 'Table equipment Creado!';
 END
 ELSE
	BEGIN
		PRINT 'Table equipment ya existe en la Base de datos: ';
	END
GO
--================================================================================================================================================================
-- FADIR END
--================================================================================================================================================================


--****************************************************************************************************************************************************************
--******************************       	FOREIGN KEY
--****************************************************************************************************************************************************************
--================================================================================================================================================================
-- MARCELO START
--================================================================================================================================================================
-- Define the relationship between Area_Asign_Project and Project.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_project_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Area_Asign_Project]'))
ALTER TABLE [dbo].Area_Asign_Project  WITH CHECK ADD
       CONSTRAINT fk_project_id FOREIGN KEY(project_id)
REFERENCES [dbo].[Project] ([id]) On Update Cascade On Delete Cascade
GO
ALTER TABLE [dbo].Area_Asign_Project CHECK 
       CONSTRAINT fk_project_id
GO

-- Define the relationship between Area_Asign_Project and Project.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_areas_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Area_Asign_Project]'))
ALTER TABLE [dbo].Area_Asign_Project  WITH CHECK ADD
       CONSTRAINT fk_areas_id FOREIGN KEY(area_id)
REFERENCES [dbo].[Area] ([id]) On Update Cascade On Delete Cascade
GO
ALTER TABLE [dbo].Area_Asign_Project CHECK 
       CONSTRAINT fk_areas_id
GO
--================================================================================================================================================================
-- MARCELO END
--================================================================================================================================================================

--================================================================================================================================================================
-- LAURA START
--================================================================================================================================================================
--======================================================================================================
-- POSITION FOREIGN KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_areaId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position]'))
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_areaId] FOREIGN KEY([area_id])
REFERENCES [dbo].[area] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_areaId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_higher_work_position_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position]'))
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_higher_work_position_id] FOREIGN KEY([higher_work_position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_higher_work_position_id]
GO

--======================================================================================================
-- RECRUITMENT PROFILE FOREIGN KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table
--======================================================================================================

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_positionId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[recruitmentprofile]'))
ALTER TABLE [dbo].[recruitmentprofile]  WITH CHECK ADD  CONSTRAINT [FK_positionId] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[recruitmentprofile] CHECK CONSTRAINT [FK_positionId]
GO

--======================================================================================================
--  FUNCTION_ASSIGNED_POSITION FOREIGN KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table
--======================================================================================================

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_position_and_position_assigned_function]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Function_Assigned_Position]'))
ALTER TABLE [dbo].[Function_Assigned_Position]  WITH CHECK ADD  CONSTRAINT [FK_position_and_position_assigned_function] FOREIGN KEY([position_id])
REFERENCES [dbo].[Position] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Function_Assigned_Position] CHECK CONSTRAINT [FK_position_and_position_assigned_function]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_function_and_position_assigned_function]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Function_Assigned_Position]'))
ALTER TABLE [dbo].[Function_Assigned_Position]  WITH CHECK ADD  CONSTRAINT [FK_function_and_position_assigned_function] FOREIGN KEY([position_id])
REFERENCES [dbo].[Function] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Function_Assigned_Position] CHECK CONSTRAINT [FK_function_and_position_assigned_function]
GO

--======================================================================================================
--  EVALUATION FOREIGN KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_typeId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_typeId] FOREIGN KEY([type_id])
REFERENCES [dbo].[type_evaluator] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_typeId]
GO

/*
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employeeId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_employeeId] FOREIGN KEY([evaluated_id])
REFERENCES [dbo].[employee] ([employeeid])
ON DELETE CASCADE

GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_employeeId]
GO
*/
/*IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employeeIdAsig]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_employeeIdAsig] FOREIGN KEY([evaluator_id])
REFERENCES [dbo].[employee] ([id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_employeeIdAsig]*/
GO

--======================================================================================================
--  EVALUATION_INDICATOR_VALUE FOREIGN KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_evaluation_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation_indicator_values]'))
ALTER TABLE [dbo].[evaluation_indicator_values]  WITH CHECK ADD  CONSTRAINT [FK_evaluation_id] FOREIGN KEY([evaluation_id])
REFERENCES [dbo].[evaluation] ([id])
GO
ALTER TABLE [dbo].[evaluation_indicator_values] CHECK CONSTRAINT [FK_evaluation_id]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_indicatorId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation_indicator_values]'))
ALTER TABLE [dbo].[evaluation_indicator_values]  WITH CHECK ADD  CONSTRAINT [FK_indicatorId] FOREIGN KEY([indicator_values_id])
REFERENCES [dbo].[indicator_value] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[evaluation_indicator_values] CHECK CONSTRAINT [FK_indicatorId]
GO

--======================================================================================================
--  INDICATOR_VALUE KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_managementId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_value]'))
ALTER TABLE [dbo].[indicator_value]  WITH CHECK ADD  CONSTRAINT [FK_managementId] FOREIGN KEY([management_indicator_id])
REFERENCES [dbo].[management_indicator] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[indicator_value] CHECK CONSTRAINT [FK_managementId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_metricId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_value]'))
ALTER TABLE [dbo].[indicator_value]  WITH CHECK ADD  CONSTRAINT [FK_metricId] FOREIGN KEY([metric_id])
REFERENCES [dbo].[evaluation_metric] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[indicator_value] CHECK CONSTRAINT [FK_metricId]

--================================================================================================================================================================
-- LAURA END
--================================================================================================================================================================

--================================================================================================================================================================
-- BRIAN START
--================================================================================================================================================================
/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y empleado------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

/*-- Define the relationship between Project_Contract and Empleado.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
ALTER TABLE [dbo].Project_Contract  WITH CHECK ADD 
       CONSTRAINT FK_Project_Contract_Employee FOREIGN KEY(employee_id)
REFERENCES [dbo].Employee (id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Employee
GO*/
-------------------------------------------------------------------------------------------------------------------
/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y supervisor----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Supervisor]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
ALTER TABLE [dbo].Project_Contract  WITH CHECK ADD
       CONSTRAINT FK_Project_Contract_Supervisor FOREIGN KEY(supervisor_id)
REFERENCES [dbo].Employee (id)
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Supervisor
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y Cargo----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Position]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
	BEGIN
		ALTER TABLE dbo.Project_Contract
		   ALTER COLUMN position_id BIGINT
		ALTER TABLE [dbo].Project_Contract  ADD CONSTRAINT FK_Project_Contract_Position
				FOREIGN KEY (position_id) 
				REFERENCES [dbo].Position(id) ON DELETE CASCADE
	END
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Position
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y projecto----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Project]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
ALTER TABLE [dbo].Project_Contract  WITH CHECK ADD  project_id INT
       CONSTRAINT FK_Project_Contract_Project FOREIGN KEY(project_id)
REFERENCES [dbo].Project (id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Project
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion System_Project_User y Rol------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/
-------------------------------------------------------------------------------------------------------------------
-- Define the relationship between System_Project_User and Rol.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_System_Project_User_Rol]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[System_Project_User]'))
ALTER TABLE [dbo].System_Project_User  WITH CHECK ADD  rol_id BIGINT NOT NULL
       CONSTRAINT FK_System_Project_User_Rol FOREIGN KEY(rol_id)
REFERENCES [dbo].Rol (id)  ON DELETE CASCADE
GO
ALTER TABLE [dbo].[System_Project_User] CHECK 
       CONSTRAINT FK_System_Project_User_Rol
GO
-------------------------------------------------------------------------------------------------------------------

--================================================================================================================================================================
-- BRIAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- ENAYDA START
--================================================================================================================================================================
--relacionando tabla accidentCause y AccidentCauseGroup
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
   WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccidentCause_AccidentCauseGroup]')
   AND parent_object_id = OBJECT_ID(N'[dbo].[AccidentCause]'))
ALTER TABLE [dbo].[AccidentCause] WITH CHECK ADD
   CONSTRAINT [FK_AccidentCause_AccidentCauseGroup] FOREIGN KEY([accidentCauseGroupID])
REFERENCES [dbo].[AccidentCauseGroup] ([accidentCauseGroupID])
GO
ALTER TABLE [dbo].[AccidentCause] CHECK
   CONSTRAINT [FK_AccidentCause_AccidentCauseGroup]
GO
----------------------------------------------------------------------------------------------------------
-----------------------------relacion Accident Cause------------------------------------------------------
----------------------------------------------------------------------------------------------------------
--relacionando tabla accident y AccidentType
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
   WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accident_AccidentType]')
   AND parent_object_id = OBJECT_ID(N'[dbo].[Accident]'))
ALTER TABLE [dbo].[Accident] WITH CHECK ADD
   CONSTRAINT [FK_Accident_AccidentType] FOREIGN KEY([accidentTypeID])
REFERENCES [dbo].[AccidentType] ([accidentTypeID])
GO
ALTER TABLE [dbo].[Accident] CHECK
   CONSTRAINT [FK_Accident_AccidentType]
GO

--relacionando tabla accodente y Area
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
   WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accident_Area]')
   AND parent_object_id = OBJECT_ID(N'[dbo].[Accident]'))
ALTER TABLE [dbo].[Accident] WITH CHECK ADD
   CONSTRAINT [FK_Accident_Area] FOREIGN KEY([areaID])
REFERENCES [dbo].[Area] ([id])
GO
ALTER TABLE [dbo].[Accident] CHECK
   CONSTRAINT [FK_Accident_Area]
GO
--================================================================================================================================================================
-- ENAYDA END
--================================================================================================================================================================

--================================================================================================================================================================
-- JUAN START
--================================================================================================================================================================
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_accident_employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[employee_accident]'))
ALTER TABLE [dbo].[employee_accident]  WITH CHECK ADD  
       CONSTRAINT [FK_employee_accident_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Employee] ([id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employee_accident] CHECK 
       CONSTRAINT [FK_employee_accident_employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_accident_accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[employee_accident]'))
ALTER TABLE [dbo].[employee_accident]  WITH CHECK ADD  
       CONSTRAINT [FK_employee_accident_accident] FOREIGN KEY([id_accident])
REFERENCES [dbo].[Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[employee_accident] CHECK 
       CONSTRAINT [FK_employee_accident_accident]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_accident_causes_cause]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[accident_causes]'))
ALTER TABLE [dbo].[accident_causes]  WITH CHECK ADD  
       CONSTRAINT [FK_accident_causes_cause] FOREIGN KEY([id_cause])
REFERENCES [dbo].[AccidentCause] ([AccidentCauseID])
GO
ALTER TABLE [dbo].[accident_causes] CHECK 
       CONSTRAINT [FK_accident_causes_cause]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_accident_causes_accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[accident_causes]'))
ALTER TABLE [dbo].[accident_causes]  WITH CHECK ADD  
       CONSTRAINT [FK_accident_causes_accident] FOREIGN KEY([id_accident])
REFERENCES [dbo].[Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[accident_causes] CHECK 
       CONSTRAINT [FK_accident_causes_accident]
GO
--================================================================================================================================================================
-- JUAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- LOURDES START
--================================================================================================================================================================
--Relacion entre assign_equipment y employee
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssignEquipEmployee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[assign_equipment]'))
ALTER TABLE assign_equipment WITH CHECK ADD
		CONSTRAINT FK_AssignEquipEmployee FOREIGN KEY(employee_id)
			REFERENCES Employee(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assign_equipment] CHECK
       CONSTRAINT [FK_AssignEquipEmployee]
GO

--Relacion entre detail_assign_equipment y assign_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssignEquipDetail]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE detail_assign_equipment WITH CHECK ADD
		CONSTRAINT FK_AssignEquipDetail FOREIGN KEY(assign_equipment_id)
			REFERENCES assign_equipment(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK
       CONSTRAINT [FK_AssignEquipDetail]
GO

--Relacion entre assign_equipment y equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetailEquip]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE detail_assign_equipment WITH CHECK ADD
		CONSTRAINT FK_DetailEquip FOREIGN KEY(equipment_id)
			REFERENCES equipment(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK
       CONSTRAINT [FK_DetailEquip]
GO

--Relacion entre position y position_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_PositionEquip]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE position_equipment WITH CHECK ADD
		CONSTRAINT FK_PositionEquip FOREIGN KEY(position_id)
			REFERENCES Position(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position_equipment] CHECK
       CONSTRAINT [FK_PositionEquip]
GO

--Relacion entre equipment y position_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_PosEquipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE position_equipment WITH CHECK ADD
		CONSTRAINT FK_PosEquipment FOREIGN KEY(equipment_id)
			REFERENCES Equipment(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position_equipment] CHECK
       CONSTRAINT [FK_PosEquipment]
GO
--================================================================================================================================================================
-- LOURDES END
--================================================================================================================================================================

--================================================================================================================================================================
-- FADIR START
--================================================================================================================================================================
-- Define la relaci�n entre equipment y type_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_equipment_type1]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[equipment]'))
ALTER TABLE [dbo].[equipment]  WITH CHECK ADD  CONSTRAINT [FK_equipment_type1] FOREIGN KEY([type_equipment_id])
REFERENCES [dbo].[type_equipment] ([id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[equipment] CHECK CONSTRAINT [FK_equipment_type1]
GO
--================================================================================================================================================================
-- FADIR END
--================================================================================================================================================================