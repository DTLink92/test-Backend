/******************************************************************************
**  Desc.: Creación de tabla auditoria
*******************************************************************************/

USE the_walking_bugs;
GO

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