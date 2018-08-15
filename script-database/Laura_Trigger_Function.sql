USE [the_walking_bugs]
GO

/*******************************************************************************************************
**  Name: TG_Function_Version_Audit_InsertUpdate
**  Desc: Audit History for Function table
** 
**  Called by: Function
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

PRINT 'Creando trigger en la tabla Function llamado  -> TG_Function_Version_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Version_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Version_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Version_Audit_InsertUpdate]
ON [dbo].[Function]
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
    SELECT TableName    = 'Function', 
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
**  Name: TG_Function_Description_Audit_InsertUpdate
**  Desc: Audit History for Function table
** 
**  Called by: Function
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

PRINT 'Creando trigger en la tabla Function llamado  -> TG_Function_Description_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Description_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Description_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Description_Audit_InsertUpdate]
ON [dbo].[Function]
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
    SELECT TableName    = 'Function', 
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

/*******************************************************************************************************
**  Name: TG_Function_Frecuency_Audit_InsertUpdate
**  Desc: Audit History for Function table
** 
**  Called by: Function
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

PRINT 'Creando trigger en la tabla Function llamado  -> TG_Function_Frecuency_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Frecuency_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Frecuency_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Frecuency_Audit_InsertUpdate]
ON [dbo].[Function]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Frecuency)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Function', 
           ColumnName   = 'Frecuency',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[Frecuency], 
           NewValue     = i.[Frecuency],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
    WHERE ISNULL(d.Frecuency, '') != ISNULL(i.Frecuency, '');
  END
END;
GO

/*******************************************************************************************************
**  Name: TG_Function_Contribution_Audit_InsertUpdate
**  Desc: Audit History for Function table
** 
**  Called by: Function
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

PRINT 'Creando trigger en la tabla Function llamado  -> TG_Function_Contribution_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Contribution_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Contribution_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Contribution_Audit_InsertUpdate]
ON [dbo].[Function]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Contribution)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Function', 
           ColumnName   = 'Contribution',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[Contribution], 
           NewValue     = i.[Contribution],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
    WHERE ISNULL(d.Contribution, '') != ISNULL(i.Contribution, '');
  END
END;
GO

/*******************************************************************************************************
**  Name: TG_Function_Is_important_Audit_InsertUpdate
**  Desc: Audit History for Function table
** 
**  Called by: Function
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
PRINT 'Creando trigger en la tabla Function llamado  -> TG_Function_Is_important_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Function_Is_important_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Function_Is_important_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Function_Is_important_Audit_InsertUpdate]
ON [dbo].[Function]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Is_important)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Function', 
           ColumnName   = 'Is_important',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[Is_important], 
           NewValue     = i.[Is_important],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
    WHERE ISNULL(CAST(d.Is_important as varchar(max)), '') != ISNULL(CAST(i.Is_important as varchar(max)), '');
  END
END;
GO