/*
    Lab 5 - Task 2
    Script: inspection_request_registration.sql
    Purpose: Create and populate ProductionOps.InspectionRequests
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.InspectionRequests', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.InspectionRequests
    (
        InspectionRequestID INT           NOT NULL IDENTITY(1, 1),
        ProductID           INT           NOT NULL,
        RequestDate         DATETIME      NOT NULL,
        RequestedBy         NVARCHAR(100) NOT NULL,
        InspectionType      NVARCHAR(100) NOT NULL,
        Status              NVARCHAR(50)  NOT NULL,
        CONSTRAINT PK_InspectionRequests PRIMARY KEY (InspectionRequestID)
    );

    PRINT 'ProductionOps.InspectionRequests table created successfully.';
END
ELSE
BEGIN
    PRINT 'ProductionOps.InspectionRequests table already exists.';
END
GO

-- Insert lab data only when table is empty (re-runnable)
IF NOT EXISTS (
    SELECT 1
    FROM ProductionOps.InspectionRequests
)
BEGIN
    INSERT INTO ProductionOps.InspectionRequests
    (
        ProductID,
        RequestDate,
        RequestedBy,
        InspectionType,
        Status
    )
    SELECT TOP (12)
        p.ProductID,
        GETDATE(),
        CASE (p.ProductID % 4)
            WHEN 0 THEN 'Supervisor A'
            WHEN 1 THEN 'Supervisor B'
            WHEN 2 THEN 'Supervisor C'
            ELSE 'Supervisor D'
        END AS RequestedBy,
        CASE
            WHEN p.ListPrice > 2000 THEN 'Performance Inspection'
            WHEN p.SafetyStockLevel < 500 THEN 'Safety Inspection'
            WHEN p.MakeFlag = 1 THEN 'Assembly Inspection'
            ELSE 'Final Release Inspection'
        END AS InspectionType,
        CASE
            WHEN p.SafetyStockLevel < 500 THEN 'Pending'
            WHEN p.ListPrice > 1000 THEN 'Scheduled'
            ELSE 'Completed'
        END AS Status
    FROM Production.Product AS p
    ORDER BY p.ProductID;

    PRINT CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' inspection request(s) inserted.';
END
ELSE
BEGIN
    PRINT 'InspectionRequests already contains data. Skipping insert.';
END
GO

-- Validation output
SELECT *
FROM ProductionOps.InspectionRequests
ORDER BY InspectionRequestID;
GO
