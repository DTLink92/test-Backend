PRINT 'Creando tabla assign_equipment....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[assign_equipment]')
		       AND type in (N'U'))
	BEGIN

		CREATE TABLE assign_equipment(id INT IDENTITY(1,1) CONSTRAINT PK_AssignEquipID PRIMARY KEY
							, version BIGINT CONSTRAINT DF_VersionAssignEquip DEFAULT(1)
							, date_assign DATE CONSTRAINT NN_DateAssign NOT NULL
							, date_return DATE CONSTRAINT NN_DateReturn NULL
							, description VARCHAR(250) CONSTRAINT DF_DescriptionAssignEquip DEFAULT 'Sin observaciones'
							, status_employee INT CONSTRAINT DF_StatusAssignEquip DEFAULT (1)
							, employee_id INT CONSTRAINT NN_EmployeeID NOT NULL);
		PRINT 'Tabla assign_equipment creada!';
	END
 ELSE
	BEGIN
		PRINT 'Tabla assign_equipment ya existe en la Base de Datos';
	END
GO


PRINT 'Creando tabla detail_assign_equipment....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]')
		       AND type in (N'U'))
	BEGIN

		CREATE TABLE detail_assign_equipment(id INT IDENTITY(1,1) CONSTRAINT PK_DetailAssignEquipID1 PRIMARY KEY
							, version BIGINT CONSTRAINT DF_VersionDetailEquip DEFAULT(1)
							, assign_equipment_id INT CONSTRAINT NN_DetailAssignEquipID NOT NULL
							, equipment_id INT CONSTRAINT NN_DetailEquipID NOT NULL);
		PRINT 'Tabla detail_assign_equipment creada!';
	END
 ELSE
	BEGIN
		PRINT 'Tabla detail_assign_equipment ya existe en la Base de Datos';
	END
GO

PRINT 'Creando tabla position_equipment....';

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[position_equipment]')
		       AND type in (N'U'))
	BEGIN

		CREATE TABLE position_equipment(id BIGINT IDENTITY(1,1) CONSTRAINT PK_DetailAssignEquipID PRIMARY KEY
							, version BIGINT CONSTRAINT DF_PositionEquip DEFAULT(1)
							, equipment_id INT CONSTRAINT NN_PositionEquipID NOT NULL
							, position_id BIGINT CONSTRAINT NN_PositionAssignEquipID NOT NULL);
		PRINT 'Tabla position_equipment creada!';
	END
 ELSE
	BEGIN
		PRINT 'Tabla position_equipment ya existe en la Base de Datos';
	END
GO



--Relacion entre assign_equipment y employee
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssignEquipEmployee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[assign_equipment]'))
ALTER TABLE assign_equipment WITH CHECK ADD
		CONSTRAINT FK_AssignEquipEmployee FOREIGN KEY(employee_id)
			REFERENCES Employee(EmployeeID) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assign_equipment] CHECK
       CONSTRAINT [FK_AssignEquipEmployee]
GO

--Relacion entre detail_assign_equipment y assign_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssignEquipDetail]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE detail_assign_equipment WITH CHECK ADD
		CONSTRAINT FK_AssignEquipDetail FOREIGN KEY(assign_equipment_id)
			REFERENCES assign_equipment(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK
       CONSTRAINT [FK_AssignEquipDetail]
GO

--Relacion entre assign_equipment y equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetailEquip]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_assign_equipment]'))
ALTER TABLE detail_assign_equipment WITH CHECK ADD
		CONSTRAINT FK_DetailEquip FOREIGN KEY(equipment_id)
			REFERENCES equipment(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detail_assign_equipment] CHECK
       CONSTRAINT [FK_DetailEquip]
GO

--Relacion entre position y position_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_PositionEquip]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE position_equipment WITH CHECK ADD
		CONSTRAINT FK_PositionEquip FOREIGN KEY(position_id)
			REFERENCES Position(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position_equipment] CHECK
       CONSTRAINT [FK_PositionEquip]
GO

--Relacion entre equipment y position_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_PosEquipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[position_equipment]'))
ALTER TABLE position_equipment WITH CHECK ADD
		CONSTRAINT FK_PosEquipment FOREIGN KEY(equipment_id)
			REFERENCES Equipment(id) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[position_equipment] CHECK
       CONSTRAINT [FK_PosEquipment]
GO

