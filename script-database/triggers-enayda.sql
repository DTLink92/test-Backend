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
*//*
IF (OBJECT_ID(N'[dbo].[TG_AccidentCause(Audit)]') IS NOT NULL)
	BEGIN
      DROP TRIGGER [dbo].[TG_AccidentCause(Audit)] end; go
*/
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


/*
IF (OBJECT_ID(N'[dbo].[TG_AccidentCauseGroup(Audit)]') IS NOT NULL)
	BEGIN
      DROP TRIGGER [dbo].[TG_AccidentCauseGroup(Audit)] end; go
*/
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
/*
IF (OBJECT_ID(N'[dbo].[TG_AccidentType(Audit)]') IS NOT NULL)
	BEGIN
      DROP TRIGGER [dbo].[TG_AccidentType(Audit)] END; GO
*/
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
