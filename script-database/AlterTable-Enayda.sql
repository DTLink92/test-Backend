/**************************************************************************************************
**  Name: alter tables (Accident,[dbo].[AccidentCause],[dbo].[AccidentCauseGroup],[dbo].[AccidentType])
**  Desc:modified lables
**
**  Called by: Accident
**
**  Author: Quispe Guarachi Enayda
**
**  Date: 22/06/2018
*************************************************************************************************
**                            Change History
***************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/06/2018 Quispe Guarachi Enayda   Initial version
***********************************************************************************************/

USE [the_walking_bugs]
GO
PRINT 'INSERTANDO NUEVAS COLUMNAS PARA AUDITORIA EN  LA TABLA AccidentType....';
IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'AccidentType'))
BEGIN
ALTER TABLE [dbo].[AccidentType]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE() )
END
print 'se inserto cuatro columnas para auditoria.....en la tabla AccidentType';

PRINT 'INSERTANDO NUEVAS COLUMNAS PARA AUDITORIA EN  LA TABLA Accident....';

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'Accident'))
BEGIN
ALTER TABLE [dbo].[Accident]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE() )
END
print 'se inserto cuatro columnas para auditoria.....en la tabla Accident';



PRINT 'INSERTANDO COLUMNAS PARA PA AUDITORIA EN LA TABLA "AccidentCause"....';
IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'AccidentCause'))
BEGIN
ALTER TABLE [dbo].[AccidentCause]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE())
END
print 'se inserto cuatro columnas para auditoria.....en la tabla AccidentCause';

PRINT 'INSERTANDO COLUMNAS PARA PA AUDITORIA EN LA TABLA AccidentCauseGroup....';

IF NOT EXISTS(SELECT 1 FROM sys.columns
          WHERE Name = N'CreatedBy'
          AND Object_ID = Object_ID(N'AccidentCauseGroup'))
BEGIN
ALTER TABLE [dbo].[AccidentCauseGroup]
    ADD  CreatedBy INT NOT NULL DEFAULT (1),
        CreatedDate DATETIME NOT NULL DEFAULT (GETUTCDATE()),
        ModifiedBy INT NOT NULL DEFAULT (1),
        ModifiedDate DATETIME NOT NULL DEFAULT (GETUTCDATE() )
END
print 'se inserto cuatro columnas para auditoria.....en la tabla AccidentCauseGroup';

