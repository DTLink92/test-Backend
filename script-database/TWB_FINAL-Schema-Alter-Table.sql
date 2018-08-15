--================================================================================================================================================================
-- MARCELO START
--================================================================================================================================================================
USE the_walking_bugs;
GO

-- tabla PROJECT
PRINT 'Creando columnas de autitoria (createdBy,modifiedBy) en "tabla "project"... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.project'))
BEGIN
	ALTER TABLE dbo.project ADD createdBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "CreatedBy" ya existe'
END

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.project'))
BEGIN
	ALTER TABLE dbo.project ADD modifiedBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "modifiedBy" ya existe'
END
PRINT '...OK';
GO

-- TABLA AREA
PRINT 'Creando columnas de autitoria (createdBy,modifiedBy) en "tabla "area"... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.area'))
BEGIN
	ALTER TABLE dbo.area ADD createdBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "CreatedBy" ya existe'
END

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.area'))
BEGIN
	ALTER TABLE dbo.area ADD modifiedBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "modifiedBy" ya existe'
END
PRINT '...OK';
GO


-- TABLA Area_Asign_Project
PRINT 'Creando columnas de autitoria (createdBy,modifiedBy) en "tabla "Area_Asign_Project"... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.Area_Asign_Project'))
BEGIN
	ALTER TABLE dbo.Area_Asign_Project ADD createdBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "CreatedBy" ya existe'
END

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.Area_Asign_Project'))
BEGIN
	ALTER TABLE dbo.Area_Asign_Project ADD modifiedBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "modifiedBy" ya existe'
END
PRINT '...OK';
GO
--================================================================================================================================================================
-- MARCELO END
--================================================================================================================================================================


--================================================================================================================================================================
-- LAURA START
--================================================================================================================================================================
use [the_walking_bugs]

--======================================================================================================
-- POSITION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Position...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'Position'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[Position] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- RECRUITMENT PROFILE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la recruitment_profile...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'recruitmentprofile'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[recruitmentprofile] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- FUNCTION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================

PRINT 'Agregando nuevas Columnas para la Function...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'Function'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[Function] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- POSITION_ASSIGNED_POSITION RELATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Function_Assigned_Position...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'Function_Assigned_Position'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[Function_Assigned_Position] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO

--======================================================================================================
-- EVALUATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Evaluation...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'Evaluation'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[Evaluation] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Type_Evaluator...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'Type_Evaluator'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[Type_Evaluator] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- EVALUATION_INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la evaluation_indicator_values...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'evaluation_indicator_values'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[evaluation_indicator_values] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]   NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la indicator_value...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'indicator_value'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[indicator_value] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- MANAGEMENT_INDICATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la management_indicator...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'management_indicator'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[management_indicator] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- EVALUATION_METRIC TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la evaluation_metric...';
IF NOT EXISTS (SELECT COLUMN_NAME
                 FROM information_schema.columns
                 WHERE TABLE_SCHEMA = 'dbo'
                   AND TABLE_NAME = 'evaluation_metric'
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by'))
 BEGIN
	ALTER TABLE [dbo].[evaluation_metric] ADD
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO

--================================================================================================================================================================
-- LAURA END
--================================================================================================================================================================

--================================================================================================================================================================
-- BRIAN START
--================================================================================================================================================================
USE the_walking_bugs;
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'created_by'
          AND Object_ID = Object_ID(N'Employee'))
BEGIN
	ALTER TABLE dbo.Employee
	ADD created_by INT  NOT NULL DEFAULT (1),
		created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		modified_by INT NOT NULL DEFAULT (1),
		updated_on DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'created_by'
          AND Object_ID = Object_ID(N'Project_Contract'))
BEGIN
	ALTER TABLE dbo.Project_Contract
	ADD created_by INT  NOT NULL DEFAULT (1),
		created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		modified_by INT NOT NULL DEFAULT (1),
		updated_on DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'created_by'
          AND Object_ID = Object_ID(N'System_Project_User'))
BEGIN
	ALTER TABLE dbo.System_Project_User
	ADD created_by INT  NOT NULL DEFAULT (1),
		created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		modified_by INT NOT NULL DEFAULT (1),
		updated_on DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'created_by'
          AND Object_ID = Object_ID(N'Rol'))
BEGIN
	ALTER TABLE dbo.Rol
	ADD created_by INT  NOT NULL DEFAULT (1),
		created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		modified_by INT NOT NULL DEFAULT (1),
		updated_on DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END
--================================================================================================================================================================
-- BRIAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- ENAYDA START
--================================================================================================================================================================
/**************************************************************************************************
**  Name: alter tables (Accident,[dbo].[AccidentCause],[dbo].[AccidentCauseGroup],[dbo].[AccidentType])
**  Desc:modified lables
**  Author: Quispe Guarachi Enayda
**  Date: 22/06/2018
*************************************************************************************************/


USE [the_walking_bugs]
GO
PRINT 'INSERTANDO NUEVAS COLUMNAS PARA AUDITORIA EN  LA TABLA AccidentType....';
IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'AccidentType'))
BEGIN
ALTER TABLE [dbo].[AccidentType]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE() )
END
print 'se inserto cuatro columnas para auditoria.....en la tabla AccidentType';

PRINT 'INSERTANDO NUEVAS COLUMNAS PARA AUDITORIA EN  LA TABLA Accident....';

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'Accident'))
BEGIN
ALTER TABLE [dbo].[Accident]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE() )
END
print 'se inserto cuatro columnas para auditoria.....en la tabla Accident';



PRINT 'INSERTANDO COLUMNAS PARA PA AUDITORIA EN LA TABLA "AccidentCause"....';
IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'AccidentCause'))
BEGIN
ALTER TABLE [dbo].[AccidentCause]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE())
END
print 'se inserto cuatro columnas para auditoria.....en la tabla AccidentCause';

PRINT 'INSERTANDO COLUMNAS PARA PA AUDITORIA EN LA TABLA AccidentCauseGroup....';

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'AccidentCauseGroup'))
BEGIN
ALTER TABLE [dbo].[AccidentCauseGroup]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE() )
END
print 'se inserto cuatro columnas para auditoria.....en la tabla AccidentCauseGroup';



--================================================================================================================================================================
-- ENAYDA END
--================================================================================================================================================================

--================================================================================================================================================================
-- JUAN START
--================================================================================================================================================================

USE the_walking_bugs;
-- modificar las columnas de auditoria para la tabla employee_accident
PRINT 'Creando las columnas de auditoria de employee_accident ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.employee_accident'))
BEGIN
	alter table employee_accident add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.employee_accident'))
BEGIN
	alter table employee_accident add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.employee_accident'))
BEGIN
	alter table employee_accident add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.employee_accident'))
BEGIN
	alter table employee_accident add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO
-- modificar las columnas de auditoria para la tabla accident_causes
PRINT 'Creando las columnas de auditoria para la tabla accident_causes ... ';
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.accident_causes'))
BEGIN
	alter table accident_causes add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.accident_causes'))
BEGIN
	alter table accident_causes add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.accident_causes'))
BEGIN
	alter table accident_causes add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.accident_causes'))
BEGIN
	alter table accident_causes add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

--================================================================================================================================================================
-- JUAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- LOURDES START
--================================================================================================================================================================

/******************************************************************************
**  Desc: Alter table para auditoria, table assign_equipment
*******************************************************************************/

USE the_walking_bugs;

PRINT 'Creando columnas en table assign_equipment para auditoria ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_by' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add created_by INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_on' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'modified_by' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add modified_by INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'updated_on' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add updated_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

PRINT 'Columnas para table assign_equipment creadas ... ';
GO


/******************************************************************************
**  Desc: Alter table para auditoria, table detail_assign_equipment
*******************************************************************************/

PRINT 'Creando columnas en table detail_assign_equipment para auditoria ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_by' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add created_by INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_on' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'modified_by' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add modified_by INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'updated_on' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add updated_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

PRINT 'Columnas para table detail_assign_equipment creadas ... ';
GO


/******************************************************************************
**  Desc: Alter table para auditoria, table position_equipment
*******************************************************************************/

USE the_walking_bugs;

PRINT 'Creando columnas en table position_equipment para auditoria ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_by' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add created_by INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_on' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'modified_by' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add modified_by INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'updated_on' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add updated_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

PRINT 'Columnas para table position_equipment creadas ... ';
GO
--================================================================================================================================================================
-- LOURDES END
--================================================================================================================================================================

--================================================================================================================================================================
-- FARID START
--================================================================================================================================================================

USE the_walking_bugs;

-- modificar las columnas de auditoria para la tabla type_equipment
/* ------------------------------------------------------------------------------
Alter Table type_equipment añadiendo las siguientes columnas:
created_by
created_date
modified_by
modified_date

*/ ------------------------------------------------------------------------------


PRINT 'Creando las columnas de auditoria de type_equipment ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_by' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add created_by INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_on' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'modified_by' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add modified_by INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'updated_on' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add updated_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

/*
PRINT 'Creando las columnas de auditoria de type_equipment ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'created_by'
          AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	ALTER TABLE dbo.dbo.type_equipment
	ADD created_by INT  NOT NULL DEFAULT (1),
		created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		modified_by INT NOT NULL DEFAULT (1),
		updated_on DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

*/


-- modificar las columnas de auditoria para la tabla equipment
/* ------------------------------------------------------------------------------
Alter Table equipment añadiendo las siguientes columnas:
created_by
created_date
modified_by
modified_date

*/ ------------------------------------------------------------------------------


PRINT 'Creando las columnas de auditoria para la tabla equipment ... ';
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_by' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add created_by INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'created_on' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add created_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'modified_by' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add modified_by INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'updated_on' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add updated_on DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO


--================================================================================================================================================================
-- FADIR END
--================================================================================================================================================================