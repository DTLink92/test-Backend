PRINT 'Creado la tabla equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[equipment]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[brand] [varchar](255) NULL,
		[code] [varchar](255) NULL,
		[dateofpurchase] [datetime2](7) NULL,
		[description] [varchar](255) NULL,
		[image_equipment] [varbinary](max) NULL,
		[manufactured] [varchar](255) NULL,
		[name] [varchar](255) NULL,
		[status] [varchar](255) NULL,
		[warranty] [varchar](255) NULL,
		[type_equipment_id] [bigint] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla type_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[type_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[type_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[description_type_equipment] [varchar](255) NULL,
		[name] [varchar](255) NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
			CONSTRAINT [pk_type_equipment] PRIMARY KEY
			(
				[id] ASC
			));
		PRINT 'Table type_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table type_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla assign_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[assign_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[assign_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[date_assign] [datetime2](7) NULL,
		[date_return] [datetime2](7) NULL,
		[description] [varchar](255) NULL,
		[status_employee] [int] NOT NULL,
		[employee_id] [int] NOT NULL,
		[supervisor_id] [int] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_assign_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table assign_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table assign_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla detail_assign_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[detail_assign_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[assign_equipment_id] [bigint] NOT NULL,
		[equipment_id] [bigint] NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_detail_assign_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table detail_assign_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table detail_assign_equipment ya existe en la Base de datos: ';
	END
GO

PRINT 'Creado la tabla position_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[position_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[position_equipment](
		[id] [bigint] NOT NULL,
		[created_on] [datetime2](7) NOT NULL,
		[updated_on] [datetime2](7) NULL,
		[version] [bigint] NOT NULL,
		[equipment_id] [bigint] NOT NULL,
		[position_id] [bigint] NOT NULL,
		[Created_by] [int]  NOT NULL,
		[Modified_by] [int] NOT NULL,
		CONSTRAINT [pk_position_equipment] PRIMARY KEY
		(
			[id] ASC
		));
		PRINT 'Table position_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table position_equipment ya existe en la Base de datos: ';
	END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_equipment_type1]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[equipment]'))
ALTER TABLE [dbo].[equipment]  WITH CHECK ADD  CONSTRAINT [FK_equipment_type1] FOREIGN KEY([type_equipment_id])
REFERENCES [dbo].[type_equipment] ([id])
GO
ALTER TABLE [dbo].[equipment] CHECK CONSTRAINT [FK_equipment_type1]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_assign_employee1]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[assign_equipment]'))
ALTER TABLE [dbo].[assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_assign_employee1] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[assign_equipment] CHECK CONSTRAINT [FK_assign_employee1]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_assign_employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[assign_equipment]'))
ALTER TABLE [dbo].[assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_assign_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employeeid])
GO
ALTER TABLE [dbo].[assign_equipment] CHECK CONSTRAINT [FK_assign_employee]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_detail_assign]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE [dbo].[detail_assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_detail_assign] FOREIGN KEY([assign_equipment_id])
REFERENCES [dbo].[assign_equipment] ([id])
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK CONSTRAINT [FK_detail_assign]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_details_equipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE [dbo].[detail_assign_equipment]  WITH CHECK ADD  CONSTRAINT [FK_details_equipment] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK CONSTRAINT [FK_details_equipment]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_position_equipment_equi]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE [dbo].[position_equipment]  WITH CHECK ADD  CONSTRAINT [FK_position_equipment_equi] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[position_equipment] CHECK CONSTRAINT [FK_position_equipment_equi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_position_equi_position]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE [dbo].[position_equipment]  WITH CHECK ADD  CONSTRAINT [FK_position_equi_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[position_equipment] CHECK CONSTRAINT [FK_position_equi_position]
GO