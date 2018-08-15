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
           ModifiedBy   = i.ModifiedBy
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
           ModifiedBy   = i.ModifiedBy
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
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.equipment_id, 1) != ISNULL(i.equipment_id, 1);
  END
END;
GO
