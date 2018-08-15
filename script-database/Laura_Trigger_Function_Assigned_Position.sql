USE [the_walking_bugs]
GO

/*******************************************************************************************************
**  Name: TG_Function_Assigned_Position_Version_Audit_InsertUpdate
**  Desc: Audit History for Function_Assigned_Position table
** 
**  Called by: Function_Assigned_Position
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Date: 21/06/2018
********************************************************************************************************
**                            Change History
********************************************************************************************************
** Date:        Author:                              Description:
** --------     --------                             ---------------------------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon           Initial version
*******************************************************************************************************/

PRINT 'Creando trigger en la tabla Function_Assigned_Position llamado  -> TG_Function_Assigned_Position_Version_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Assigned_Position_Version_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Assigned_Position_Version_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Assigned_Position_Version_Audit_InsertUpdate]
ON [dbo].[Function_Assigned_Position]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(version)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Function_Assigned_Position', 
           ColumnName   = 'Version',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[version], 
           NewValue     = i.[version],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
	WHERE ISNULL(CAST(d.version as varchar(max)), '') != ISNULL(CAST(i.version as varchar(max)), '');
  END
END;
GO

/*******************************************************************************************************
**  Name: TG_Function_Assigned_Position_PositionId_Audit_InsertUpdate
**  Desc: Audit History for Function_Assigned_Position table
** 
**  Called by: Function_Assigned_Position
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Date: 21/06/2018
********************************************************************************************************
**                            Change History
********************************************************************************************************
** Date:        Author:                              Description:
** --------     --------                             ---------------------------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon           Initial version
*******************************************************************************************************/

PRINT 'Creando trigger en la tabla Function_Assigned_Position llamado  -> TG_Function_Assigned_Position_PositionId_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Assigned_Position_PositionId_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Assigned_Position_PositionId_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Assigned_Position_PositionId_Audit_InsertUpdate]
ON [dbo].[Function_Assigned_Position]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Position_Id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Function_Assigned_Position', 
           ColumnName   = 'position_id',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[position_id], 
           NewValue     = i.[position_id],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
	WHERE ISNULL(CAST(d.position_id as varchar(max)), '') != ISNULL(CAST(i.position_id as varchar(max)), '');
  END
END;
GO

/*******************************************************************************************************
**  Name: TG_Function_Assigned_Position_FunctionId_Audit_InsertUpdate
**  Desc: Audit History for Function_Assigned_Position table
** 
**  Called by: Function_Assigned_Position
**
**  Author: Lady Laura Tucuman Alarcon
**
**  Date: 21/06/2018
********************************************************************************************************
**                            Change History
********************************************************************************************************
** Date:        Author:                              Description:
** --------     --------                             ---------------------------------------------------
** 21/06/2018   Lady Laura Tucuman Alarcon           Initial version
*******************************************************************************************************/

PRINT 'Creando trigger en la tabla Function_Assigned_Position llamado  -> TG_Function_Assigned_Position_FunctionId_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Assigned_Position_FunctionId_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Assigned_Position_FunctionId_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Assigned_Position_FunctionId_Audit_InsertUpdate]
ON [dbo].[Function_Assigned_Position]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(function_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Function_Assigned_Position', 
           ColumnName   = 'function_id',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[function_id], 
           NewValue     = i.[function_id],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
	WHERE ISNULL(CAST(d.function_id as varchar(max)), '') != ISNULL(CAST(i.function_id as varchar(max)), '');
  END
END;
GO