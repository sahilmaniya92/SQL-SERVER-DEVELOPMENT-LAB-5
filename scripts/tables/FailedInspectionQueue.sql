-- =============================================
-- Script Name: failed_inspection_queue.sql
-- Objective: Create Failed Inspection Queue
-- =============================================

-- Check if the table already exists
IF OBJECT_ID('ProductionOps.FailedInspectionQueue', 'U') IS NOT NULL
BEGIN
    DROP TABLE ProductionOps.FailedInspectionQueue;
END;
GO

-- Create the table
CREATE TABLE ProductionOps.FailedInspectionQueue
(
    QueueID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    InspectionScore DECIMAL(5,2) NOT NULL,
    InspectionDate DATE NOT NULL,
    ProcessingStatus VARCHAR(30) NOT NULL
);
GO

-- Insert failed inspection records
INSERT INTO ProductionOps.FailedInspectionQueue
(
    ProductID,
    InspectionScore,
    InspectionDate,
    ProcessingStatus
)
VALUES
(1001, 45.50, '2026-06-01', 'Pending Review'),
(1002, 38.75, '2026-06-02', 'Pending Review'),
(1003, 49.00, '2026-06-03', 'Pending Review'),
(1004, 42.25, '2026-06-04', 'Pending Review'),
(1005, 35.80, '2026-06-05', 'Pending Review'),
(1006, 40.50, '2026-06-06', 'Pending Review'),
(1007, 47.10, '2026-06-07', 'Pending Review'),
(1008, 39.95, '2026-06-08', 'Pending Review'),
(1009, 44.30, '2026-06-09', 'Pending Review'),
(1010, 41.60, '2026-06-10', 'Pending Review');
GO

-- Verify the data
SELECT *
FROM ProductionOps.FailedInspectionQueue;