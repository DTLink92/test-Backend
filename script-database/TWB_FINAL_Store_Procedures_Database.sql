USE the_walking_bugs;
GO

--================================================================================================================================================================
-- MARCELO START
--================================================================================================================================================================

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
END
GO

--================================================================================================================================================================
-- MARCELO END
--================================================================================================================================================================

--================================================================================================================================================================
-- LAURA START
--================================================================================================================================================================

--======================================================================================================
-- FUNCTION TABLE			 --> 	NAME : STORED PROCEDURE Insert_Function
--					   				OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> Insert_Function...';

IF OBJECT_ID ( 'Insert_Function', 'P' ) IS NOT NULL
    DROP PROCEDURE Insert_Function;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Insert_Function
	-- Add the parameters for the stored procedure
	--@id] [bigint] NOT NULL,
	@created_on [date] ,
	@updated_on [date] ,
	@version [bigint] ,
	@description [varchar](255) ,
	@frecuency [varchar](255) ,
	@contribution [varchar](255) ,
	@is_important [bit],
	@Created_by [int] ,
	@Modified_by [int] ,

	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Insert data into the Function table...';
			INSERT INTO [dbo].[Function]
           ([created_on]
           ,[updated_on]
           ,[version]
           ,[description]
		       ,[frecuency]
		       ,[contribution]
		       ,[is_important]
           ,[Created_by]
           ,[Modified_by])
			VALUES
           (@created_on
           ,@updated_on
           ,@version
           ,@description
		       ,@frecuency
		       ,@contribution
		       ,@is_important
           ,@Created_by
           ,@Modified_by)

			Select top 1 @identity = [id]
			from [dbo].[Function]
			Order by id DESC
			PRINT 'Function table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE --> 				NAME : STORED PROCEDURE Update_Function
--					   				OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> Update_Function...';

IF OBJECT_ID ( 'Update_Function', 'P' ) IS NOT NULL
    DROP PROCEDURE Update_Function;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Update_Function
	-- Add the parameters for the stored procedure
	@id [bigint] ,
	@created_on [date] ,
	@updated_on [date] ,
	@version [bigint] ,
	@description [varchar](255) ,
	@frecuency [varchar](255) ,
	@contribution [varchar](255) ,
	@is_important [bit] ,
	@Created_by [int] ,
	@Modified_by [int] ,
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'update data into the Function table...';
			UPDATE [dbo].[Function]
				SET [created_on] = @created_on
				,[updated_on] = @updated_on
				,[version] = @version
				,[description] = @description
				,[frecuency] = @frecuency
				,[contribution] = @contribution
				,[is_important] = @is_important
				,[Created_by] = @Created_by
				,[Modified_by] = @Modified_by
			WHERE [id] = @id

			Select @identity = @id
			PRINT 'Function table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE Delete_Function
--					   				OUTPUT: None
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> Delete_Function...';
IF OBJECT_ID ( 'Delete_Function', 'P' ) IS NOT NULL
    DROP PROCEDURE Delete_Function;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Delete_Function
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Delete data into the Function table...';
			DELETE FROM [dbo].[Function]
			WHERE [id] = @id

			PRINT 'Function table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE Get_Function_by_id
--					   				OUTPUT: A Register
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> Get_Function_by_id...';

IF OBJECT_ID ( 'Get_Function_by_id', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Function_by_id;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Function_by_id
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data into the Function table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[description]
			,[frecuency]
			,[contribution]
			,[is_important]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Function]
			WHERE id = @id
			PRINT 'Function table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION TABLE  --> 				NAME : STORED PROCEDURE Get_Functions
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function llamado  -> Get_Functions...';
IF OBJECT_ID ( 'Get_Functions', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Functions;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Functions
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the Function table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[description]
			,[frecuency]
			,[contribution]
			,[is_important]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Function]
			PRINT 'Function table done...';

		COMMIT TRANSACTION;

END

--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION TABLE			 --> 	NAME : STORED PROCEDURE Insert_Function_Assigned_Position
--					   								OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
go
PRINT 'Creando Stored Procedure en la tabla Function_Assigned_Position llamado  -> Insert_Function_Assigned_Position...';

IF OBJECT_ID ( 'Insert_Function_Assigned_Position', 'P' ) IS NOT NULL
    DROP PROCEDURE Insert_Function_Assigned_Position;
	print ('test')
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Insert_Function_Assigned_Position
	-- Add the parameters for the stored procedure
	--@id] [bigint] NOT NULL,
	@created_on [date] ,
	@updated_on [date] ,
	@version [bigint] ,
	@position_id [bigint],
	@function_id [bigint],
	@Created_by [int] ,
	@Modified_by [int] ,

	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Insert data into the Function table...';
			INSERT INTO [dbo].[Function_Assigned_Position]
           ([created_on]
           ,[updated_on]
           ,[version]
           ,[position_id]
		   ,[function_id]
           ,[Created_by]
           ,[Modified_by])
			VALUES
           (@created_on
           ,@updated_on
           ,@version
           ,@position_id
		   ,@function_id
           ,@Created_by
           ,@Modified_by)

			Select top 1 @identity = [id]
			from [dbo].[Function_Assigned_Position]
			Order by id DESC
			PRINT 'Function_Assigned_Position table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION TABLE --> 				NAME : STORED PROCEDURE Update_Function_Assigned_Position
--					   									OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function_Assigned_Position llamado  -> Update_Function_Assigned_Position...';

IF OBJECT_ID ( 'Update_Function_Assigned_Position', 'P' ) IS NOT NULL
    DROP PROCEDURE Update_Function_Assigned_Position;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Update_Function_Assigned_Position
	-- Add the parameters for the stored procedure
	@id [bigint] ,
	@created_on [date] ,
	@updated_on [date] ,
	@version [bigint] ,
	@position_id [bigint],
	@function_id [bigint],
	@Created_by [int] ,
	@Modified_by [int] ,
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'update data into the Function_Assigned_Position table...';
			UPDATE [dbo].[Function_Assigned_Position]
				SET [created_on] = @created_on
				,[updated_on] = @updated_on
				,[version] = @version
				,[position_id] = @position_id
				,[function_id] = @function_id
				,[Created_by] = @Created_by
				,[Modified_by] = @Modified_by
			WHERE [id] = @id

			Select @identity = @id
			PRINT 'Function_Assigned_Position table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION TABLE  --> 				NAME : STORED PROCEDURE Delete_Function_Assigned_Position
--					   									OUTPUT: None
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function_Assigned_Position llamado  -> Delete_Function_Assigned_Position...';
IF OBJECT_ID ( 'Delete_Function_Assigned_Position', 'P' ) IS NOT NULL
    DROP PROCEDURE Delete_Function_Assigned_Position;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Delete_Function_Assigned_Position
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Delete data into the Function_Assigned_Position table...';
			DELETE FROM [dbo].[Function_Assigned_Position]
			WHERE [id] = @id

			PRINT 'Function_Assigned_Position table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION TABLE  --> 				NAME : STORED PROCEDURE Get_Function_Assigned_Position_by_id
--					   									OUTPUT: A Register
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function_Assigned_Position llamado  -> Get_Function_Assigned_Position_by_id...';

IF OBJECT_ID ( 'Get_Function_Assigned_Position_by_id', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Function_Assigned_Position_by_id;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Function_Assigned_Position_by_id
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data into the Function_Assigned_Position table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[position_id]
			,[function_id]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Function_Assigned_Position]
			WHERE id = @id
			PRINT 'Function_Assigned_Position table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION TABLE  --> 				NAME : STORED PROCEDURE Get_Function_Assigned_Positions
--					   									OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function_Assigned_Position llamado  -> Get_Function_Assigned_Positions...';
IF OBJECT_ID ( 'Get_Function_Assigned_Positions', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Function_Assigned_Positions;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Function_Assigned_Positions
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the Function_Assigned_Position table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[position_id]
			,[function_id]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Function_Assigned_Position]
			PRINT 'Function_Assigned_Position table done...';

		COMMIT TRANSACTION;

END

--======================================================================================================
-- POSITION TABLE  --> NAME : STORED PROCEDURE Insert_Position
--					   OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
go
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> Insert_Position...';

IF OBJECT_ID ( 'Insert_Position', 'P' ) IS NOT NULL
    DROP PROCEDURE Insert_Position;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Insert_Position
	-- Add the parameters for the stored procedure
	@created_on [date],
	@updated_on [date],
	@version [bigint],
	@code [varchar](255),
	@name [varchar](255),
	@process [varchar](255),
	@purpose [varchar](255),
	@area_id [int],
	@higher_work_position_id [bigint],
	@Created_by [int],
	@Modified_by [int],
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Insert data into the Position table...';
			SET IDENTITY_INSERT dbo.Position  OFF
			INSERT INTO [dbo].[Position]
           ([created_on]
           ,[updated_on]
           ,[version]
           ,[code]
           ,[name]
           ,[process]
           ,[purpose]
           ,[area_id]
           ,[higher_work_position_id]
           ,[Created_by]
           ,[Modified_by])
     VALUES
           (@created_on
           ,@updated_on
           ,@version
           ,@code
           ,@name
           ,@process
           ,@purpose
           ,@area_id
           ,@higher_work_position_id
           ,@Created_by
           ,@Modified_by)

			Select @identity = @@IDENTITY
			PRINT 'Position table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- POSITION TABLE  --> NAME : STORED PROCEDURE Update_Position
--					   OUTPUT: ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> Update_Position...';
IF OBJECT_ID ( 'Update_Position', 'P' ) IS NOT NULL
    DROP PROCEDURE Update_Position;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Update_Position
	-- Add the parameters for the stored procedure
	@id [bigint] ,
	@created_on [date],
	@updated_on [date],
	@version [bigint],
	@code [varchar](255),
	@name [varchar](255),
	@process [varchar](255),
	@purpose [varchar](255),
	@area_id [int],
	@higher_work_position_id [bigint],
	@Created_by [int],
	@Modified_by [int],
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'update data into the Position table...';
			UPDATE [dbo].[Position]
			SET [created_on] = @created_on
			,[updated_on] = @updated_on
			,[version] = @version
			,[code] = @code
			,[name] = @name
			,[process] = @process
			,[purpose] = @purpose
			,[area_id] = @area_id
			,[higher_work_position_id] = @higher_work_position_id
			,[Created_by] = @Created_by
			,[Modified_by] = @Modified_by
			WHERE [id] = @id

			Select @identity = @@IDENTITY
			PRINT 'Position table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- POSITION TABLE  --> NAME : STORED PROCEDURE Delete_Position
--					   OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           Cinitial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> Delete_Position...';
IF OBJECT_ID ( 'Delete_Position', 'P' ) IS NOT NULL
    DROP PROCEDURE Delete_Position;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Delete_Position
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Delete data into the Position table...';
			DELETE FROM [dbo].[Position]
			WHERE [id] = @id

			PRINT 'Position table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- POSITION TABLE  --> NAME : STORED PROCEDURE Get_Position_by_id
--					   OUTPUT: A Register
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> Get_Position_by_id...';
IF OBJECT_ID ( 'Get_Position_by_id', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Position_by_id;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Position_by_id
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data into the Position table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[code]
			,[name]
			,[process]
			,[purpose]
			,[area_id]
			,[higher_work_position_id]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Position]
			WHERE id = @id
			PRINT 'Position table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- POSITION TABLE  --> NAME : STORED PROCEDURE Get_Positions
--					   OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Position llamado  -> Get_Positions...';
IF OBJECT_ID ( 'Get_Positions', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Positions;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Positions
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the Position table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[code]
			,[name]
			,[process]
			,[purpose]
			,[area_id]
			,[higher_work_position_id]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Position]
			PRINT 'Position table done...';

		COMMIT TRANSACTION;

END

--======================================================================================================
-- RECRUITMENT PROFILE TABLE  --> 	NAME : STORED PROCEDURE Insert_Recruitment_profile
--					   				OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
GO
PRINT 'Creando Stored Procedure en la tabla Recruitment_profile llamado  -> Insert_Recruitment_profile...';
IF OBJECT_ID ( 'Insert_Recruitmentprofile', 'P' ) IS NOT NULL
    DROP PROCEDURE Insert_Recruitmentprofile;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Insert_Recruitmentprofile
	-- Add the parameters for the stored procedure
	--@id] [bigint] NOT NULL,
	@created_on [date],
	@updated_on [date],
	@version [bigint],
	@description [varchar](255),
	@requirement [varchar](255),
	@verification [varchar](255),
	@position_id [bigint] ,
	@Created_by [int] ,
	@Modified_by [int],
	@identity [bigint] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Insert data into the Recruitment_profile table...';
			INSERT INTO [dbo].[Recruitmentprofile]
           ([created_on]
           ,[updated_on]
           ,[version]
           ,[description]
           ,[requirement]
           ,[verification]
           ,[position_id]
           ,[Created_by]
           ,[Modified_by])
     VALUES
           (@created_on
           ,@updated_on
           ,@version
           ,@description
           ,@requirement
           ,@verification
           ,@position_id
           ,@Created_by
           ,@Modified_by)

			Select top 1 @identity = [id]
			from [dbo].[Recruitmentprofile]
			Order by id DESC
			PRINT 'Recruitment_profile table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- RECRUITMENT PROFILE TABLE --> 	NAME : STORED PROCEDURE Update_Recruitment_profile
--					   				OUTPUT: ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Recruitment_profile llamado  -> Update_Recruitment_profile...';
IF OBJECT_ID ( 'Update_Recruitmentprofile', 'P' ) IS NOT NULL
    DROP PROCEDURE Update_Recruitmentprofile;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE Update_Recruitmentprofile
	-- Add the parameters for the stored procedure
	@id [bigint] ,
	@created_on [date],
	@updated_on [date],
	@version [bigint],
	@description [varchar](255),
	@requirement [varchar](255),
	@verification [varchar](255),
	@position_id [bigint] ,
	@Created_by [int] ,
	@Modified_by [int],
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'update data into the Recruitmentprofile table...';
			UPDATE [dbo].[Recruitmentprofile]
			SET [created_on] = @created_on
				,[updated_on] = @updated_on
				,[version] = @version
				,[description] = @description
				,[requirement] = @requirement
				,[verification] = @verification
				,[position_id] = @position_id
				,[Created_by] = @Created_by
				,[Modified_by] = @Modified_by
			WHERE [id] = @id

			Select @identity = @id
			PRINT 'Recruitment_profile table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- RECRUITMENT PROFILE TABLE --> 	NAME : STORED PROCEDURE Delete_Recruitment_profile
--					   				OUTPUT: None
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Recruitment_profile llamado  -> Delete_Recruitment_profile...';
IF OBJECT_ID ( 'Delete_Recruitmentprofile', 'P' ) IS NOT NULL
    DROP PROCEDURE Delete_Recruitmentprofile;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Delete_Recruitmentprofile
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Delete data into the Recruitment_profile table...';
			DELETE FROM [dbo].[Recruitmentprofile]
			WHERE [id] = @id

			PRINT 'Recruitment_profile table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- RECRUITMENT PROFILE TABLE  --> 	NAME : STORED PROCEDURE Get_Recruitment_profile_by_id
--					   				OUTPUT: A Register
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Recruitment_profile llamado  -> Get_Recruitment_profile_by_id...';

IF OBJECT_ID ( 'Get_Recruitment_profile_by_id', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Recruitment_profile_by_id;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Recruitment_profile_by_id
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data into the Recruitment_profile table...';
			SELECT [id]
				,[created_on]
				,[updated_on]
				,[version]
				,[description]
				,[requirement]
				,[verification]
				,[position_id]
				,[Created_by]
				,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Recruitmentprofile]
			WHERE id = @id
			PRINT 'Recruitment_profile table done...';

		COMMIT TRANSACTION;

END
GO

--======================================================================================================
-- RECRUITMENT PROFILE TABLE  --> 	NAME : STORED PROCEDURE Get_Recruitment_profiles
--					   				OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
IF OBJECT_ID ( 'Get_Recruitment_profiles', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Recruitment_profiles;
GO

PRINT 'Creando Stored Procedure en la tabla Recruitment_profile llamado  -> Get_Recruitment_profiles...';
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Recruitment_profiles
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the Recruitment_profile table...';
			SELECT [id]
				,[created_on]
				,[updated_on]
				,[version]
				,[description]
				,[requirement]
				,[verification]
				,[position_id]
				,[Created_by]
				,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Recruitmentprofile]
			PRINT 'Recruitment_profile table done...';

		COMMIT TRANSACTION;

END

--======================================================================================================
-- TYPE_EVALUATOR TABLE --> 	NAME : STORED PROCEDURE Insert_Recruitment_profile
--					   			OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
GO
PRINT 'Creando Stored Procedure en la tabla Type_Evaluator llamado  -> Insert_Type_Evaluator...';

IF OBJECT_ID ( 'Insert_Type_Evaluator', 'P' ) IS NOT NULL
    DROP PROCEDURE Insert_Type_Evaluator;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Insert_Type_Evaluator
	-- Add the parameters for the stored procedure
	--@id] [bigint] NOT NULL,
	@created_on [date] ,
	@updated_on [date] ,
	@version [bigint] ,
	@description [varchar](255) ,
	@Created_by [int] ,
	@Modified_by [int] ,
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Insert data into the Type_Evaluator table...';
			SET IDENTITY_INSERT dbo.Type_Evaluator  OFF
			INSERT INTO [dbo].[Type_Evaluator]
           ([created_on]
           ,[updated_on]
           ,[version]
           ,[description]
           ,[Created_by]
           ,[Modified_by])
			VALUES
           (@created_on
           ,@updated_on
           ,@version
           ,@description
           ,@Created_by
           ,@Modified_by)

			Select top 1 @identity = [id]
			from [dbo].[Type_Evaluator]
			Order by id DESC
			PRINT 'Type_Evaluator table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE  --> 	NAME : STORED PROCEDURE Update_Type_Evaluator
--					   			OUTPUT: ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Type_Evaluator llamado  -> Update_Type_Evaluator...';

IF OBJECT_ID ( 'Update_Type_Evaluator', 'P' ) IS NOT NULL
    DROP PROCEDURE Update_Type_Evaluator;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Update_Type_Evaluator
	-- Add the parameters for the stored procedure
	@id [bigint] ,
	@created_on [date] ,
	@updated_on [date] ,
	@version [bigint] ,
	@description [varchar](255) ,
	@Created_by [int] ,
	@Modified_by [int] ,
	@identity [int] OUTPUT
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'update data into the Type_Evaluator table...';
			UPDATE [dbo].[Type_Evaluator]
				SET [created_on] = @created_on
				,[updated_on] = @updated_on
				,[version] = @version
				,[description] = @description
				,[Created_by] = @Created_by
				,[Modified_by] = @Modified_by
			WHERE [id] = @id

			Select @identity = @id
			PRINT 'Type_Evaluator table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE  --> 	NAME : STORED PROCEDURE Delete_Type_Evaluator
--					   			OUTPUT: None
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Type_Evaluator llamado  -> Delete_Type_Evaluator...';
IF OBJECT_ID ( 'Delete_Type_Evaluator', 'P' ) IS NOT NULL
    DROP PROCEDURE Delete_Type_Evaluator;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Delete_Type_Evaluator
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'Delete data into the Type_Evaluator table...';
			DELETE FROM [dbo].[Type_Evaluator]
			WHERE [id] = @id

			PRINT 'Type_Evaluator table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE  --> 	NAME : STORED PROCEDURE Get_Type_Evaluator_by_id
--					   			OUTPUT: A Register
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Type_Evaluator llamado  -> Get_Type_Evaluator_by_id...';

IF OBJECT_ID ( 'Get_Type_Evaluator_by_id', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Type_Evaluator_by_id;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Type_Evaluator_by_id
	-- Add the parameters for the stored procedure
	@id [bigint]

AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data into the Type_Evaluator table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[description]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Type_Evaluator]
			WHERE id = @id
			PRINT 'Type_Evaluator table done...';

		COMMIT TRANSACTION;

END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE  --> 	NAME : STORED PROCEDURE Get_Type_Evaluators
--					   			OUTPUT: List
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Type_Evaluator llamado  -> Get_Type_Evaluators...';
IF OBJECT_ID ( 'Get_Type_Evaluators', 'P' ) IS NOT NULL
    DROP PROCEDURE Get_Type_Evaluators;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Get_Type_Evaluators
	-- Add the parameters for the stored procedure
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;

			PRINT 'get data the Type_Evaluator table...';
			SELECT [id]
			,[created_on]
			,[updated_on]
			,[version]
			,[description]
			,[Created_by]
			,[Modified_by]
			FROM [the_walking_bugs].[dbo].[Type_Evaluator]
			PRINT 'Type_Evaluator table done...';

		COMMIT TRANSACTION;

END


--================================================================================================================================================================
-- LAURA END
--================================================================================================================================================================

--================================================================================================================================================================
-- BRIAN START
--================================================================================================================================================================
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
	@CreatedBy INT
)
AS
BEGIN
	DECLARE @Login VARCHAR(100)
	SET @Login = (
		SELECT id
		FROM System_Project_User
		WHERE user_login = @Login
	)

	DECLARE @ValidRolID INT
	SET @ValidRolID = (
		SELECT id
		FROM Rol
		WHERE id = @RolID
	)

	IF (@Login IS NULL AND @ValidRolID IS NOT NULL)
		BEGIN
			IF(@Password <> '' AND @Password IS NOT NULL AND
				@UserLogin <> '' AND @UserLogin IS NOT NULL
				AND @Name <> '' AND @Name IS NOT NULL
				AND @LastName <> '' AND @LastName IS NOT NULL)
			BEGIN
				INSERT INTO System_Project_User(name, last_name, user_login, user_password, rol_id, created_by, modified_by)
				VALUES  (@Name, @LastName,  @UserLogin, @Password, @RolID, @CreatedBy, @CreatedBy);
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
	@UserID INT
)
AS
BEGIN
	BEGIN
		UPDATE System_Project_User
		SET  user_password = @Password,
				modified_by = @ModifiedBy
		WHERE id = @UserID;
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
			WHERE id = @SystemUserID;
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
			SELECT su.id, su.Name, last_name, user_login, user_password, su.rol_id, r.Name as RolName
			FROM System_Project_User su
			INNER JOIN Rol r
			ON su.rol_id = r.id
			WHERE su.id = @SystemUserID;
		END
	ELSE
		BEGIN
			PRINT('El id de usuario es incorrecto');
		END
END
GO


/*
/******************************************************************************
**  Name: LoginUser
**  Desc: Loguea un Usuario
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
            WHERE  id = object_id(N'[dbo].[LoginUser]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[LoginUser]
END
GO

CREATE PROCEDURE [dbo].[LoginUser]
(
	@UserLogin VARCHAR(100),
	@Password VARCHAR(100)
)
AS
BEGIN
	SELECT su.id, su.Name, last_name, user_login, user_password, su.rol_id, r.Name as RolName
	FROM System_Project_User su
	INNER JOIN Rol r
	ON su.rol_id = r.id
	WHERE user_login = @UserLogin
	AND user_password = @Password
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
	SELECT su.id, su.Name, last_name as LastName, user_login, user_password, su.rol_id, r.Name as RolName
	FROM System_Project_User su
	INNER JOIN Rol r
	ON su.rol_id = r.id
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
		INSERT INTO Rol(Name, created_by, modified_by)
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
			modified_by = @ModifiedBy
		WHERE id = @RolID;
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
		WHERE id = @RolID;
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
	SELECT id, Name
	FROM Rol
	WHERE id = @RolID
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
	SELECT id, Name
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
	INSERT INTO [dbo].[Employee](first_name,last_name,employee_address,ci,phone_number,civil_state,birthdate,dependencies_amount,experience,gender,profile_image,email, modified_by)
	VALUES (@Name, @LastName, @EmployeeAddress, @CI, @Phone, @CivilState, @BirthDate, @DependenciesAmount, @Experience, @Gender, @ProfileImage, @Email, @CreatedBy)
	SET @EmployeeID = (SELECT MAX(id) FROM Employee)
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
	@DependenciesAmount = 0,
	@Experience = @Experience,
	@Gender = 'Masculino',
	@ProfileImage = NULL,
	@Email = @Email,
	@CreatedBy = @CreatedBy,
	@EmployeeID = @EmployeeID OUTPUT

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
	SET first_name = @Name,
		last_name = @LastName,
		employee_address = @EmployeeAddress,
		ci = @CI,
		phone_number = @Phone,
		[civil_state] = @CivilState,
		[birthdate] = @BirthDate,
		[dependencies_amount] = @DependeciesAmount,
		[experience] = @Experience,
		[gender] = @Gender,
		[profile_image] = @ProfileImage,
		[email] = @Email,
		[modified_by] = @ModifiedBy
	WHERE id = @EmployeeID
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
	SET supervisor_id = Null
	WHERE id IN (
		SELECT id
		FROM Project_Contract
		where supervisor_id = @EmployeeID
	)

	DELETE FROM Employee
	WHERE id = @EmployeeID
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
	WHERE id = @EmployeeID
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
	SELECT *
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

	IF (@SupervisorID = 0)
	Begin
		Set @SupervisorID = NULL
	end

	IF (@ProjectID = 0)
	Begin
		Set @ProjectID = NULL
	end

	INSERT INTO Project_Contract(contract_description, hire_date, end_date, salary, position_id, employee_id, supervisor_id, created_by, modified_by, project_id)
	VALUES (@ContractDescription, @HireDate, @EndDate, @Salary, @PositionID, @EmployeeID, @SupervisorID, @CreatedBy, @CreatedBy, @ProjectID)
	SET @ContractID = (SELECT MAX(id) FROM Project_Contract)
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
	SET contract_description = @ContractDescription,
		end_date = @EndDate,
		salary = @Salary,
		position_id = @PositionID,
		supervisor_id = @SupervisorID,
		modified_by = @ModifiedBy,
		project_id = @ProjectID
	WHERE id = @ContractID
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
	WHERE id = @ContractID
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
	WHERE id = @ContractID
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
**  Name: GetProjectContractByEmployeeID
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
            WHERE  id = object_id(N'[dbo].[GetProjectContractByEmployeeID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetProjectContractByEmployeeID]
END
GO
CREATE PROCEDURE [dbo].[GetProjectContractByEmployeeID]
(
	@EmployeeID INT
)
AS
BEGIN
	SELECT *
	FROM Project_Contract
	WHERE employee_id = @EmployeeID
END
GO


/*
/******************************************************************************
**  Name: GetProjectContractByPosition
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
            WHERE  id = object_id(N'[dbo].[GetProjectContractByPosition]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetProjectContractByPosition]
END
GO
CREATE PROCEDURE [dbo].[GetProjectContractByPosition]
(
	@PositionID INT
)
AS
BEGIN
	SELECT *
	FROM Project_Contract
	WHERE position_id = @PositionID
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
	SELECT *
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
	SELECT e.id, e.first_name, e.last_name, e.ci,pos.name as PosName,
		pc.contract_description, pc.hire_date, pc.end_date
	FROM Employee e
	INNER JOIN Project_Contract pc
	ON e.id = pc.id
	INNER JOIN Position pos
	ON pos.id = pc.position_id
END
GO

/*
EXECUTE [dbo].[GetProjectContracts]
GO
*/


--================================================================================================================================================================
-- BRIAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- ENAYDA START
--================================================================================================================================================================

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
	WHERE accidentID =@accidentID
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
GO
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
GO
IF EXISTS ( SELECT *
            FROM   sysobjects
            WHERE  id = object_id(N'[dbo].[SP_AccidentCause_getAccidentCauseByID]')
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

--================================================================================================================================================================
-- ENAYDA END
--================================================================================================================================================================


--================================================================================================================================================================
-- JUAN START
--================================================================================================================================================================

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




--================================================================================================================================================================
-- JUAN END
--================================================================================================================================================================

--================================================================================================================================================================
-- LOURDES START
--================================================================================================================================================================

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
	@Description VARCHAR(255),
	@EmployeeID INT,
	@CreatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.assign_equipment (date_assign, description, employee_id, created_by, modified_by)
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
	@Description VARCHAR(255),
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
			  , modified_by    = @ModifiedBy
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
	INSERT INTO dbo.detail_assign_equipment(assign_equipment_id, equipment_id, created_by, modified_by)
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
	   , modified_by         = @ModifiedBy
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
	SELECT asg.id, asg.employee_id, emp.first_name, emp.last_name, fullName=emp.first_name + ' '+ emp.last_name, asg.date_assign, asg.description, dasg.equipment_id
	FROM assign_equipment asg INNER JOIN detail_assign_equipment dasg
			ON (asg.id = dasg.assign_equipment_id) INNER JOIN Employee emp
			ON (asg.employee_id = emp.id)
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
**  Name: GetDetailByAssignEquipID
**  Desc: Selecciona el detalle de equipos segun asignacion
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
            WHERE  id = object_id(N'[dbo].[GetDetailByAssignEquipID]')
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].[GetDetailByAssignEquipID]
END
GO

CREATE PROCEDURE [dbo].[GetDetailByAssignEquipID]
(
	@AssignEquipID INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT dasg.id as id, asg.id as idAssignEquip, dasg.equipment_id as idEquipment, asg.employee_id as idEmployee
		, emp.first_name as nameEmployee, asg.date_assign as dateAssign, eq.name as nameEquip, teq.name as nameTypeEquip
	FROM assign_equipment asg INNER JOIN detail_assign_equipment dasg
			ON (asg.id = dasg.assign_equipment_id) INNER JOIN Employee emp
			ON (asg.employee_id = emp.id) INNER JOIN Equipment eq
			ON (dasg.equipment_id = eq.id) INNER JOIN Type_equipment teq
			ON (eq.type_equipment_id = teq.id)
	WHERE asg.id = @AssignEquipID
END
GO

PRINT 'Procedimiento [dbo].[GetDetailByAssignEquipID] creado';
GO


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
	SELECT dasg.id,	asg.id, emp.id, emp.first_name, emp.last_name, eq.id, eq.name
	FROM detail_assign_equipment dasg INNER JOIN equipment eq
			ON (dasg.equipment_id = eq.id) INNER JOIN assign_equipment asg
			ON (asg.id = dasg.assign_equipment_id) INNER JOIN Employee emp
			ON (asg.employee_id = emp.id)
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
	INSERT INTO dbo.position_equipment(equipment_id, position_id, created_by, modified_by)
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
	    , modified_by    = @ModifiedBy
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

--================================================================================================================================================================
-- LOURDES END
--================================================================================================================================================================


--================================================================================================================================================================
-- FARID START
--================================================================================================================================================================

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

--================================================================================================================================================================
-- FARID END
--================================================================================================================================================================

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



/******************************************************************************
**  Name: SP_getAuditHistory
**  Desc: Obtener informacion de la tabla de auditoria
** 
**  Called by: 
**
**  Author: Eneyda Quispe
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
            WHERE  id = object_id(N'[dbo].[SP_getAuditHistory]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].SP_getAuditHistory
  PRINT ' procedimiento almacenado "SP_getAuditHistory" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "SP_getAuditHistory" ......'
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
PRINT '...OK' 

/******************************************************************************
**  Name: get_areas_by_project
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
** 8/07/2018 Marcelo Jhossmar Ramos Valdez       Initial version
*******************************************************************************/
IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[get_areas_by_project]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].get_areas_by_project
  PRINT ' procedimiento almacenado "get_areas_by_project" ya existia, Volviendolo a re-crear......'
END
ELSE 
BEGIN 
     PRINT 'creando procedimiento almacenado "get_areas_by_project" ......'
END
GO

CREATE PROCEDURE [dbo].get_areas_by_project
( @id_project INT,
  @UserLogin INT
)
AS
BEGIN 
SELECT A.id, A.created_on, A.updated_on, A.[version],A.detail, A.name, A.created_on, A.modifiedBy FROM dbo.Area A
JOIN Area_Asign_Project  Asign ON (A.id = Asign.area_id)
WHERE asign.project_id = @id_project
END

GO
PRINT '...OK'