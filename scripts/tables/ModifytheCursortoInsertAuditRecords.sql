USE AdventureWorks2022;
GO

DECLARE
    @QueueID INT,
    @ProductID INT,
    @ProductName NVARCHAR(200),
    @InspectionScore INT,
    @ReviewDecision NVARCHAR(50);

DECLARE FailedProductCursor CURSOR FOR
SELECT
    q.QueueID,
    q.ProductID,
    p.Name,
    q.InspectionScore
FROM ProductionOps.FailedInspectionQueue q
INNER JOIN Production.Product p
    ON q.ProductID = p.ProductID
WHERE q.ProcessingStatus = 'Pending';

OPEN FailedProductCursor;

FETCH NEXT FROM FailedProductCursor
INTO
    @QueueID,
    @ProductID,
    @ProductName,
    @InspectionScore;

WHILE @@FETCH_STATUS = 0
BEGIN

    -- Determine review decision
    IF @InspectionScore < 50
        SET @ReviewDecision = 'Reject';
    ELSE
        SET @ReviewDecision = 'Rework Required';

    -- Task 12 Requirement:
    -- Insert processed record into ProductReleaseReview
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

    -- Update queue status
    UPDATE ProductionOps.FailedInspectionQueue
    SET ProcessingStatus = 'Processed'
    WHERE QueueID = @QueueID;

    -- Display processing message
    PRINT 'Processing Product ' + CAST(@ProductID AS VARCHAR(10));
    PRINT @ProductName;
    PRINT 'Inspection Score: ' + CAST(@InspectionScore AS VARCHAR(10));
    PRINT 'Decision: ' + @ReviewDecision;
    PRINT '----------------------------------';

    FETCH NEXT FROM FailedProductCursor
    INTO
        @QueueID,
        @ProductID,
        @ProductName,
        @InspectionScore;
END;

CLOSE FailedProductCursor;
DEALLOCATE FailedProductCursor;
GO
