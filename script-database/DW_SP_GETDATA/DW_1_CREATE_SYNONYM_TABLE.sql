USE [the_walking_bugs];
GO  

CREATE SYNONYM DimAreaSyn  
FOR [DW_The_Walking_bugs].[dbo].[DimArea];  
GO 

CREATE SYNONYM DimEmployeeSyn  
FOR [DW_The_Walking_bugs].[dbo].[DimEmployee];  
GO 

CREATE SYNONYM DimEquipmentSyn  
FOR [DW_The_Walking_bugs].[dbo].[DimEquipment];  
GO 

CREATE SYNONYM DimPositionSyn  
FOR [DW_The_Walking_bugs].[dbo].[DimPosition];  
GO 

CREATE SYNONYM FactAccidentSyn  
FOR [DW_The_Walking_bugs].[dbo].[FactAccident];  
GO 