USE the_walking_bugs;
GO

/*
################################## procedures tabla project #############################
*/
/******************************************************************************
**  Name: add_project
**  Desc: Crea un nuevo projecto en la Base de Datos
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[add_project]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[add_project]
	PRINT ' procedimiento almacenado "add_project" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "add_project" ......'
END
GO

CREATE PROCEDURE [dbo].[add_project]
(
	@delivery_date DATE,
	@economic_loss float,
	@estimated_date DATE,
	@gestion varchar(10),
	@inversion float, 
	@name varchar (50),
	@UserLogin INT

)
AS
BEGIN
DECLARE @created_on DATETIME = GETDATE()
DECLARE @updated_on  DATETIME = null
DECLARE @version float = 1
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CreatedBy' AND Object_ID = Object_ID(N'dbo.project'))
  BEGIN
    INSERT INTO [dbo].[Project]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name])
    VALUES(@created_on,@updated_on,@version,@delivery_date,@economic_loss,@estimated_date,@gestion,@inversion,@name)
  END
  ELSE 
    BEGIN
	DECLARE @ParmDefinition NVARCHAR(MAX);
	DECLARE  @sql NVARCHAR(MAX)  = N'INSERT INTO [dbo].[Project]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name],[createdBy],[modifiedBy])
								VALUES(@created_on,@updated_on,@version,@delivery_date,@economic_loss,@estimated_date,@gestion,@inversion,@name,@UserLoginUno,@UserLoginDos)'

	SET @ParmDefinition = N'@created_on DATETIME ,@updated_on DATETIME ,@version INT ,@delivery_date DATETIME ,@economic_loss float,@estimated_date DATETIME ,@gestion  varchar(10), @inversion float ,@name VARCHAR(100), @UserLoginUno INT ,@UserLoginDos INT'
	EXECUTE sp_executesql @sql, @ParmDefinition
				     ,@created_on = @created_on
					 ,@updated_on = @updated_on
					 ,@version = @version
					 ,@delivery_date = @delivery_date
					 ,@economic_loss = @economic_loss
					 ,@estimated_date = @estimated_date
					 ,@gestion  =   @gestion
					 ,@inversion = @inversion
					 ,@name = @name
					 ,@UserLoginUno = @UserLogin
					 ,@UserLoginDos = @UserLogin    
    END 
END
GO
PRINT ' ....OK'


/*
  ---- PROBAR PROCEDIMIENTO-----------

  DECLARE @RC INT
DECLARE @delivery_date date = GETDATE()
DECLARE @economic_loss float = 50000
DECLARE @estimated_date date = GETDATE()
DECLARE @gestion varchar(10) = '2018-2019'
DECLARE @inversion float  = 561
DECLARE @name varchar(50) = 'Projecto Edificio Nuevo1'
DECLARE @UserLogin  INT = 2


-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[add_project] 
   @delivery_date 
  ,@economic_loss 
  ,@estimated_date
  ,@gestion
  ,@inversion
  ,@name
  ,@UserLogin
GO

SELECT  * FROM dbo.project 
*/

/******************************************************************************
**  Name: update_project
**  Desc: Actualizar los  un registro de la tabla Project
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[update_project]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[update_project]
	PRINT ' procedimiento almacenado "update_project" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "update_project" ......'
END
GO

CREATE PROCEDURE [dbo].[update_project]
(	@id_project INT,
	@delivery_date DATE,
	@economic_loss float,
	@estimated_date DATE,
	@gestion varchar(10),
	@inversion float, 
	@name varchar (50),
	@UserLogin INT
)
AS
BEGIN 
DECLARE @date_current DATETIME = GETDATE();
DECLARE @nextVersion  INT = (SELECT version FROM Project WHERE id=@id_project) + 1


UPDATE [dbo].[Project]
   SET
       [updated_on]  = @date_current
      ,[version] = @nextVersion
      ,[delivery_date] = @delivery_date
      ,[economic_loss] = @economic_loss
      ,[estimated_date] = @estimated_date
      ,[gestion] = @gestion
      ,[inversion] = @inversion
      ,[name] =  @name 
      ,[modifiedBy] = @UserLogin
 WHERE id= @id_project
END
GO
PRINT '...OK' 
/*
---- Probar este procedimiento
DECLARE @RC int
DECLARE @id_project int = 4	
DECLARE @delivery_date date = GETDATE();
DECLARE @economic_loss float = 888888
DECLARE @estimated_date date =GETDATE()
DECLARE @gestion varchar(10) = '2018-2019'
DECLARE @inversion float  = 25878	
DECLARE @name varchar(50) = 'cambio'
DECLARE @UserLogin int = 1

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[update_project] 
   @id_project
  ,@delivery_date
  ,@economic_loss
  ,@estimated_date
  ,@gestion
  ,@inversion
  ,@name
  ,@UserLogin
GO

*/


/******************************************************************************
**  Name: delete_project
**  Desc: borrar el projecto de la Base de datos 
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[delete_project]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].delete_project
	PRINT ' procedimiento almacenado "delete_project" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "delete_project" ......'
END
GO

CREATE PROCEDURE [dbo].[delete_project]
(	@id_project INT,
	@UserLogin INT
)
AS
BEGIN 
DELETE FROM [dbo].[Project]
      WHERE id = @id_project
END
GO
PRINT '...OK' 

/*
  -- Probar procedure : delete_project
  USE [the_walking_bugs]
  GO

	DECLARE @RC int
	DECLARE @id_project  INT = 3
	DECLARE @UserLogin INT  = 1 

	-- TODO: Set parameter values here.

	EXECUTE @RC = [dbo].[delete_project] 
	   @id_project
	  ,@UserLogin
	GO
*/


/******************************************************************************
**  Name: get_project_by_id
**  Desc: Obtener un proyecto segun su ID 
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[get_project_by_id]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].get_project_by_id
	PRINT ' procedimiento almacenado "get_project_by_id" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "get_project_by_id" ......'
END
GO

CREATE PROCEDURE [dbo].get_project_by_id
(	@id_project INT,
	@UserLogin INT
)
AS
BEGIN 
  SELECT * FROM dbo.project WHERE id = @id_project 
END

GO
PRINT '...OK' 

/*
 -- Probar procedure "get_project_by_id"
USE [the_walking_bugs]
GO

DECLARE @RC int
DECLARE @id_project int =1 
DECLARE @UserLogin int = 2

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[get_project_by_id] 
   @id_project
  ,@UserLogin
GO
*/

/******************************************************************************
**  Name: get_all_project
**  Desc: Obtener lista de todos los proyectos
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[get_all_project]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].get_all_project
  PRINT ' procedimiento almacenado "get_all_project" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "get_all_project" ......'
END
GO

CREATE PROCEDURE [dbo].get_all_project
AS
BEGIN 
  SELECT * FROM dbo.project
END

GO
PRINT '...OK' 


/*
################################## procedures tabla area #############################
*/

/******************************************************************************
**  Name: add_area
**  Desc: Crea un nuevo area en la Base de Datos
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[add_area]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].add_area
	PRINT ' procedimiento almacenado "add_area" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "add_area" ......'
END
GO

CREATE PROCEDURE [dbo].[add_area]
(
	 @detail varchar (255),
	 @name varchar(100),
	 @user_id  int 


)
AS
BEGIN
DECLARE @created_on DATETIME = GETDATE()
DECLARE @updated_on  DATETIME = null
DECLARE @version float = 1
INSERT INTO [dbo].[Area]([created_on],[updated_on],[version],[detail],[name],[createdBy],[modifiedBy])
VALUES(@created_on,@updated_on,@version,@detail,@name,@user_id,@user_id)  
END
GO
PRINT ' ....OK'

/*
  ---- PROBAR PROCEDIMIENTO add_area -----------

 USE [the_walking_bugs]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[add_area]
		@detail = N'area de desarrollo',
		@name = N'desarrollo',
		@user_id = 1

SELECT	'Return Value' = @return_value

GO
*/

/******************************************************************************
**  Name: update_area
**  Desc: Actualizar los  un registro de la tabla Area
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[update_area]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].update_area
	PRINT ' procedimiento almacenado "update_area" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "update_area" ......'
END
GO

CREATE PROCEDURE [dbo].[update_area]
(	@id_area INT,
	@detail varchar (255),
	@name varchar(100),
	@user_id  int 
)
AS
BEGIN 
DECLARE @date_current DATETIME = GETDATE();
DECLARE @nextVersion  INT = (SELECT version FROM Area WHERE id=@id_area) + 1
UPDATE [dbo].[Area]
   SET [updated_on] = @date_current
      ,[version] = @nextVersion
      ,[detail] = @detail
      ,[name] = @name
      ,[modifiedBy] = @user_id
 WHERE id = @id_area
END
GO
PRINT '...OK' 
/*
---- Probar este procedimiento "update_area"
DECLARE	@return_value int

EXEC	@return_value = [dbo].[update_area]
		@id_area = 1,
		@detail = 'otroDetail',
		@name = 'other',
		@user_id = 1

SELECT	'Return Value' = @return_value

GO
*/


-------------------
/******************************************************************************
**  Name: get_all_area
**  Desc: Obtener lista de todas las areas que hay en db
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[get_all_area]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].get_all_area
  PRINT ' procedimiento almacenado "get_all_area" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "get_all_area" ......'
END
GO

CREATE PROCEDURE [dbo].get_all_area
AS
BEGIN 
  SELECT * FROM dbo.area
END

GO
PRINT '...OK' 

-----------
/******************************************************************************
**  Name: get_area_by_id
**  Desc: Obtener un area segun su ID 
** 
**  Called by: 
**
**  Author: Marcelo Jhossmar Ramos Valdez
**
**  Date: 23/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                  Description:
** --------   --------            ---------------------------------------------------
** 23/06/2018 Marceo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[get_area_by_id]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].get_area_by_id
  PRINT ' procedimiento almacenado "get_area_by_id" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "get_area_by_id" ......'
END
GO

CREATE PROCEDURE [dbo].get_area_by_id
( @id_area INT,
  @UserLogin INT
)
AS
BEGIN 
  SELECT * FROM dbo.area WHERE id = @id_area 
END

GO
PRINT '...OK'