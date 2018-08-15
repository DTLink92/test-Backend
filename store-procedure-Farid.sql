/*
/******************************************************************************
**  Name: CreateTypeEquipment
**  Desc: Crea un nuevo tipo de equipo
** 
**  Called by: 
**
**  Author: Farid Zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[CreateTypeEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[CreateTypeEquipment]
END
GO

CREATE PROCEDURE [dbo].[CreateTypeEquipment]
(
	@description_type_equipment VARCHAR(50),
	@name VARCHAR(50),
	@id INT OUTPUT
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[type_equipment](description_type_equipment ,name)
	VALUES ( @description_type_equipment,@name);
	SET @id = (SELECT @@IDENTITY)
			
  
END
GO

PRINT 'Procedimiento [dbo].[CreateTypeEquipment] creado';
PRINT 'Cliente creado con id: [CreateTypeEquipment]' 

/*
EXECUTE [dbo].[CreateTypeEquipment]  
                                @id= @@IDENTITY
								,@description_type_equipment = 'Tools por operator'
                                ,@name = 'Tools'

select *
from type_equipment
                                
*/

/*
/******************************************************************************
**  Name: UpdateTypeEquipment
**  Desc: Actualiza type_equipments base de datos
** 
**  Called by: 
**
**  Author: Farid Zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana     		 Initial version
*******************************************************************************/
*/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateTypeEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[UpdateTypeEquipment]
END
GO

CREATE PROCEDURE [dbo].[UpdateTypeEquipment]
(
	@description_type_equipment VARCHAR(50),
	@name VARCHAR(50),
	@id INT OUTPUT
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[type_equipment]
	SET description_type_equipment =@description_type_equipment,
	    name= @name
	WHERE id = @id;
	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT * 
		FROM type_equipment
		WHERE id = @id;
	 END
END
GO
PRINT 'Procedimiento [dbo].[UpdateTypeEquipment] creado';

/*
EXECUTE [dbo].[UpdateTypeEquipment]  
                                @id= 5,
								@description_type_equipment = 'Herramientas para obreros'
                                ,@name = 'Herramientas'
go
                                
*/

/*
/******************************************************************************
**  Name: DeleteTypeEquipment
**  Desc: Elimina un Tipo de equipo en la base de datos
** 
**  Called by: 
**
**  Author: Farid zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[DeleteTypeEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[DeleteTypeEquipment]
END
GO

CREATE PROCEDURE [dbo].[DeleteTypeEquipment]
(
	@id INT
)
AS
BEGIN
	DELETE FROM type_equipment
	WHERE id = @id
END
GO

PRINT 'Procedimiento [dbo].[DeleteTypeEquipment] creado';

/*
EXECUTE [dbo].[DeleteTypeEquipment]  
                                @id= 5
								
go

select *
from type_equipment

                                
*/


/*
/******************************************************************************
**  Name: GettypeEquipmentByID
**  Desc: Obtiene un Tipo de equipo de la base de datos
** 
**  Called by: 
**
**  Author: Farid zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GettypeEquipmentByID]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[GettypeEquipmentByID]
END
GO

CREATE PROCEDURE [dbo].[GettypeEquipmentByID]
(
	@id INT
)
AS
BEGIN
	SELECT *
	FROM type_equipment
	WHERE id = @id
END
GO
PRINT 'Procedimiento [dbo].[GettypeEquipmentByID] creado';
/*
EXECUTE [dbo].[GettypeEquipmentByID]  
                                @id= 4
								
                               
*/


/*
/******************************************************************************
**  Name: GettypeEquipment
**  Desc: Obtiene la lista de tipo de equipos de la base de datos
** 
**  Called by: 
**
**  Author: Farid zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GettypeEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[GettypeEquipment]
END
GO

CREATE PROCEDURE [dbo].[GettypeEquipment]
AS
BEGIN
	SELECT id, description_type_equipment, name
	FROM type_equipment
END
GO
PRINT 'Procedimiento [dbo].[GettypeEquipment] creado';
/*
EXECUTE [dbo].[GettypeEquipment]  
                                                              
*/
 -----------------------------------------------------------------------------------------
 
 
 
 
 -----------------------------------------------------------------------------------------
 
 /*
/******************************************************************************
**  Name: CreateEquipment
**  Desc: Crea un nuevo equipo
** 
**  Called by: 
**
**  Author: Farid Zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[CreateEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[CreateEquipment]
END
GO

CREATE PROCEDURE [dbo].[CreateEquipment]
(
	@brand VARCHAR (255),
	@code  VARCHAR (255),
	@dateofpurchase DATE,
	@description VARCHAR (255),
	@image_equipment VARBINARY(MAX) ,
	@manufactured VARCHAR (255), 
	@name VARCHAR (255),
	@status VARCHAR (255),
	@warranty VARCHAR (255), 
	@type_equipment_id INT ,
	@id INT OUTPUT

)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[equipment]( brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id)
	VALUES ( @brand, @code, @dateofpurchase, @description, @image_equipment, @manufactured, @name,  @status, @warranty, @type_equipment_id );
	SET @id = (SELECT @@IDENTITY)
			
  
END
GO

PRINT 'Procedimiento [dbo].[CreateEquipment] creado';
PRINT 'Cliente creado con id: [CreateEquipment]' 

/*
EXECUTE [dbo].[CreateEquipment]  
                                 @id= @@IDENTITY
								,@brand = 'CAT'
								,@code = 'MDRL' 
								,@dateofpurchase = '2017-09-12'
								,@description = 'Sire para perforar acero manualmente con brocas de acero'
								,@image_equipment = NULL
								,@manufactured = 'USA'
								,@name = 'Mandril'
								,@status = 'Activo'
								,@warranty = '4 años' 
								,@type_equipment_id = '4'
								

select *
from equipment
                                
*/

/*
/******************************************************************************
**  Name: UpdateEquipment
**  Desc: Actualiza equipment en la base de datos
** 
**  Called by: 
**
**  Author: Farid Zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana     		 Initial version
*******************************************************************************/
*/

IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[UpdateEquipment]
END
GO

CREATE PROCEDURE [dbo].[UpdateEquipment]
(
	@brand VARCHAR (255),
	@code  VARCHAR (255),
	@dateofpurchase DATE,
	@description VARCHAR (255),
	@image_equipment VARBINARY(MAX) ,
	@manufactured VARCHAR (255), 
	@name VARCHAR (255),
	@status VARCHAR (255),
	@warranty VARCHAR (255), 
	@type_equipment_id INT,
	@id INT OUTPUT
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[equipment]
	SET brand = @brand,
	    dateofpurchase = @dateofpurchase,
		description = @description,
		image_equipment = @image_equipment,
		manufactured = @manufactured, 
		name = @name,
		status = @status, 
		warranty = @warranty, 
		type_equipment_id = @type_equipment_id 
	WHERE id = @id;
	IF @@ROWCOUNT > 0
	 BEGIN
		SELECT * 
		FROM equipment
		WHERE id = @id;
	 END
END
GO
PRINT 'Procedimiento [dbo].[UpdateEquipment] creado';

/*
EXECUTE [dbo].[UpdateEquipment]  
                                 @id= 10
								,@brand = 'Bosch'
								,@code = 'MDRL' 
								,@dateofpurchase = '2018-09-12'
								,@description = 'Sire para perforar acero manualmente con brocas de acero'
								,@image_equipment = NULL
								,@manufactured = 'USA'
								,@name = 'Mandril'
								,@status = 'Activo'
								,@warranty = '3 ños' 
								,@type_equipment_id = '4'
go
                                
*/


/*
/******************************************************************************
**  Name: DeleteEquipment
**  Desc: Elimina un equipo en la base de datos
** 
**  Called by: 
**
**  Author: Farid zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[DeleteEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[DeleteEquipment]
END
GO

CREATE PROCEDURE [dbo].[DeleteEquipment]
(
	@id INT
)
AS
BEGIN
	DELETE FROM equipment
	WHERE id = @id
END
GO

PRINT 'Procedimiento [dbo].[DeleteEquipment] creado';

/*
EXECUTE [dbo].[DeleteEquipment]  
                                @id= 10
								
go

select *
from equipment
                               
*/

/*
/******************************************************************************
**  Name: GetEquipmentByID
**  Desc: Obtiene un equipo de la base de datos
** 
**  Called by: 
**
**  Author: Farid zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipmentByID]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[GetEquipmentByID]
END
GO

CREATE PROCEDURE [dbo].[GetEquipmentByID]
(
	@id INT
)
AS
BEGIN
	SELECT *
	FROM equipment
	WHERE id = @id
END
GO
PRINT 'Procedimiento [dbo].[GetEquipmentByID] creado';
/*
EXECUTE [dbo].[GetEquipmentByID]  
                                @id= 4
								
                               
*/

/*
/******************************************************************************
**  Name: GetEquipment
**  Desc: Obtiene la lista de equipos de la base de datos
** 
**  Called by: 
**
**  Author: Farid zambrana
**
**  Date: 20/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:									Description:
** --------   --------						---------------------------------------------------
** 20/06/2018 Farid Zambrana			 Initial version
*******************************************************************************/
*/


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[GetEquipment]') 
		      -- and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
			  AND type in (N'P', N'PC'))		
BEGIN
	DROP PROCEDURE [dbo].[GetEquipment]
END
GO

CREATE PROCEDURE [dbo].[GetEquipment]
AS
BEGIN
	SELECT id, brand, code, dateofpurchase, description, image_equipment, manufactured, name, status, warranty, type_equipment_id
	FROM equipment
END
GO
PRINT 'Procedimiento [dbo].[GetEquipment] creado';
/*
EXECUTE [dbo].[GetEquipment]  
                                                              
*/