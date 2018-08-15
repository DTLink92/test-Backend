USE [the_walking_bugs]
GO

/*******************************************************************************************************
**  Name: TG_Recruitment_profile_Version_Audit_InsertUpdate
**  Desc: Audit History for Recruitment_profile table
** 
**  Called by: Recruitment_profile
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

PRINT 'Creando trigger en la tabla Recruitment_profile llamado  -> TG_Recruitment_profile_Version_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Recruitment_profile_Version_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Recruitment_profile_Version_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Recruitment_profile_Version_Audit_InsertUpdate]
ON [dbo].[Recruitment_profile]
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
    SELECT TableName    = 'Recruitment_profile', 
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
**  Name: TG_Recruitment_profile_Description_Audit_InsertUpdate
**  Desc: Audit History for Recruitment_profile table
** 
**  Called by: Recruitment_profile
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

PRINT 'Creando trigger en la tabla Recruitment_profile llamado  -> TG_Recruitment_profile_Description_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Recruitment_profile_Description_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Recruitment_profile_Description_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Recruitment_profile_Description_Audit_InsertUpdate]
ON [dbo].[Recruitment_profile]
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
    SELECT TableName    = 'Recruitment_profile', 
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
**  Name: TG_Recruitment_profile_Requirement_Audit_InsertUpdate
**  Desc: Audit History for Recruitment_profile table
** 
**  Called by: Recruitment_profile
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
PRINT 'Creando trigger en la tabla Recruitment_profile llamado  -> TG_Recruitment_profile_Requirement_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Recruitment_profile_Requirement_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Recruitment_profile_Requirement_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Recruitment_profile_Requirement_Audit_InsertUpdate]
ON [dbo].[Recruitment_profile]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Requirement)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Recruitment_profile', 
           ColumnName   = 'Requirement',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[Requirement], 
           NewValue     = i.[Requirement],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
    WHERE ISNULL(d.Requirement, '') != ISNULL(i.Requirement, '');
  END
END;
GO

/*******************************************************************************************************
**  Name: TG_Recruitment_profile_Verification_Audit_InsertUpdate
**  Desc: Audit History for Recruitment_profile table
** 
**  Called by: Recruitment_profile
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
PRINT 'Creando trigger en la tabla Recruitment_profile llamado  -> TG_Recruitment_profile_Verification_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Recruitment_profile_Verification_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Recruitment_profile_Verification_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Recruitment_profile_Verification_Audit_InsertUpdate]
ON [dbo].[Recruitment_profile]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(Verification)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Recruitment_profile', 
           ColumnName   = 'Verification',
           ID           = i.ID, 
           Date         = @CurrDate, 
           OldValue     = d.[Verification], 
           NewValue     = i.[Verification],
           ModifiedBy   = i.Modified_by          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID = i.ID)
    WHERE ISNULL(d.Verification, '') != ISNULL(i.Verification, '');
  END
END;
GO

/*******************************************************************************************************
**  Name: TG_Recruitment_profile_position_id_Audit_InsertUpdate
**  Desc: Audit History for Recruitment_profile table
** 
**  Called by: Recruitment_profile
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
PRINT 'Creando trigger en la tabla Recruitment_profile llamado  -> TG_Recruitment_profile_position_id_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Recruitment_profile_position_id_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Recruitment_profile_position_id_Audit_InsertUpdate;
GO

CREATE TRIGGER [dbo].[TG_Recruitment_profile_position_id_Audit_InsertUpdate]
ON [dbo].[Recruitment_profile]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy
								 ) 
    SELECT TableName    = 'Recruitment_profile', 
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


