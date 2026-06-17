/*
    Lab 5 - Task 5 (Table Component)
    Script: error_log.sql
    Purpose: Create ProductionOps.ErrorLog for runtime error capture
*/

USE AdventureWorks2022;
GO

IF OBJECT_ID('ProductionOps.ErrorLog', 'U') IS NULL
BEGIN
    CREATE TABLE ProductionOps.ErrorLog
    (
        ErrorLogID    INT            NOT NULL IDENTITY(1, 1),
        ErrorDate     DATETIME       NOT NULL,
        ErrorNumber   INT            NOT NULL,
        ErrorSeverity INT            NOT NULL,
        ErrorState    INT            NOT NULL,
        ErrorLine     INT            NOT NULL,
        ErrorMessage  NVARCHAR(MAX)  NOT NULL,
        CONSTRAINT PK_ErrorLog PRIMARY KEY (ErrorLogID)
    );

    PRINT 'ProductionOps.ErrorLog table created successfully.';
END
ELSE
BEGIN
    PRINT 'ProductionOps.ErrorLog table already exists.';
END
GO
