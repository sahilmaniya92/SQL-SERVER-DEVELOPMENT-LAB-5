/*
    Lab 5 - Task 9
    Script: vProductInspectionSummary.sql
    Purpose: Create reusable product inspection summary view
*/

USE AdventureWorks2022;
GO

CREATE OR ALTER VIEW ProductionOps.vProductInspectionSummary
AS
SELECT
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.ListPrice,
    p.SafetyStockLevel
FROM Production.Product AS p;
GO

-- Validation output
SELECT TOP (20) *
FROM ProductionOps.vProductInspectionSummary
ORDER BY ListPrice DESC;
GO
