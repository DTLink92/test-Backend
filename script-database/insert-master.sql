USE the_walking_bugs;
GO
/*
------------------------------------------------------------------------------------------------
---------------------------------Inicializacion Roles-------------------------------------------
------------------------------------------------------------------------------------------------
*/
INSERT INTO Rol(Name) 
VALUES ('Administrator')

INSERT INTO Rol(Name) 
VALUES ('SuperUser')

INSERT INTO Rol(Name) 
VALUES ('RegularUser')
/*
------------------------------------------------------------------------------------------------
---------------------------------Inicializacion Usuarios---------------------------------------
------------------------------------------------------------------------------------------------
*/
/*Adminnistradores*/
INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Admin','Admin','Admin123','1234administrator',1)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Brian','Perez','bp1992','02101992Pbrian',1)

/*SuperUser*/
INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Juan','Mejia','elMejia123','789Mejia',2)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Marcelo','Ramos','marshello56','mRamos789',2)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Laura','Tucuman','laura123','123tucuman',2)

/*RegularUser*/
INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Farid','Orellana','farid7456','F78945rid',3)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Enayda','Quispe','enayda789','quisPe789',3)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Lurdes','Choque','lurdesC123','789choquE',3)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Fernando','Orellana','FOrellana','Fer758Or',3)

INSERT INTO SystemUser(Name, LastName, UserLogin, UserPassword, RolID) 
VALUES ('Carla','Valdez','carlitaV','Car758Or',3)

/*
------------------------------------------------------------------------------------------------
---------------------------------Inicializacion Empleados---------------------------------------
------------------------------------------------------------------------------------------------
*/

GO


INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Rosa','Mora','Av.Beijing#854',7930324,4554055,'Casado/a','1993-2-18',1,'Ninguna','Femenino',NULL,'RosMor4554055@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Miranda','Morado','Av.Pando#550',7930325,4554056,'Casado/a','1995-2-11',0,'Ninguna','Femenino',NULL,'MirMor4554056@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Silvia','Montufar','Av.Oquendo#642',7930326,4554057,'Viudo/a','1988-8-17',1,'Ninguna','Femenino',NULL,'SilMon4554057@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Alba','Clark','Av.Heroinas#797',7930327,4554058,'Divorciado/a','1993-4-5',1,'Ninguna','Femenino',NULL,'AlbCla4554058@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Estrella','Abila','Av.Ayacucho#863',7930328,4554059,'Casado/a','1984-1-3',0,'Ninguna','Femenino',NULL,'EstAbi4554059@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Anastasia','Morantes','Av.Blanco Galindo#619',7930329,4554060,'Casado/a','1987-4-4',3,'Ninguna','Femenino',NULL,'AnaMor4554060@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Joana','Valle','Av.Ayacucho#317',7930330,4554061,'Viudo/a','1992-1-16',3,'Ninguna','Femenino',NULL,'JoaVal4554061@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Olga','Samarron','Av.America#530',7930331,4554062,'Viudo/a','1987-8-9',2,'Ninguna','Femenino',NULL,'OlgSam4554062@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Luisa','Vallarta','Av.Blanco Galindo#982',7930332,4554063,'Casado/a','1984-1-27',1,'Ninguna','Femenino',NULL,'LuiVal4554063@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Catalina','Esquivias','Av.Beijing#507',7930333,4554064,'Divorciado/a','1985-3-13',2,'Ninguna','Femenino',NULL,'CatEsq4554064@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Natacha','Benabides','Av.Libertadores#420',7930334,4554065,'Casado/a','1985-7-6',1,'Ninguna','Femenino',NULL,'NatBen4554065@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('�ngeles','Morales','Av.Peru#850',7930335,4554066,'Casado/a','1986-12-13',0,'Ninguna','Femenino',NULL,'�ngMor4554066@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Pamela','Valesquez','Av.Peru#254',7930336,4554067,'Casado/a','1992-8-27',1,'Ninguna','Femenino',NULL,'PamVal4554067@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Concha','Abalos','Av.Peru#152',7930337,4554068,'Casado/a','1982-7-8',1,'Ninguna','Femenino',NULL,'ConAba4554068@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Sof�a','Monzon','Av.Oquendo#192',7930338,4554069,'Divorciado/a','1987-10-5',2,'Ninguna','Femenino',NULL,'SofMon4554069@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Ursula','Abila','Av.Ustariz#278',7930339,4554070,'Casado/a','1992-10-20',1,'Ninguna','Femenino',NULL,'UrsAbi4554070@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Nidia','Benabides','Av.Ayacucho#206',7930340,4554071,'Soltero/a','1985-12-20',3,'Ninguna','Femenino',NULL,'NidBen4554071@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Estrella','Bera','Av.Peru#229',7930341,4554072,'Viudo/a','1987-4-24',3,'Ninguna','Femenino',NULL,'EstBer4554072@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Nazaret','Benito','Av.Ramon Rivero#789',7930342,4554073,'Casado/a','1988-4-20',0,'Ninguna','Femenino',NULL,'NazBen4554073@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Madalena','Esquivel','Av.Libertadores#864',7930343,4554074,'Soltero/a','1989-4-30',2,'Ninguna','Femenino',NULL,'MadEsq4554074@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Melisa','Valensia','Av.Heroinas#228',7930344,4554075,'Viudo/a','1984-5-15',0,'Ninguna','Femenino',NULL,'MelVal4554075@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Natacha','Montoya','Av.Ramon Rivero#543',7930345,4554076,'Divorciado/a','1982-1-4',2,'Ninguna','Femenino',NULL,'NatMon4554076@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Elisa','Mora','Av.Ayacucho#517',7930346,4554077,'Divorciado/a','1995-3-30',1,'Ninguna','Femenino',NULL,'EliMor4554077@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Leonor','Samores','Av.Blanco Galindo#501',7930347,4554078,'Viudo/a','1984-8-29',2,'Ninguna','Femenino',NULL,'LeoSam4554078@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Victoria','Sanabia','Av.Heroinas#801',7930348,4554079,'Casado/a','1985-7-3',2,'Ninguna','Femenino',NULL,'VicSan4554079@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Tere','Samano','Av.America#781',7930349,4554080,'Divorciado/a','1985-2-16',0,'Ninguna','Femenino',NULL,'TerSam4554080@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Vanesa','Esquivel','Av.Beijing#560',7930350,4554081,'Casado/a','1994-9-17',3,'Ninguna','Femenino',NULL,'VanEsq4554081@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Valeria','Samores','Av.Ustariz#517',7930351,4554082,'Divorciado/a','1983-2-03',3,'Ninguna','Femenino',NULL,'ValSam4554082@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Clara','Esqueda','Av.Beijing#551',7930352,4554083,'Viudo/a','1985-8-1',1,'Ninguna','Femenino',NULL,'ClaEsq4554083@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Ingrid','Samarron','Av.Blanco Galindo#706',7930353,4554084,'Casado/a','1988-9-28',1,'Ninguna','Femenino',NULL,'IngSam4554084@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Melisa','Benegas','Av.Beijing#349',7930354,4554085,'Soltero/a','1983-6-10',0,'Ninguna','Femenino',NULL,'MelBen4554085@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Amelia','Cisneros','Av.America#224',7930355,4554086,'Casado/a','1989-1-9',3,'Ninguna','Femenino',NULL,'AmeCis4554086@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Eva','Berber','Av.Blanco Galindo#707',7930356,4554087,'Viudo/a','1994-2-15',3,'Ninguna','Femenino',NULL,'EvaBer4554087@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
 VALUES ('Fernanda','Abrego','Av.Oquendo#871',7930357,4554088,'Divorciado/a','1993-4-4',3,'Ninguna','Femenino',NULL,'FerAbr4554088@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Lea','Cisneros','Av.Oquendo#367',7930358,4554089,'Soltero/a','1981-7-28',2,'Ninguna','Femenino',NULL,'LeaCis4554089@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Ylenia','Esquibias','Av.Libertadores#753',7930359,4554090,'Viudo/a','1994-1-3',1,'Ninguna','Femenino',NULL,'YleEsq4554090@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Elvira','Cimental','Av.Ustariz#325',7930360,4554091,'Divorciado/a','1990-5-5',2,'Ninguna','Femenino',NULL,'ElvCim4554091@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Tea','Moras','Av.Ramon Rivero#208',7930361,4554092,'Soltero/a','1989-3-24',3,'Ninguna','Femenino',NULL,'TeaMor4554092@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Luisa','Benabides','Av.Pando#163',7930362,4554093,'Casado/a','1990-10-14',0,'Ninguna','Femenino',NULL,'LuiBen4554093@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Rosa','Bera','Av.Pando#177',7930363,4554094,'Viudo/a','1990-10-4',2,'Ninguna','Femenino',NULL,'RosBer4554094@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Irene','Abila','Av.Beijing#625',7930364,4554095,'Viudo/a','1992-10-1',1,'Ninguna','Femenino',NULL,'IreAbi4554095@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('M�nica','Morelos','Av.Ramon Rivero#440',7930365,4554096,'Soltero/a','1985-3-6',3,'Ninguna','Femenino',NULL,'M�nMor4554096@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Paloma','Benito','Av.Blanco Galindo#416',7930366,4554097,'Divorciado/a','1983-9-16',3,'Ninguna','Femenino',NULL,'PalBen4554097@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Nazaret','Benito','Av.Peru#176',7930367,4554098,'Soltero/a','1995-8-18',1,'Ninguna','Femenino',NULL,'NazBen4554098@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Ana','Samano','Av.Blanco Galindo#638',7930368,4554099,'Viudo/a','1989-6-18',2,'Ninguna','Femenino',NULL,'AnaSam4554099@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Inma','Sanavia','Av.Heroinas#492',7930369,4554100,'Casado/a','1991-10-21',1,'Ninguna','Femenino',NULL,'InmSan4554100@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Francisca','Claudio','Av.Libertadores#698',7930370,4554101,'Viudo/a','1988-4-6',0,'Ninguna','Femenino',NULL,'FraCla4554101@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Tatiana','Esquivel','Av.Libertadores#754',7930371,4554102,'Casado/a','1991-10-9',3,'Ninguna','Femenino',NULL,'TatEsq4554102@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Emma','Belos','Av.Ramon Rivero#853',7930372,4554103,'Soltero/a','1990-3-22',1,'Ninguna','Femenino',NULL,'EmmBel4554103@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('M�nica','Montion','Av.Blanco Galindo#722',7930373,4554104,'Soltero/a','1993-11-9',1,'Ninguna','Femenino',NULL,'M�nMon4554104@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Inma','Samarron','Av.San Martin#623',7930374,4554105,'Viudo/a','1983-3-13',2,'Ninguna','Femenino',NULL,'InmSam4554105@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Est�baliz','Esquibias','Av.Oquendo#936',7930375,4554106,'Casado/a','1995-1-2',1,'Ninguna','Femenino',NULL,'EstEsq4554106@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Tere','Esquivel','Av.Ramon Rivero#634',7930376,4554107,'Soltero/a','1989-6-13',2,'Ninguna','Femenino',NULL,'TerEsq4554107@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Leila','Clark','Av.Pando#834',7930377,4554108,'Divorciado/a','1985-2-12',0,'Ninguna','Femenino',NULL,'LeiCla4554108@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Lidia','Cisneros','Av.Libertadores#883',7930378,4554109,'Divorciado/a','1989-4-15',3,'Ninguna','Femenino',NULL,'LidCis4554109@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Anastasia','Moral','Av.Libertadores#601',7930379,4554110,'Soltero/a','1994-9-20',1,'Ninguna','Femenino',NULL,'AnaMor4554110@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Maddi','Morantes','Av.Heroinas#144',7930380,4554111,'Casado/a','1983-4-20',3,'Ninguna','Femenino',NULL,'MadMor4554111@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Martina','Abrego','Av.Beijing#641',7930381,4554112,'Viudo/a','1990-7-6',0,'Ninguna','Femenino',NULL,'MarAbr4554112@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Tere','Montolla','Av.Pando#873',7930382,4554113,'Divorciado/a','1995-9-11',1,'Ninguna','Femenino',NULL,'TerMon4554113@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Elvira','Samano','Av.America#246',7930383,4554114,'Soltero/a','1988-8-15',3,'Ninguna','Femenino',NULL,'ElvSam4554114@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Erica','Sanabria','Av.San Martin#353',7930384,4554115,'Divorciado/a','1986-9-5',1,'Ninguna','Femenino',NULL,'EriSan4554115@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Jacinta','Valles','Av.Ramon Rivero#285',7930385,4554116,'Soltero/a','1989-9-7',0,'Ninguna','Femenino',NULL,'JacVal4554116@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Leonor','Clemente','Av.Heroinas#168',7930386,4554117,'Soltero/a','1988-9-21',2,'Ninguna','Femenino',NULL,'LeoCle4554117@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Elvira','Belos','Av.Ustariz#459',7930387,4554118,'Viudo/a','1993-8-30',0,'Ninguna','Femenino',NULL,'ElvBel4554118@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Micaela','Esqueda','Av.Ayacucho#193',7930388,4554119,'Soltero/a','1995-12-3',2,'Ninguna','Femenino',NULL,'MicEsq4554119@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Iris','Morelos','Av.Libertadores#387',7930389,4554120,'Viudo/a','1994-9-5',2,'Ninguna','Femenino',NULL,'IriMor4554120@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Alejandra','Sanabia','Av.Beijing#390',7930390,4554121,'Soltero/a','1986-1-3',1,'Ninguna','Femenino',NULL,'AleSan4554121@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Emma','Morales','Av.Pando#431',7930391,4554122,'Divorciado/a','1984-6-25',2,'Ninguna','Femenino',NULL,'EmmMor4554122@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Anastasia','Morantes','Av.Blanco Galindo#282',7930392,4554123,'Soltero/a','1990-4-25',3,'Ninguna','Femenino',NULL,'AnaMor4554123@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Zoraida','Esquivel','Av.San Martin#920',7930393,4554124,'Casado/a','1988-7-2',1,'Ninguna','Femenino',NULL,'ZorEsq4554124@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Sara','Benegas','Av.Oquendo#226',7930394,4554125,'Casado/a','1984-6-16',3,'Ninguna','Femenino',NULL,'SarBen4554125@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Carla','Sanavia','Av.Blanco Galindo#417',7930395,4554126,'Viudo/a','1985-10-24',0,'Ninguna','Femenino',NULL,'CarSan4554126@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Lea','Monzon','Av.Beijing#756',7930396,4554127,'Soltero/a','1990-3-22',3,'Ninguna','Femenino',NULL,'LeaMon4554127@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Luisa','Abarca','Av.Ustariz#367',7930397,4554128,'Divorciado/a','1995-4-30',3,'Ninguna','Femenino',NULL,'LuiAba4554128@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Paulina','Esquibias','Av.Beijing#372',7930398,4554129,'Divorciado/a','1993-11-1',2,'Ninguna','Femenino',NULL,'PauEsq4554129@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Micaela','Benites','Av.Blanco Galindo#235',7930399,4554130,'Casado/a','1985-4-3',0,'Ninguna','Femenino',NULL,'MicBen4554130@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Anastasia','Berber','Av.America#996',7930400,4554131,'Casado/a','1993-11-27',2,'Ninguna','Femenino',NULL,'AnaBer4554131@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Milena','Mora','Av.Beijing#557',7930401,4554132,'Casado/a','1994-7-1',3,'Ninguna','Femenino',NULL,'MilMor4554132@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Amelia','Vallarta','Av.Ustariz#404',7930402,4554133,'Casado/a','1995-12-19',3,'Ninguna','Femenino',NULL,'AmeVal4554133@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Eva','Esquivel','Av.Ayacucho#346',7930403,4554134,'Soltero/a','1982-11-18',0,'Ninguna','Femenino',NULL,'EvaEsq4554134@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Maddi','Esquibel','Av.San Martin#579',7930404,4554135,'Soltero/a','1994-6-1',1,'Ninguna','Femenino',NULL,'MadEsq4554135@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Julia','Aboites','Av.Peru#331',7930405,4554136,'Viudo/a','1985-6-25',2,'Ninguna','Femenino',NULL,'JulAbo4554136@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Salom�','Samorano','Av.Heroinas#226',7930406,4554137,'Viudo/a','1987-5-12',1,'Ninguna','Femenino',NULL,'SalSam4554137@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Francisca','Esteban','Av.Beijing#738',7930407,4554138,'Divorciado/a','1989-8-3',2,'Ninguna','Femenino',NULL,'FraEst4554138@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Gemma','Belos','Av.America#782',7930408,4554139,'Divorciado/a','1991-11-19',1,'Ninguna','Femenino',NULL,'GemBel4554139@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Lorete','Morales','Av.Oquendo#122',7930409,4554140,'Viudo/a','1986-8-6',3,'Ninguna','Femenino',NULL,'LorMor4554140@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Leila','Abonce','Av.America#303',7930410,4554141,'Casado/a','1992-4-10',2,'Ninguna','Femenino',NULL,'LeiAbo4554141@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Elena','Monzon','Av.Peru#401',7930411,4554142,'Viudo/a','1988-12-19',2,'Ninguna','Femenino',NULL,'EleMon4554142@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Luisa','Moras','Av.Pando#886',7930412,4554143,'Viudo/a','1984-8-11',3,'Ninguna','Femenino',NULL,'LuiMor4554143@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Roc�o','Bentura','Av.San Martin#348',7930413,4554144,'Casado/a','1993-9-9',1,'Ninguna','Femenino',NULL,'RocBen4554144@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Luisa','Cirilo','Av.America#352',7930414,4554145,'Soltero/a','1994-6-26',0,'Ninguna','Femenino',NULL,'LuiCir4554145@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Sof�a','Morado','Av.Oquendo#263',7930415,4554146,'Casado/a','1981-2-27',1,'Ninguna','Femenino',NULL,'SofMor4554146@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Nazaret','Morales','Av.Pando#962',7930416,4554147,'Soltero/a','1986-3-20',3,'Ninguna','Femenino',NULL,'NazMor4554147@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Fernanda','Valles','Av.San Martin#927',7930417,4554148,'Viudo/a','1991-4-22',0,'Ninguna','Femenino',NULL,'FerVal4554148@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Patricia','Esquibel','Av.Libertadores#173',7930418,4554149,'Viudo/a','1991-6-29',1,'Ninguna','Femenino',NULL,'PatEsq4554149@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Zulema','Bentura','Av.Oquendo#244',7930419,4554150,'Casado/a','1991-6-10',1,'Ninguna','Femenino',NULL,'ZulBen4554150@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Greta','Valensia','Av.Ramon Rivero#150',7930420,4554151,'Divorciado/a','1982-2-11',3,'Ninguna','Femenino',NULL,'GreVal4554151@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Gloria','Benegas','Av.America#266',7930421,4554152,'Soltero/a','1993-12-7',2,'Ninguna','Femenino',NULL,'GloBen4554152@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Julia','Benites','Av.Beijing#263',7930422,4554153,'Viudo/a','1995-1-18',2,'Ninguna','Femenino',NULL,'JulBen4554153@gmail.com')

INSERT INTO [dbo].[Employee](Name,LastName,EmployeeAddress,CI,Phone,CivilState,BirthDate,DependenciesAmount,Experience,Gender,ProfileImage,Email)
VALUES ('Esperanza','Samarron','Av.San Martin#157',7930423,4554154,'Viudo/a','1981-3-30',2,'Ninguna','Femenino',NULL,'EspSam4554154@gmail.com')


GO 
/*
   ############################################################################################################
   ############################ INICIALIZACION TABLA PROJECT ##################################################
*/
INSERT INTO [dbo].[PROJECT]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name],[CreatedBy],[ModifiedBy])
VALUES ('2010-06-04', '2011-12-04' ,3 ,'2012-12-04' ,698000 ,'2011-12-04' ,'2010-2012' ,'650000' ,'Vivienda Av. suecia' ,8 ,6)

INSERT INTO [dbo].[PROJECT]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name],[CreatedBy],[ModifiedBy])
VALUES ('2011-06-04', null ,1 ,'2012-06-04' ,658700 ,'2017-06-04' ,'2011-2012' ,'650000' ,'Edificio Palmas' ,7 ,7)

INSERT INTO [dbo].[PROJECT]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name],[CreatedBy],[ModifiedBy])
VALUES ('2012-06-04', '2013-06-04' ,2 ,'2014-06-04' ,8000 ,'2013-06-04' ,'2012-2014' ,'650000' ,'Edificio Colonial' ,6 ,8)

INSERT INTO [dbo].[PROJECT]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name],[CreatedBy],[ModifiedBy])
VALUES ('2013-06-04', null ,1 ,'2014-06-04' ,3600 ,'2014-06-04' ,'2013-2014' ,'650000' ,'Edificio Cochabamba' ,9 ,9)

INSERT INTO [dbo].[PROJECT]([created_on],[updated_on],[version],[delivery_date],[economic_loss],[estimated_date],[gestion],[inversion],[name],[CreatedBy],[ModifiedBy])
VALUES ('2014-06-04', '2015-06-04' ,2 ,'2016-02-04' ,20000 ,'2015-06-04' ,'2014-2016' ,'650000' ,'Vivienda 50' ,6 ,10)

/*
   ############################################################################################################
   ############################ INICIALIZACION TABLA AREA #####################################################
*/
---------------------------------------------------------------------------------------------------------------
-------------- Areas Proyecto "Vivienda Av. suecia" id = 1-----------------------------------------------------
---------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2010-06-04',null,1,'Obra gruesa Planta baja','obra gruesa PB',1,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2010-06-04',null,1,'Obra gruesa planta 2 ','obra gruesa P2',1,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2010-06-04',null,1,'Obra Gruesa planta 3',' obra gruesa P3',1,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2010-12-04',null,1,'obra fina planta baja','obra fina PB',1,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2010-12-04',null,1,'obra fina planta 2','fachado P2',1,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2010-12-04',null,1,'obra fina planta 3','fachado P3',1,8,8)

---------------------------------------------------------------------------------------------------------------
-------------- Areas Proyecto "Edificio Palmas" id = 2-----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 0 ','gruesa p0 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 1 ','gruesa p1 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 2 ','gruesa p2 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 3 ','gruesa p3 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 4 ','gruesa p4 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 5 ','gruesa p5 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 6 ','gruesa p6 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra gruesa piso 7 ','gruesa p7 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 0 ','fina p0 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 1 ','fina p1 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 2 ','fina p2 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 3 ','fina p3 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 4 ','fina p4 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 5 ','fina p5 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 6 ','fina p6 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'obra fina piso 7 ','fina p7 ',2,7,7)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2011-06-04',null,1,'fachado externo ','fachado ',2,7,7)


---------------------------------------------------------------------------------------------------------------
-------------- Areas Proyecto "Edificio Palmas" id = 3 -----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 0 ','gruesa p0 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 1 ','gruesa p1 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 2 ','gruesa p2 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 3 ','gruesa p3 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 4 ','gruesa p4 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 5 ','gruesa p5 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 6 ','gruesa p6 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 7 ','gruesa p7 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 0 ','fina p0 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 1 ','fina p1 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 2 ','fina p2 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 3 ','fina p3 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 4 ','fina p4 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 5 ','fina p5 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 6 ','fina p6 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 7 ','fina p7 ',3,6,6)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'fachado externo ','fachado ',3,6,6)


---------------------------------------------------------------------------------------------------------------
-------------- Areas Proyecto "Edificio Cochabamba" id = 4-----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 0 ','gruesa p0 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 1 ','gruesa p1 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 2 ','gruesa p2 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 3 ','gruesa p3 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 4 ','gruesa p4 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 5 ','gruesa p5 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 6 ','gruesa p6 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra gruesa piso 7 ','gruesa p7 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 0 ','fina p0 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 1 ','fina p1 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 2 ','fina p2 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 3 ','fina p3 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 4 ','fina p4 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 5 ','fina p5 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 6 ','fina p6 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'obra fina piso 7 ','fina p7 ',4,9,9)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2012-06-04',null,1,'fachado externo ','fachado ',4,9,9)

---------------------------------------------------------------------------------------------------------------
-------------- Areas Proyecto "Vivienda Av. suecia" id = 1-----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2014-06-04',null,1,'Obra gruesa Planta baja','obra gruesa PB',5,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2014-06-04',null,1,'Obra gruesa planta 2 ','obra gruesa P2',5,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2014-06-04',null,1,'Obra Gruesa planta 3',' obra gruesa P3',5,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2014-06-04',null,1,'obra fina planta baja','obra fina PB',5,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2014-06-04',null,1,'obra fina planta 2','fachado P2',5,8,8)
INSERT INTO [dbo].[AREA]([created_on],[updated_on],[version],[detail],[name],[project_id],[CreatedBy],[ModifiedBy])
VALUES('2014-06-04',null,1,'obra fina planta 3','fachado P3',5,8,8)

/*
   ############################################################################################################
   ############################ INICIALIZACION TABLA PERFORMANCE ##############################################
*/
INSERT INTO [dbo].[PERFORMANCE]([created_on],[updated_on],[version],[description],[abilities],[is_important],[registration_date],[CreatedBy],[ModifiedBy])
VALUES('2013-05-20',null,1,'Manual de funciones para Jefe de Obra','experiencia de 2 años, tener licencia de conducir',1,'2016-05-20',9,9)

INSERT INTO [dbo].[PERFORMANCE]([created_on],[updated_on],[version],[description],[abilities],[is_important],[registration_date],[CreatedBy],[ModifiedBy])
VALUES('2014-05-20',null,1,'Manual de funciones para empleado albañil','experiencia de 1 años',1,'2014-05-20',6,6)

INSERT INTO [dbo].[PERFORMANCE]([created_on],[updated_on],[version],[description],[abilities],[is_important],[registration_date],[CreatedBy],[ModifiedBy])
VALUES('2015-05-20',null,1,'Manual de funciones para maestro albañil','experiencia de 2 años, contar con licencia de conducir',1,'2015-05-20',6,6)

INSERT INTO [dbo].[PERFORMANCE]([created_on],[updated_on],[version],[description],[abilities],[is_important],[registration_date],[CreatedBy],[ModifiedBy])
VALUES('2015-05-20',null,1,'Manual de funciones para mestro Yesero','experiencia de 2 años ',1,'2015-05-20',8,8)

INSERT INTO [dbo].[PERFORMANCE]([created_on],[updated_on],[version],[description],[abilities],[is_important],[registration_date],[CreatedBy],[ModifiedBy])
VALUES('2016-05-20',null,1,'Manual de funciones para maestro plomero','experiencia de 2 años',1,'2016-05-20',9,9)

/*
   ############################################################################################################
   ############################ INICIALIZACION TABLA FUNCTION ##############################################
*/
INSERT INTO [dbo].[FUNCTION]([created_on],[updated_on],[version],[name],[frecuency],[contribution],[CreatedBy],[ModifiedBy])
VALUES('2014-05-20',null,1,'Registrarce al ingresar a la Obra','diario','ayuda al control de asistencia y en el control de horas trabajadas',7,7)

INSERT INTO [dbo].[FUNCTION]([created_on],[updated_on],[version],[name],[frecuency],[contribution],[CreatedBy],[ModifiedBy])
VALUES('2013-05-20',null,1,'Apoyo al plan de emergencia','cuando se requiera','estar preparado para intervenir en cualquier emergencia, especialmente en su area de trabajo',7,7)

INSERT INTO [dbo].[FUNCTION]([created_on],[updated_on],[version],[name],[frecuency],[contribution],[CreatedBy],[ModifiedBy])
VALUES('2013-05-20',null,1,'Apoyo al plan de emergencia','cuando se requiera','participar y promover simulacros de emergencias',7,7)

INSERT INTO [dbo].[FUNCTION]([created_on],[updated_on],[version],[name],[frecuency],[contribution],[CreatedBy],[ModifiedBy])
VALUES('2013-05-20',null,1,'verificacion de la obra y/o al plan de diseño','diario','toma de mediciones y de cantidades en la obra',7,7)

INSERT INTO [dbo].[FUNCTION]([created_on],[updated_on],[version],[name],[frecuency],[contribution],[CreatedBy],[ModifiedBy])
VALUES('2013-05-20',null,1,'verificacion de la obra y/o al plan de diseño','diario','chequear las cotas de nivel de los materiales que se estan entregando en la obra',7,7)


/*
   ############################################################################################################
   ############################ INICIALIZACION TABLA PERFORMANCE_ASIGN_FUNCTION ##############################################
*/

INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,1,2,6,6)
INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,1,3,6,6)
INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,1,4,6,6)
INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,1,5,6,6)

INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,2,1,6,6)
INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,3,1,6,6)
INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,4,1,6,6)
INSERT INTO [dbo].[PERFORMANCE_ASIGN_FUNCTION]([created_on],[updated_on],[version],[performance_id],[function_id],[CreatedBy],[ModifiedBy])
VALUES('2013-07-29',null,1,5,1,6,6)



