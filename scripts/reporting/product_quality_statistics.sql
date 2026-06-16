USE AdventureWorks2022;
GO

/*
=========================================
Task 8
Product Quality Statistics
Owner: Joshua
=========================================
*/

SELECT
    ProductStats.SubcategoryName,
    ProductStats.ProductCount,
    ProductStats.AverageListPrice
FROM
(
    SELECT
        ps.Name AS SubcategoryName,
        COUNT(p.ProductID) AS ProductCount,
        AVG(p.ListPrice) AS AverageListPrice
    FROM Production.Product AS p
    INNER JOIN Production.ProductSubcategory AS ps
        ON p.ProductSubcategoryID = ps.ProductSubcategoryID
    GROUP BY ps.Name
) AS ProductStats
ORDER BY ProductStats.AverageListPrice DESC;
GO