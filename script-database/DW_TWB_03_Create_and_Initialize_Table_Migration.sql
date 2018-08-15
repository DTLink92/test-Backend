USE [the_walking_bugs]
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
-- TABLEMIGRATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[ETL].[TableMigration]')
		       AND type in (N'U'))
 BEGIN
	PRINT 'Creando la tabla TableMigration ...';

	CREATE TABLE [ETL].[TableMigration](
		[IDMigration] [int] IDENTITY(1,1) NOT NULL,
		[TableName] [varchar](50) NOT NULL,
		[LatestChange] [bigint] NOT NULL CONSTRAINT [DF_Migration]  DEFAULT ((0)),
	 CONSTRAINT [PK_Migration] PRIMARY KEY CLUSTERED 
	(
		[IDMigration] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END
 ELSE
	BEGIN
		PRINT 'Table TableMigration ya existe en la Base de datos: ';
	END
GO
--======================================================================================================
-- TABLEMIGRATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
USE [the_walking_bugs];
GO
SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Initialize Table Migration...';
SET IDENTITY_INSERT [ETL].[TableMigration]  ON;
INSERT INTO [ETL].[TableMigration]([IDMigration]
								  ,[TableName]
								  ,[LatestChange])
VALUES (1,'Accident',0)
	  ,(2,'Area',0)
	  ,(3,'Equipment',0)
	  ,(4,'Position',0)
	  ,(5,'Employee',0);
GO
SET IDENTITY_INSERT [ETL].[TableMigration]  OFF;
PRINT 'Table Migration initialization done...';
COMMIT TRANSACTION;