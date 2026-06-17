/*
    Lab 5 - Task 12 (Table Component)
    Script: product_release_review.sql
    Purpose: Create ProductionOps.ProductReleaseReview audit table
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.ProductReleaseReview', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.ProductReleaseReview
    (
        ReviewID         INT           NOT NULL IDENTITY(1, 1),
        ProductID        INT           NOT NULL,
        ProductName      NVARCHAR(200) NOT NULL,
        InspectionScore  INT           NOT NULL,
        ReviewDecision   NVARCHAR(50)  NOT NULL,
        ReviewDate       DATETIME      NOT NULL,
        CONSTRAINT PK_ProductReleaseReview PRIMARY KEY (ReviewID)
    );

    PRINT 'ProductionOps.ProductReleaseReview table created successfully.';
END
ELSE
BEGIN
    PRINT 'ProductionOps.ProductReleaseReview table already exists.';
END
GO

-- Insert review records when table is empty (re-runnable)
IF NOT EXISTS (
    SELECT 1
    FROM ProductionOps.ProductReleaseReview
)
BEGIN
    ;WITH ScoredProducts AS
    (
        SELECT
            p.ProductID,
            p.Name AS ProductName,
            CASE
                WHEN p.ListPrice > 2000 AND p.SafetyStockLevel < 500 THEN 45
                WHEN p.ListPrice > 1000 AND p.SafetyStockLevel < 800 THEN 55
                WHEN p.SafetyStockLevel < 300 THEN 60
                ELSE 65
            END AS InspectionScore
        FROM Production.Product AS p
    )
    INSERT INTO ProductionOps.ProductReleaseReview
    (
        ProductID,
        ProductName,
        InspectionScore,
        ReviewDecision,
        ReviewDate
    )
    SELECT TOP (12)
        sp.ProductID,
        sp.ProductName,
        sp.InspectionScore,
        CASE
            WHEN sp.InspectionScore < 50 THEN 'Reject'
            WHEN sp.InspectionScore BETWEEN 50 AND 69 THEN 'Rework Required'
            ELSE 'Approved'
        END AS ReviewDecision,
        GETDATE() AS ReviewDate
    FROM ScoredProducts AS sp
    WHERE sp.InspectionScore < 70
    ORDER BY sp.ProductID;

    PRINT CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' product release review record(s) inserted.';
END
ELSE
BEGIN
    PRINT 'ProductReleaseReview already contains data. Skipping insert.';
END
GO

-- Validation output
SELECT *
FROM ProductionOps.ProductReleaseReview
ORDER BY ReviewID;
GO
