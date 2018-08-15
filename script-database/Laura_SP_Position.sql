
USE [the_walking_bugs]

--======================================================================================================
-- POSITION TABLE  --> NAME : STORED PROCEDURE Insert_Position
--					   OUTPUT: NEW ID
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           initial version
--======================================================================================================
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


