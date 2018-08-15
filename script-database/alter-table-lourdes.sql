/******************************************************************************
**  Desc: Alter table para auditoria, table assign_equipment
*******************************************************************************/

USE the_walking_bugs;

PRINT 'Creando columnas en table assign_equipment para auditoria ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.assign_equipment'))
BEGIN
	alter table assign_equipment add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

PRINT 'Columnas para table assign_equipment creadas ... ';
GO


/******************************************************************************
**  Desc: Alter table para auditoria, table detail_assign_equipment
*******************************************************************************/

PRINT 'Creando columnas en table detail_assign_equipment para auditoria ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.detail_assign_equipment'))
BEGIN
	alter table detail_assign_equipment add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
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
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.position_equipment'))
BEGIN
	alter table position_equipment add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO

PRINT 'Columnas para table position_equipment creadas ... ';
GO