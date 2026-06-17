/*
    Lab 5 - Task 7
    Script: inspection_category_management.sql
    Purpose: Demonstrate table variable for inspection category management
*/

USE AdventureWorks2022;
GO

DECLARE @InspectionCategories TABLE
(
    CategoryID   INT,
    CategoryName NVARCHAR(50)
);

INSERT INTO @InspectionCategories (CategoryID, CategoryName)
VALUES
    (1, 'Critical'),
    (2, 'High Risk'),
    (3, 'Standard'),
    (4, 'Low Risk');

-- Required output
SELECT *
FROM @InspectionCategories
ORDER BY CategoryID;
GO
