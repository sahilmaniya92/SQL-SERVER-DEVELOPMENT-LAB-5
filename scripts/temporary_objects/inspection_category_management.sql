USE AdventureWorks2022;
GO

/* =====================================================
   Task 7: Inspection Category Management
   Purpose: Demonstrates use of a TABLE VARIABLE to
            store reusable inspection categories
===================================================== */

-- Create table variable for inspection categories
DECLARE @InspectionCategories TABLE
(
    CategoryID INT,
    CategoryName NVARCHAR(50)
);

-- Insert predefined inspection categories
INSERT INTO @InspectionCategories (CategoryID, CategoryName)
VALUES
(1, 'Critical'),
(2, 'High Risk'),
(3, 'Standard'),
(4, 'Low Risk');

-- Display all inspection categories
SELECT 
    CategoryID,
    CategoryName
FROM @InspectionCategories;
GO