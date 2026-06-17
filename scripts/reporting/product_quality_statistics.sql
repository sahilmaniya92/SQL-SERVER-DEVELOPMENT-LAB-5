/*
    Lab 5 - Task 8
    Script: product_quality_statistics.sql
    Purpose: Demonstrate derived table for product quality analytics
*/

USE AdventureWorks2022;
GO

SELECT
    ps.Name AS SubcategoryName,
    dq.ProductCount,
    dq.AverageListPrice
FROM
(
    SELECT
        p.ProductSubcategoryID,
        COUNT(p.ProductID) AS ProductCount,
        AVG(p.ListPrice) AS AverageListPrice
    FROM Production.Product AS p
    WHERE p.ProductSubcategoryID IS NOT NULL
    GROUP BY p.ProductSubcategoryID
) AS dq
INNER JOIN Production.ProductSubcategory AS ps
    ON dq.ProductSubcategoryID = ps.ProductSubcategoryID
ORDER BY dq.AverageListPrice DESC;
GO
