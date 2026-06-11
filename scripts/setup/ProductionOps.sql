-- =============================================
-- Script Name: initialize_productionops_schema.sql
-- Objective: Create ProductionOps schema
-- =============================================

-- Check if schema exists
IF NOT EXISTS
(
    SELECT *
    FROM sys.schemas
    WHERE name = 'ProductionOps'
)
BEGIN
    EXEC('CREATE SCHEMA ProductionOps');
    PRINT 'Schema ProductionOps created successfully.';
END
ELSE
BEGIN
    PRINT 'Schema ProductionOps already exists.';
END;

-- Display schema information
SELECT
    schema_id,
    name AS SchemaName,
    principal_id
FROM sys.schemas
WHERE name = 'ProductionOps';


