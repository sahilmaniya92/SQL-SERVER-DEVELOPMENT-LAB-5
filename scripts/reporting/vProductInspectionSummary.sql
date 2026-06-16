USE AdventureWorks2022;
GO

CREATE OR ALTER VIEW ProductionOps.vProductInspectionSummary
AS
SELECT
    ProductID,
    Name AS ProductName,
    ProductNumber,
    ListPrice,
    SafetyStockLevel
FROM Production.Product;
GO

SELECT TOP 20 *
FROM ProductionOps.vProductInspectionSummary
ORDER BY ListPrice DESC;
GO