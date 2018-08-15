USE [the_walking_bugs]
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE GET_DW_DIMAREASYN
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> GET_DW_DIMAREA...';
IF OBJECT_ID ( 'GET_DW_DIMAREASYN', 'P' ) IS NOT NULL
    DROP PROCEDURE GET_DW_DIMAREASYN;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GET_DW_DIMAREASYN
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the Function table...';
			SELECT [id]
			,[detail]
			,[name]
			FROM [The_Walking_bugs].[dbo].[DimAreaSyn]
			PRINT 'Function table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE GET_DW_DIMACCIDENTSYN
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> GET_DW_FACTACCIDENTSYN...';
IF OBJECT_ID ( 'GET_DW_FACTACCIDENTSYN', 'P' ) IS NOT NULL
    DROP PROCEDURE GET_DW_FACTACCIDENTSYN;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GET_DW_FACTACCIDENTSYN
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the FactAccidentSyn table...';
			SELECT TOP 1000 [area_id]
				,[accident_id]
				,[position_id]
				,[equipment_id]
				,[employee_id]
				,[name_Accidentado]
				,[date]
				,[place]
				,[gravity]
				,[description]
				,[type]
			FROM [The_Walking_bugs].[dbo].[FactAccidentSyn]
			PRINT 'FactAccidentSyn table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE GET_DW_DIMEMPLOYEESYN
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> GET_DW_DIMEMPLOYEESYN...';
IF OBJECT_ID ( 'GET_DW_DIMEMPLOYEESYN', 'P' ) IS NOT NULL
    DROP PROCEDURE GET_DW_DIMEMPLOYEESYN;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GET_DW_DIMEMPLOYEESYN
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the DimEmployeeSyn table...';
			SELECT [id]
			,[name]
			,[last_name]
			,[ci]
			,[phone]
			,[civil_State]
			,[birth_date]
			,[gender]
			FROM [The_Walking_bugs].[dbo].[DimEmployeeSyn]
			PRINT 'DimEmployeeSyn table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE GET_DW_DIMEQUIPMENTSYN
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> GET_DW_DIMEQUIPMENTSYN...';
IF OBJECT_ID ( 'GET_DW_DIMEQUIPMENTSYN', 'P' ) IS NOT NULL
    DROP PROCEDURE GET_DW_DIMEQUIPMENTSYN;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GET_DW_DIMEQUIPMENTSYN
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the DimEquipmentSyn table...';
			SELECT Distinct [id]
			,[brand]
			,[code]
			,[dateofpurchase]
			,[description]
			,[manufactured]
			,[name]
			,[status]
			,[warranty]
			FROM [The_Walking_bugs].[dbo].[DimEquipmentSyn]
			PRINT 'DimEquipmentSyn table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE GET_DW_DIMPOSITIONSYN
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> GET_DW_DIMPOSITIONSYN...';
IF OBJECT_ID ( 'GET_DW_DIMPOSITIONSYN', 'P' ) IS NOT NULL
    DROP PROCEDURE GET_DW_DIMPOSITIONSYN;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GET_DW_DIMPOSITIONSYN
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the DimPositionSyn table...';
			SELECT [id]
			,[code]
			,[name]
			,[process]
			,[purpose]
			FROM [The_Walking_bugs].[dbo].[DimPositionSyn]
			PRINT 'DimPositionSyn table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE GET_DW_ALLDETAILS
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> GET_DW_ALLDETAILS...';
IF OBJECT_ID ( 'GET_DW_ALLDETAILS', 'P' ) IS NOT NULL
    DROP PROCEDURE GET_DW_ALLDETAILS;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GET_DW_ALLDETAILS
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the GET_DW_ALLDETAILS table...';
			SELECT Distinct [area_id]
			,das.name as areaname
			,dps.name as positionname
			,deqs.name as equipmentname
			,deqs.brand as equipmentbrand
			,employeeName = des.[name] + ' ' + des.last_name
			,[name_Accidentado]
			,[date]
			,[place]
			,[gravity]
			,fas.[description]
			,[type]
			,fas.equipment_id
			FROM [dbo].[FactAccidentSyn] fas
			INNER JOIN [dbo].[DimAreaSyn] das ON fas.area_id = das.id
			INNER JOIN [dbo].[DimPositionSyn] dps ON fas.position_id = dps.id
			INNER JOIN [dbo].[DimEquipmentSyn] deqs ON fas.equipment_id = deqs.id
			INNER JOIN [dbo].[DimEmployeeSyn] des ON fas.employee_id = des.id
			PRINT 'GET_DW_ALLDETAILS table done...';

		COMMIT TRANSACTION;

END
GO