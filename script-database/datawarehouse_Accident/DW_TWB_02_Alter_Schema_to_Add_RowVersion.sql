use [the_walking_bugs]
--======================================================================================================
-- AREA TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Area...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Area'))
BEGIN
	ALTER TABLE dbo.Area
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- PROJECT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Project...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Project'))
BEGIN
	ALTER TABLE dbo.Project
	ADD [RowVersion] [timestamp] NOT NULL
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- AREA_ASSIGN_PROJECT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Area_asign_Project...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Area_Asign_Project'))
BEGIN
	ALTER TABLE dbo.Area_Asign_Project
	ADD [RowVersion] [timestamp] NOT NULL
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- POSITION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Position...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Position' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[Position] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- RECRUITMENT PROFILE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la recruitment_profile...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'recruitment_profile' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[recruitment_profile] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- FUNCTION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================

PRINT 'Agregando nuevas Columnas para la Function...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Function' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[Function] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- POSITION_ASSIGNED_POSITION RELATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Function_Assigned_Position...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Function_Assigned_Position' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[Function_Assigned_Position] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- EVALUATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Evaluation...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Evaluation' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[Evaluation] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Type_Evaluator...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Type_Evaluator' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[Type_Evaluator] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- EVALUATION_INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la evaluation_indicator_values...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'evaluation_indicator_values' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[evaluation_indicator_values] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la indicator_value...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'indicator_value' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[indicator_value] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- MANAGEMENT_INDICATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la management_indicator...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'management_indicator' 
                   AND (COLUMN_NAME = 'Rowversion' )) 
 BEGIN
	ALTER TABLE [dbo].[management_indicator] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- EVALUATION_METRIC TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la evaluation_metric...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'evaluation_metric' 
                   AND (COLUMN_NAME = 'Rowversion')) 
 BEGIN
	ALTER TABLE [dbo].[evaluation_metric] ADD 
		[RowVersion] [timestamp] NOT NULL
		PRINT 'Agregado la columna Rowversion';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- EMPLOYEE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Employee...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Employee'))
BEGIN
	ALTER TABLE dbo.Employee
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- PROJECT_CONTRACT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Project_Contract...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Project_Contract'))
BEGIN
	ALTER TABLE dbo.Project_Contract
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- SYSTEM_PROJECT_USER TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la System_Project_User...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'System_Project_User'))
BEGIN
	ALTER TABLE dbo.System_Project_User
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- ROL TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Rol...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Rol'))
BEGIN
	ALTER TABLE dbo.Rol
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- ACCIDENTTYPE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la AccidentType...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'AccidentType'))
BEGIN
	ALTER TABLE dbo.AccidentType
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- ACCIDENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Accident...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'Accident'))
BEGIN
	ALTER TABLE dbo.Accident
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- ACCIDENTCAUSE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la AccidentCause...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'AccidentCause'))
BEGIN
	ALTER TABLE dbo.AccidentCause
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- ACCIDENTCAUSEGROUP TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la AccidentCauseGroup...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'AccidentCauseGroup'))
BEGIN
	ALTER TABLE dbo.AccidentCauseGroup
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- EMPLOYEE_ACCIDENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la employee_accident...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'employee_accident'))
BEGIN
	ALTER TABLE dbo.employee_accident
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- ACCIDENTCAUSEGROUP TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la AccidentCauseGroup...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'AccidentCauseGroup'))
BEGIN
	ALTER TABLE dbo.AccidentCauseGroup
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- ASSIGN_EQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la assign_equipment...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'assign_equipment'))
BEGIN
	ALTER TABLE dbo.assign_equipment
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO
--======================================================================================================
-- DETAIL_ASSIGN_EQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la detail_assign_equipment...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'detail_assign_equipment'))
BEGIN
	ALTER TABLE dbo.detail_assign_equipment
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- POSITION_EQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la position_equipment...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'position_equipment'))
BEGIN
	ALTER TABLE dbo.position_equipment
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- TYPE_EQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la type_equipment...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'type_equipment'))
BEGIN
	ALTER TABLE dbo.type_equipment
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

--======================================================================================================
-- EQUIPMENT TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as Rowversion
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la equipment...';
IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Rowversion'
          AND Object_ID = Object_ID(N'equipment'))
BEGIN
	ALTER TABLE dbo.equipment
	ADD [RowVersion] [timestamp] NOT NULL;
	PRINT 'Agregado la columna Rowversion';
END
ELSE
	BEGIN
		PRINT 'Existe las columnas Rowversion';
	END
GO

