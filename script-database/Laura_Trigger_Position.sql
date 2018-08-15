USE [the_walking_bugs]
GO

--======================================================================================================
-- POSITION TABLE
--======================================================================================================

/*******************************************************************************************************
**  Name: TG_Position_Version_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_Version_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_Version_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_Version_Audit_InsertUpdate;
GO
	CREATE TRIGGER [dbo].[TG_Position_Version_Audit_InsertUpdate]
	ON [dbo].[Position]
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
		SELECT TableName    = 'Position', 
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

--======================================================================================================
-- POSITION  - Code - TRIGGER
--======================================================================================================
/*******************************************************************************************************
**  Name: TG_Position_Code_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_Code_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_Code_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_Code_Audit_InsertUpdate;
GO

	CREATE TRIGGER [dbo].[TG_Position_Code_Audit_InsertUpdate]
	ON [dbo].[Position]
	FOR INSERT, UPDATE
	AS
	BEGIN
	
	  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN
	 
	  SET NOCOUNT ON;
	  SET XACT_ABORT ON;
	 
	  DECLARE @CurrDate DATETIME = GETUTCDATE();
	 
	  IF UPDATE(Code)
	  BEGIN
		INSERT INTO dbo.AuditHistory(TableName, 
									 ColumnName, 
									 ID, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy
									 ) 
		SELECT TableName    = 'Position', 
			   ColumnName   = 'Code',
			   ID           = i.ID, 
			   Date         = @CurrDate, 
			   OldValue     = d.code, 
			   NewValue     = i.code,
			   ModifiedBy   = i.Modified_by          
		FROM deleted d 
		FULL OUTER JOIN inserted i ON (d.ID = i.ID)
		WHERE ISNULL(d.code, '') != ISNULL(i.code, '');
	  END
	END
GO

--======================================================================================================
-- POSITION  - Name - TRIGGER
--======================================================================================================
/*******************************************************************************************************
**  Name: TG_Position_Name_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_Name_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_Name_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_Name_Audit_InsertUpdate;
GO

	CREATE TRIGGER [dbo].[TG_Position_Name_Audit_InsertUpdate]
	ON [dbo].[Position]
	FOR INSERT, UPDATE
	AS
	BEGIN
	
	  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN
	 
	  SET NOCOUNT ON;
	  SET XACT_ABORT ON;
	 
	  DECLARE @CurrDate DATETIME = GETUTCDATE();
	 
	  IF UPDATE(Name)
	  BEGIN
		INSERT INTO dbo.AuditHistory(TableName, 
									 ColumnName, 
									 ID, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy
									 ) 
		SELECT TableName    = 'Position', 
			   ColumnName   = 'Name',
			   ID           = i.ID, 
			   Date         = @CurrDate, 
			   OldValue     = d.[name], 
			   NewValue     = i.[name],
			   ModifiedBy   = i.Modified_by          
		FROM deleted d 
		FULL OUTER JOIN inserted i ON (d.ID = i.ID)
		WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
	  END
	END;

GO
--======================================================================================================
-- POSITION  - Process - TRIGGER
--======================================================================================================
/*******************************************************************************************************
**  Name: TG_Position_Process_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_Process_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_Process_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_Process_Audit_InsertUpdate;
GO

	CREATE TRIGGER [dbo].[TG_Position_Process_Audit_InsertUpdate]
	ON [dbo].[Position]
	FOR INSERT, UPDATE
	AS
	BEGIN
	
	  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN
	 
	  SET NOCOUNT ON;
	  SET XACT_ABORT ON;
	 
	  DECLARE @CurrDate DATETIME = GETUTCDATE();
	 
	  IF UPDATE(Process)
	  BEGIN
		INSERT INTO dbo.AuditHistory(TableName, 
									 ColumnName, 
									 ID, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy
									 ) 
		SELECT TableName    = 'Position', 
			   ColumnName   = 'Process',
			   ID           = i.ID, 
			   Date         = @CurrDate, 
			   OldValue     = d.Process, 
			   NewValue     = i.Process,
			   ModifiedBy   = i.Modified_by          
		FROM deleted d 
		FULL OUTER JOIN inserted i ON (d.ID = i.ID)
		WHERE ISNULL(d.Process, '') != ISNULL(i.Process, '');
	  END
	END;
GO
--======================================================================================================
-- POSITION  - Purpose - TRIGGER
--======================================================================================================
/*******************************************************************************************************
**  Name: TG_Position_Purpose_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_Purpose_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_Purpose_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_Purpose_Audit_InsertUpdate;
GO

	CREATE TRIGGER [dbo].[TG_Position_Purpose_Audit_InsertUpdate]
	ON [dbo].[Position]
	FOR INSERT, UPDATE
	AS
	BEGIN
	
	  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN
	 
	  SET NOCOUNT ON;
	  SET XACT_ABORT ON;
	 
	  DECLARE @CurrDate DATETIME = GETUTCDATE();
	 
	  IF UPDATE(Purpose)
	  BEGIN
		INSERT INTO dbo.AuditHistory(TableName, 
									 ColumnName, 
									 ID, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy
									 ) 
		SELECT TableName    = 'Position', 
			   ColumnName   = 'Purpose',
			   ID           = i.ID, 
			   Date         = @CurrDate, 
			   OldValue     = d.[Purpose], 
			   NewValue     = i.[Purpose],
			   ModifiedBy   = i.Modified_by          
		FROM deleted d 
		FULL OUTER JOIN inserted i ON (d.ID = i.ID)
		WHERE ISNULL(d.Purpose, '') != ISNULL(i.Purpose, '');
	  END
	END;
GO
--======================================================================================================
-- POSITION  - Area_id - TRIGGER
--======================================================================================================
/*******************************************************************************************************
**  Name: TG_Position_area_id_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_area_id_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_area_id_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_area_id_Audit_InsertUpdate;
GO

	CREATE TRIGGER [dbo].[TG_Position_area_id_Audit_InsertUpdate]
	ON [dbo].[Position]
	FOR INSERT, UPDATE
	AS
	BEGIN
	
	  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN
	 
	  SET NOCOUNT ON;
	  SET XACT_ABORT ON;
	 
	  DECLARE @CurrDate DATETIME = GETUTCDATE();
	 
	  IF UPDATE(area_id)
	  BEGIN
		INSERT INTO dbo.AuditHistory(TableName, 
									 ColumnName, 
									 ID, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy
									 ) 
		SELECT TableName    = 'Position', 
			   ColumnName   = 'area_id',
			   ID           = i.ID, 
			   Date         = @CurrDate, 
			   OldValue     = d.[area_id], 
			   NewValue     = i.[area_id],
			   ModifiedBy   = i.Modified_by          
		FROM deleted d 
		FULL OUTER JOIN inserted i ON (d.ID = i.ID)
		WHERE ISNULL(CAST(d.area_id as varchar(max)), '') != ISNULL(CAST(i.area_id as varchar(max)), '');
	  END
	END;
GO
--======================================================================================================
-- POSITION  - higher_work_position_id - TRIGGER
--======================================================================================================
/*******************************************************************************************************
**  Name: Position_higher_work_position_id_Audit_InsertUpdate
**  Desc: Audit History for Positon table
** 
**  Called by: Position
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
PRINT 'Creando trigger en la tabla positon llamado  -> TG_Position_higher_work_position_id_Audit_InsertUpdate...';

IF OBJECT_ID (N'TG_Position_higher_work_position_id_Audit_InsertUpdate', N'TR') IS NOT NULL  
	DROP TRIGGER dbo.TG_Position_higher_work_position_id_Audit_InsertUpdate;
GO

	CREATE TRIGGER [dbo].[TG_Position_higher_work_position_id_Audit_InsertUpdate]
	ON [dbo].[Position]
	FOR INSERT, UPDATE
	AS
	BEGIN
	
	  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
		RETURN
	 
	  SET NOCOUNT ON;
	  SET XACT_ABORT ON;
	 
	  DECLARE @CurrDate DATETIME = GETUTCDATE();
	 
	  IF UPDATE(higher_work_position_id)
	  BEGIN
		INSERT INTO dbo.AuditHistory(TableName, 
									 ColumnName, 
									 ID, 
									 Date, 
									 OldValue, 
									 NewValue,
									 ModifiedBy
									 ) 
		SELECT TableName    = 'Position', 
			   ColumnName   = 'higher_work_position_id',
			   ID           = i.ID, 
			   Date         = @CurrDate, 
			   OldValue     = d.[higher_work_position_id], 
			   NewValue     = i.[higher_work_position_id],
			   ModifiedBy   = i.Modified_by          
		FROM deleted d 
		FULL OUTER JOIN inserted i ON (d.ID = i.ID)
		WHERE ISNULL(CAST(d.higher_work_position_id as varchar(max)), '') != ISNULL(CAST(i.higher_work_position_id as varchar(max)), '');
	  END
	END;
GO


