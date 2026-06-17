/*
    Lab 5 - Task 13
    Script: inspection_notification_cursor.sql
    Purpose: Generate notification messages for products requiring corrective action
*/

USE AdventureWorks2022;
GO

DECLARE @ProductID INT;
DECLARE @ProductName NVARCHAR(200);
DECLARE @ReviewDecision NVARCHAR(50);
DECLARE @NotificationMessage NVARCHAR(500);

DECLARE notification_cursor CURSOR LOCAL FAST_FORWARD FOR
SELECT
    prr.ProductID,
    prr.ProductName,
    prr.ReviewDecision
FROM ProductionOps.ProductReleaseReview AS prr
WHERE prr.ReviewDecision IN ('Reject', 'Rework Required')
  AND NOT EXISTS
  (
      SELECT 1
      FROM ProductionOps.NotificationLog AS nl
      WHERE nl.ProductID = prr.ProductID
        AND nl.NotificationMessage LIKE '%' + prr.ProductName + '%'
  )
ORDER BY prr.ReviewID;

OPEN notification_cursor;

FETCH NEXT FROM notification_cursor
INTO @ProductID, @ProductName, @ReviewDecision;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generate notification message based on review decision
    IF @ReviewDecision = 'Reject'
        SET @NotificationMessage =
            'Product ' + @ProductName + ' has been rejected and must not be released.';
    ELSE IF @ReviewDecision = 'Rework Required'
        SET @NotificationMessage =
            'Product ' + @ProductName + ' requires rework before release approval.';
    ELSE
        SET @NotificationMessage =
            'Product ' + @ProductName + ' requires management review.';

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

    PRINT @NotificationMessage;

    FETCH NEXT FROM notification_cursor
    INTO @ProductID, @ProductName, @ReviewDecision;
END

CLOSE notification_cursor;
DEALLOCATE notification_cursor;
GO

-- Validation output
SELECT *
FROM ProductionOps.NotificationLog
ORDER BY NotificationID;
GO
