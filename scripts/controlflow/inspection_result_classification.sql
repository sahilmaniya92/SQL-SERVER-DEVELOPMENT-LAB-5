/*
    Lab 5 - Task 3
    Script: inspection_result_classification.sql
    Purpose: Demonstrate IF...ELSE inspection decision logic
*/

USE AdventureWorks2022;
GO

DECLARE @ProductID INT;
DECLARE @InspectionScore INT;
DECLARE @InspectionResult NVARCHAR(50);

-- Create table variable to store test results
DECLARE @ClassificationResults TABLE
(
    ProductID INT,
    InspectionScore INT,
    InspectionResult NVARCHAR(50)
);

-- Test Case 1: Approved (score 95)
SET @ProductID = 707;
SET @InspectionScore = 95;
SET @InspectionResult = NULL;

IF @InspectionScore BETWEEN 90 AND 100
    SET @InspectionResult = 'Approved';
ELSE IF @InspectionScore BETWEEN 70 AND 89
    SET @InspectionResult = 'Conditional Approval';
ELSE
    SET @InspectionResult = 'Failed';

INSERT INTO @ClassificationResults (ProductID, InspectionScore, InspectionResult)
VALUES (@ProductID, @InspectionScore, @InspectionResult);

-- Test Case 2: Conditional Approval (score 78)
SET @ProductID = 708;
SET @InspectionScore = 78;
SET @InspectionResult = NULL;

IF @InspectionScore BETWEEN 90 AND 100
    SET @InspectionResult = 'Approved';
ELSE IF @InspectionScore BETWEEN 70 AND 89
    SET @InspectionResult = 'Conditional Approval';
ELSE
    SET @InspectionResult = 'Failed';

INSERT INTO @ClassificationResults (ProductID, InspectionScore, InspectionResult)
VALUES (@ProductID, @InspectionScore, @InspectionResult);

-- Test Case 3: Failed (score 45)
SET @ProductID = 709;
SET @InspectionScore = 45;
SET @InspectionResult = NULL;

IF @InspectionScore BETWEEN 90 AND 100
    SET @InspectionResult = 'Approved';
ELSE IF @InspectionScore BETWEEN 70 AND 89
    SET @InspectionResult = 'Conditional Approval';
ELSE
    SET @InspectionResult = 'Failed';

INSERT INTO @ClassificationResults (ProductID, InspectionScore, InspectionResult)
VALUES (@ProductID, @InspectionScore, @InspectionResult);

-- Required output
SELECT
    ProductID,
    InspectionScore,
    InspectionResult
FROM @ClassificationResults;
GO
