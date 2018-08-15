USE [the_walking_bugs]
GO

PRINT 'Creado la tabla Area...';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Area]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Area](id int  IDENTITY(1,1) NOT NULL,
  								  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  								  updated_on datetime NULL DEFAULT NULL,
  								  version bigint NOT NULL,
  								  detail varchar(255)  NULL DEFAULT NULL,
  							      name varchar(100)  NULL,  								
		 CONSTRAINT [pk_area] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Area Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Area ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla Project...';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Project]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Project]( id int IDENTITY(1,1) NOT NULL,
  									  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  									  updated_on datetime NULL DEFAULT NULL,
  									  version bigint NOT NULL,
  									  delivery_date datetime NULL DEFAULT NULL,
  									  economic_loss float NOT NULL ,
  									  estimated_date datetime NULL DEFAULT NULL,
  									  gestion varchar(10) NOT NULL,
  									  inversion float  NULL DEFAULT NULL,
  									  name varchar(50)   NOT NULL ,
		 CONSTRAINT [pk_project] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Project Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Project ya existe en la Base de datos: ""';
	END
GO

PRINT 'Creado la tabla Area_Asign_Project..';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Area_Asign_Project]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Area_Asign_Project]( id int IDENTITY(1,1) NOT NULL,
  									  created_on datetime NOT NULL DEFAULT (GETUTCDATE()),
  									  updated_on datetime NULL DEFAULT NULL,
  									  version bigint NOT NULL,
  									  area_id int NOT NULL,
  									  project_id int NOT NULL,							 
		 CONSTRAINT [pk_Area_Asign_project] PRIMARY KEY
		(
			[id] ASC
		));

		PRINT 'Table Area_Asign_Project Creado!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Area_Asign_Project ya existe en la Base de datos: ""';
	END
GO

-- Define the relationship between Area_Asign_Project and Project.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_project_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Area_Asign_Project]'))
ALTER TABLE [dbo].Area_Asign_Project  WITH CHECK ADD
       CONSTRAINT fk_project_id FOREIGN KEY(project_id)
REFERENCES [dbo].[Project] ([id]) On Update Cascade On Delete Cascade
GO
ALTER TABLE [dbo].Area_Asign_Project CHECK 
       CONSTRAINT fk_project_id
GO

-- Define the relationship between Area_Asign_Project and Project.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[fk_areas_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Area_Asign_Project]'))
ALTER TABLE [dbo].Area_Asign_Project  WITH CHECK ADD
       CONSTRAINT fk_areas_id FOREIGN KEY(area_id)
REFERENCES [dbo].[Area] ([id]) On Update Cascade On Delete Cascade
GO
ALTER TABLE [dbo].Area_Asign_Project CHECK 
       CONSTRAINT fk_areas_id
GO
