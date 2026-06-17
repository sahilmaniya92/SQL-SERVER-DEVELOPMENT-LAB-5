/*
    Lab 5 - Task 5
    Script: inspection_error_logging.sql
    Purpose: Demonstrate TRY...CATCH error handling and logging
*/

USE AdventureWorks2022;
GO

BEGIN TRY
    -- Intentional runtime error for lab demonstration
    SELECT 1 / 0;
END TRY
BEGIN CATCH
    INSERT INTO ProductionOps.ErrorLog
    (
        ErrorDate,
        ErrorNumber,
        ErrorSeverity,
        ErrorState,
        ErrorLine,
        ErrorMessage
    )
    VALUES
    (
        GETDATE(),
        ERROR_NUMBER(),
        ERROR_SEVERITY(),
        ERROR_STATE(),
        ERROR_LINE(),
        ERROR_MESSAGE()
    );

    PRINT 'Runtime error captured and logged to ProductionOps.ErrorLog.';
END CATCH
GO

-- Validation output
SELECT *
FROM ProductionOps.ErrorLog
ORDER BY ErrorLogID DESC;
GO
