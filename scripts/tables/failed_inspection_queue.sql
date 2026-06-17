/*
    Lab 5 - Task 10
    Script: failed_inspection_queue.sql
    Purpose: Create and populate ProductionOps.FailedInspectionQueue
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.FailedInspectionQueue', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.FailedInspectionQueue
    (
        QueueID           INT           NOT NULL IDENTITY(1, 1),
        ProductID         INT           NOT NULL,
        InspectionScore   INT           NOT NULL,
        InspectionDate    DATETIME      NOT NULL,
        ProcessingStatus  NVARCHAR(50)  NOT NULL,
        CONSTRAINT PK_FailedInspectionQueue PRIMARY KEY (QueueID)
    );

    PRINT 'ProductionOps.FailedInspectionQueue table created successfully.';
END
ELSE
BEGIN
    PRINT 'ProductionOps.FailedInspectionQueue table already exists.';
END
GO

-- Insert failed inspection records only when table is empty (re-runnable)
IF NOT EXISTS (
    SELECT 1
    FROM ProductionOps.FailedInspectionQueue
)
BEGIN
    ;WITH ScoredProducts AS
    (
        SELECT
            p.ProductID,
            CASE
                WHEN p.ListPrice > 2000 AND p.SafetyStockLevel < 500 THEN 45
                WHEN p.ListPrice > 1000 AND p.SafetyStockLevel < 800 THEN 55
                WHEN p.SafetyStockLevel < 300 THEN 60
                ELSE 65
            END AS InspectionScore
        FROM Production.Product AS p
    )
    INSERT INTO ProductionOps.FailedInspectionQueue
    (
        ProductID,
        InspectionScore,
        InspectionDate,
        ProcessingStatus
    )
    SELECT TOP (12)
        sp.ProductID,
        sp.InspectionScore,
        GETDATE(),
        'Pending'
    FROM ScoredProducts AS sp
    WHERE sp.InspectionScore < 70
    ORDER BY sp.ProductID;

    PRINT CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' failed inspection record(s) inserted.';
END
ELSE
BEGIN
    PRINT 'FailedInspectionQueue already contains data. Skipping insert.';
END
GO

-- Validation output
SELECT *
FROM ProductionOps.FailedInspectionQueue
ORDER BY QueueID;
GO
