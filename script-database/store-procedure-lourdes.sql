/******************************************************************************
**  Name: InsertAssignEquipment
**  Desc: Insertar una asignación de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[InsertAssignEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[InsertAssignEquipment]
END
GO

CREATE PROCEDURE [dbo].[InsertAssignEquipment]
(
	@DateAssign DATE,
	@Description VARCHAR(250),
	@EmployeeID INT,
	@CreatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.assign_equipment (date_assign, description, employee_id, CreatedBy, ModifiedBy)
	VALUES (@DateAssign
		   , @Description
		   , @EmployeeID
		   , @CreatedBy
		   , @CreatedBy);

	SELECT @@IDENTITY AS NuevoAssignEquip;

END
GO

PRINT 'Procedimiento [dbo].[InsertAssignEquipment] creado';
GO

/*
EXECUTE [dbo].[InsertAssignEquipment]
   @DateAssign   = '2018-02-15'
  ,@Description  = 'Equipo necesita mantenimiento'
  ,@EmployeeID   = 10
  ,@CreatedBy = 1
GO
*/

/******************************************************************************
**  Name: UpdateAssignEquipment
**  Desc: Actualizar una asignación de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[UpdateAssignEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateAssignEquipment]
END
GO

CREATE PROCEDURE [dbo].[UpdateAssignEquipment]
(
	@AssignEquipID INT,
	@DateAssign DATE,
	@Description VARCHAR(250),
	@EmployeeID INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE assign_equipment
	SET    date_assign    = @DateAssign
			  , description   = @Description
			  , employee_id   = @EmployeeID
			  , ModifiedBy    = @ModifiedBy
	WHERE id = @AssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[UpdateAssignEquipment] creado';
GO

/*
EXECUTE [dbo].[UpdateAssignEquipment]
   @AssignEquipID = 10
  ,@DateAssign   = '2018-02-20'
  ,@Description  = 'Equipo necesita mantenimiento'
  ,@EmployeeID   = 9
  ,@ModifiedBy = 2
GO
*/

/******************************************************************************
**  Name: DeleteAssignEquipment
**  Desc: Elimina una asignación de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[DeleteAssignEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteAssignEquipment]
END
GO

CREATE PROCEDURE [dbo].[DeleteAssignEquipment]
(
	@AssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM assign_equipment
	WHERE id = @AssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[DeleteAssignEquipment] creado';
GO
/*
EXECUTE [dbo].[DeleteAssignEquipment]
	@AssignEquipID = 1
GO
*/

/******************************************************************************
**  Name: GetAssignEquipment
**  Desc: Selecciona una asignación de equipo por ID
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAssignEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAssignEquipment]
END
GO

CREATE PROCEDURE [dbo].[GetAssignEquipment]
(
	@AssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT *
	FROM assign_equipment
	WHERE id = @AssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[GetAssignEquipment] creado';
GO

/*
EXECUTE [dbo].[GetAssignEquipment]
	@AssignEquipID = 20
GO
*/

/******************************************************************************
**  Name: GetAllAssignEquipment
**  Desc: Selecciona todas las asignaciones de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAllAssignEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAllAssignEquipment]
END
GO

CREATE PROCEDURE [dbo].[GetAllAssignEquipment]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT *
	FROM assign_equipment
END
GO

PRINT 'Procedimiento [dbo].[GetAllAssignEquipment] creado';
GO
/*
EXECUTE [dbo].[GetAllAssignEquipment]
GO
*/

/******************************************************************************
**  Name: InsertDetailAssignEquip
**  Desc: Insertar un detalle de asignación de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[InsertDetailAssignEquip]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[InsertDetailAssignEquip]
END
GO

CREATE PROCEDURE [dbo].[InsertDetailAssignEquip]
(
	@AssignEquipID INT,
	@EquipmentID INT,
	@CreatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.detail_assign_equipment(assign_equipment_id, equipment_id, CreatedBy, ModifiedBy)
	VALUES (@AssignEquipID, @EquipmentID, @CreatedBy, @CreatedBy);

	SELECT @@IDENTITY AS NewDetailAssign;

END
GO

PRINT 'Procedimiento [dbo].[InsertDetailAssignEquip] creado';
GO

/*
EXECUTE [dbo].[InsertDetailAssignEquip]
   @AssignEquipID = 10
   ,@EquipmentID  = 20
   ,@CreatedBy = 1
GO
*/

/******************************************************************************
**  Name: UpdateDetailAssignEquip
**  Desc: Actualizar un detalle de asignación de equipo
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


IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[UpdateDetailAssignEquip]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateDetailAssignEquip]
END
GO

CREATE PROCEDURE [dbo].[UpdateDetailAssignEquip]
(
	@DetailAssignEquipID INT,
	@AssignEquipID INT,
	@EquipmentID INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE detail_assign_equipment
	SET assign_equipment_id = @AssignEquipID
	   , equipment_id       = @EquipmentID
	   , ModifiedBy         = @ModifiedBy
	WHERE id = @DetailAssignEquipID

END
GO

PRINT 'Procedimiento [dbo].[UpdateDetailAssignEquip] creado';
GO

/*
EXECUTE [dbo].[UpdateDetailAssignEquip]
	@DetailAssignEquipID = 10
   ,@AssignEquipID = 10
   ,@EquipmentID  = 30
   ,@ModifiedBy  = 2
GO
*/

/******************************************************************************
**  Name: DeleteDetailAssignEquip
**  Desc: Elimina un detalle de asignación de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[DeleteDetailAssignEquip]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteDetailAssignEquip]
END
GO

CREATE PROCEDURE [dbo].[DeleteDetailAssignEquip]
(
	@DetailAssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM detail_assign_equipment
	WHERE id = @DetailAssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[DeleteDetailAssignEquip] creado';
GO
/*
EXECUTE [dbo].[DeleteDetailAssignEquip]
	@DetailAssignEquipID = 1
GO
*/

/******************************************************************************
**  Name: GetDetailAssignEquip
**  Desc: Selecciona un detalle de asignación de equipo por ID
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetDetailAssignEquip]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetDetailAssignEquip]
END
GO

CREATE PROCEDURE [dbo].[GetDetailAssignEquip]
(
	@DetailAssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT *
	FROM detail_assign_equipment
	WHERE id = @DetailAssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[GetDetailAssignEquip] creado';
GO
/*
EXECUTE [dbo].[GetDetailAssignEquip]
	@DetailAssignEquipID = 10
GO
*/

/******************************************************************************
**  Name: GetAllDetailAssignEquip
**  Desc: Seleccionar todos los detalles de asignación de equipo
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAllDetailAssignEquip]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAllDetailAssignEquip]
END
GO

CREATE PROCEDURE [dbo].[GetAllDetailAssignEquip]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT *
	FROM detail_assign_equipment
END
GO

PRINT 'Procedimiento [dbo].[GetAllDetailAssignEquip] creado';
GO
/*
EXECUTE [dbo].[GetAllDetailAssignEquip]
GO
*/

/******************************************************************************
**  Name: GetAssignEquipByID
**  Desc: Selecciona asignación de equipo por ID
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAssignEquipByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAssignEquipByID]
END
GO

CREATE PROCEDURE [dbo].[GetAssignEquipByID]
(
	@AssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT asg.id, asg.employee_id, emp.Name, emp.LastName, fullName=emp.Name + ' '+ emp.LastName, asg.date_assign, asg.description, dasg.equipment_id
	FROM assign_equipment asg INNER JOIN detail_assign_equipment dasg
			ON (asg.id = dasg.assign_equipment_id) INNER JOIN Employee emp
			ON (asg.employee_id = emp.EmployeeID)
	WHERE asg.id = @AssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[GetAssignEquipByID] creado';
GO
/*
EXECUTE [dbo].[GetAssignEquipByID]
	@AssignEquipID = 2
GO
*/

/******************************************************************************
**  Name: GetEquipByAssign
**  Desc: Selecciona los equipos de una asignacion
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetEquipByAssign]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetEquipByAssign]
END
GO

CREATE PROCEDURE [dbo].[GetEquipByAssign]
(
	@AssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT dasg.id,	asg.id, emp.EmployeeID, emp.Name, emp.LastName, eq.id, eq.name
	FROM detail_assign_equipment dasg INNER JOIN equipment eq
			ON (dasg.equipment_id = eq.id) INNER JOIN assign_equipment asg
			ON (asg.id = dasg.assign_equipment_id) INNER JOIN Employee emp
			ON (asg.employee_id = emp.EmployeeID)
	WHERE dasg.assign_equipment_id = @AssignEquipID

END
GO

PRINT 'Procedimiento [dbo].[GetEquipByAssign] creado';
GO
/*
EXECUTE [dbo].[GetEquipByAssign]
	@AssignEquipID = 1
GO
*/


/******************************************************************************
**  Name: InsertPositionEquip
**  Desc: Insertar una asignación de equipo a un puesto
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[InsertPositionEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[InsertPositionEquipment]
END
GO

CREATE PROCEDURE [dbo].[InsertPositionEquipment]
(
	@EquipmentID INT,
	@PositionID INT,
	@CreatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.position_equipment(equipment_id, position_id, CreatedBy, ModifiedBy)
	VALUES (@EquipmentID, @PositionID, @CreatedBy, @CreatedBy);

	SELECT @@IDENTITY AS NewPositionEquipment;

END
GO

PRINT 'Procedimiento [dbo].[InsertPositionEquipment] creado';
GO

/*
EXECUTE [dbo].[InsertPositionEquipment]
   @EquipmentID  = 20
   , @PositionID = 10
   , @CreatedBy = 1
GO
*/

/******************************************************************************
**  Name: UpdatePositionEquip
**  Desc: Actualizar una asignación de equipo a un puesto
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[UpdatePositionEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdatePositionEquipment]
END
GO

CREATE PROCEDURE [dbo].[UpdatePositionEquipment]
(
	@PositionEquipID INT,
	@EquipmentID INT,
	@PositionID INT,
	@ModifiedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE position_equipment
	SET  equipment_id = @EquipmentID
	    , position_id = @PositionID
	    , ModifiedBy    = @ModifiedBy
	WHERE id = @PositionEquipID
END
GO

PRINT 'Procedimiento [dbo].[UpdatePositionEquipment] creado';
GO

/*
EXECUTE [dbo].[UpdatePositionEquipment]
	@PositionEquipID = 10
   , @EquipmentID  = 30
   , @PositionID = 10
   , @ModifiedBy = 2
GO
*/

/******************************************************************************
**  Name: DeletePositionEquipment
**  Desc: Elimina una asignación de equipo a un puesto
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[DeletePositionEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeletePositionEquipment]
END
GO

CREATE PROCEDURE [dbo].[DeletePositionEquipment]
(
	@PositionEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM position_equipment
	WHERE id = @PositionEquipID
END
GO

PRINT 'Procedimiento [dbo].[DeletePositionEquipment] creado';
GO
/*
EXECUTE [dbo].[DeletePositionEquipment]
	@PositionEquipID = 1
GO
*/

/******************************************************************************
**  Name: GetPositionEquipment
**  Desc: Selecciona una asignación de equipo a un puesto por ID
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetPositionEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetPositionEquipment]
END
GO

CREATE PROCEDURE [dbo].[GetPositionEquipment]
(
	@PositionEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT *
	FROM position_equipment
	WHERE id = @PositionEquipID
END
GO

PRINT 'Procedimiento [dbo].[GetPositionEquipment] creado';
GO
/*
EXECUTE [dbo].[GetPositionEquipment]
	@PositionEquipID = 10
GO
*/

/******************************************************************************
**  Name: GetAllPositionEquipment
**  Desc: Seleccionar todas las asignaciones de equipo a un puesto
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAllPositionEquipment]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAllPositionEquipment]
END
GO

CREATE PROCEDURE [dbo].[GetAllPositionEquipment]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT *
	FROM position_equipment
END
GO

PRINT 'Procedimiento [dbo].[GetAllPositionEquipment] creado';
GO
/*
EXECUTE [dbo].[GetAllPositionEquipment]
GO
*/