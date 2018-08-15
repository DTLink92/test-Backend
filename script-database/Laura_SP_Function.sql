USE [the_walking_bugs]

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


