USE [the_walking_bugs]
GO

/*******************************************************************************************************
**  Name: TG_Type_Evaluator_Version_Audit_InsertUpdate
**  Desc: Audit History for Type_Evaluator table
** 
**  Called by: Type_Evaluator
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
PRINT 'Creando trigger en la tabla Type_Evaluator llamado  -> TG_Type_Evaluator_Version_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Type_Evaluator_Version_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Type_Evaluator_Version_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Type_Evaluator_Version_Audit_InsertUpdate]
ON [dbo].[Type_Evaluator]
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
    SELECT TableName    = 'Type_Evaluator', 
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
**  Name: TG_Type_Evaluator_Description_Audit_InsertUpdate
**  Desc: Audit History for Type_Evaluator table
** 
**  Called by: Type_Evaluator
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
PRINT 'Creando trigger en la tabla Type_Evaluator llamado  -> TG_Type_Evaluator_Description_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Type_Evaluator_Description_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Type_Evaluator_Description_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Type_Evaluator_Description_Audit_InsertUpdate]
ON [dbo].[Type_Evaluator]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Type_Evaluator', 
           ColumnName   = 'Description',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[Description], 
           NewValue     = i.[Description],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
    WHERE ISNULL(d.Description, '') != ISNULL(i.Description, '');
  END
END;
GO

