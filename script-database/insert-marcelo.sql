USE the_walking_bugs;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

SET IDENTITY_INSERT [dbo].[Project]  ON
print 'insertando Projectos...'
INSERT INTO [Project]([id], [created_on], [updated_on], [version], [delivery_date], [economic_loss], [estimated_date], [gestion], [inversion], [name]) 
VALUES (1, '2010-06-04 00:00:00.000', '2011-12-04 00:00:00.000', 3, '2012-12-04 00:00:00.000', 698000, '2011-12-04 00:00:00.000', '2010-2012', 650000, 'Vivienda Av. suecia')
INSERT INTO [Project]([id], [created_on], [updated_on], [version], [delivery_date], [economic_loss], [estimated_date], [gestion], [inversion], [name]) 
VALUES (2, '2011-06-04 00:00:00.000', NULL, 1, '2012-06-04 00:00:00.000', 658700, '2017-06-04 00:00:00.000', '2011-2012', 650000, 'Edificio Palmas')
SET IDENTITY_INSERT [dbo].[Project]  OFF
print '...OK'

SET IDENTITY_INSERT [dbo].[Area]  ON
print 'insertando Areas'
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (1, '2010-06-04 00:00:00.000', NULL, 1, 'Construccion obra gruesa ', 'Construccion gruesa')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (2, '2010-06-04 00:00:00.000', NULL, 1, 'Electricidad ', 'Electricidad')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (3, '2010-06-04 00:00:00.000', NULL, 1, 'Plomeria ', ' Plomeria')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (4, '2010-12-04 00:00:00.000', NULL, 1, 'Fachado area externa', 'Fachado')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (5, '2010-12-04 00:00:00.000', NULL, 1, 'Pintado de interior y fachado', 'Pintura')
INSERT INTO [Area]([id], [created_on], [updated_on], [version], [detail], [name]) 
VALUES (6, '2010-12-04 00:00:00.000', NULL, 1, 'Construccin Obra fina', 'Construccioin fina')
SET IDENTITY_INSERT [dbo].[Area]  OFF
print '...OK'

SET IDENTITY_INSERT [dbo].[Area_Asign_Project]  ON
print 'insertando Area_Asign_Project...'
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (1, '2013-04-06 00:00:00.000', NULL, 1, 1, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (2, '2013-04-06 00:00:00.000', NULL, 1, 2, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (3, '2013-04-06 00:00:00.000', NULL, 1, 3, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (4, '2013-04-06 00:00:00.000', NULL, 1, 4, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (5, '2013-04-06 00:00:00.000', NULL, 1, 5, 1)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (6, '2013-04-06 00:00:00.000', NULL, 1, 6, 1)

INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (7, '2013-04-06 00:00:00.000', NULL, 1, 1, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (8, '2013-04-06 00:00:00.000', NULL, 1, 2, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (9, '2013-04-06 00:00:00.000', NULL, 1, 3, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (10, '2013-04-06 00:00:00.000', NULL, 1, 4, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (11, '2013-04-06 00:00:00.000', NULL, 1, 5, 2)
INSERT INTO [Area_Asign_Project]([id], [created_on], [updated_on], [version], [area_id], [project_id]) 
VALUES (12, '2013-04-06 00:00:00.000', NULL, 1, 6, 2)
print '...OK'
SET IDENTITY_INSERT [dbo].[Area_Asign_Project]  OFF

COMMIT TRANSACTION;
