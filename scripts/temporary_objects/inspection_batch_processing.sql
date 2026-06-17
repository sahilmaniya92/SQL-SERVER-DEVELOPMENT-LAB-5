/*
    Lab 5 - Task 6
    Script: inspection_batch_processing.sql
    Purpose: Demonstrate local temporary table for inspection batch processing
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('tempdb..#InspectionBatch') IS NOT NULL
    DROP TABLE #InspectionBatch;

CREATE TABLE #InspectionBatch
(
    ProductID         INT,
    ProductName       NVARCHAR(200),
    ProductNumber     NVARCHAR(25),
    ListPrice         MONEY,
    SafetyStockLevel  SMALLINT
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
    p.ProductID,
    p.Name,
    p.ProductNumber,
    p.ListPrice,
    p.SafetyStockLevel
FROM Production.Product AS p
WHERE p.ListPrice > 1000
   OR p.SafetyStockLevel < 500;

PRINT CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' product(s) loaded into #InspectionBatch.';

-- Required output
SELECT *
FROM #InspectionBatch
ORDER BY ListPrice DESC;
GO
