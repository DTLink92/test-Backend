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

PRINT 'Creando la tabla audit historico ... ';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[AuditHistory]') 
		       AND type in (N'U'))
  BEGIN
	CREATE TABLE [dbo].[AuditHistory]
	(
		[AuditHistoryId] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
		[TableName]		 VARCHAR(50) NULL,
		[ColumnName]	 VARCHAR(50) NULL,
		[ID]             INT NULL,
		[Date]           DATETIME NULL,
		[Oldvalue]       VARCHAR(MAX) NULL,
		[NewValue]       VARCHAR(MAX) NULL,
		[ModifiedBy]     INT
	);
	PRINT 'tabla AuditHistory creada'
  END
ELSE 
	BEGIN
		PRINT 'Tabla AuditHistory ya existe en la base de datos';
	END
GO
--Creacion del trigger

/******************************************************************************
**  Name: TG_EmployeeAccidentDetalleLesion_Audit_InsertUpdate
**  Desc: Audit History for Employee Accident table
** 
**  Called by: Employee_Accident
**
**  Author: Juan Pablo MEjia Callizaya
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------           ---------------------------------------------------
** 21/06/2018 Juan Pablo Mejia   version inicial
*******************************************************************************/
IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_EmpleadoAccidenteDetalleLesion_Audit_Update')
BEGIN
    DROP TRIGGER [TG_EmpleadoAccidenteDetalleLesion_Audit_Update]
END
GO

CREATE TRIGGER [dbo].[TG_EmpleadoAccidenteDetalleLesion_Audit_Update]
ON [dbo].[employee_accident]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(detalle_lesion)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'employee_accident', 
           ColumnName   = 'detalle_lesion',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[detalle_lesion], 
           NewValue     = i.[detalle_lesion],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.detalle_lesion, '') != ISNULL(i.detalle_lesion,'');
  END
END;
GO
/******************************************************************************
**  Name: TG_EmployeeAccidentTipoLesion_Audit_InsertUpdate
**  Desc: Audit History for Employee Accident table
** 
**  Called by: Employee_Accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------           ---------------------------------------------------
** 21/06/2018 Juan Pablo Mejia   version inicial
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects WHERE [name] =  'TG_EmpleadoAccidenteTipoLesion_Audit_Update' AND [type] = 'TR')
BEGIN
  PRINT 'DROP TRIGGER' 
  DROP TRIGGER TG_EmpleadoAccidenteTipoLesion_Audit_Update     
END
GO
CREATE TRIGGER TG_EmpleadoAccidenteTipoLesion_Audit_Update
ON [dbo].[employee_accident]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(tipo_lesion)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'employee_accident', 
           ColumnName   = 'tipo_lesion',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[tipo_lesion], 
           NewValue     = i.[tipo_lesion],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.tipo_lesion, '') != ISNULL(i.tipo_lesion,'');
  END
END;

/******************************************************************************
**  Name: TG_EmployeeAccidentZonaLesion_Audit_InsertUpdate
**  Desc: Audit History for Employee Accident table
** 
**  Called by: Employee_Accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------           ---------------------------------------------------
** 21/06/2018 Juan Pablo Mejia   version inicial
*******************************************************************************/
GO
IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME = 'TG_EmpleadoAccidenteZonaLesion_Audit_Update')
  BEGIN 
	DROP TRIGGER [TG_EmpleadoAccidenteZonaLesion_Audit_Update]
  END 
GO

CREATE TRIGGER [dbo].[TG_EmpleadoAccidenteZonaLesion_Audit_Update]
ON [dbo].[employee_accident]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(zona_lesion)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'employee_accident', 
           ColumnName   = 'zona_lesion',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[zona_lesion], 
           NewValue     = i.[zona_lesion],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.zona_lesion, '') != ISNULL(i.zona_lesion,'');
  END
END;


/******************************************************************************
**  Name: TG_EmployeeAccidentZonaLesion_Audit_InsertUpdate
**  Desc: Audit History for Employee Accident table
** 
**  Called by: accident_causes
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------           ---------------------------------------------------
** 21/06/2018 Juan Pablo Mejia   version inicial
*******************************************************************************/
GO
IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_AccidentCausesStatus_Audit_Update')
BEGIN
    DROP TRIGGER [TG_AccidentCausesStatus_Audit_Update]
END
GO

CREATE TRIGGER [dbo].[TG_AccidentCausesStatus_Audit_Update]
ON [dbo].[accident_causes]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(status)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'accident_causes', 
           ColumnName   = 'status',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[status], 
           NewValue     = i.[status],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.status, '') != ISNULL(i.status,'');
  END
END;

