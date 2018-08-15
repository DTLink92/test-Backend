USE the_walking_bugs;

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

--Creacion del trigger

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
           ModifiedBy   = i.ModifiedBy          
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
           ModifiedBy   = i.ModifiedBy          
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
           ModifiedBy   = i.ModifiedBy          
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
           ModifiedBy   = i.ModifiedBy          
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
           ModifiedBy   = i.ModifiedBy          
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

