USE the_walking_bugs
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