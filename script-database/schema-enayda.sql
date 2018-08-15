

USE [the_walking_bugs]
GO
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



--relacionando tabla accidentCause y AccidentCauseGroup
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
   WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccidentCause_AccidentCauseGroup]')
   AND parent_object_id = OBJECT_ID(N'[dbo].[AccidentCause]'))
ALTER TABLE [dbo].[AccidentCause] WITH CHECK ADD
   CONSTRAINT [FK_AccidentCause_AccidentCauseGroup] FOREIGN KEY([accidentCauseGroupID])
REFERENCES [dbo].[AccidentCauseGroup] ([accidentCauseGroupID])On Update Cascade On Delete Cascade

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
REFERENCES [dbo].[AccidentType] ([accidentTypeID]) On Update Cascade On Delete Cascade

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
REFERENCES [dbo].[Area] ([id])On Update Cascade On Delete Cascade

GO
ALTER TABLE [dbo].[Accident] CHECK
   CONSTRAINT [FK_Accident_Area]
GO
