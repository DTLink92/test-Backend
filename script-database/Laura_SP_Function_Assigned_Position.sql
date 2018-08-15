USE [the_walking_bugs]

--======================================================================================================
-- FUNCTION_ASSIGNED_POSITION TABLE			 --> 	NAME : STORED PROCEDURE Insert_Function_Assigned_Position
--					   								OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Function_Assigned_Position llamado  -> Insert_Function_Assigned_Position...';

IF OBJECT_ID ( 'Insert_Function_Assigned_Position', 'P' ) IS NOT NULL   
    DROP PROCEDURE Insert_Function_Assigned_Position;  
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


