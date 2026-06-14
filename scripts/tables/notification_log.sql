USE AdventureWorks2022;
GO

/* =====================================================
   Task 13: Notification Log Table
   Purpose: Stores notification messages generated
            from cursor-based inspection processing
===================================================== */

-- Create NotificationLog table (if it does not exist)
IF OBJECT_ID('ProductionOps.NotificationLog', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.NotificationLog
    (
        NotificationID INT IDENTITY(1,1) PRIMARY KEY,
        ProductID INT NOT NULL,
        NotificationMessage NVARCHAR(500) NOT NULL,
        NotificationDate DATETIME NOT NULL DEFAULT GETDATE()
    );
END;
GO