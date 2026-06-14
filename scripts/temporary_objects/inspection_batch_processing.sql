-- Task 6 — inspection_batch_processing.sql

USE AdventureWorks2022;
GO

/*=========================================================
  Temporary Inspection Batch Processing
=========================================================*/

IF OBJECT_ID('tempdb..#InspectionBatch') IS NOT NULL
    DROP TABLE #InspectionBatch;

CREATE TABLE #InspectionBatch
(
    ProductID INT,
    ProductName NVARCHAR(200),
    ProductNumber NVARCHAR(25),
    ListPrice MONEY,
    SafetyStockLevel SMALLINT
);

INSERT INTO #InspectionBatch
(
    ProductID,
    ProductName,
    ProductNumber,
    ListPrice,
    SafetyStockLevel
)
SELECT
    ProductID,
    Name,
    ProductNumber,
    ListPrice,
    SafetyStockLevel
FROM Production.Product
WHERE
    ListPrice > 1000
    OR SafetyStockLevel < 500;

SELECT *
FROM #InspectionBatch
ORDER BY ListPrice DESC;
GO