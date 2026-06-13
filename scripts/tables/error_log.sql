-- =============================================
-- Script : error_log.sql
-- Purpose: Create ProductionOps.ErrorLog table
-- Owner  : Parth (Task 5)
-- =============================================
USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.ErrorLog', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.ErrorLog (
        ErrorLogID      INT           IDENTITY(1,1) PRIMARY KEY,
        ErrorDate       DATETIME      NOT NULL,
        ErrorNumber     INT           NOT NULL,
        ErrorSeverity   INT           NOT NULL,
        ErrorState      INT           NOT NULL,
        ErrorLine       INT           NOT NULL,
        ErrorMessage    NVARCHAR(MAX) NOT NULL
    );
    PRINT 'Table ProductionOps.ErrorLog created.';
END
ELSE
    PRINT 'Table ProductionOps.ErrorLog already exists.';
GO

-- Validation: display error log contents
SELECT *
FROM ProductionOps.ErrorLog
ORDER BY ErrorLogID DESC;
GO
