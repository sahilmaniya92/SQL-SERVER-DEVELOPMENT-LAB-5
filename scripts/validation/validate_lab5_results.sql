/*
    Lab 5 - Validation Script
    Script: validate_lab5_results.sql
    Purpose: Verify all Lab 5 objects and data are deployed correctly
*/

USE AdventureWorks2022;
GO

PRINT '=== Lab 5 Validation: Schema ===';
SELECT name
FROM sys.schemas
WHERE name = 'ProductionOps';
GO

PRINT '=== Lab 5 Validation: Tables ===';
SELECT name
FROM sys.tables
WHERE schema_id = SCHEMA_ID('ProductionOps');
GO

PRINT '=== Lab 5 Validation: Views ===';
SELECT name
FROM sys.views
WHERE schema_id = SCHEMA_ID('ProductionOps');
GO

PRINT '=== Lab 5 Validation: InspectionRequests ===';
SELECT *
FROM ProductionOps.InspectionRequests;
GO

PRINT '=== Lab 5 Validation: ErrorLog ===';
SELECT *
FROM ProductionOps.ErrorLog;
GO

PRINT '=== Lab 5 Validation: FailedInspectionQueue ===';
SELECT *
FROM ProductionOps.FailedInspectionQueue;
GO

PRINT '=== Lab 5 Validation: ProductReleaseReview ===';
SELECT *
FROM ProductionOps.ProductReleaseReview;
GO

PRINT '=== Lab 5 Validation: NotificationLog ===';
SELECT *
FROM ProductionOps.NotificationLog;
GO

PRINT '=== Lab 5 Validation: vProductInspectionSummary ===';
SELECT TOP (20) *
FROM ProductionOps.vProductInspectionSummary;
GO

PRINT '=== Lab 5 Validation Complete ===';
GO
