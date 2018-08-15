use the_walking_bugs;
PRINT 'Creado la tabla DArea ...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DArea]')
		       AND type in (N'U'))
 BEGIN

		CREATE TABLE [dbo].[DArea](
		    id int  IDENTITY(1,1) NOT NULL,
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
		PRINT 'Table DArea Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table DArea ya existe en la Base de datos: ';
	END
GO
PRINT 'Creado la tabla DPosition...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DPosition]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[DPosition](
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
		PRINT 'Table DPosition Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table DPosition ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla DEquipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DEquipment]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[DEquipment](
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
		PRINT 'Table DEequipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table DEquipment ya existe en la Base de datos: ';
	END
GO

PRINT 'CREANDO LA TABLA DAccident....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DAccident]') 
		       AND type in (N'U'))
 BEGIN
	create table DAccident (
		id int not null,
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
			[id] ASC
		));

		PRINT 'La tabla ACCIDENT se a creado exitosamente!';
	END
 ELSE 
	BEGIN
		PRINT 'Table ACCIDENT ya existe en la  base de datos';
	END
GO

GO

PRINT 'Creating the HEmployee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[HEmployee]') 
		      AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.HEmployee(
			id INT IDENTITY (1,1) PRIMARY KEY,
			id_area INT,
			id_accident int,
			id_position int,
			id_equipment int, 
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
			Email VARCHAR(100)
		)
		PRINT 'Table HEmployee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END
GO
