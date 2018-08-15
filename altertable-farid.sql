USE the_walking_bugs;

-- modificar las columnas de auditoria para la tabla type_equipment
/* ------------------------------------------------------------------------------
Alter Table type_equipment añadiendo las siguientes columnas:
CreatedBy
CreatedDate
ModifiedBy
ModifiedDate

*/ ------------------------------------------------------------------------------


PRINT 'Creando las columnas de auditoria de type_equipment ... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.type_equipment'))
BEGIN
	alter table type_equipment add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO
-- modificar las columnas de auditoria para la tabla equipment
/* ------------------------------------------------------------------------------
Alter Table equipment añadiendo las siguientes columnas:
CreatedBy
CreatedDate
ModifiedBy
ModifiedDate

*/ ------------------------------------------------------------------------------


PRINT 'Creando las columnas de auditoria para la tabla equipment ... ';
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add CreatedBy INT  NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedDate' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add ModifiedBy INT NOT NULL DEFAULT (1);
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedDate' AND Object_ID = Object_ID(N'dbo.equipment'))
BEGIN
	alter table equipment add ModifiedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE());
END
GO
