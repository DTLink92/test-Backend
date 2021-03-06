USE [the_walking_bugs]
GO
PRINT 'Creado la tabla type_equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[type_equipment]')
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE type_equipment(id INT IDENTITY(1,1) CONSTRAINT pk_type_equipment PRIMARY KEY
		              ,description_type_equipment VARCHAR (255) CONSTRAINT NN_description_type_equipment NOT NULL
					  ,name VARCHAR (255) CONSTRAINT NN_name NOT NULL);
		              					  
		PRINT 'Table type_equipment Creado!';
	END
 ELSE
	BEGIN
		PRINT 'Table type_equipment ya existe en la Base de datos: ';
	END
GO


PRINT 'Creado la tabla equipment...';
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[equipment]')
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE equipment(id INT IDENTITY(1,1) CONSTRAINT pk_equipment PRIMARY KEY
	                 ,brand VARCHAR (255) CONSTRAINT NN_brand NOT NULL
					 ,code  VARCHAR (255) CONSTRAINT NN_code NOT NULL
					 ,dateofpurchase DATE CONSTRAINT NN_dateofpurchase  NULL
					 ,description VARCHAR (255) CONSTRAINT NN_description NOT NULL
					 ,image_equipment VARBINARY(MAX) CONSTRAINT NN_image_equipment  NULL
					 ,manufactured VARCHAR (255) CONSTRAINT NN_manufactured NOT NULL
					 ,name VARCHAR (255) CONSTRAINT NN_name NOT NULL
					 ,status VARCHAR (255) CONSTRAINT NN_status NOT NULL
					 ,warranty VARCHAR (255) CONSTRAINT NN_warranty NOT NULL
					 ,type_equipment_id INT CONSTRAINT NN_type_equipment_id NOT NULL);

					 
     PRINT 'Table equipment Creado!';
 END
 ELSE
	BEGIN
		PRINT 'Table equipment ya existe en la Base de datos: ';
	END
GO
		
		

-- Define la relación entre equipment y type_equipment
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_equipment_type1]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[equipment]'))
ALTER TABLE [dbo].[equipment]  WITH CHECK ADD  CONSTRAINT [FK_equipment_type1] FOREIGN KEY([type_equipment_id])
REFERENCES [dbo].[type_equipment] ([id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[equipment] CHECK CONSTRAINT [FK_equipment_type1]
GO
