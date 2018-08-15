USE the_walking_bugs;
GO 

-- tabla PROJECT
PRINT 'Creando columnas de autitoria (createdBy,modifiedBy) en "tabla "project"... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.project'))
BEGIN
	ALTER TABLE dbo.project ADD createdBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "CreatedBy" ya existe'
END

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.project'))
BEGIN
	ALTER TABLE dbo.project ADD modifiedBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "modifiedBy" ya existe'
END
PRINT '...OK';
GO

-- TABLA AREA
PRINT 'Creando columnas de autitoria (createdBy,modifiedBy) en "tabla "area"... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.area'))
BEGIN
	ALTER TABLE dbo.area ADD createdBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "CreatedBy" ya existe'
END

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.area'))
BEGIN
	ALTER TABLE dbo.area ADD modifiedBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "modifiedBy" ya existe'
END
PRINT '...OK';
GO


-- TABLA Area_Asign_Project
PRINT 'Creando columnas de autitoria (createdBy,modifiedBy) en "tabla "Area_Asign_Project"... ';
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.Area_Asign_Project'))
BEGIN
	ALTER TABLE dbo.Area_Asign_Project ADD createdBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "CreatedBy" ya existe'
END

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ModifiedBy' AND Object_ID = Object_ID(N'dbo.Area_Asign_Project'))
BEGIN
	ALTER TABLE dbo.Area_Asign_Project ADD modifiedBy INT NOT NULL DEFAULT (1)
END
ELSE
BEGIN
	PRINT 'las columna "modifiedBy" ya existe'
END
PRINT '...OK';
GO