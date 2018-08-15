use the_walking_bugs;
/*
/******************************************************************************
**  Name: CreateEmployeeAccident
**  Desc: Crea Empleado asignado en un accidente
**
**  Called by: employee_accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[CreateEmployeeAccident]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[CreateEmployeeAccident]
END
GO
CREATE PROCEDURE [dbo].[CreateEmployeeAccident]
(
	@id_employee int,
	@id_accident int,
	@detalle_lesion VARCHAR(max),
	@tipo_lesion varchar(50),
	@zona_lesion varchar(255),
	@user_id int,
	@employee_accident_id int output
)
AS
BEGIN
	INSERT INTO [dbo].[employee_accident](id_employee, id_accident, detalle_lesion, tipo_lesion, zona_lesion,CreatedBy,ModifiedBy)
	VALUES (@id_employee, @id_accident, @detalle_lesion, @tipo_lesion, @zona_lesion, @user_id, @user_id);
	SET @employee_accident_id = (SELECT @@IDENTITY);
END
GO
-- declare @id_ea int;
-- execute CreateEmployeeAccident 1,500,'detalle lesion', 'tipo leion', 'zona lesion', 100,@id_ea


/*
/******************************************************************************
**  Name: UpdateEmployeeAccident
**  Desc: Actualiza la informacion de un empleado accidentado en la base de datos
**
**  Called by: employee_accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia C.			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[UpdateEmployeeAccident]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateEmployeeAccident]
END
GO
CREATE PROCEDURE [dbo].[UpdateEmployeeAccident]
(
	@id int,
	@id_employee int,
	@id_accident int,
	@detalle_lesion VARCHAR(max),
	@tipo_lesion varchar(50),
	@zona_lesion varchar(255),
	@user_id int
)
AS
BEGIN
	UPDATE employee_accident
	SET id_employee = @id_employee,
		id_accident = @id_accident,
		detalle_lesion = @detalle_lesion,
		tipo_lesion = @tipo_lesion,
		zona_lesion = @zona_lesion,
		ModifiedBy = @user_id,
		ModifiedDate = GETDATE()
	WHERE id = @id
END
GO
--execute UpdateEmployeeAccident 1,1,500,'detalle lesion', 'tipo leion', 'zona lesion1', 5
--select * from employee_accident;


/*
/******************************************************************************
**  Name: DeleteEmployeeAccident
**  Desc: Elimina un empleado accidentado en la base de datos
**
**  Called by: employee_accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[DeleteEmployeeAccident]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteEmployeeAccident]
END
GO
CREATE PROCEDURE [dbo].[DeleteEmployeeAccident]
(
	@id INT
)
AS
BEGIN
	DELETE FROM employee_accident WHERE id = @id;
END
GO


/*
/******************************************************************************
**  Name: GetEmployeeAccidentByID
**  Desc: Obtiene un empleado accidentado en la base de datos por id
**
**  Called by: employee_accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia C.			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetEmployeeAccidentByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetEmployeeAccidentByID]
END
GO
CREATE PROCEDURE [dbo].[GetEmployeeAccidentByID]
(
	@id INT
)
AS
BEGIN
	SELECT id, id_employee, id_accident, detalle_lesion, tipo_lesion, zona_lesion
	FROM employee_accident
	WHERE id=@id
END
GO


/*
/******************************************************************************
**  Name: GetEmployeeAccidents
**  Desc: Obtiene la lista de empleados accidentados en la base de datos
**
**  Called by: employee_accident
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia C.			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetEmployeesAccident]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetEmployeesAccident]
END
GO
CREATE PROCEDURE [dbo].[GetEmployeesAccident]
AS
BEGIN
	SELECT id, id_employee, id_accident, detalle_lesion, tipo_lesion, zona_lesion
	FROM employee_accident
END
GO

/*
/******************************************************************************
**  Name: CreateAccidentCauses
**  Desc: Crea y relaciona un accidente con una causa
**
**  Called by: accident_causes
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[CreateAccidentCauses]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[CreateAccidentCauses]
END
GO
CREATE PROCEDURE [dbo].[CreateAccidentCauses]
(
	@id_cause int,
	@id_accident int,
	@user_id int,
	@accident_cause int output
)
AS
BEGIN
	INSERT INTO [dbo].[accident_causes](id_cause, id_accident,status,CreatedBy,ModifiedBy)
	VALUES (@id_cause, @id_accident, 1, @user_id, @user_id);
	SET @accident_cause = (SELECT @@IDENTITY);
END
GO

/*
/******************************************************************************
**  Name: UpdateAccidentCauses
**  Desc: Actualiza la informacion de un de la relacion entre causa y accidente
**
**  Called by: accident_causes
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia C.			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[UpdateAccidentCauses]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateAccidentCauses]
END
GO
CREATE PROCEDURE [dbo].[UpdateAccidentCauses]
(
	@id int,
	@id_cause int,
	@id_accident int,
	@status int,
	@user_id int
)
AS
BEGIN
	UPDATE accident_causes
	SET id_cause = @id_cause,
		id_accident = @id_accident,
		status = @status,
		ModifiedBy = @user_id,
		ModifiedDate = GETDATE()
	WHERE id = @id
END
GO


/*
/******************************************************************************
**  Name: DeleteAccidentCauses
**  Desc: Elimina una relacion entre causa y  accidente en la base de datos
**
**  Called by: accident_causes
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[DeleteAccidentCauses]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteAccidentCauses]
END
GO
CREATE PROCEDURE [dbo].[DeleteAccidentCauses]
(
	@id INT
)
AS
BEGIN
	DELETE FROM accident_causes WHERE id = @id;
END
GO


/*
/******************************************************************************
**  Name: GetAccidentCausesByID
**  Desc: Obtiene un causa del accidente en la base de datos por id
**
**  Called by: accident_causes
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia C.			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAccidentCausesByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAccidentCausesByID]
END
GO
CREATE PROCEDURE [dbo].[GetAccidentCausesByID]
(
	@id INT
)
AS
BEGIN
	SELECT id, id_cause, id_accident, status
	FROM accident_causes
	WHERE id=@id
END
GO


/*
/******************************************************************************
**  Name: GetAccidentsCauses
**  Desc: Obtiene la lista de la relacion causas del accidente en la base de datos
**
**  Called by: accident_causes
**
**  Author: Juan Pablo Mejia Callizaya
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Juan Pablo Mejia C.			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[GetAccidentCauses]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetAccidentCauses]
END
GO
CREATE PROCEDURE [dbo].[GetAccidentCauses]
AS
BEGIN
	SELECT id, id_cause, id_accident, status
	FROM accident_causes
END
GO

