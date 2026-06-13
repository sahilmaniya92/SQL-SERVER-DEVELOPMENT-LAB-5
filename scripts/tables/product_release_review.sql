-- =====================================================
-- Script : product_release_review.sql
-- Purpose: Create ProductionOps.ProductReleaseReview table
-- =====================================================
USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.ProductReleaseReview', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.ProductReleaseReview (
        ReviewID        INT           IDENTITY(1,1) PRIMARY KEY,
        ProductID       INT           NOT NULL,
        ProductName     NVARCHAR(200) NOT NULL,
        InspectionScore INT           NOT NULL,
        ReviewDecision  NVARCHAR(50)  NOT NULL,
        ReviewDate      DATETIME      NOT NULL
    );
    PRINT 'Table ProductionOps.ProductReleaseReview created.';
END
ELSE
    PRINT 'Table ProductionOps.ProductReleaseReview already exists.';
GO
