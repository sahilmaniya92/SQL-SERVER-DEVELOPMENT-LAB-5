/*
    Lab 5 - Task 11 & Task 12
    Script: failed_product_review_cursor.sql
    Purpose: Process failed inspections and store review decisions
*/

USE AdventureWorks2022;
GO

DECLARE @QueueID INT;
DECLARE @ProductID INT;
DECLARE @ProductName NVARCHAR(200);
DECLARE @InspectionScore INT;
DECLARE @ReviewDecision NVARCHAR(50);

DECLARE failed_inspection_cursor CURSOR LOCAL FAST_FORWARD FOR
SELECT
    fiq.QueueID,
    fiq.ProductID,
    p.Name,
    fiq.InspectionScore
FROM ProductionOps.FailedInspectionQueue AS fiq
INNER JOIN Production.Product AS p
    ON fiq.ProductID = p.ProductID
WHERE fiq.ProcessingStatus = 'Pending'
  AND NOT EXISTS
  (
      SELECT 1
      FROM ProductionOps.ProductReleaseReview AS prr
      WHERE prr.ProductID = fiq.ProductID
        AND prr.InspectionScore = fiq.InspectionScore
  )
ORDER BY fiq.QueueID;

OPEN failed_inspection_cursor;

FETCH NEXT FROM failed_inspection_cursor
INTO @QueueID, @ProductID, @ProductName, @InspectionScore;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Determine review decision using IF...ELSE
    IF @InspectionScore < 50
        SET @ReviewDecision = 'Reject';
    ELSE IF @InspectionScore BETWEEN 50 AND 69
        SET @ReviewDecision = 'Rework Required';
    ELSE
        SET @ReviewDecision = 'Approved';

    -- Insert audit record
    INSERT INTO ProductionOps.ProductReleaseReview
    (
        ProductID,
        ProductName,
        InspectionScore,
        ReviewDecision,
        ReviewDate
    )
    VALUES
    (
        @ProductID,
        @ProductName,
        @InspectionScore,
        @ReviewDecision,
        GETDATE()
    );

    -- Update queue processing status
    UPDATE ProductionOps.FailedInspectionQueue
    SET ProcessingStatus = 'Processed'
    WHERE QueueID = @QueueID;

    -- Display processing message
    PRINT 'Processing Product ' + CAST(@ProductID AS NVARCHAR(20));
    PRINT @ProductName;
    PRINT 'Inspection Score: ' + CAST(@InspectionScore AS NVARCHAR(10));
    PRINT 'Decision: ' + @ReviewDecision;
    PRINT '----------------------------------------';

    FETCH NEXT FROM failed_inspection_cursor
    INTO @QueueID, @ProductID, @ProductName, @InspectionScore;
END

CLOSE failed_inspection_cursor;
DEALLOCATE failed_inspection_cursor;
GO

-- Validation output
SELECT *
FROM ProductionOps.ProductReleaseReview
ORDER BY ReviewID;
GO

SELECT *
FROM ProductionOps.FailedInspectionQueue
ORDER BY QueueID;
GO
