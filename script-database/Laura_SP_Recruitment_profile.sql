USE [the_walking_bugs]

--======================================================================================================
-- RECRUITMENT PROFILE TABLE  --> 	NAME : STORED PROCEDURE Insert_Recruitment_profile
--					   				OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
PRINT 'Creando Stored Procedure en la tabla Recruitment_profile llamado  -> Insert_Recruitment_profile...';
IF OBJECT_ID ( 'Insert_Recruitment_profile', 'P' ) IS NOT NULL   
    DROP PROCEDURE Insert_Recruitment_profile;  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Insert_Recruitment_profile
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
			INSERT INTO [dbo].[Recruitment_profile]
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
			from [dbo].[Recruitment_profile]
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
IF OBJECT_ID ( 'Update_Recruitment_profile', 'P' ) IS NOT NULL   
    DROP PROCEDURE Update_Recruitment_profile;  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE Update_Recruitment_profile
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
			
			PRINT 'update data into the Recruitment_profile table...';
			UPDATE [dbo].[Recruitment_profile]
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
IF OBJECT_ID ( 'Delete_Recruitment_profile', 'P' ) IS NOT NULL   
    DROP PROCEDURE Delete_Recruitment_profile;  
GO  

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Delete_Recruitment_profile
	-- Add the parameters for the stored procedure
	@id [bigint] 
	
AS
BEGIN

		SET XACT_ABORT ON;
		SET NOCOUNT ON;

		BEGIN TRANSACTION;
			
			PRINT 'Delete data into the Recruitment_profile table...';
			DELETE FROM [dbo].[Recruitment_profile]
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
			FROM [the_walking_bugs].[dbo].[Recruitment_profile]
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
			FROM [the_walking_bugs].[dbo].[Recruitment_profile]
			PRINT 'Recruitment_profile table done...';

		COMMIT TRANSACTION;
	
END

