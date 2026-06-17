/*
    Lab 5 - Task 1
    Script: initialize_productionops_schema.sql
    Purpose: Create ProductionOps schema with existence validation
*/

USE AdventureWorks2022;
GO

-- Validate and create schema if missing
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'ProductionOps'
)
BEGIN
    EXEC('CREATE SCHEMA ProductionOps');
    PRINT 'ProductionOps schema created successfully.';
END
ELSE
BEGIN
    PRINT 'ProductionOps schema already exists.';
END
GO

-- Display schema validation output
SELECT name AS SchemaName
FROM sys.schemas
WHERE name = 'ProductionOps';
GO
