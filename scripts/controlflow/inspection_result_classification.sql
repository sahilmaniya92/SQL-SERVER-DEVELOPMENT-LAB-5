-- =====================================================
-- Script : inspection_result_classification.sql
-- Purpose: Demonstrate IF...ELSE decision logic
-- =====================================================
USE AdventureWorks2022;
GO

-- Test 1: Score 95 (Approved)
DECLARE @ProductID INT = 1;
DECLARE @InspectionScore INT = 95;
DECLARE @InspectionResult NVARCHAR(50);

IF @InspectionScore >= 90
    SET @InspectionResult = 'Approved';
ELSE IF @InspectionScore >= 70
    SET @InspectionResult = 'Conditional Approval';
ELSE
    SET @InspectionResult = 'Failed';

SELECT @ProductID AS ProductID, @InspectionScore AS InspectionScore, @InspectionResult AS InspectionResult;
PRINT 'Test 1 completed.';
GO

-- Test 2: Score 78 (Conditional Approval)
DECLARE @ProductID INT = 2;
DECLARE @InspectionScore INT = 78;
DECLARE @InspectionResult NVARCHAR(50);

IF @InspectionScore >= 90
    SET @InspectionResult = 'Approved';
ELSE IF @InspectionScore >= 70
    SET @InspectionResult = 'Conditional Approval';
ELSE
    SET @InspectionResult = 'Failed';

SELECT @ProductID AS ProductID, @InspectionScore AS InspectionScore, @InspectionResult AS InspectionResult;
PRINT 'Test 2 completed.';
GO

-- Test 3: Score 45 (Failed)
DECLARE @ProductID INT = 3;
DECLARE @InspectionScore INT = 45;
DECLARE @InspectionResult NVARCHAR(50);

IF @InspectionScore >= 90
    SET @InspectionResult = 'Approved';
ELSE IF @InspectionScore >= 70
    SET @InspectionResult = 'Conditional Approval';
ELSE
    SET @InspectionResult = 'Failed';

SELECT @ProductID AS ProductID, @InspectionScore AS InspectionScore, @InspectionResult AS InspectionResult;
PRINT 'Test 3 completed.';
GO
