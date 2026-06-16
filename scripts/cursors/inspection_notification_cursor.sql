USE AdventureWorks2022;
GO

/* =====================================================
   Task 13: Inspection Notification Cursor
   Purpose: Processes ProductReleaseReview records and
            generates notifications for rejected or
            rework-required products
===================================================== */

-- Declare cursor variables
DECLARE @ProductID INT;
DECLARE @ProductName NVARCHAR(200);
DECLARE @ReviewDecision NVARCHAR(50);
DECLARE @NotificationMessage NVARCHAR(500);

-- Cursor: selects only failed or rework products
DECLARE NotificationCursor CURSOR FOR
SELECT ProductID, ReviewDecision
FROM ProductionOps.ProductReleaseReview
WHERE ReviewDecision IN ('Reject', 'Rework Required');

-- Open cursor
OPEN NotificationCursor;

-- Fetch first record
FETCH NEXT FROM NotificationCursor
INTO @ProductID, @ReviewDecision;

-- Loop through all records
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Get product name from Production.Product table
    SELECT @ProductName = Name
    FROM Production.Product
    WHERE ProductID = @ProductID;

    -- Determine notification message based on decision
    IF @ReviewDecision = 'Reject'
        SET @NotificationMessage =
            'Product ' + @ProductName + 
            ' has been rejected and must not be released.';
    ELSE
        SET @NotificationMessage =
            'Product ' + @ProductName + 
            ' requires rework before release approval.';

    -- Insert notification record
    INSERT INTO ProductionOps.NotificationLog
    (
        ProductID,
        NotificationMessage,
        NotificationDate
    )
    VALUES
    (
        @ProductID,
        @NotificationMessage,
        GETDATE()
    );

    -- Fetch next record
    FETCH NEXT FROM NotificationCursor
    INTO @ProductID, @ReviewDecision;
END;

-- Close and deallocate cursor
CLOSE NotificationCursor;
DEALLOCATE NotificationCursor;
GO

/* =====================================================
   Validation: View generated notifications
===================================================== */
SELECT *
FROM ProductionOps.NotificationLog;
GO

SELECT COUNT(*) AS TotalRows
FROM ProductionOps.ProductReleaseReview;