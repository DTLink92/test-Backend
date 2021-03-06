use [the_walking_bugs]

--======================================================================================================
-- POSITION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Position...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Position' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[Position] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- RECRUITMENT PROFILE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la recruitment_profile...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'recruitment_profile' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[recruitment_profile] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- FUNCTION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================

PRINT 'Agregando nuevas Columnas para la Function...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Function' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[Function] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- POSITION_ASSIGNED_POSITION RELATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Function_Assigned_Position...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Function_Assigned_Position' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[Function_Assigned_Position] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO

--======================================================================================================
-- EVALUATION TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Evaluation...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Evaluation' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[Evaluation] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- TYPE_EVALUATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la Type_Evaluator...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'Type_Evaluator' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[Type_Evaluator] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- EVALUATION_INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la evaluation_indicator_values...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'evaluation_indicator_values' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[evaluation_indicator_values] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]   NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- INDICATOR_VALUE TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la indicator_value...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'indicator_value' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[indicator_value] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- MANAGEMENT_INDICATOR TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la management_indicator...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'management_indicator' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[management_indicator] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
--======================================================================================================
-- EVALUATION_METRIC TABLE
--======================================================================================================
-- Date:        Author:                              Description:
-- --------     --------                             ---------------------------------------------------
-- 21/06/2018   Lady Laura Tucuman Alarcon           ADD new Column as created_on, updated_on, created_by, modified_by
--======================================================================================================
PRINT 'Agregando nuevas Columnas para la evaluation_metric...';
IF NOT EXISTS (SELECT COLUMN_NAME 
                 FROM information_schema.columns 
                 WHERE TABLE_SCHEMA = 'dbo' 
                   AND TABLE_NAME = 'evaluation_metric' 
                   AND (COLUMN_NAME = 'created_on' OR COLUMN_NAME = 'updated_on' OR COLUMN_NAME = 'Created_by' OR COLUMN_NAME = 'Modified_by')) 
 BEGIN
	ALTER TABLE [dbo].[evaluation_metric] ADD 
		[Created_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Updated_on] 	DATE 	  NOT NULL	DEFAULT GETDATE(),
		[Created_by] 	[int]  	NOT NULL	DEFAULT 1,
		[Modified_by] [int] 	NOT NULL	DEFAULT 1;
		PRINT 'Las columnas created_on, updated_on, Created_by, Modified_by fueron creados';
	END
 ELSE
	BEGIN
		PRINT 'Existe las columnas created_on, updated_on, Created_by, Modified_by';
	END
GO
