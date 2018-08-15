/**************************************************************************************************
**  Name: SP_Accidnet_insertAccidnet
**  Desc: insetar un nuevo accidente a la tabla "ACCIDENT"
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


--insertando datos en la tabla accidentes
if object_id('SP_Accident_insertAccident') is not null
begin drop procedure SP_Accident_insertAccident
end
go
create procedure SP_Accident_insertAccident
(

	@nameAccidentado nvarchar (max),
	@date_accident nvarchar (max),
	@hour_accident nvarchar (max),
	@place_accident nvarchar (max),
	@gravity_accident nvarchar (max),
	@description_accident nvarchar (max),
	@accidentTypeID int,
	@areaID int,
	@CreatedBy int,

	@accidentID int output
)
as
begin
	insert[dbo].[Accident]([nameAccidentado],
						   [date_accident],
						   [hour_accident],
						   [place_accident],
						   [gravity_accident],
						   [description_accident],
						   [accidentTypeID],
						   [areaID],[CreatedBy])
							values(@nameAccidentado,
							       @date_accident,
								   @hour_accident,
								   @place_accident,
								   @gravity_accident,
								   @description_accident,
								   @accidentTypeID,@areaID,
								   @CreatedBy);
								SET @accidentID = (SELECT @@IDENTITY)
end
go
/**************************************************************************************************
**  Name: SP_Accident_UpdateAccident
**  Desc: actualizando un accidente que ya existe en la tabla "ACCIDENT"
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
--actualiza un accident
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_Accident_UpdateAccident]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_Accident_UpdateAccident]
END
GO
CREATE PROCEDURE [dbo].[SP_Accident_UpdateAccident]
(
  @id INT,
	@nameAccidentado nvarchar (max),
	@date_accident nvarchar (max),
	@hour_accident nvarchar (max),
	@place_accident nvarchar (max),
	@gravity_accident nvarchar (max),
	@description_accident nvarchar (max),
	@accidentTypeID int,
	@areaID int,
	@ModifiedBy INT,
	@accidentID int output
)
AS
BEGIN
	UPDATE Accident
		SET nameAccidentado=@nameAccidentado,
			date_accident=@date_accident,
			hour_accident=@hour_accident,
			place_accident=@place_accident,
			gravity_accident=@gravity_accident,
			description_accident=@description_accident ,
			accidentTypeID=@accidentTypeID ,
			areaID=@areaID ,
			ModifiedBy=@ModifiedBy
	WHERE accidentID =@id
END
GO
/**************************************************************************************************
**  Name: SP_Accident_DeleteAccident
**  Desc: eliminar un accidente ya registrado
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
--elimina un accidente
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_Accident_DeleteAccident]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_Accident_DeleteAccident]
END
GO
CREATE PROCEDURE [dbo].[SP_Accident_DeleteAccident]
(
	@accidentID INT
)
AS
BEGIN
	DELETE FROM Accident
	WHERE accidentID = @accidentID
END
GO
/**************************************************************************************************
**  Name: SP_Accident_getAccidentByID
**  Desc: mostrar un accidente registrado mediante en ID
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
--optiene un accident de la base de datos
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_Accident_getAccidentByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
drop Procedure [dbo].[SP_Accident_getAccidentByID]
end
go
create procedure [dbo].[SP_Accident_getAccidentByID]
(
	@accidentID int
)
as
begin
	select * from Accident where accidentID = @accidentID
end
go

/**************************************************************************************************
**  Name: SP_Accident_getAccidents
**  Desc: mostrar todos los accidentes ya registrados
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
--optiene todos los Accidentes de la base de datos
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_Accident_getAccidents]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_Accident_getAccidents]
END
GO
CREATE PROCEDURE [dbo].[SP_Accident_getAccidents]
AS
BEGIN
	SELECT [accidentID],
			[nameAccidentado],
			[date_accident],
			[hour_accident],
			[place_accident],
			[gravity_accident],
			[description_accident],
			[accidentTypeID],
			[areaID]
	FROM Accident
END
GO

/**************************************************************************************************
**  Name: SP_AccidentCause_insertAccidentCause
**  Desc: insertando una nueva causa en la tabla "ACCIDENTCAUSE"
**
**  Called by: AccidentCause
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
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCause_insertAccidentCause]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCause_insertAccidentCause]
END
go
create procedure SP_AccidentCause_insertAccidentCause
(
	@accidentCauseID int output,
	@descripcion nvarchar(300),
	@accidentCauseGroupID int,
	@createdBy int
)
as
begin
	insert[dbo].[AccidentCause]([descripcion],[accidentCauseGroupID],[CreatedBy])
							values(@descripcion,@accidentCauseGroupID,@createdBy);
								SET @accidentCauseID = (SELECT @@IDENTITY)
end
go

/**************************************************************************************************
**  Name: SP_AccidentCause_updateAccidentCause
**  Desc: actualizar una Causa de accidente ya registrada de la tabla "ACCIDENTCAUSE"
**
**  Called by: AccidentCause
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
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCause_updateAccidentCause]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCause_updateAccidentCause]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentCause_UpdateAccidentCause]
(
	@accidentCauseID int output,
	@descripcion nvarchar(300),
	@accidentCauseGroupID int,
	@ModifiedBy int
)
AS
BEGIN
	UPDATE AccidentCause
		SET  descripcion=@descripcion,
			 accidentCauseGroupID=@accidentCauseGroupID,
			 ModifiedBy=@ModifiedBy
	WHERE accidentCauseID=@accidentCauseID
END
GO


/**************************************************************************************************
**  Name: SP_AccidentCause_DeleteAccidentCause
**  Desc: eliminar una causa de accidente
**  Called by: AccidentCause
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCause_DeleteAccidentCause]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCause_DeleteAccidentCause]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentCause_DeleteAccidentCause]
(
	@accidentCauseID INT
)
AS
BEGIN
	DELETE FROM AccidentCause
	WHERE accidentCauseID = @accidentCauseID
END
GO
/**************************************************************************************************
**  Name: SP_AccidentCause_getAccidentCauseByID
**  Desc: muestra la causa mediante en   "ID"
**  Called by: AccidentCause
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
--optiene un accident de la base de datos
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_Accident_getAccidentCauseByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
drop Procedure [dbo].[SP_AccidentCause_getAccidentCauseByID]
end
go
create procedure [dbo].[SP_AccidentCause_getAccidentCauseByID]
(
	@accidentCauseID int
)
as
begin
	select * from AccidentCause where accidentCauseID = @accidentCauseID
end
go

/**************************************************************************************************
**  Name: SP_Accident_getAccidentsCauses
**  Desc: muestra todas las causas de accidentes registradas
**  Called by: AccidentCause
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCause_getAccidentsCauses]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCause_getAccidentsCauses]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentCause_getAccidentsCauses]
AS
BEGIN
	SELECT [accidentCauseID],
			[descripcion],
			[accidentCauseGroupID]

	FROM AccidentCause
END
GO


/**************************************************************************************************
**  Name: SP_AccidentCauseGroup_insertAccidentCauseGroup
**  Desc: insertando un nuevo grupo de Causas de accidentes a la tabla "ACCIDENTCAUSEGROUP"
**
**  Called by: AccidentCauseGroup
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
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCauseGroup_insertAccidentCauseGroup]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCauseGroup_insertAccidentCauseGroup]
END
go
create procedure SP_AccidentCauseGroup_insertAccidentCauseGroup
(
	@accidentCauseGroupID int output,
	@title nvarchar(500),
	@CreatedBy int
)
as
begin
	insert[dbo].[AccidentCauseGroup]([accidentCauseGroupID],[title],[CreatedBy])
							values(@accidentCauseGroupID,@title,@CreatedBy);
								SET @accidentCauseGroupID = (SELECT @@IDENTITY)
end
go

/**************************************************************************************************
**  Name: SP_AccidentCauseGroup_updateAccidentCauseGroup
**  Desc: actualiza Grupo de causa de accidentes
**
**  Called by: AccidentCauseGroup
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
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCauseGroup_updateAccidentCauseGroup]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCauseGroup_updateAccidentCauseGroup]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentCauseGroup_UpdateAccidentCauseGroup]
(
	@accidentCauseGroupID int output,
	@title nvarchar(500),
	@ModifiedBy int

)
AS
BEGIN
	UPDATE AccidentCauseGroup
		SET  title=@title,
			 ModifiedBy =@ModifiedBy
	WHERE accidentCauseGroupID=@accidentCauseGroupID
END
GO


/**************************************************************************************************
**  Name: SP_AccidentCauseGroup_DeleteAccidentCauseGroup
**  Desc: elimina un grupo de causa
**  Called by: AccidentCauseGroup
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCauseGroup_DeleteAccidentCauseGroup]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCauseGroup_DeleteAccidentCauseGroup]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentCauseGroup_DeleteAccidentCauseGroup]
(
	@accidentCauseGroupID INT
)
AS
BEGIN
	DELETE FROM AccidentCauseGroup
	WHERE accidentCauseGroupID = @accidentCauseGroupID
END
GO
/**************************************************************************************************
**  Name: SP_AccidentCauseGroup_getAccidentCauseGroupByID
**  Desc: muestra el grupo de causas mediante el "ID"
**  Called by: AccidentCauseGroup
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
--optiene un accident de la base de datos
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCauseGroup_getAccidentCauseGroupByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
drop Procedure [dbo].[SP_AccidentCauseGroup_getAccidentCauseGroupByID]
end
go
create procedure [dbo].[SP_AccidentCauseGroup_getAccidentCauseGroupByID]
(
	@accidentCauseGroupID int
)
as
begin
	select * from AccidentCauseGroup where accidentCauseGroupID = @accidentCauseGroupID
end
go

/**************************************************************************************************
**  Name: SP_AccidentCauseGroup_getAccidentsCauseGroups
**  Desc: muestra todos los grupos de causas existentes
**  Called by: AccidentCauseGroup
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCauseGroup_getAccidentsCauseGroups]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentCauseGroup_getAccidentsCauseGroups]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentCauseGroup_getAccidentsCauseGroups]
AS
BEGIN
	SELECT [accidentCauseGroupID],
			[title]

	FROM AccidentCauseGroup
END
GO






/**************************************************************************************************
**  Name: SP_AccidentType_insertAccidentType
**  Desc: inserta un nuevo tipo de accidente
**
**  Called by: AccidentType
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
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentType_insertAccidentType]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentType_insertAccidentType]
END
go
create procedure SP_AccidentType_insertAccidentType
(
	@accidentTypeID int output,
	@name_type_accident nvarchar(200),
	@code_type_accident nvarchar (10),
	@CreatedBy int
)
as
begin
	insert[dbo].[AccidentType]([name_type_accident],[code_type_accident],[CreatedBy])
							values(@name_type_accident,	@code_type_accident ,@CreatedBy);
								SET @accidentTypeID = (SELECT @@IDENTITY)
end
go

/**************************************************************************************************
**  Name: SP_AccidentType_updateAccidentType
**  Desc: actualiza un tipo de accidente
**
**  Called by: AccidentType
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
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentType_updateAccidentType]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentType_updateAccidentType]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentType_UpdateAccidentType]
(
	@accidentTypeID int output,
	@name_type_accident nvarchar(200),
	@code_type_accident nvarchar(10),
	@ModifiedBy int

)
AS
BEGIN
	UPDATE AccidentType
		SET  name_type_accident=@name_type_accident,
			 code_type_accident=@code_type_accident,
			 ModifiedBy=@ModifiedBy
	WHERE AccidentTypeID=@accidentTypeID
END
GO


/**************************************************************************************************
**  Name: SP_AccidentType_DeleteAccidentType
**  Desc: elimina un tipo de accidente
**  Called by: AccidentType
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentType_DeleteAccidentType]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentType_DeleteAccidentType]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentType_DeleteAccidentType]
(
	@accidentTypeID INT
)
AS
BEGIN
	DELETE FROM AccidentType
	WHERE accidentTypeID = @accidentTypeID
END
GO
/**************************************************************************************************
**  Name: SP_AccidentType_getAccidentTypeByID
**  Desc: muestra un tipo de accidente mediante el  "ID"
**  Called by: AccidentType
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
--optiene un accident de la base de datos
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentType_getAccidentTypeByID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
drop Procedure [dbo].[SP_AccidentType_getAccidentTypeByID]
end
go
create procedure [dbo].[SP_AccidentType_getAccidentTypeByID]
(
	@accidentTypeID int
)
as
begin
	select * from AccidentType where accidentTypeID = @accidentTypeID
end
go

/**************************************************************************************************
**  Name: SP_AccidentType_getAccidentsTypes
**  Desc: muestra todos los tipos de accidentes registrados
**  Called by: AccidentType
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

IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentType_getAccidentTypes]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[SP_AccidentType_getAccidentTypes]
END
GO
CREATE PROCEDURE [dbo].[SP_AccidentType_getAccidentTypes]
AS
BEGIN
	SELECT [accidentTypeID],
			[name_type_accident],
			[code_type_accident]
	FROM [dbo].[AccidentType]
END
GO


