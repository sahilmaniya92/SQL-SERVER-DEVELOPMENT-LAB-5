-- Task 2 — inspection_request_registration.sql

USE AdventureWorks2022;
GO

/*=========================================================
  ProductionOps.InspectionRequests
  Creates table and loads inspection request data
=========================================================*/

IF OBJECT_ID('ProductionOps.InspectionRequests', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.InspectionRequests
    (
        InspectionRequestID INT IDENTITY(1,1) PRIMARY KEY,
        ProductID INT NOT NULL,
        RequestDate DATETIME NOT NULL,
        RequestedBy NVARCHAR(100) NOT NULL,
        InspectionType NVARCHAR(100) NOT NULL,
        Status NVARCHAR(50) NOT NULL
    );
END;
GO

IF NOT EXISTS
(
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
    SELECT TOP 10
        ProductID,
        GETDATE(),

        'Supervisor A',

        CASE
            WHEN ListPrice > 2000
                THEN 'Performance Inspection'

            WHEN SafetyStockLevel < 500
                THEN 'Safety Inspection'

            WHEN MakeFlag = 1
                THEN 'Assembly Inspection'

            ELSE 'Final Release Inspection'
        END,

        CASE
            WHEN SafetyStockLevel < 500
                THEN 'Pending'

            WHEN ListPrice > 1000
                THEN 'Scheduled'

            ELSE 'Completed'
        END

    FROM Production.Product
    ORDER BY ProductID;

END;
GO

SELECT *
FROM ProductionOps.InspectionRequests
ORDER BY InspectionRequestID;
GO


