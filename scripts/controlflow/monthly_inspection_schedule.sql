-- =====================================================
-- Script : monthly_inspection_schedule.sql
-- Purpose: Generate 12‑month inspection schedule using WHILE
-- =====================================================
USE AdventureWorks2022;
GO

DECLARE @InspectionSchedule TABLE (
    MonthNumber INT,
    MonthName   NVARCHAR(20)
);

DECLARE @CurrentMonth INT = 1;
WHILE @CurrentMonth <= 12
BEGIN
    INSERT INTO @InspectionSchedule (MonthNumber, MonthName)
    VALUES (@CurrentMonth, DATENAME(MONTH, DATEFROMPARTS(2000, @CurrentMonth, 1)));
    SET @CurrentMonth = @CurrentMonth + 1;
END

SELECT * FROM @InspectionSchedule ORDER BY MonthNumber;
PRINT 'Monthly inspection schedule generated.';
GO
