use [the_walking_bugs]
GO

/******************************************************************************
**  Name: GetDatabaseRowVersion
**  Desc: Used by DW ETL Process
**
**  Called by: SQL Job
**  Author: Laura Tucuman
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:         Description:
**  --------    --------        -----------------------------------------------
**  21/06/2018  Laura Tucuman  Initial Version
******************************************************************************/
PRINT 'Creando Function llamado  -> [ETL].[GetDatabaseRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetDatabaseRowVersion]') IS NOT NULL
BEGIN
    DROP FUNCTION [ETL].[GetDatabaseRowVersion];
END
GO

CREATE FUNCTION [ETL].[GetDatabaseRowVersion] ()
RETURNS BIGINT
AS
BEGIN
  RETURN CONVERT(BIGINT, MIN_ACTIVE_ROWVERSION()) - 1;
END
GO

/******************************************************************************
**  Name: GetTableMigrationLatestRowVersion
**  Desc: Gets Latest Rowversion used into the corresponding the table
**
**  Called by: SQL Job
**  Author: Laura Tucuman
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:         Description:
**  --------    --------        -----------------------------------------------
**  21/06/2018  Laura Tucuman   Initial Version
******************************************************************************/
PRINT 'Creando Function  llamado  -> [ETL].[GetTableMigrationLatestRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetTableMigrationLatestRowVersion]') IS NOT NULL  
-- deletes function  
    DROP FUNCTION [ETL].[GetTableMigrationLatestRowVersion];  
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion] 
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT;

	SELECT @last = LatestChange
	FROM [ETL].[TableMigration]
	WHERE TableName = @table;

  RETURN @last;
END
GO

/******************************************************************************
**  Name: GetAreaChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Area table 
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman 
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure  llamado  -> [ETL].[GetAreaChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetAreaChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetAreaChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetAreaChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT Distinct a.[id]
		  ,a.[detail]
		  ,a.[name]
	FROM [dbo].[Area] a
	WHERE a.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND a.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO

/******************************************************************************
**  Name: GetPositionChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Position table 
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman 
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure  llamado  -> [ETL].[GetPositionChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetPositionChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetPositionChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetPositionChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT Distinct p.[id]
		  ,p.[code]
		  ,p.[name]
		  ,p.[process]
		  ,p.[purpose]
	FROM [dbo].[Position] p
	WHERE p.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND p.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO

/******************************************************************************
**  Name: GetEquipmentChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Equipment table 
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman 
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/

PRINT 'Creando Stored Procedure  llamado  -> [ETL].[GetEquipmentChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetEquipmentChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetEquipmentChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetEquipmentChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT Distinct e.[id]
		  ,e.[brand]
		  ,e.[code]
		  ,e.[dateofpurchase]
		  ,e.[description]
		  ,e.[manufactured]
		  ,e.[name]
		  ,e.[status]
		  ,e.[warranty]
	FROM [dbo].[Equipment] e
	WHERE e.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND e.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO


/******************************************************************************
**  Name: GetAccidentChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Accident table 
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman 
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure  llamado  -> [ETL].[GetAccidentChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetAccidentChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetAccidentChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetAccidentChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT Distinct 
		  a.[id] as area_id
		  ,ac.[accidentId] as accident_id
		  ,p.[id] as position_id
		  ,eq.[id] as equipment_id
		  ,e.[EmployeeID] as employee_id
		  ,ac.[nameAccidentado] as name_accidentado
		  ,ac.[date_accident] as date
		  ,ac.[place_accident] as place
		  ,ac.[gravity_accident] as gravity
		  ,ac.[description_accident] as description
		  ,at.[name_type_accident] as type
	FROM [dbo].[Accident] ac
	inner join [dbo].[AccidentType] at ON ac.accidentTypeId = at.accidentTypeId
	INNER JOIN [dbo].[Area] a ON a.id = ac.areaID
	INNER JOIN [dbo].[Position] p ON p.area_id = a.id
	INNER JOIN [dbo].[Employee_Accident] ea ON ea.id_accident = ac.accidentID
	INNER JOIN [dbo].[Employee] e ON e.employeeid = ea.id_employee
	INNER JOIN [dbo].[Assign_Equipment] ae ON ae.employee_id = e.employeeid
	INNER JOIN [dbo].[Detail_Assign_Equipment] dae ON dae.assign_equipment_id = ae.id
	INNER JOIN [dbo].[Equipment] eq ON eq.id = dae.equipment_id

	WHERE a.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND a.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO

/******************************************************************************
**  Name: GetEmployeeChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Employee table 
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman 
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure llamado  -> [ETL].[GetEmployeeChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetEmployeeChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetEmployeeChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetEmployeeChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT Distinct
		   e.[EmployeeID] as id 
		  ,e.[name]
		  ,e.[lastName] as last_name
		  ,e.[ci]
		  ,e.[phone]
		  ,e.[civilState] as civil_State
		  ,e.[birthDate] as birth_date
		  ,e.[gender]
	FROM [dbo].[Employee] e
	WHERE e.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND e.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO

/******************************************************************************
**  Name: UpdateTableMigration
**  Desc: Updates Table Migration with latest Rowversion used 
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure en la tabla TableMigration llamado  -> [ETL].[UpdateTableMigration]...';
IF OBJECT_ID ( '[ETL].[PullDataToDatawarehouse]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[UpdateTableMigration];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[UpdateTableMigration]
(
  @tableName VARCHAR(50),
  @current     BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE [ETL].[TableMigration]
	SET LatestChange = @current
	WHERE TableName = @tableName;
GO

/******************************************************************************
**  Name: PullTableDataToDW
**  Desc: Pulls Changes and Inserts from the the_walking_bugs to DW_The_Walking_Bugs Database
**  Called By ETL SQL Job.
**
**  Author: Laura Tucuman
**
**  Created: 21/06/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:       Description:
**  --------    --------      --------------------------------------------------
**  21/06/2018  Laura Tucuman Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure llamado  -> [ETL].[PullDataToDatawarehouse]...';
IF OBJECT_ID ( '[ETL].[PullDataToDatawarehouse]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[PullDataToDatawarehouse];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[PullDataToDatawarehouse]
(
  @table VARCHAR(50)
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN
	DECLARE @SQLString      NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(MAX); 
	DECLARE @currentDBTS    BIGINT = [ETL].[GetDatabaseRowVersion]();
	DECLARE @lastDBTS       BIGINT = [ETL].[GetTableMigrationLatestRowVersion](@table); 

	SET @ParmDefinition = N'@last BIGINT, @current BIGINT'; 
	SET @SQLString = N'INSERT INTO [DW_The_Walking_Bugs].[ETL].[' + @table + ']
					   EXECUTE [ETL].[Get' + @table + 'ChangesByRowVersion] @LastRowVersionID = @last
																		   ,@CurrentDBTS      = @current;';  
	EXECUTE SP_EXECUTESQL @SQLString
						 ,@ParmDefinition
						 ,@last    = @lastDBTS
						 ,@current = @currentDBTS;  

	EXECUTE [ETL].[UpdateTableMigration] @tableName = @table
										,@current   = @currentDBTS;
END
GO
