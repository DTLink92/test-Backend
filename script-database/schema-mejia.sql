PRINT 'Creando la tabla employee accidents  ....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[employee_accident]') 
		       AND type in (N'U'))
  BEGIN
	create table employee_accident(
		id int IDENTITY(1,1),
		id_employee int,
		id_accident int,
		detalle_lesion varchar(max) constraint NN_employee_accident not null,
		tipo_lesion varchar(50) constraint NN_employee_accident_tipo_lesion not null,
		zona_lesion varchar(250) constraint NN_employee_zona_accident_lesion not null,
		
		CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()),
		CONSTRAINT PK_employee_accident PRIMARY KEY ( id ASC )
	)
	PRINT 'tabla employee accident creada';
  END
ELSE 
	BEGIN
		PRINT 'Tabla employee accident ya existe en la base de datos';
	END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_accident_employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[employee_accident]'))
ALTER TABLE [dbo].[employee_accident]  WITH CHECK ADD  
       CONSTRAINT [FK_employee_accident_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[employee_accident] CHECK 
       CONSTRAINT [FK_employee_accident_employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_accident_accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[employee_accident]'))
ALTER TABLE [dbo].[employee_accident]  WITH CHECK ADD  
       CONSTRAINT [FK_employee_accident_accident] FOREIGN KEY([id_accident])
REFERENCES [dbo].[Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[employee_accident] CHECK 
       CONSTRAINT [FK_employee_accident_accident]
GO


PRINT 'Creando la tabla accident causes  ....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[accident_causes]') 
		       AND type in (N'U'))
  BEGIN
	create table accident_causes(
		id int IDENTITY(1,1),
		id_accident int,
		id_cause int,
		status int constraint DF_accident_cause_estado default 1 not null,		
		CreatedBy INT  NOT NULL DEFAULT (1),
		CreatedDate DATETIME  NOT NULL  DEFAULT (GETUTCDATE()),
		ModifiedBy INT NOT NULL DEFAULT (1),
		ModifiedDate DATETIME NOT NULL  DEFAULT (GETUTCDATE()),
		CONSTRAINT PK_accident_causes PRIMARY KEY ( id ASC )
	)
	PRINT 'tabla accident causes creada';
  END
ELSE 
	BEGIN
		PRINT 'Tabla accident causes ya existe en la base de datos';
	END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_accident_causes_cause]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[accident_causes]'))
ALTER TABLE [dbo].[accident_causes]  WITH CHECK ADD  
       CONSTRAINT [FK_accident_causes_cause] FOREIGN KEY([id_cause])
REFERENCES [dbo].[AccidentCause] ([AccidentCauseID])
GO
ALTER TABLE [dbo].[accident_causes] CHECK 
       CONSTRAINT [FK_accident_causes_cause]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_accident_causes_accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[accident_causes]'))
ALTER TABLE [dbo].[accident_causes]  WITH CHECK ADD  
       CONSTRAINT [FK_accident_causes_accident] FOREIGN KEY([id_accident])
REFERENCES [dbo].[Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[accident_causes] CHECK 
       CONSTRAINT [FK_accident_causes_accident]
GO
