use DW_The_Walking_bugs;
GO

--======================================================================================================
--  SCHEMA ETL
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN
	PRINT 'Creando el SCHEMA ETL ...';
	EXEC('CREATE SCHEMA ETL')
END
ELSE
BEGIN
	PRINT 'El SCHEMA ETL existe...';
END
GO

--======================================================================================================
--  DIMAREA TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimArea]')
		       AND type in (N'U'))
 BEGIN
	PRINT 'Creando la tabla DimArea ...';
		CREATE TABLE [dbo].[DimArea](
		    [id]		[bigint] NOT NULL,  
  			[detail]	[varchar](255)  NULL,
  			[name]		[varchar](100)  NULL,
		 CONSTRAINT [PK_DimArea] PRIMARY KEY CLUSTERED
		(
			[id] ASC
		) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]		
		PRINT 'Table DimArea Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table DimArea ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
--  DIMPOSITION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimPosition]')
		       AND type in (N'U'))
 BEGIN
 PRINT 'Creando la tabla DimPosition...';
	CREATE TABLE [dbo].[DimPosition](
		[id]		[bigint]		NOT NULL,
		[code]		[varchar](255)	NULL,
		[name]		[varchar](255)	NULL,
		[process]	[varchar](255)	NULL,
		[purpose]	[varchar](255)	NULL,
		--[higher_work_position_id] [bigint] NULL,
		CONSTRAINT [pk_DimPosition] PRIMARY KEY CLUSTERED
		(
			[id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]
		PRINT 'Table DimPosition Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table DimPosition ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
--  DIMEQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimEquipment]')
		       AND type in (N'U'))
 BEGIN
	PRINT 'Creando la tabla DimEquipment...';
	CREATE TABLE [dbo].[DimEquipment](
		[id]				[bigint]		NOT NULL,
		[brand]				[varchar](255)	NULL,
		[code]				[varchar](255)	NULL,
		[dateofpurchase]	[date]	NULL,
		[description]		[varchar](255)	NULL,
		[manufactured]		[varchar](255)	NULL,
		[name]				[varchar](255)	NULL,
		[status]			[varchar](255)	NULL,
		[warranty]			[varchar](255)	NULL,
		CONSTRAINT [pk_DimEquipment] PRIMARY KEY CLUSTERED
		(
			[id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]
		PRINT 'Table DimEequipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table DimEquipment ya existe en la Base de datos: ';
	END
GO

--======================================================================================================
--  DIMACCIDENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimAccident]') 
		       AND type in (N'U'))
 BEGIN
	PRINT 'Creando la tabla DimAccident....';
	create table DimAccident (
		[id]					[bigint] not null,
		[name_Accidentado]		[varchar](100),
		[date]			[date],
		[place]		[varchar](300),
		[gravity]		[varchar](300),
		[description]	[varchar](1000),
		[type]			[varchar](100),
		 CONSTRAINT [PK_DimAccident] PRIMARY KEY CLUSTERED
		(
			[id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]

		PRINT 'La tabla DimAccident se a creado exitosamente!';
	END
 ELSE 
	BEGIN
		PRINT 'Table DimAccident ya existe en la  base de datos';
	END
GO

--======================================================================================================
--  FACTEMPLOYEE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[FactEmployee]') 
		      AND type in (N'U'))
 BEGIN
	PRINT 'Creating the FactEmployee table....';
		CREATE TABLE dbo.FactEmployee(
			[area_id]			[bigint],
			[accident_id]		[bigint],
			[position_id]		[bigint],
			[equipment_id]		[bigint],
			[employee_id]		[bigint], 
			[name]				[varchar](50)	NOT NULL,
			[last_name]			[varchar](50)	NOT NULL,
			[ci]				[bigint]		NOT NULL,
			[phone]				[bigint]		NOT NULL,
			[civil_State]		[varchar](100)	NOT NULL,
			[birth_date]		[date]			NOT NULL,
			[gender]			[varchar](100)	NOT NULL,
			CONSTRAINT [PK_FactEmployee] PRIMARY KEY CLUSTERED 
			(
				[area_id] ASC,
				[accident_id] ASC,
				[position_id] ASC,
				[equipment_id] ASC,
				[employee_id] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
		PRINT 'Table FactEmployee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table FactEmployee already exists into the database';
	END
GO

--======================================================================================================
--  ETL AREA TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Area]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creando the ETL Area table....';
	CREATE TABLE [ETL].[Area](
		[id]		[bigint] NOT NULL,
  		[detail]	[varchar](255)  NULL,
  		[name]		[varchar](100)  NULL
	) ON [PRIMARY]
END
ELSE 
BEGIN
	PRINT 'Table ETL Area already exists into the database';
END
GO

--======================================================================================================
--  ETL POSITION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Position]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creando the ETL Position table....';
	CREATE TABLE [ETL].[Position](
		[id]		[bigint]		NOT NULL,
		[code]		[varchar](255)	NULL,
		[name]		[varchar](255)	NULL,
		[process]	[varchar](255)	NULL,
		[purpose]	[varchar](255)	NULL
	) ON [PRIMARY]
END
ELSE 
BEGIN
	PRINT 'Table ETL Position already exists into the database';
END
GO

--======================================================================================================
--  ETL EQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Equipment]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creando the ETL Equipment table....';
	CREATE TABLE [ETL].[Equipment](
		[id]				[bigint]		NOT NULL,
		[brand]				[varchar](255)	NULL,
		[code]				[varchar](255)	NULL,
		[dateofpurchase]	[date]      	NULL,
		[description]		[varchar](255)	NULL,
		[manufactured]		[varchar](255)	NULL,
		[name]				[varchar](255)	NULL,
		[status]			[varchar](255)	NULL,
		[warranty]			[varchar](255)	NULL,
	) ON [PRIMARY]
END
ELSE 
BEGIN
	PRINT 'Table ETL Equipment already exists into the database';
END
GO

--======================================================================================================
--  ETL ACCIDENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Accident]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creating the ETL Accident table....';
	CREATE TABLE [ETL].[Accident](
		[id]					[bigint] not null,
		[name_Accidentado]		[varchar](100),
		[date]			[date],
		[place]		[varchar](300),
		[gravity]		[varchar](300),
		[description]	[varchar](1000),
		[type]			[varchar](100),
	) ON [PRIMARY]
END
ELSE 
BEGIN
	PRINT 'Table ETL Accident already exists into the database';
END
GO

--======================================================================================================
--  ETL EMPLOYEE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon          DW- initial version
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Employee]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creating the ETL Employee table....';
	CREATE TABLE [ETL].[Employee](
		[area_id]			[bigint],
		[accident_id]		[bigint],
		[position_id]		[bigint],
		[equipment_id]		[bigint], 
		[employee_id]		[bigint], 
		[name]				[varchar](50)	NOT NULL,
		[last_name]			[varchar](50)	NOT NULL,
		[ci]				[bigint]		NOT NULL,
		[phone]				[bigint]		NOT NULL,
		[civil_State]		[varchar](100)	NOT NULL,
		[birth_date]		[date]			NOT NULL,
		[gender]			[varchar](100)	NOT NULL
	) ON [PRIMARY]
END
ELSE 
BEGIN
	PRINT 'Table ETL Employee already exists into the database';
END
GO

--======================================================================================================
--  FACTEMPLOYEE FOREIGN KEY
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Create table - initial version
--======================================================================================================
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_area_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEmployee]'))
ALTER TABLE [dbo].[FactEmployee]  WITH CHECK ADD  CONSTRAINT [FK_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[DimArea] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactEmployee] CHECK CONSTRAINT [FK_area_id]


IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_accident_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEmployee]'))
ALTER TABLE [dbo].[FactEmployee]  WITH CHECK ADD  CONSTRAINT [FK_accident_id] FOREIGN KEY([accident_id])
REFERENCES [dbo].[DimAccident] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactEmployee] CHECK CONSTRAINT [FK_accident_id]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_position_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEmployee]'))
ALTER TABLE [dbo].[FactEmployee]  WITH CHECK ADD  CONSTRAINT [FK_position_id] FOREIGN KEY([position_id])
REFERENCES [dbo].[DimPosition] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactEmployee] CHECK CONSTRAINT [FK_position_id]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_equipment_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactEmployee]'))
ALTER TABLE [dbo].[FactEmployee]  WITH CHECK ADD  CONSTRAINT [FK_equipment_id] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[DimEquipment] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactEmployee] CHECK CONSTRAINT [FK_equipment_id]

USE [DW_The_Walking_bugs]
GO
/******************************************************************************
**  Name: ETL.DW_MergeArea
**  Desc: Merges Source ETL.Areas changes into Destination dbo.DimAreas table. 
**  Called By SQL Job ETL
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------------				-----------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon   Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure en la tabla Area llamado  -> DW_MergeArea...';

IF OBJECT_ID ( '[ETL].[DW_MergeArea]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[DW_MergeArea];  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[DW_MergeArea]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimArea] AS target
	USING [ETL].[Area] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [detail]   = source.[detail]
			,[name] = source.[name]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [id]
		,[detail]
		,[name]
	  )
	  VALUES
	  (
		source.[id]
		,source.[detail]
		,source.[name]
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergePosition
**  Desc: Merges Source ETL.Positions changes into Destination dbo.DimPositions table. 
**  Called By SQL Job ETL
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------------				-----------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon   Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> DW_MergePosition...';

IF OBJECT_ID ( '[ETL].[DW_MergePosition]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[DW_MergePosition];  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[DW_MergePosition]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimPosition] AS target
	USING [ETL].[Position] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [code] = source.[Name]
			,[name] = source.[code]
			,[process] = source.[process]
			,[purpose] = source.[purpose]

	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[id]
		,[code]
		,[name]
		,[process]
		,[purpose]
	  )
	  VALUES
	  (
		source.[id]
		,source.[code]
		,source.[name]
		,source.[process]
		,source.[purpose]
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeEmployee
**  Desc: Merges Source ETL.Employees changes into Destination dbo.DimEmployees table. 
**  Called By SQL Job ETL
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------------				-----------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon   Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> DW_MergeEmployee...';

IF OBJECT_ID ( '[ETL].[DW_MergeEmployee]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[DW_MergeEmployee];  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[DW_MergeEmployee]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[FactEmployee] AS target
	USING [ETL].[Employee] AS source
	ON
	(
	  target.[area_id] = source.[area_id]
	  AND target.[accident_id] = source.[accident_id]
	  AND target.[position_id] = source.[position_id]
	  AND target.[equipment_id] = source.[equipment_id]
	  AND target.[employee_id] = source.[employee_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [name] = ISNULL(source.[name],'N/A')
		 ,[last_name] = ISNULL(source.[last_name],'N/A')
		 ,[ci] = ISNULL(source.[ci],0)
		 ,[phone] = ISNULL(source.[phone],0)
		 ,[civil_state] = ISNULL(source.[civil_state],'N/A')
		 ,[birth_date] = ISNULL(source.[birth_date],GETDATE())
		 ,[gender] = ISNULL(source.[gender],'N/A')
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[area_id]
		,[accident_id]
		,[position_id]
		,[equipment_id]
		,[employee_id]
		,[name]
		,[last_name] 
		,[ci] 
		,[phone] 
		,[civil_state] 
		,[birth_date] 
		,[gender] 
	  )
	  VALUES
	  (
		source.[area_id]
		,source.[accident_id]
		,source.[position_id]
		,source.[equipment_id]
		,source.[employee_id]
		,ISNULL(source.[name],'N/A')
		,ISNULL(source.[last_name],'N/A')
		,ISNULL(source.[ci],0)
		,ISNULL(source.[phone],0)
		,ISNULL(source.[civil_state],'N/A')
		,ISNULL(source.[birth_date],GETDATE())
		,ISNULL(source.[gender],'N/A')
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeEquipment
**  Desc: Merges Source ETL.Equipments changes into Destination dbo.DimEquipments table. 
**  Called By SQL Job ETL
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------------				-----------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon   Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure en la tabla Equipment llamado  -> DW_MergeEquipment...';

IF OBJECT_ID ( '[ETL].[DW_MergeEquipment]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[DW_MergeEquipment];  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[DW_MergeEquipment]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimEquipment] AS target
	USING [ETL].[Equipment] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [brand]			= source.[brand]
			,[code]				= source.[code]
			,[dateofpurchase]   = source.[dateofpurchase]
			,[description]      = source.[description]
			,[manufactured]     = source.[manufactured]
			,[name]				= source.[name]
			,[status]			= source.[status]
			,[warranty]			= source.[warranty]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[id]
		,[code]
		,[dateofpurchase]
		,[description]
		,[manufactured]
		,[name]
		,[status]
		,[warranty]
	  )
	  VALUES
	  (
		source.[id]
		,source.[code]
		,source.[dateofpurchase]
		,source.[description]
		,source.[manufactured]
		,source.[name]
		,source.[status]
		,source.[warranty]
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeAccident
**  Desc: Merges Source ETL.Areas changes into Destination dbo.DimAreas table. 
**  Called By SQL Job ETL
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------------				-----------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon   Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure en la tabla Equipment llamado  -> DW_MergeAccident...';

IF OBJECT_ID ( '[ETL].[DW_MergeAccident]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[DW_MergeAccident];  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[DW_MergeAccident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimAccident] AS target
	USING [ETL].[Accident] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [name_accidentado]    = source.[name_accidentado]
			,[date] = ISNULL(source.[date],GETDATE())
			,[place] = ISNULL(source.[place],'N/A')
			,[gravity] = ISNULL(source.[gravity],'N/A')
			,[description] = ISNULL(source.[description],'N/A')
			,[type] = ISNULL(source.[type],'N/A')
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[id]
		,[date]
		,[place]
		,[gravity]
		,[description]
		,[type]
	  )
	  VALUES
	  (
		source.[id]
		,ISNULL(source.[date],GETDATE())
		,ISNULL(source.[place],'N/A')
		,ISNULL(source.[gravity],'N/A')
		,ISNULL(source.[description],'N/A')
		,ISNULL(source.[type],'N/A')
	  );
END
GO