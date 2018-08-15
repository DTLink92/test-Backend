/*
/******************************************************************************
**  Name: CreateSystemUser
**  Desc: Crea un nuevo usuario en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
USE the_walking_bugs;
GO
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[CreateSystemUser]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[CreateSystemUser]
END
GO

CREATE PROCEDURE [dbo].[CreateSystemUser]
(
	@Name VARCHAR(50),
	@LastName VARCHAR(50),
	@UserLogin VARCHAR(100),
	@Password VARCHAR(100),
	@RolID INT,
	@CreatedBy INT,	
	@UserID INT OUTPUT
)
AS
BEGIN
	DECLARE @Login VARCHAR(100)
	SET @Login = (
		SELECT UserID
		FROM System_Project_User
		WHERE UserLogin = @Login
	)

	DECLARE @ValidRolID INT
	SET @ValidRolID = (
		SELECT RolID
		FROM Rol
		WHERE RolID = @RolID
	)

	IF (@Login IS NULL AND @ValidRolID IS NOT NULL)
		BEGIN
			IF(@Password <> '' AND @Password IS NOT NULL AND
				@UserLogin <> '' AND @UserLogin IS NOT NULL
				AND @Name <> '' AND @Name IS NOT NULL
				AND @LastName <> '' AND @LastName IS NOT NULL)
			BEGIN
				INSERT INTO System_Project_User(Name, LastName, UserLogin, UserPassword, RolID, CreatedBy, ModifiedBy)
				VALUES  (@Name, @LastName,  @UserLogin, @Password, @RolID, @CreatedBy, @CreatedBy);
				SET @UserID = (SELECT @@IDENTITY)
			END
			ELSE
			BEGIN
				PRINT('Vrificar que ninguno de los campos es nulo o vacio');
			END
		END
	ELSE
		BEGIN
			PRINT('El login de usuario ya existe');
		END
END
GO

/*Ejecucioin Prueba del Procedure*/
/*
USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[CreateSystemUser]
	@Name = 'TestUser',
	@LastName = 'Test',
	@UserLogin = 'test12345',
	@Password = 'test123',
	@RolID = 1,
	@CreatedBy = 1,
	@UserID = @UserID OUTPUT
PRINT @UserID;
GO

USE the_walking_bugs;
GO
SELECT *
FROM SystemUser*/

/*
/******************************************************************************
**  Name: UpdatePasswordSystemUser
**  Desc: Actualiza el password de un usuario en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
USE the_walking_bugs;
GO
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[UpdatePasswordSystemUser]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdatePasswordSystemUser]
END
GO
CREATE PROCEDURE [dbo].[UpdatePasswordSystemUser]
(
	@UserLogin VARCHAR(100),
	@Password VARCHAR(100),
	@ModifiedBy INT,
	@NewPassword VARCHAR(100)
)
AS
BEGIN
	DECLARE @UserID INT
	SET @UserID = (
		SELECT UserID
		FROM System_Project_User
		WHERE UserLogin = @UserLogin 
			AND UserPassword = @Password
	)

	IF (@UserID IS NOT NULL)
		BEGIN
			UPDATE System_Project_User 
			SET  UserPassword = @NewPassword,
				 ModifiedBy = @ModifiedBy
			WHERE UserID = @UserID;
		END
	ELSE
		BEGIN
			PRINT('El login de usuario o el password son incorrectos');
		END
END
GO

/*Ejecucioin Prueba del Procedure*/
/*
USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[UpdatePasswordSystemUser]
	@UserLogin = 'Admin123',
	@Password = '1234administrator',
	@ModifiedBy = 1,
	@NewPassword = 'Admin123'
GO*/


/*
/******************************************************************************
**  Name: DeleteSystemUser
**  Desc: Elimina un usuario en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[DeleteSystemUser]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteSystemUser]
END
GO

CREATE PROCEDURE [dbo].[DeleteSystemUser]
(
	@SystemUserID int
)
AS
BEGIN
	IF (@SystemUserID IS NOT NULL AND @SystemUserID > 0)
		BEGIN
			DELETE FROM System_Project_User
			WHERE UserID = @SystemUserID;
		END
	ELSE
		BEGIN
			PRINT('El id de usuario es incorrecto');
		END
END
GO

/*Ejecucioin Prueba del Procedure*/
/*

SELECT *
FROM SystemUser

USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[DeleteSystemUser]
	@SystemUserID = 12
GO*/



/*
/******************************************************************************
**  Name: GetSystemUserByID
**  Desc: Devuelve toda la informacion de un usuario en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetSystemUserByID]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetSystemUserByID]
END
GO

CREATE PROCEDURE [dbo].[GetSystemUserByID]
(
	@SystemUserID int
)
AS
BEGIN
	IF (@SystemUserID IS NOT NULL AND @SystemUserID > 0)
		BEGIN
			SELECT * 
			FROM System_Project_User
			WHERE UserID = @SystemUserID;
		END
	ELSE
		BEGIN
			PRINT('El id de usuario es incorrecto');
		END
END
GO

/*Ejecucioin Prueba del Procedure*/
/*

SELECT *
FROM SystemUser

USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[GetSystemUserByID]
	@SystemUserID = 1
GO*/

/*
/******************************************************************************
**  Name: GetSystemUsers
**  Desc: Devuelve todas los usuarios en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetSystemUsers]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetSystemUsers]
END
GO

CREATE PROCEDURE [dbo].[GetSystemUsers]
AS
BEGIN
	SELECT UserID, Name, LastName, UserLogin, UserPassword
	FROM System_Project_User
END
GO

/*Ejecucioin Prueba del Procedure*/
/*

SELECT *
FROM SystemUser

USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[GetSystemUsers]
GO*/



/*
/******************************************************************************
**  Name: CreateRol
**  Desc: Crea un rol en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[CreateRol]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[CreateRol]
END
GO
CREATE PROCEDURE [dbo].[CreateRol]
(
	@CreatedBy INT,
	@Name VARCHAR(50)
)
AS
BEGIN
	IF (@Name IS NOT NULL AND @Name <> '')
	BEGIN
		INSERT INTO Rol(Name, CreatedBy, ModifiedBy)
		VALUES (@Name, @CreatedBy, @CreatedBy)
	END
END
GO
/*
SELECT *
FROM Rol

USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[CreateRol]
	@Name = 'TestRol',
	@CreatedBy = 1
GO*/

/*
/******************************************************************************
**  Name: UpdateRol
**  Desc: Actualiza un rol en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[UpdateRol]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateRol]
END
GO
CREATE PROCEDURE [dbo].[UpdateRol]
(
	@RolID INT,
	@Name VARCHAR(50),
	@ModifiedBy INT
)
AS
BEGIN
	IF (@RolID IS NOT NULL)
	BEGIN
		UPDATE Rol
		SET  Name = @Name,
			ModifiedBy = @ModifiedBy 
		WHERE RolID = @RolID;
	END
END
GO
/*
SELECT *
FROM Rol

USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[UpdateRol]
	@Name = 'TestRol2',
	@RolID = 7,
	@ModifiedBy = 1
GO*/

/*
/******************************************************************************
**  Name: DeleteRol
**  Desc: Elimina un rol en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[DeleteRol]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteRol]
END
GO
CREATE PROCEDURE [dbo].[DeleteRol]
(
	@RolID INT
)
AS
BEGIN
	IF (@RolID IS NOT NULL)
	BEGIN
		DELETE FROM Rol
		WHERE RolID = @RolID;
	END
END
GO
/*
SELECT *
FROM Rol

USE the_walking_bugs;
GO
DECLARE @UserID INT
EXECUTE [dbo].[DeleteRol]
	@RolID = 7
GO*/


/*
/******************************************************************************
**  Name: GetRolById
**  Desc: Devuelve todas los usuarios en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetRolById]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetRolById]
END
GO

CREATE PROCEDURE [dbo].[GetRolById]
(
	@RolID INT
)
AS
BEGIN
	SELECT *
	FROM Rol
	WHERE RolID = @RolID
END
GO
/*
SELECT *
FROM Rol

USE the_walking_bugs;
GO
DECLARE @RolID INT
EXECUTE [dbo].[GetRolById]
	@RolID = 1
GO*/

/*
/******************************************************************************
**  Name: GetRoles
**  Desc: Devuelve todas los usuarios en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetRoles]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetRoles]
END
GO

CREATE PROCEDURE [dbo].[GetRoles]
AS
BEGIN
	SELECT RolID, Name
	FROM Rol
END
GO
/*
SELECT *
FROM Rol

USE the_walking_bugs;
GO
DECLARE @RolID INT
EXECUTE [dbo].[GetRoles]
GO*/


/*
/******************************************************************************
**  Name: CreateEmployee
**  Desc: Crea un empleado en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[CreateEmployee]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[CreateEmployee]
END
GO
CREATE PROCEDURE [dbo].[CreateEmployee]
(
	@Name VARCHAR(50),
	@LastName VARCHAR(50),
	@EmployeeAddress VARCHAR(150),
	@CI BIGINT,
	@Phone BIGINT,
	@CivilState VARCHAR(100),
	@BirthDate DATE,
	@DependenciesAmount INT,
	@Experience VARCHAR(MAX),
	@Gender VARCHAR(100),
	@ProfileImage VARBINARY(8000),
	@Email VARCHAR(100),
	@CreatedBy INT,
	@EmployeeID INT OUTPUT
)
AS
BEGIN
	INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email, ModifiedBy)
	VALUES (@Name, @LastName, @EmployeeAddress, @CI, @Phone, @CivilState, @BirthDate, @DependenciesAmount, @Experience, @Gender, @ProfileImage, @Email, @CreatedBy)
	SET @EmployeeID = (SELECT @@IDENTITY)
END
GO
/*
SELECT *
FROM Rol

USE the_walking_bugs;
GO
DECLARE @Name VARCHAR(50) = 'NewName'
DECLARE @LastName VARCHAR(50) = 'NewLastName'
DECLARE @EmployeeAddress VARCHAR(150) = 'NewAddress'
DECLARE @CI BIGINT = 10101
DECLARE @Phone BIGINT = 4891
DECLARE @CivilState VARCHAR(100) = 'Casado/a'
DECLARE @BirthDate DATE = '1995-01-01'
DECLARE @DependenciesAmount INT = 0
DECLARE @Experience VARCHAR(MAX) = 'N/A'
DECLARE @Gender VARCHAR(100) = 'Masculino'
DECLARE @ProfileImage VARBINARY(8000) = Null
DECLARE @Email VARCHAR(100) = 'NewTest@gmail.com'
DECLARE @CreatedBy INT = '1'
DECLARE @EmployeeID INT
EXECUTE [dbo].[CreateEmployee]
	@Name = @Name,
	@LastName = @LastName,
	@EmployeeAddress = @EmployeeAddress,
	@CI = @CI,
	@Phone = @Phone,
	@CivilState = @CivilState,
	@BirthDate = @BirthDate,
	@DependeciesAmount = @DependeciesAmount,
	@Experience = @Experience,
	@Gender = 'Masculino',
	@ProfileImage = NULL,
	@Email = @Email,
	@CreatedBy = @CreatedBy,
	@EmployeeID = @EmployeeiD OUTPUT
	
SELECT @EmployeeID
GO*/

/*
/******************************************************************************
**  Name: UpdateEmployee
**  Desc: Actualiza un empleado en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[UpdateEmployee]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateEmployee]
END
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
(
	@Name VARCHAR(50),
	@LastName VARCHAR(50),
	@EmployeeAddress VARCHAR(150),
	@CI BIGINT,
	@Phone BIGINT,
	@CivilState VARCHAR(100),
	@BirthDate DATE,
	@DependeciesAmount INT,
	@Experience VARCHAR(MAX),
	@Gender VARCHAR(100),
	@ProfileImage VARBINARY(8000),
	@Email VARCHAR(100),
	@ModifiedBy INT,
	@EmployeeID INT
)
AS
BEGIN
	UPDATE Employee
	SET Name = @Name,
		LastName = @LastName,
		EmployeeAddress = @EmployeeAddress,
		CI = @CI,
		Phone = @Phone,
		CivilState = @CivilState,
		BirthDate = @BirthDate,
		DependenciesAmount = @DependeciesAmount,
		Experience = @Experience,
		Gender = @Gender,
		ProfileImage = @ProfileImage,
		Email = @Email,
		ModifiedBy = @ModifiedBy
	WHERE EmployeeID = @EmployeeID
END
GO


/*
/******************************************************************************
**  Name: DeleteEmployee
**  Desc: Elimina un empleado en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[DeleteEmployee]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteEmployee]
END
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
(
	@EmployeeID INT
)
AS
BEGIN
	
	UPDATE Project_Contract
	SET SupervisoID = Null
	WHERE ProjectContractID IN (
		SELECT ProjectContractID
		FROM Project_Contract
		where SupervisoID = @EmployeeID
	)

	DELETE FROM Employee
	WHERE EmployeeID = @EmployeeID
END
GO


/*
/******************************************************************************
**  Name: GetEmployeeByID
**  Desc: Obtiene un empleado en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetEmployeeByID]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetEmployeeByID]
END
GO
CREATE PROCEDURE [dbo].[GetEmployeeByID]
(
	@EmployeeID INT
)
AS
BEGIN
	SELECT *
	FROM Employee
	WHERE EmployeeID = @EmployeeID
END
GO


/*
/******************************************************************************
**  Name: GetEmployees
**  Desc: Obtiene la lista de empleados en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetEmployees]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetEmployees]
END
GO
CREATE PROCEDURE [dbo].[GetEmployees]
AS
BEGIN
	SELECT EmployeeID, Name, LastName, EmployeeAddress, CI, Phone, CivilState,
			BirthDate, DependenciesAmount, Experience, Gender, ProfileImage, Email
	FROM Employee
END
GO


/*
/******************************************************************************
**  Name: CreateProjectContract
**  Desc: Crea un contrato en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[CreateProjectContract]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[CreateProjectContract]
END
GO
CREATE PROCEDURE [dbo].[CreateProjectContract]
(
	@ContractDescription VARCHAR(MAX),
	@HireDate DATE,
	@EndDate DATE,
	@Salary BIGINT,
	@PositionID INT,
	@EmployeeID INT,
	@SupervisorID INT,
	@CreatedBy INT,
	@ProjectID INT,
	@ContractID INT OUTPUT
)
AS
BEGIN
	INSERT INTO Project_Contract(ContractDescription, HireDate, EndDate, Salary, PositionID, EmployeeID, SupervisoID, CreatedBy, ModifiedBy, ProjectID)
	VALUES (@ContractDescription, @HireDate, @EndDate, @Salary, @PositionID, @EmployeeID, @SupervisorID, @CreatedBy, @CreatedBy, @ProjectID)
	SET @ContractID = (SELECT @@IDENTITY)
END
GO
/*
DECLARE @ContractID INT
EXECUTE [dbo].[CreateProjectContract]
	@ContractDescription = '',
	@HireDate = '2018-01-01',
	@EndDate = '2020-01-01',
	@Salary = 1000,
	@PositionID = 1,
	@EmployeeID = 1,
	@SupervisorID = NULL,
	@CreatedBy = 1,
	@ProjectID = 1,
	@ContractID = @ContractID OUTPUT
SELECT @ContractID
GO
*/


/*
/******************************************************************************
**  Name: UpdateProjectContract
**  Desc: Actualiza la informacion de un contrato en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[UpdateProjectContract]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[UpdateProjectContract]
END
GO
CREATE PROCEDURE [dbo].[UpdateProjectContract]
(
	@ContractDescription VARCHAR(MAX),
	@HireDate DATE,
	@EndDate DATE,
	@Salary BIGINT,
	@PositionID INT,
	@SupervisorID INT,
	@ContractID INT,
	@ModifiedBy INT,
	@ProjectID INT
)
AS
BEGIN
	UPDATE Project_Contract
	SET ContractDescription = @ContractDescription,
		EndDate = @EndDate,
		Salary = @Salary,
		PositionID = @PositionID,
		SupervisoID = @SupervisorID,
		ModifiedBy = @ModifiedBy,
		ProjectID = @ProjectID
	WHERE ProjectContractID = @ContractID
END
GO
/*
DECLARE @ContractID INT
EXECUTE [dbo].[UpdateProjectContract]
	@ContractDescription = '',
	@HireDate = '2018-01-01',
	@EndDate = '2020-01-01',
	@Salary = 100,
	@PositionID = 1,
	@SupervisorID = NULL,
	@ContractID = 1,
	@ModifiedBy = 1,
	@ProjectID = 2
GO
*/




/*
/******************************************************************************
**  Name: DeleteProjectContract
**  Desc: Elimina un contrato en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[DeleteProjectContract]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[DeleteProjectContract]
END
GO
CREATE PROCEDURE [dbo].[DeleteProjectContract]
(
	@ContractID INT
)
AS
BEGIN
	DELETE FROM Project_Contract
	WHERE ProjectContractID = @ContractID
END
GO
/*
EXECUTE [dbo].[DeleteProjectContract]
	@ContractID = 1
GO
*/


/*
/******************************************************************************
**  Name: GetProjectContractByID
**  Desc: Devuelve un contrato en la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetProjectContractByID]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetProjectContractByID]
END
GO
CREATE PROCEDURE [dbo].[GetProjectContractByID]
(
	@ContractID INT
)
AS
BEGIN
	SELECT *
	FROM Project_Contract
	WHERE ProjectContractID = @ContractID
END
GO
/*
DECLARE @ContractID INT
EXECUTE [dbo].[GetProjectContractByID]
	@ContractID = 1
GO
*/


/*
/******************************************************************************
**  Name: GetProjectContracts
**  Desc: Devuelve los contratos de la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetProjectContracts]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetProjectContracts]
END
GO
CREATE PROCEDURE [dbo].[GetProjectContracts]
AS
BEGIN
	SELECT ProjectContractID, ContractDescription, HireDate, EndDate, Salary,
			PositionID, EmployeeID, SupervisoID, ProjectID
	FROM Project_Contract
END
GO
/*
EXECUTE [dbo].[GetProjectContracts]
GO
*/


/*
/******************************************************************************
**  Name: GetEmployeeList
**  Desc: Devuelve la lista de empleados con informacion de su contratos de la base de datos
** 
**  Called by: 
**
**  Author: Rodrigo Brian Perez Orozco
**
**  Date: 16/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 16/06/2018 Rodrigo Brian Perez Orozco			 Initial version
*******************************************************************************/
*/

IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[GetEmployeeList]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetEmployeeList]
END
GO
CREATE PROCEDURE [dbo].[GetEmployeeList]
AS
BEGIN
	SELECT e.Name, e.LastName, e.CI, 
			supervisor.Name, pc.ContractDescription, pc.HireDate, pc.EndDate,
			pos.name
	FROM Employee e
	INNER JOIN ProjectContract pc
	ON e.EmployeeID = pc.ProjectContractID
	INNER JOIN Employee supervisor
	ON pc.SupervisoID = supervisor.EmployeeID
	INNER JOIN Position pos
	ON pos.id = pc.ProjectContractID
END
GO
/*
EXECUTE [dbo].[GetProjectContracts]
GO
*/
