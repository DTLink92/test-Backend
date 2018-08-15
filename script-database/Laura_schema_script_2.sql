USE [the_walking_bugs]
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
		       WHERE object_id = OBJECT_ID(N'[dbo].[recruitment_profile]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Recruitment_profile](
			[id] 			      [bigint] IDENTITY(1,1) 	NOT NULL,
			[version] 		  [bigint] 				    NOT NULL,
			[description] 	[varchar](255) 			NULL,
			[requirement] 	[varchar](255) 			NULL,
			[verification] 	[varchar](255) 			NULL,
			[position_id] 	[bigint] 				    NULL,
			CONSTRAINT [pk_recruitmentProfile] PRIMARY KEY
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
       AND parent_object_id = OBJECT_ID(N'[dbo].[recruitment_profile]'))
ALTER TABLE [dbo].[recruitment_profile]  WITH CHECK ADD  CONSTRAINT [FK_positionId] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[recruitment_profile] CHECK CONSTRAINT [FK_positionId]
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
			[evaluated_id] 	[int] 					NOT NULL,
			[evaluator_id] 	[int] 					NOT NULL,
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

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employeeId]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[evaluation]'))
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK_employeeId] FOREIGN KEY([evaluated_id])
REFERENCES [dbo].[employee] ([employeeid])
ON DELETE CASCADE
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

