USE the_walking_bugs;
GO

--================================================================================================================================================================
-- MARCELO START
--================================================================================================================================================================
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


--================================================================================================================================================================
-- MARCELO END
--================================================================================================================================================================

--================================================================================================================================================================
-- LAURA START
--================================================================================================================================================================

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
ON [dbo].[Recruitmentprofile]
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
    SELECT TableName    = 'Recruitmentprofile',
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
ON [dbo].[Recruitmentprofile]
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
    SELECT TableName    = 'Recruitmentprofile',
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
ON [dbo].[Recruitmentprofile]
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
    SELECT TableName    = 'Recruitmentprofile',
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
ON [dbo].[Recruitmentprofile]
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
    SELECT TableName    = 'Recruitmentprofile',
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
ON [dbo].[Recruitmentprofile]
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
    SELECT TableName    = 'Recruitmentprofile',
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



--================================================================================================================================================================
-- LAURA END
--================================================================================================================================================================

--================================================================================================================================================================
-- BRIAN START
--================================================================================================================================================================

USE the_walking_bugs;
GO
/*
/******************************************************************************
**  Name: TG_Employee_Audit_Name
**  Desc: Audit History for Employee table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/
IF (OBJECT_ID(N'[dbo].[TG_Employee_Audit_Name]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_Employee_Audit_Name];
END;
GO

CREATE TRIGGER [dbo].[TG_Employee_Audit_Name]
ON [dbo].[Employee]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(first_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'first_name',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.first_name,
           NewValue     = i.first_name,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.first_name, '') != ISNULL(i.first_name, '');
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_Employee_Audit_LastName
**  Desc: Audit History for Employee table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_Employee_Audit_LastName]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_Employee_Audit_LastName];
END;
GO


CREATE TRIGGER [dbo].[TG_Employee_Audit_LastName]
ON [dbo].[Employee]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(last_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'last_name',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.last_name,
           NewValue     = i.last_name,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.last_name, '') != ISNULL(i.last_name, '');
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_Employee_Audit_CI
**  Desc: Audit History for Employee table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_Employee_Audit_CI]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_Employee_Audit_CI];
END;
GO

CREATE TRIGGER [dbo].[TG_Employee_Audit_CI]
ON [dbo].[Employee]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(CI)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'CI',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[CI],
           NewValue     = i.[CI],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.CI, 0) != ISNULL(i.CI, 0);
  END
END;
GO

/*
/******************************************************************************
**  Name: TG_Employee_Audit_Civil_State
**  Desc: Audit History for Employee table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_Employee_Audit_Civil_State]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_Employee_Audit_Civil_State];
END;
GO

CREATE TRIGGER [dbo].[TG_Employee_Audit_Civil_State]
ON [dbo].[Employee]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(civil_state)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'CivilState',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.civil_state,
           NewValue     = i.civil_state,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.civil_state, '') != ISNULL(i.civil_state, '');
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_ProjectContract_Audit_Salary
**  Desc: Audit History for project table table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_ProjectContract_Audit_Salary]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_ProjectContract_Audit_Salary];
END;
GO

CREATE TRIGGER [dbo].[TG_ProjectContract_Audit_Salary]
ON [dbo].[Project_Contract]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(Salary)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Project_Contract',
           ColumnName   = 'Salary',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[Salary],
           NewValue     = i.[Salary],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.Salary, 0) != ISNULL(i.Salary, 0);
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_ProjectContract_Audit_PositionID
**  Desc: Audit History for project table table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_ProjectContract_Audit_PositionID]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_ProjectContract_Audit_PositionID];
END;
GO

CREATE TRIGGER [dbo].[TG_ProjectContract_Audit_PositionID]
ON [dbo].[Project_Contract]
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
								 ModifiedBy)
    SELECT TableName    = 'Project_Contract',
           ColumnName   = 'PositionID',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.position_id,
           NewValue     = i.position_id,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.position_id, 0) != ISNULL(i.position_id, 0);
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_ProjectContract_Audit_SupervisorID
**  Desc: Audit History for project table table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_ProjectContract_Audit_SupervisorID]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_ProjectContract_Audit_SupervisorID];
END;
GO

CREATE TRIGGER [dbo].[TG_ProjectContract_Audit_SupervisorID]
ON [dbo].[Project_Contract]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(supervisor_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Project_Contract',
           ColumnName   = 'SupervisorID',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.supervisor_id,
           NewValue     = i.supervisor_id,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.supervisor_id, 0) != ISNULL(i.supervisor_id, 0);
  END
END;
GO

/*
/******************************************************************************
**  Name: TG_ProjectContract_Audit_ProjectID
**  Desc: Audit History for project table table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_ProjectContract_Audit_ProjectID]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_ProjectContract_Audit_ProjectID];
END;
GO

CREATE TRIGGER [dbo].[TG_ProjectContract_Audit_ProjectID]
ON [dbo].[Project_Contract]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(project_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Project_Contract',
           ColumnName   = 'ProjectID',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.project_id,
           NewValue     = i.project_id,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.project_id, NULL) != ISNULL(i.project_id, NULL);
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_ProjectContract_Audit_ContractDescription
**  Desc: Audit History for project table table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/
IF (OBJECT_ID(N'[dbo].[TG_ProjectContract_Audit_ContractDescription]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_ProjectContract_Audit_ContractDescription];
END;
GO

CREATE TRIGGER [dbo].[TG_ProjectContract_Audit_ContractDescription]
ON [dbo].[Project_Contract]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(contract_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Project_Contract',
           ColumnName   = 'ContractDescription',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.contract_description,
           NewValue     = i.contract_description,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.contract_description, '') != ISNULL(i.contract_description, '');
  END
END;
GO

/*
/******************************************************************************
**  Name: TG_Rol_Name
**  Desc: Audit History for rol table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_Rol_Name]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_Rol_Name];
END;
GO

CREATE TRIGGER [dbo].[TG_Rol_Name]
ON [dbo].[Rol]
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
								 ModifiedBy)
    SELECT TableName    = 'Rol',
           ColumnName   = 'Name',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[Name],
           NewValue     = i.[Name],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.Name, '') != ISNULL(i.Name, '');
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_SystemUser_UserLogin
**  Desc: Audit History for system user table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_SystemUser_UserLogin]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_SystemUser_UserLogin];
END;
GO

CREATE TRIGGER [dbo].[TG_SystemUser_UserLogin]
ON [dbo].[System_Project_User]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(user_login)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'System_Poject_User',
           ColumnName   = 'UserLogin',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.user_login,
           NewValue     = i.user_login,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.user_login, '') != ISNULL(i.user_login, '');
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_SystemUser_UserPassword
**  Desc: Audit History for system user table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_SystemUser_UserPassword]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_SystemUser_UserPassword];
END;
GO

CREATE TRIGGER [dbo].[TG_SystemUser_UserPassword]
ON [dbo].[System_Project_User]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(user_password)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'System_Poject_User',
           ColumnName   = 'UserPassword',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.user_password,
           NewValue     = i.user_password,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.user_password, '') != ISNULL(i.user_password, '');
  END
END;
GO


/*
/******************************************************************************
**  Name: TG_SystemUser_RolID
**  Desc: Audit History for system user table
**
**  Called by:
**
**  Author: Brian Perez
**
**  Date: 06/17/2012
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 06/17/2018 Brian Perez   Initial version
*******************************************************************************/
*/

IF (OBJECT_ID(N'[dbo].[TG_SystemUser_RolID]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_SystemUser_RolID];
END;
GO

CREATE TRIGGER [dbo].[TG_SystemUser_RolID]
ON [dbo].[System_Project_User]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(rol_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'System_Poject_User',
           ColumnName   = 'RolID',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.rol_id,
           NewValue     = i.rol_id,
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.rol_id, 0) != ISNULL(i.rol_id, 0);
  END
END;
GO

--================================================================================================================================================================
-- BRIAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- ENAYDA START
--================================================================================================================================================================
USE the_walking_bugs;
GO
/*
/******************************************************************************
**  Name:[dbo].[TG_Accident(Audit)_InsertUpdate]
**  Desc: auditoria para la tabla Accident
**
**  Called by:
**
**  Author: Enayda Quispe
**
**  Date: 22/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/06/2018 Enayda Quispe   Initial version
*******************************************************************************/
*/
IF (OBJECT_ID(N'[dbo].[TG_Accident(Audit)]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_Accident(Audit)] ;
END;
GO

CREATE TRIGGER [dbo].[TG_Accident(Audit)]
ON [dbo].[Accident]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE(), @esAccident int ;
 select @esAccident =count(*)
	from [dbo].[Accident]
IF(@esAccident > 0)
BEGIN
  IF UPDATE(nameAccidentado)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = 'nameAccidentado',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[nameAccidentado],
           NewValue     = i.[nameAccidentado],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.nameAccidentado, '') != ISNULL(i.nameAccidentado, '');
  END
IF UPDATE(date_accident)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = 'date_accident',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[date_accident],
           NewValue     = i.date_accident,
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.date_accident, '') != ISNULL(i.date_accident, '');
  END
  IF UPDATE([hour_accident])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = '[hour_accident]',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[hour_accident],
           NewValue     = i.[hour_accident],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.[hour_accident], '') != ISNULL(i.[hour_accident], '');
  END
  IF UPDATE([place_accident])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = '[place_accident]',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[place_accident],
           NewValue     = i.[place_accident],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.[place_accident], '') != ISNULL(i.[place_accident], '');
  END
  IF UPDATE([gravity_accident])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = '[gravity_accident]',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[gravity_accident],
           NewValue     = i.[gravity_accident],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.[gravity_accident], '') != ISNULL(i.[gravity_accident], '');
  END
  IF UPDATE([description_accident])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = '[description_accident]',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[description_accident],
           NewValue     = i.[description_accident],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.[description_accident], '') != ISNULL(i.[description_accident], '');
  END
  IF UPDATE([accidentTypeID])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = '[accidentTypeID]',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[accidentTypeID],
           NewValue     = i.[accidentTypeID],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.[accidentTypeID], '') != ISNULL(i.[accidentTypeID], '');
  END
    IF UPDATE([areaID])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'Accident',
           ColumnName   = '[areaID]',
           ID1          = i.accidentID,
           Date         = @CurrDate,
           OldValue     = d.[areaID],
           NewValue     = i.[areaID],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentID = i.accidentID)
    WHERE ISNULL(d.[areaID], '') != ISNULL(i.[areaID], '');
  END
END
END;
GO
/*
/******************************************************************************
**  Name:[dbo].[TG_AccidentCause(Audit)_InsertUpdate]
**  Desc: auditoria para la tabla AccidentCause
**
**  Called by:
**
**  Author: Enayda Quispe
**
**  Date: 22/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/06/2018 Enayda Quispe   Initial version
*******************************************************************************/
*/
IF (OBJECT_ID(N'[dbo].[TG_AccidentCause(Audit)]') IS NOT NULL)
	BEGIN
      DROP TRIGGER [dbo].[TG_AccidentCause(Audit)] 
end; 
go

CREATE TRIGGER [dbo].[TG_AccidentCause(Audit)]
ON [dbo].[AccidentCause]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE(), @esAccidentCause int ;
									select @esAccidentCause =count(*) from [dbo].[AccidentCause]
IF(@esAccidentCause > 0)
BEGIN
  IF UPDATE(descripcion)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'AccidentCause',
           ColumnName   = 'descripcion',
           ID1          = i.accidentCauseID,
           Date         = @CurrDate,
           OldValue     = d.[descripcion],
           NewValue     = i.[descripcion],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentCauseID = i.accidentCauseID)
    WHERE ISNULL(d.descripcion, '') != ISNULL(i.descripcion, '');
  END
IF UPDATE(accidentCauseGroupID)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'AccidentCause',
           ColumnName   = 'accidentCauseGroupID',
           ID1          = i.[accidentCauseID],
           Date         = @CurrDate,
           OldValue     = d.[accidentCauseGroupID],
           NewValue     = i.accidentCauseGroupID,
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentCauseID = i.accidentCauseID)
    WHERE ISNULL(d.accidentCauseGroupID, '') != ISNULL(i.accidentCauseGroupID, '');
  END
END
END;
GO

/******************************************************************************
**  Name:[dbo].[TG_AccidentCauseGroup(Audit)_InsertUpdate]
**  Desc: auditoria para la tabla AccidentCauseGroup
**
**  Called by:
**
**  Author: Enayda Quispe
**
**  Date: 22/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/06/2018 Enayda Quispe   Initial version
*******************************************************************************/



IF (OBJECT_ID(N'[dbo].[TG_AccidentCauseGroup(Audit)]') IS NOT NULL)
	BEGIN
      DROP TRIGGER [dbo].[TG_AccidentCauseGroup(Audit)] end; 
go

CREATE TRIGGER [dbo].[TG_AccidentCauseGroup(Audit)]
ON [dbo].[AccidentCauseGroup]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE(), @esAccidentCauseGroup int ;
									select @esAccidentCauseGroup =count(*) from [dbo].[AccidentCauseGroup]
IF(@esAccidentCauseGroup > 0)
BEGIN
  IF UPDATE(Title)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'AccidentCauseGroup',
           ColumnName   = 'title',
           ID1          = i.title,
           Date         = @CurrDate,
           OldValue     = d.title,
           NewValue     = i.title,
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentCauseGroupID = i.accidentCauseGroupID)
    WHERE ISNULL(d.title, '') != ISNULL(i.title, '');
  END

END
END;
GO
/******************************************************************************
**  Name:[dbo].[TG_AccidentType(Audit)_InsertUpdate]
**  Desc: auditoria para la tabla AccidentType
**
**  Called by:
**
**  Author: Enayda Quispe
**
**  Date: 22/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/06/2018 Enayda Quispe   Initial version
*******************************************************************************/


IF (OBJECT_ID(N'[dbo].[TG_AccidentType(Audit)]') IS NOT NULL)
BEGIN
      DROP TRIGGER [dbo].[TG_AccidentType(Audit)];
END;
GO


CREATE TRIGGER [dbo].[TG_AccidentType(Audit)]
ON [dbo].[AccidentType]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE(), @esAccidentType int ;
									select @esAccidentType =count(*) from [dbo].[AccidentType]
IF(@esAccidentType > 0)
BEGIN
  IF UPDATE([name_type_accident])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'AccidentType',
           ColumnName   = 'name_type_accident',
           ID1          = i.accidentTypeID,
           Date         = @CurrDate,
           OldValue     = d.name_type_accident,
           NewValue     = i.name_type_accident,
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentTypeID = i.accidentTypeID)
    WHERE ISNULL(d.name_type_accident, '') != ISNULL(i.name_type_accident, '');
  END
    IF UPDATE([code_type_accident])
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'AccidentType',
           ColumnName   = '[code_type_accident]',
           ID1          = i.accidentTypeID,
           Date         = @CurrDate,
           OldValue     = d.name_type_accident,
           NewValue     = i.name_type_accident,
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.accidentTypeID = i.accidentTypeID)
    WHERE ISNULL(d.[code_type_accident], '') != ISNULL(i.[code_type_accident], '');
  END
END
END;
GO


--================================================================================================================================================================
-- ENAYDA END
--================================================================================================================================================================


--================================================================================================================================================================
-- JUAN START
--================================================================================================================================================================

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

GO
--================================================================================================================================================================
-- JUAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- LOURDES START
--================================================================================================================================================================

/******************************************************************************
**  Name: TG_AssignEquipmentDateAssign_InsertUpdate
**  Desc: Auditoria a date_assign dentro de Assign_equipment
**
**  Called by: Assign_equipment
**
**  Author: Lourdes Selen Choque Ch.
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:        Author:                            Description:
** --------      --------           ------------------------------------
** 21/06/2018  Lourdes S. Choque Ch.               version inicial
*******************************************************************************/

USE the_walking_bugs;

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_AssignEquipmentDateAssign_InsertUpdate')
BEGIN
    DROP TRIGGER [TG_AssignEquipmentDateAssign_InsertUpdate]
END
GO

CREATE TRIGGER [dbo].[TG_AssignEquipmentDateAssign_InsertUpdate]
ON [dbo].[assign_equipment]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(date_assign)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'assign_equipment',
           ColumnName   = 'date_assign',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[date_assign],
           NewValue     = i.[date_assign],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.date_assign, '') != ISNULL(i.date_assign,'');
  END
END;
GO

/******************************************************************************
**  Name: TG_DetailAssignEquipmentIDEquip_InsertUpdate
**  Desc: Auditoria a equipo dentro de Detail_Assign_equipment
**
**  Called by: Detail_assign_equipment
**
**  Author: Lourdes Selen Choque Ch.
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:        Author:                            Description:
** --------      --------           ------------------------------------
** 21/06/2018  Lourdes S. Choque Ch.               version inicial
*******************************************************************************/

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_DetailAssignEquipmentIDEquip_InsertUpdate')
BEGIN
    DROP TRIGGER [TG_DetailAssignEquipmentIDEquip_InsertUpdate]
END
GO

CREATE TRIGGER [dbo].[TG_DetailAssignEquipmentIDEquip_InsertUpdate]
ON [dbo].[detail_assign_equipment]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(equipment_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'detail_assign_equipment',
           ColumnName   = 'equipment_id',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[equipment_id],
           NewValue     = i.[equipment_id],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.equipment_id, 1) != ISNULL(i.equipment_id, 1);
  END
END;
GO

/******************************************************************************
**  Name: TG_PositionEquipmentIDEquip_InsertUpdate
**  Desc: Auditoria a equipo dentro de Position_equipment
**
**  Called by: Position_equipment
**
**  Author: Lourdes Selen Choque Ch.
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:        Author:                            Description:
** --------      --------           ------------------------------------
** 21/06/2018  Lourdes S. Choque Ch.               version inicial
*******************************************************************************/

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_PositionEquipmentIDEquip_InsertUpdate')
BEGIN
    DROP TRIGGER [TG_PositionEquipmentIDEquip_InsertUpdate]
END
GO

CREATE TRIGGER [dbo].[TG_PositionEquipmentIDEquip_InsertUpdate]
ON [dbo].[position_equipment]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(equipment_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'position_equipment',
           ColumnName   = 'equipment_id',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[equipment_id],
           NewValue     = i.[equipment_id],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.equipment_id, 1) != ISNULL(i.equipment_id, 1);
  END
END;
GO


--================================================================================================================================================================
-- LOURDES END
--================================================================================================================================================================


--================================================================================================================================================================
-- FARID START
--================================================================================================================================================================

/******************************************************************************
**  Name: TG_type_equipment_InsertUpdate
**  Desc: Audit History for type_equipment table
**
**  Called by: type_equipment
**
**  Author: Farid Zambrana
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------           ---------------------------------------------------
** 21/06/2018 Farid Zambrana      version inicial
*******************************************************************************/

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_type_equipment_InsertUpdate')
BEGIN
    DROP TRIGGER [TG_type_equipment_InsertUpdate]
END
GO

CREATE TRIGGER [dbo].[TG_type_equipment_InsertUpdate]
ON [dbo].[type_equipment]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'type_equipment',
           ColumnName   = 'name',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[name],
           NewValue     = i.[name],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name,'');
  END
  ------------------------------------------------------
  ------------------------------------------------------
  IF UPDATE(description_type_equipment)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'type_equipment',
           ColumnName   = 'description_type_equipment',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[description_type_equipment],
           NewValue     = i.[description_type_equipment],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.description_type_equipment, '') != ISNULL(i.description_type_equipment,'');
  END

END;
GO

/*
EXECUTE [dbo].[UpdateTypeEquipment]
                                @id= 4,
								@description_type_equipment = 'Herramientas para obreros'
                                ,@name = 'Herramientas'

SELECT *
FROM AuditHistory
*/


--Creacion del trigger

/******************************************************************************
**  Name: TG_equipment_InsertUpdate
**  Desc: Audit History for equipment table
**
**  Called by: equipment
**
**  Author: Farid Zambrana
**
**  Date: 21/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------           ---------------------------------------------------
** 21/06/2018 Farid Zambrana      version inicial
*******************************************************************************/

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_equipment_InsertUpdate')
BEGIN
    DROP TRIGGER [TG_equipment_InsertUpdate]
END
GO

CREATE TRIGGER [dbo].[TG_equipment_InsertUpdate]
ON [dbo].[equipment]
FOR UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'equipment',
           ColumnName   = 'name',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[name],
           NewValue     = i.[name],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name,'');
  END
  ------------------------------------------------------
  ------------------------------------------------------
  IF UPDATE(status)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'equipment',
           ColumnName   = 'status',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[status],
           NewValue     = i.[status],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.status, '') != ISNULL(i.status,'');
  END

  ------------------------------------------------------
  ------------------------------------------------------
  IF UPDATE(warranty)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'equipment',
           ColumnName   = 'warranty',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[warranty],
           NewValue     = i.[warranty],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.warranty, '') != ISNULL(i.warranty,'');
  END

END;
GO

/*
EXECUTE [dbo].[UpdateEquipment]
                                 @id= 11
								,@brand = 'Skyl'
								,@code = 'MDRL'
								,@dateofpurchase = '2018-09-12'
								,@description = 'Sire para perforar acero manualmente con brocas de acero'
								,@image_equipment = NULL
								,@manufactured = 'USA'
								,@name = 'Mandril'
								,@status = 'Inactivo'
								,@warranty = '2 años'
								,@type_equipment_id = '4'

SELECT *
FROM AuditHistory

*/

--================================================================================================================================================================
-- FARID END
--================================================================================================================================================================

GO 

/******************************************************************************
**  Name: TG_INSERT_UPDATE_INVERSION_PROJECT
**  Desc: Auditorioa del campo inversion dentro de la tala project
**
**  Called by: 
**
**  Author: MArcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:        Author:                            Description:
** --------      --------           			------------------------------------
** 23/06/2018  Marcelo Jhossmar Ramos Valdez         version inicial
*******************************************************************************/

USE the_walking_bugs;

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_INSERT_UPDATE_INVERSION_PROJECT')
BEGIN
    DROP TRIGGER [TG_INSERT_UPDATE_INVERSION_PROJECT]
	print ' el trigger "TG_INSERT_UPDATE_INVERSION_PROJECT" ya existia, re-creando....'
END
ELSE 
BEGIN
print ' Creando el trigger "TG_INSERT_UPDATE_INVERSION_PROJECT"....'

END
GO

CREATE TRIGGER [dbo].[TG_INSERT_UPDATE_INVERSION_PROJECT]
ON [dbo].[project]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(inversion) -- float
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'project',
           ColumnName   = 'inversion',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[inversion],
           NewValue     = i.[inversion],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.inversion, '') != ISNULL(i.inversion,'');
  END
END
GO
print '...OK'
--------------------------------------------------------
/******************************************************************************
**  Name: TG_INSERT_UPDATE_NAME_AREA
**  Desc: Auditorioa del campo name dentro de la tala Area
**
**  Called by: 
**
**  Author: MArcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Cambios en la historia
*******************************************************************************
**   Date:        Author:                            Description:
** --------      --------           			------------------------------------
** 23/06/2018  Marcelo Jhossmar Ramos Valdez         version inicial
*******************************************************************************/

USE the_walking_bugs;

IF EXISTS(SELECT 1 FROM sys.triggers WHERE NAME LIKE 'TG_INSERT_UPDATE_NAME_AREA')
BEGIN
    DROP TRIGGER [TG_INSERT_UPDATE_NAME_AREA]
	print ' el trigger "TG_INSERT_UPDATE_NAME_AREA" ya existia, re-creando....'
END
ELSE 
BEGIN
print ' Creando el trigger "TG_INSERT_UPDATE_NAME_AREA"....'

END
GO

CREATE TRIGGER [dbo].[TG_INSERT_UPDATE_NAME_AREA]
ON [dbo].[Area]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(name) -- float
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'area',
           ColumnName   = 'name',
           ID1          = i.id,
           Date         = @CurrDate,
           OldValue     = d.[name],
           NewValue     = i.[name],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name,'');
  END
END
GO
print '...OK'