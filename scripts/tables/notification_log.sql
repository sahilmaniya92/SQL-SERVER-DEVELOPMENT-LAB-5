/*
    Lab 5 - Task 13 (Table Component)
    Script: notification_log.sql
    Purpose: Create ProductionOps.NotificationLog for corrective action alerts
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.NotificationLog', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.NotificationLog
    (
        NotificationID      INT            NOT NULL IDENTITY(1, 1),
        ProductID           INT            NOT NULL,
        NotificationMessage NVARCHAR(500)  NOT NULL,
        NotificationDate    DATETIME       NOT NULL,
        CONSTRAINT PK_NotificationLog PRIMARY KEY (NotificationID)
    );

    PRINT 'ProductionOps.NotificationLog table created successfully.';
END
ELSE
BEGIN
    PRINT 'ProductionOps.NotificationLog table already exists.';
END
GO

-- Validation output
SELECT *
FROM ProductionOps.NotificationLog
ORDER BY NotificationID;
GO
