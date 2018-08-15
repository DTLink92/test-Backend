USE [the_walking_bugs]

--======================================================================================================
-- TYPE_EVALUATOR TABLE --> 	NAME : STORED PROCEDURE Insert_Recruitment_profile
--					   			OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
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


