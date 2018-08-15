use the_walking_bugs
go
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_getAuditHistory]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_getAuditHistory]
END
GO
CREATE PROCEDURE [dbo].[SP_getAuditHistory]
AS
BEGIN
	SELECT [AuditHistoryId],
			[TableName],
			[ColumnName],
			[ID],
			[Date],
			[Oldvalue],
			[NewValue],
			[ModifiedBy]
	FROM [dbo].[AuditHistory]
END
GO
