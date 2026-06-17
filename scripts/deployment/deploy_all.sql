/*
    Lab 5 - Task 14
    Script: deploy_all.sql
    Purpose: Deploy all Lab 5 scripts in correct order using SQLCMD

    BEFORE RUNNING:
    1. Open this file in SSMS
    2. Menu: Query -> SQLCMD Mode  (MUST be checked ON)
    3. Update SCRIPTPATH below if your Lab5 folder is elsewhere
    4. Press F5 to execute

    If SQLCMD Mode is OFF you will get: "Incorrect syntax near ':'"
*/

:setvar SCRIPTPATH "d:\ITS\SEM-2\SQL SERVER\LAB\lab -5\scripts"

USE AdventureWorks2022;
GO

PRINT '========================================';
PRINT 'Lab 5 Deployment Started';
PRINT '========================================';
GO

-- 1. Schema Initialization
:r $(SCRIPTPATH)\setup\initialize_productionops_schema.sql

-- 2. Permanent Tables
:r $(SCRIPTPATH)\tables\error_log.sql
:r $(SCRIPTPATH)\tables\inspection_request_registration.sql
:r $(SCRIPTPATH)\tables\failed_inspection_queue.sql
:r $(SCRIPTPATH)\tables\product_release_review.sql
:r $(SCRIPTPATH)\tables\notification_log.sql

-- 3. Control Flow Scripts
:r $(SCRIPTPATH)\controlflow\inspection_result_classification.sql
:r $(SCRIPTPATH)\controlflow\monthly_inspection_schedule.sql

-- 4. Error Handling Scripts
:r $(SCRIPTPATH)\errorhandling\inspection_error_logging.sql

-- 5. Temporary Object Scripts
:r $(SCRIPTPATH)\temporary_objects\inspection_batch_processing.sql
:r $(SCRIPTPATH)\temporary_objects\inspection_category_management.sql

-- 6. Reporting Components
:r $(SCRIPTPATH)\reporting\product_quality_statistics.sql
:r $(SCRIPTPATH)\reporting\vProductInspectionSummary.sql

-- 7. Cursor Processing Scripts
:r $(SCRIPTPATH)\cursors\failed_product_review_cursor.sql
:r $(SCRIPTPATH)\cursors\inspection_notification_cursor.sql

-- 8. Validation Scripts
:r $(SCRIPTPATH)\validation\validate_lab5_results.sql

PRINT '========================================';
PRINT 'Lab 5 Deployment Completed Successfully';
PRINT '========================================';
GO
