USE the_walking_bugs;
GO

PRINT 'Creating the Employee table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') 
		      AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.Employee(EmployeeID INT IDENTITY (1,1) PRIMARY KEY, 
			Name VARCHAR(50) NOT NULL,
			LastName VARCHAR(50) NOT NULL,
			EmployeeAddress VARCHAR(150),
			CI BIGINT NOT NULL,
			Phone BIGINT NOT NULL,
			CivilState VARCHAR(100) NOT NULL,
			BirthDate DATE NOT NULL,
			DependenciesAmount INT,
			Experience VARCHAR(MAX),
			Gender VARCHAR(100) NOT NULL,
			ProfileImage varbinary(8000),
			Email VARCHAR(100))
		PRINT 'Table Employee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END

GO

PRINT 'Creating the Project_Contract table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Project_Contract]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.Project_Contract(ProjectContractID INT IDENTITY (1,1) PRIMARY KEY, 
			ContractDescription VARCHAR(MAX),
			HireDate DATE NOT NULL,
			EndDate DATE,
			Salary BIGINT NOT NULL,
			PositionID INT NOT NULL,
			SupervisoID INT, 
			EmployeeID INT NOT NULL)

		PRINT 'Table Project_Contract created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Project_Contract already exists into the database';
	END

GO

PRINT 'Creating the System_Project_User table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[System_Project_User]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.System_Project_User(UserID INT IDENTITY (1,1) PRIMARY KEY, 
			Name VARCHAR(50) NOT NULL,
			LastName VARCHAR(50) NOT NULL,
			UserLogin VARCHAR(100) UNIQUE NOT NULL 
			CHECK (UserLogin <> ''),
			UserPassword VARCHAR(100) NOT NULL
			CHECK (UserPassword <> ''))

		PRINT 'Table System_Project_User created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table System_Project_User already exists into the database';
	END

GO


PRINT 'Creating the Rol table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Rol]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE dbo.Rol(RolID INT IDENTITY (1,1) PRIMARY KEY, 
			Name VARCHAR(50) UNIQUE NOT NULL,
			CreatedBy INT  NOT NULL DEFAULT (1),
			CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
			ModifiedBy INT NOT NULL DEFAULT (1),
			ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()))

		PRINT 'Table Rol created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Rol already exists into the database';
	END

GO

/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y empleado------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Project_Contract and Empleado.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
ALTER TABLE [dbo].Project_Contract  WITH CHECK ADD 
       CONSTRAINT FK_Project_Contract_Employee FOREIGN KEY(EmployeeID)
REFERENCES [dbo].Employee (EmployeeID) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Employee
GO
-------------------------------------------------------------------------------------------------------------------
/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y supervisor----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Supervisor]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
ALTER TABLE [dbo].Project_Contract  WITH CHECK ADD
       CONSTRAINT FK_Project_Contract_Supervisor FOREIGN KEY(SupervisoID)
REFERENCES [dbo].Employee (EmployeeID)
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Supervisor
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y Cargo----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Position]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
	BEGIN
		ALTER TABLE dbo.Project_Contract
		   ALTER COLUMN PositionID BIGINT
		ALTER TABLE [dbo].Project_Contract  ADD CONSTRAINT FK_Project_Contract_Position
				FOREIGN KEY (PositionID) 
				REFERENCES [dbo].Position(id) ON DELETE CASCADE
	END
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Position
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion contrato y projecto----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/

-- Define the relationship between Contract and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Project_Contract_Project]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Project_Contract]'))
ALTER TABLE [dbo].Project_Contract  WITH CHECK ADD  ProjectID INT
       CONSTRAINT FK_Project_Contract_Project FOREIGN KEY(ProjectID)
REFERENCES [dbo].Project (id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Project_Contract] CHECK 
       CONSTRAINT FK_Project_Contract_Project
GO


/*
-------------------------------------------------------------------------------------------------------------------
---------------------------Relacion System_Project_User y Rol----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
*/
-------------------------------------------------------------------------------------------------------------------
-- Define the relationship between System_Project_User and Rol.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_System_Project_User_Rol]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[System_Project_User]'))
ALTER TABLE [dbo].System_Project_User  WITH CHECK ADD  RolID INT NOT NULL
       CONSTRAINT FK_System_Project_User_Rol FOREIGN KEY(RolID)
REFERENCES [dbo].Rol (RolID)  ON DELETE CASCADE
GO
ALTER TABLE [dbo].[System_Project_User] CHECK 
       CONSTRAINT FK_System_Project_User_Rol
GO
-------------------------------------------------------------------------------------------------------------------