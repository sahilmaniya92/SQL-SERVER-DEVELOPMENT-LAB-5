/*
    Lab 5 - Task 4
    Script: monthly_inspection_schedule.sql
    Purpose: Generate monthly inspection schedule using WHILE loop
*/

USE AdventureWorks2022;
GO

DECLARE @MonthNumber INT = 1;

DECLARE @InspectionSchedule TABLE
(
    MonthNumber INT,
    MonthName NVARCHAR(20)
);

WHILE @MonthNumber <= 12
BEGIN
    INSERT INTO @InspectionSchedule (MonthNumber, MonthName)
    VALUES
    (
        @MonthNumber,
        DATENAME(MONTH, DATEFROMPARTS(2026, @MonthNumber, 1))
    );

    SET @MonthNumber = @MonthNumber + 1;
END

-- Required output
SELECT *
FROM @InspectionSchedule
ORDER BY MonthNumber;
GO
