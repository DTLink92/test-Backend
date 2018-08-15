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
 
  IF UPDATE(Name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'Name',
           ID1          = i.EmployeeID, 
           Date         = @CurrDate, 
           OldValue     = d.[Name], 
           NewValue     = i.[Name],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.EmployeeID = i.EmployeeID)
    WHERE ISNULL(d.Name, '') != ISNULL(i.Name, '');
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
 
  IF UPDATE(LastName)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'LastName',
           ID1          = i.EmployeeID, 
           Date         = @CurrDate, 
           OldValue     = d.[LastName], 
           NewValue     = i.[LastName],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.EmployeeID = i.EmployeeID)
    WHERE ISNULL(d.LastName, '') != ISNULL(i.LastName, '');
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
           ID1          = i.EmployeeID, 
           Date         = @CurrDate, 
           OldValue     = d.[CI], 
           NewValue     = i.[CI],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.EmployeeID = i.EmployeeID)
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
 
  IF UPDATE(CivilState)
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
           ID1          = i.EmployeeID, 
           Date         = @CurrDate, 
           OldValue     = d.[CivilState], 
           NewValue     = i.[CivilState],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.EmployeeID = i.EmployeeID)
    WHERE ISNULL(d.CivilState, '') != ISNULL(i.CivilState, '');
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
           ID1          = i.ProjectContractID, 
           Date         = @CurrDate, 
           OldValue     = d.[Salary], 
           NewValue     = i.[Salary],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ProjectContractID = i.ProjectContractID)
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
 
  IF UPDATE(PositionID)
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
           ID1          = i.ProjectContractID, 
           Date         = @CurrDate, 
           OldValue     = d.[PositionID], 
           NewValue     = i.[PositionID],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ProjectContractID = i.ProjectContractID)
    WHERE ISNULL(d.PositionID, 0) != ISNULL(i.PositionID, 0);
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
 
  IF UPDATE(SupervisoID)
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
           ID1          = i.ProjectContractID, 
           Date         = @CurrDate, 
           OldValue     = d.[SupervisoID], 
           NewValue     = i.[SupervisoID],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ProjectContractID = i.ProjectContractID)
    WHERE ISNULL(d.SupervisoID, 0) != ISNULL(i.SupervisoID, 0);
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
 
  IF UPDATE(ProjectID)
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
           ID1          = i.ProjectContractID, 
           Date         = @CurrDate, 
           OldValue     = d.[ProjectID], 
           NewValue     = i.[ProjectID],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ProjectContractID = i.ProjectContractID)
    WHERE ISNULL(d.ProjectID, NULL) != ISNULL(i.ProjectID, NULL);
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
 
  IF UPDATE(ContractDescription)
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
           ID1          = i.ProjectContractID, 
           Date         = @CurrDate, 
           OldValue     = d.[ContractDescription], 
           NewValue     = i.[ContractDescription],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ProjectContractID = i.ProjectContractID)
    WHERE ISNULL(d.ContractDescription, '') != ISNULL(i.ContractDescription, '');
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
           ID1          = i.RolID, 
           Date         = @CurrDate, 
           OldValue     = d.[Name], 
           NewValue     = i.[Name],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.RolID = i.RolID)
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
 
  IF UPDATE(UserLogin)
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
           ID1          = i.UserID, 
           Date         = @CurrDate, 
           OldValue     = d.[UserLogin], 
           NewValue     = i.[UserLogin],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.UserID = i.UserID)
    WHERE ISNULL(d.UserLogin, '') != ISNULL(i.UserLogin, '');
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
 
  IF UPDATE(UserPassword)
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
           ID1          = i.UserID, 
           Date         = @CurrDate, 
           OldValue     = d.[UserPassword], 
           NewValue     = i.[UserPassword],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.UserID = i.UserID)
    WHERE ISNULL(d.UserPassword, '') != ISNULL(i.UserPassword, '');
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
 
  IF UPDATE(RolID)
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
           ID1          = i.UserID, 
           Date         = @CurrDate, 
           OldValue     = d.[RolID], 
           NewValue     = i.[RolID],
           ModifiedBy   = i.ModifiedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.UserID = i.UserID)
    WHERE ISNULL(d.RolID, 0) != ISNULL(i.RolID, 0);
  END
END;
GO