/******************************************************************************
**  Desc.: Datos para assign_equipment, detail_assign_equip, position_equip
*******************************************************************************/

USE the_walking_bugs;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Insertar dato dentro de assign_equipment...';
SET IDENTITY_INSERT [dbo].[assign_equipment]  ON
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (1, 1, '2018-04-14', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (2, 2, '2018-04-14', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (3, 3, '2018-05-14', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (4, 4, '2018-05-15', 'Equipo en estado deficiente');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (5, 5, '2018-05-15', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (6, 6, '2018-05-15', 'Equipo necesita manteniemiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (7, 7, '2018-06-15', 'Equipo presenta daño');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (8, 8, '2018-06-16', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (9, 9, '2018-06-16', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment(id, employee_id, date_assign, description)
VALUES (10, 10, '2018-06-16', 'Equipo presenta daño');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (11, 11, '2018-06-16', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (12, 12, '2018-07-16', 'Equipo en estado deficiente');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (13, 13, '2018-07-17', 'Equipo con averías en estructura');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (14, 14, '2018-07-17', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (15, 15, '2018-07-17', 'Equipo necesita manteniemiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (16, 16, '2018-08-17', 'Equipo presenta daño severo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (17, 17, '2018-08-17', 'Equipo con daños leves');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (18, 18, '2018-08-17', 'Equipo nuevo');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (19, 19, '2018-09-18', 'Equipo necesita mantenimiento');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (20, 20, '2018-09-18', 'Equipo con fallas leves');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (21, 21, '2018-09-18', 'Equipo con falla mecánica');
INSERT INTO dbo.assign_equipment (id, employee_id, date_assign, description)
VALUES (22, 22, '2018-10-18', 'Equipo nuevo');
SET IDENTITY_INSERT [dbo].[assign_equipment]  OFF;
PRINT 'Tabla assign_equipment hecho...';

PRINT 'Insertar dato dentro de detail_assign_equipment...';
SET IDENTITY_INSERT [dbo].[detail_assign_equipment]  ON
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (1, 1, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (2, 1, 5);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (3, 1, 2);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (4, 2, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (5, 2, 6);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (6, 3, 7);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (7, 3, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (8, 4, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (9, 4, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (10, 5, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (11, 5, 11);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (12, 5, 5);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (13, 6, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (14, 6, 9);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (15, 7, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (16, 7, 2);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (17, 8, 9);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (18, 9, 12);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (19, 10, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (20, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (21, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (22, 10, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (23, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (24, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (25, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (26, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (27, 10, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (28, 11, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (29, 12, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (30, 13, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (31, 13, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (32, 14, 7);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (33, 14, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (34, 15, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (35, 15, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (36, 15, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (37, 16, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (38, 16, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (39, 17, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (40, 18, 4);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (41, 19, 10);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (42, 19, 2);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (43, 20, 1);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (44, 20, 5);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (45, 20, 3);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (46, 21, 11);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (47, 22, 9);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (48, 22, 8);
INSERT INTO dbo.detail_assign_equipment (id, assign_equipment_id, equipment_id)
VALUES (49, 22, 10);
SET IDENTITY_INSERT [dbo].[detail_assign_equipment]  OFF;
PRINT 'Tabla detail_assign_equipment hecho...';

PRINT 'Insertar dato dentro de position_equipment...';
SET IDENTITY_INSERT [dbo].[position_equipment]  ON
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (1, 2, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (2, 2, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (3, 2, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (4, 2, 40);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (5, 3, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (6, 3, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (7, 3, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (8, 3, 34);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (9, 3, 40);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (10, 4, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (11, 4, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (12, 4, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (13, 4, 34);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (14, 4, 36);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (15, 4, 38);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (16, 4, 39);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (17, 5, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (18, 5, 31);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (19, 5, 32);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (20, 5, 33);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (21, 5, 34);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (22, 5, 36);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (23, 5, 38);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (24, 5, 39);
INSERT INTO dbo.position_equipment (id, position_id, equipment_id)
VALUES (25, 5, 40);
SET IDENTITY_INSERT [dbo].[position_equipment]  OFF;
PRINT 'Tabla position_equipment hecho...';


COMMIT TRANSACTION;