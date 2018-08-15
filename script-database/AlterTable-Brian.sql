USE the_walking_bugs;
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'Employee'))
BEGIN
	ALTER TABLE dbo.Employee
	ADD CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'Project_Contract'))
BEGIN
	ALTER TABLE dbo.Project_Contract
	ADD CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'System_Project_User'))
BEGIN
	ALTER TABLE dbo.System_Project_User
	ADD CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END

IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'Rol'))
BEGIN
	ALTER TABLE dbo.Rol
	ADD CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE())
END