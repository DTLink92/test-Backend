use the_walking_bugs;
/*
Seccion Laura
*/
PRINT 'Creado la tabla Position...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Position]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[Position](
		[id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[code] [varchar](255) NULL,
		[name] [varchar](255) NULL,
		[process] [varchar](255) NULL,
		[purpose] [varchar](255) NULL,
		[area_id] [int] NULL,
		[higher_work_position_id] [bigint] NULL,
		[performance_id] [int] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_position] PRIMARY KEY
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


/*-----------------------------------------------------------------------------------------------------------------------------------*/
/*Inicia seccion brian*/
USE the_walking_bugs;
GO

PRINT 'Creating the Employee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') 
		      AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.Employee(EmployeeID INT IDENTITY (1,1) PRIMARY KEY, 
			Name VARCHAR(50) NOT NULL,
			LastName VARCHAR(50) NOT NULL,
			EmployeeAddress VARCHAR(150),
			CI BIGINT NOT NULL,
			Phone BIGINT NOT NULL,
			CivilState VARCHAR(100) NOT NULL,
			BirthDate DATE NOT NULL,
			DependenciesAmount INT,
			Experience VARCHAR(MAX),
			Gender VARCHAR(100) NOT NULL,
			ProfileImage varbinary(8000),
			Email VARCHAR(100),
			CreatedBy INT  NOT NULL DEFAULT (1),
			CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
			ModifiedBy INT NOT NULL DEFAULT (1),
			ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()))
		PRINT 'Table Employee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END

GO

PRINT 'Creating the ProjectContract table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[ProjectContract]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.ProjectContract(ProjectContractID INT IDENTITY (1,1) PRIMARY KEY, 
			ContractDescription VARCHAR(MAX),
			HireDate DATE NOT NULL,
			EndDate DATE,
			Salary BIGINT NOT NULL,
			PositionID INT NOT NULL,
			CreatedBy INT  NOT NULL DEFAULT (1),
			CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
			ModifiedBy INT NOT NULL DEFAULT (1),
			ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()))

		PRINT 'Table ProjectContract created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table ProjectContract already exists into the database';
	END

GO

PRINT 'Creating the SystemUser table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.SystemUser(UserID INT IDENTITY (1,1) PRIMARY KEY, 
			Name VARCHAR(50) NOT NULL,
			LastName VARCHAR(50) NOT NULL,
			UserLogin VARCHAR(100) UNIQUE NOT NULL 
			CHECK (UserLogin <> ''),
			UserPassword VARCHAR(100) NOT NULL
			CHECK (UserPassword <> ''),
			CreatedBy INT  NOT NULL DEFAULT (1),
			CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
			ModifiedBy INT NOT NULL DEFAULT (1),
			ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()))

		PRINT 'Table SystemUser created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table SystemUser already exists into the database';
	END

GO


PRINT 'Creating the Rol table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Rol]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.Rol(RolID INT IDENTITY (1,1) PRIMARY KEY, 
			Name VARCHAR(50) UNIQUE NOT NULL,
			CreatedBy INT  NOT NULL DEFAULT (1),
			CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
			ModifiedBy INT NOT NULL DEFAULT (1),
			ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()))

		PRINT 'Table Rol created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Rol already exists into the database';
	END

GO

/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y empleado------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between ProjectContract and Empleado.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectContract_Employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectContract]'))
ALTER TABLE [dbo].ProjectContract  WITH CHECK ADD  EmployeeID INT NOT NULL
       CONSTRAINT FK_ProjectContract_Employee FOREIGN KEY(EmployeeID)
REFERENCES [dbo].Employee (EmployeeID) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectContract] CHECK 
       CONSTRAINT FK_ProjectContract_Employee
GO
-------------------------------------------------------------------------------------------------------------------
/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y supervisor----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectContract_Supervisor]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectContract]'))
ALTER TABLE [dbo].ProjectContract  WITH CHECK ADD  SupervisoID INT
       CONSTRAINT FK_ProjectContract_Supervisor FOREIGN KEY(EmployeeID)
REFERENCES [dbo].Employee (EmployeeID)
GO
ALTER TABLE [dbo].[ProjectContract] CHECK 
       CONSTRAINT FK_ProjectContract_Supervisor
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y Cargo----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectContract_Position]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectContract]'))
	BEGIN
		ALTER TABLE dbo.ProjectContract
		   ALTER COLUMN PositionID BIGINT
		ALTER TABLE [dbo].ProjectContract  ADD CONSTRAINT FK_ProjectContract_Position
				FOREIGN KEY (PositionID) 
				REFERENCES [dbo].Position(id) ON DELETE CASCADE
	END
GO
ALTER TABLE [dbo].[ProjectContract] CHECK 
       CONSTRAINT FK_ProjectContract_Position
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion SystemUser y Rol----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/
-------------------------------------------------------------------------------------------------------------------
-- Define the relationship between SystemUser and Rol.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_SystemUser_Rol]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[SystemUser]'))
ALTER TABLE [dbo].SystemUser  WITH CHECK ADD  RolID INT NOT NULL
       CONSTRAINT FK_SystemUser_Rol FOREIGN KEY(RolID)
REFERENCES [dbo].Rol (RolID)  ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SystemUser] CHECK 
       CONSTRAINT FK_SystemUser_Rol
GO

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- SECTION ACCIDENT (ENAYDA)

GO
PRINT 'CREANDO LA TABLA Accident....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Accident]') 
		       AND type in (N'U'))
 BEGIN
	create table Accident (AccidentID int not null,
						 nameAccidentado nvarchar(100),
						 date_accident date,
						  hour_accident time,
						   place_accident nvarchar(300),
						  gravity_accident nvarchar(300),
						  description_accident nvarchar(1000),
						 accidentType nvarchar(100),
						 area nvarchar(100)
						  

										
		 CONSTRAINT [PK_the_walking_bugs.Accident] PRIMARY KEY
		(
			[AccidentID] ASC
		));

		PRINT 'La tabla ACCIDENT se a creado exitosamente!';
	END
 ELSE 
	BEGIN
		PRINT 'Table ACCIDENT ya existe en la  base de datos';
	END
GO

PRINT 'CREANDO LA TABLA "AccidentAccidentCauseGroup"....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[AccidentAccidentCause]') 
		       AND type in (N'U'))
 BEGIN
	create table AccidentAccidentCause(accidentCauseID int
												,AccidentID int

										
		 CONSTRAINT [PK_the_walking_bugs.AccidentAccidentCause] PRIMARY KEY CLUSTERED
		(
			[accidentCauseID] ASC,
			[AccidentID] asc
		));

		PRINT 'La tabla "AccidentAccidentCauseGroup" se a creado exitosamente!';
	END
 ELSE 
	BEGIN
		PRINT 'Table "AccidentAccidentCauseGroup" ya existe en la  base de datos';
	END
GO

PRINT 'CREANDO LA TABLA "AccidentCause"....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[AccidentCause]') 
		       AND type in (N'U'))
 BEGIN
	create table AccidentCause  (accidentCauseID int not null, 
							descripcion nvarchar (300),
						    accidentCauseGroupID int
						  

										
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
	create table AccidentCauseGroup( accidentCauseGroupID int not null,
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

--relacionando tabla AccidentAccidentCause y Accident

IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccidentAccidentCause_Accident]')
   AND parent_object_id = OBJECT_ID(N'[dbo].[AccidentAccidentCause]'))
ALTER TABLE [dbo].[AccidentAccidentCause] WITH CHECK ADD  
   CONSTRAINT [FK_AccidentAccidentCause_Accident] FOREIGN KEY([accidentID])
REFERENCES [dbo].[Accident] ([accidentID])
GO
ALTER TABLE [dbo].[AccidentAccidentCause] CHECK 
   CONSTRAINT [FK_AccidentAccidentCause_Accident]
GO

--realcionando tabla AccidentAccidentCause y AccidentCause
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccidentAccidentCause_AccidentCause]')
   AND parent_object_id = OBJECT_ID(N'[dbo].[AccidentAccidentCause]'))
ALTER TABLE [dbo].[AccidentAccidentCause] WITH CHECK ADD  
   CONSTRAINT [FK_AccidentAccidentCause_AccidentCause] FOREIGN KEY([accidentCauseID])
REFERENCES [dbo].[AccidentCause] ([accidentCauseID])
GO
ALTER TABLE [dbo].[AccidentAccidentCause] CHECK 
   CONSTRAINT [FK_AccidentAccidentCause_AccidentCause]
GO

PRINT 'Creando la tabla employee accidents  ....';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[employee_accident]')
		       AND type in (N'U'))
  BEGIN
	create table employee_accident(
		id int IDENTITY(1,1),
		id_employee int,
		id_accident int,
		detalle_lesion varchar(250) constraint NN_employee_accident not null,
		tipo_lesion varchar(50) constraint NN_employee_accident_tipo_lesion not null,
		zona_lesion varchar(250) constraint NN_employee_zona_accident_lesion not null,
		CONSTRAINT PK_employee_accident PRIMARY KEY ( id ASC )
	)
	PRINT 'tabla employee accident creada';
  END
ELSE
	BEGIN
		PRINT 'Tabla employee accident ya existe en la base de datos';
	END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_accident_employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[employee_accident]'))
ALTER TABLE [dbo].[employee_accident]  WITH CHECK ADD
       CONSTRAINT [FK_employee_accident_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Employee] ([EmployeeID])
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
		CONSTRAINT PK_accident_causes PRIMARY KEY ( id ASC )
	)
	PRINT 'tabla accident causes creada';
  END
ELSE
	BEGIN
		PRINT 'Tabla accident causes ya existe en la base de datos';
	END
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

GO

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
  								  project_id int NULL DEFAULT NULL,
  								  CreatedBy INT  NOT NULL DEFAULT (1),
			      				  ModifiedBy INT NOT NULL DEFAULT (1),
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
  								  	  CreatedBy INT  NOT NULL DEFAULT (1),
			      				      ModifiedBy INT NOT NULL DEFAULT (1),
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


PRINT 'Creado la tabla Performance...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Performance]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Performance]( id int IDENTITY(1,1) NOT NULL,
  										  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  										  updated_on datetime NULL DEFAULT NULL,
  										  version bigint NOT NULL,
  										  description varchar(255)  NULL DEFAULT NULL,
  										  abilities varchar(255) NULL DEFAULT NULL,
  										  is_important bit NOT NULL,
  										  registration_date datetime NULL DEFAULT NULL,
										  CreatedBy INT  NOT NULL DEFAULT (1),
			      				          ModifiedBy INT NOT NULL DEFAULT (1),
		 CONSTRAINT [pk_performance] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Performance Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Performance ya existe en la Base de datos: ""';
	END
GO


PRINT 'Creado la tabla Performance_Asign_Function...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Performance_Asign_Function]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Performance_Asign_Function](id int  IDENTITY(1,1) NOT NULL,
  														created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  														updated_on datetime NULL DEFAULT NULL,
  														version bigint NOT NULL,
  														performance_id int NOT NULL,
														function_id int NOT NULL,
														CreatedBy INT  NOT NULL DEFAULT (1),
			      				      					ModifiedBy INT NOT NULL DEFAULT (1),
		 CONSTRAINT [pk_performance_asig_function] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Performance_Asign_Function Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Performance_Asign_Function ya existe en la Base de datos: ';
	END
GO



PRINT 'Creado la tabla Function...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Function]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Function](id int  IDENTITY(1,1) NOT NULL,
  									  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  									  updated_on datetime NULL DEFAULT NULL,
  									  version bigint NOT NULL,
									  name varchar(100)  NULL DEFAULT NULL,
									  frecuency varchar(30) NULL DEFAULT NULL,
									  contribution varchar(255) NULL DEFAULT NULL,
									  CreatedBy INT  NOT NULL DEFAULT (1),
			      				      ModifiedBy INT NOT NULL DEFAULT (1),
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




-- Define the relationship between Area and Project.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_project_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Area]'))
ALTER TABLE [dbo].Area  WITH CHECK ADD
       CONSTRAINT fk_project_id FOREIGN KEY(project_id)
REFERENCES [dbo].[Project] ([id])
GO
ALTER TABLE [dbo].Area CHECK
       CONSTRAINT fk_project_id
GO


-- Define the relationship between Performance_Asign_Function and Performance.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_performance_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Performance_Asign_Function]'))
ALTER TABLE [dbo].Performance_Asign_Function  WITH CHECK ADD
       CONSTRAINT fk_performance_id FOREIGN KEY(performance_id)
REFERENCES [dbo].Performance ([id])
GO
ALTER TABLE [dbo].Performance_Asign_Function CHECK
       CONSTRAINT fk_performance_id
GO


-- Define the relationship between Performance_Asign_Function and Function.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_function_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Performance_Asign_Function]'))
ALTER TABLE [dbo].Performance_Asign_Function  WITH CHECK ADD
       CONSTRAINT fk_function_id FOREIGN KEY(function_id)
REFERENCES [dbo].[Function] ([id])
GO
ALTER TABLE [dbo].Performance_Asign_Function CHECK
       CONSTRAINT fk_performance_id
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_areaId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position]'))
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_areaId] FOREIGN KEY([area_id])
REFERENCES [dbo].[area] ([id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_areaId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_performanceId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position]'))
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_performanceId] FOREIGN KEY([performance_id])
REFERENCES [dbo].[performance] ([id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_performanceId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Higher_positionId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position]'))
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_Higher_positionId] FOREIGN KEY([higher_work_position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_Higher_positionId]
GO


PRINT 'Creado la tabla recruitment_profile...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[recruitment_profile]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Recruitment_profile](
			[id] [bigint] IDENTITY(1,1) NOT NULL,
			[created_on] [datetime2](7) NOT NULL,
			[updated_on] [datetime2](7) NULL,
			[version] [bigint] NOT NULL,
			[description] [varchar](255) NULL,
			[requirement] [varchar](255) NULL,
			[verification] [varchar](255) NULL,
			[position_id] [bigint] NULL,
			[Created_by] [int]  NOT NULL,
			[Modified_by] [int] NOT NULL,
			CONSTRAINT [pk_recruitmentProfile] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table recruitment_profile Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table recruitment_profile ya existe en la Base de datos: ';
	END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_positionId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[recruitment_profile]'))
ALTER TABLE [dbo].[recruitment_profile]  WITH CHECK ADD  CONSTRAINT [FK_positionId] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[recruitment_profile] CHECK CONSTRAINT [FK_positionId]
GO

PRINT 'Creado la tabla Evaluation...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Evaluation]')
		       AND type in (N'U'))
 BEGIN
			CREATE TABLE [dbo].[Evaluation](
			[id] [bigint] NOT NULL,
			[created_on] [datetime2](7) NOT NULL,
			[updated_on] [datetime2](7) NULL,
			[version] [bigint] NOT NULL,
			[evaluated_id] [int] NOT NULL,
			[evaluator_id] [int] NOT NULL,
			[type_id] [bigint] NOT NULL,
			[Created_by] [int]  NOT NULL,
			[Modified_by] [int] NOT NULL,
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

PRINT 'Creado la tabla Type_Evaluator...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Type_Evaluator]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Type_Evaluator](
			[id] [bigint] NOT NULL,
			[created_on] [datetime2](7) NOT NULL,
			[updated_on] [datetime2](7) NULL,
			[version] [bigint] NOT NULL,
			[description] [varchar](255) NULL,
			[Created_by] [int]  NOT NULL,
			[Modified_by] [int] NOT NULL,
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

PRINT 'Creado la tabla evaluation_indicator_values...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[evaluation_indicator_values]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[evaluation_indicator_values](
			[evaluation_id] [bigint] NOT NULL,
			[indicator_values_id] [bigint] NOT NULL,
			[Created_by] [int]  NOT NULL,
			[Modified_by] [int] NOT NULL,
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

PRINT 'Creado la tabla indicator_value...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[indicator_value]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[indicator_value](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[management_indicator_id] [bigint] NOT NULL,
		[metric_id] [bigint] NOT NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
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

PRINT 'Creado la tabla management_indicator...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[management_indicator]')
		       AND type in (N'U'))
 BEGIN
			CREATE TABLE [dbo].[management_indicator](
			[id] [bigint] NOT NULL,
			[created_on] [datetime2](7) NOT NULL,
			[updated_on] [datetime2](7) NULL,
			[version] [bigint] NOT NULL,
			[competence] [varchar](255) NULL,
			[criteria] [varchar](255) NULL,
			[Created_by] [int]  NOT NULL,
			[Modified_by] [int] NOT NULL,
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

PRINT 'Creado la tabla evaluation_metric...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[evaluation_metric]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[evaluation_metric](
			[id] [bigint] NOT NULL,
			[created_on] [datetime2](7) NOT NULL,
			[updated_on] [datetime2](7) NULL,
			[version] [bigint] NOT NULL,
			[description] [varchar](255) NULL,
			[value] [int] NOT NULL,
			[Created_by] [int]  NOT NULL,
			[Modified_by] [int] NOT NULL,
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

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_typeId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_typeId] FOREIGN KEY([type_id])
REFERENCES [dbo].[type_evaluator] ([id])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_typeId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employeeId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_employeeId] FOREIGN KEY([evaluated_id])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_employeeId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employeeIdAsig]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_employeeIdAsig] FOREIGN KEY([evaluator_id])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK_employeeIdAsig]
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_evaluationid]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation_indicator_values]'))
ALTER TABLE [dbo].[evaluation_indicator_values]  WITH CHECK ADD  CONSTRAINT [FK_evaluationid] FOREIGN KEY([evaluation_id])
REFERENCES [dbo].[evaluation] ([id])
GO
ALTER TABLE [dbo].[evaluation_indicator_values] CHECK CONSTRAINT [FK_evaluationid]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_indicatorId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation_indicator_values]'))
ALTER TABLE [dbo].[evaluation_indicator_values]  WITH CHECK ADD  CONSTRAINT [FK_indicatorId] FOREIGN KEY([indicator_values_id])
REFERENCES [dbo].[indicator_value] ([id])
GO
ALTER TABLE [dbo].[evaluation_indicator_values] CHECK CONSTRAINT [FK_indicatorId]
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_managementId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_value]'))
ALTER TABLE [dbo].[indicator_value]  WITH CHECK ADD  CONSTRAINT [FK_managementId] FOREIGN KEY([management_indicator_id])
REFERENCES [dbo].[management_indicator] ([id])
GO
ALTER TABLE [dbo].[indicator_value] CHECK CONSTRAINT [FK_managementId]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_metricId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_value]'))
ALTER TABLE [dbo].[indicator_value]  WITH CHECK ADD  CONSTRAINT [FK_metricId] FOREIGN KEY([metric_id])
REFERENCES [dbo].[evaluation_metric] ([id])
GO
ALTER TABLE [dbo].[indicator_value] CHECK CONSTRAINT [FK_metricId]

/*
PRINT 'Creado la tabla Position...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[Position]')
		       AND type in (N'U'))
 BEGIN
			CONSTRAINT [pk_function] PRIMARY KEY
			(
				[positionid] ASC
			));
		PRINT 'Table Position Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table Position ya existe en la Base de datos: ';
	END
GO

*/

PRINT 'Creado la tabla equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[equipment]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[brand] [varchar](255) NULL,
		[code] [varchar](255) NULL,
		[dateofpurchase] [datetime2](7) NULL,
		[description] [varchar](255) NULL,
		[image_equipment] [varbinary](max) NULL,
		[manufactured] [varchar](255) NULL,
		[name] [varchar](255) NULL,
		[status] [varchar](255) NULL,
		[warranty] [varchar](255) NULL,
		[type_equipment_id] [bigint] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla type_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[type_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[type_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[description_type_equipment] [varchar](255) NULL,
		[name] [varchar](255) NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
			CONSTRAINT [pk_type_equipment] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table type_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table type_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla assign_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[assign_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[assign_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[date_assign] [datetime2](7) NULL,
		[date_return] [datetime2](7) NULL,
		[description] [varchar](255) NULL,
		[status_employee] [int] NOT NULL,
		[employee_id] [int] NOT NULL,
		[supervisor_id] [int] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_assign_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table assign_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table assign_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla detail_assign_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[detail_assign_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[assign_equipment_id] [bigint] NOT NULL,
		[equipment_id] [bigint] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_detail_assign_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table detail_assign_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table detail_assign_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla position_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[position_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[position_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[equipment_id] [bigint] NOT NULL,
		[position_id] [bigint] NOT NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_position_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table position_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table position_equipment ya existe en la Base de datos: ';
	END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_equipment_type1]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[equipment]'))
ALTER TABLE [dbo].[equipment]  WITH CHECK ADD  CONSTRAINT [FK_equipment_type1] FOREIGN KEY([type_equipment_id])
REFERENCES [dbo].[type_equipment] ([id])
GO
ALTER TABLE [dbo].[equipment] CHECK CONSTRAINT [FK_equipment_type1]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_assign_employee1]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[assign_equipment]'))
ALTER TABLE [dbo].[assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_assign_employee1] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[assign_equipment] CHECK CONSTRAINT [FK_assign_employee1]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_assign_employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[assign_equipment]'))
ALTER TABLE [dbo].[assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_assign_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[assign_equipment] CHECK CONSTRAINT [FK_assign_employee]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_detail_assign]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE [dbo].[detail_assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_detail_assign] FOREIGN KEY([assign_equipment_id])
REFERENCES [dbo].[assign_equipment] ([id])
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK CONSTRAINT [FK_detail_assign]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_details_equipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE [dbo].[detail_assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_details_equipment] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK CONSTRAINT [FK_details_equipment]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_position_equipment_equi]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE [dbo].[position_equipment]  WITH CHECK ADD  CONSTRAINT [FK_position_equipment_equi] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[position_equipment] CHECK CONSTRAINT [FK_position_equipment_equi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_position_equi_position]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE [dbo].[position_equipment]  WITH CHECK ADD  CONSTRAINT [FK_position_equi_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[position_equipment] CHECK CONSTRAINT [FK_position_equi_position]
GO