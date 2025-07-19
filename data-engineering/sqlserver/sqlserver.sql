-------------------------------------------------------------------------------------------------
-- version: https://learn.microsoft.com/zh-cn/troubleshoot/sql/releases/find-my-sql-version
-------------------------------------------------------------------------------------------------
-- Microsoft SQL Server 2012 (SP1) - 11.0.3000.0 (X64)   Oct 19 2012 13:38:57   Copyright (c) Microsoft Corporation  Enterprise Edition (64-bit) on Windows NT 6.2 <X64> (Build 9200: ) (Hypervisor) 
SELECT @@VERSION;

-------------------------------------------------------------------------------------------------
-- System catalog views (Transact-SQL): https://learn.microsoft.com/en-us/sql/relational-databases/system-catalog-views/catalog-views-transact-sql
-------------------------------------------------------------------------------------------------
SELECT name FROM sys.databases;
SELECT name FROM sys.schemas;
SELECT name FROM sys.tables;
SELECT name FROM sys.objects;
SELECT * FROM sys.types;
SELECT * FROM sys.systypes;

-------------------------------------------------------------------------------------------------
-- System Information Schema Views (Transact-SQL): https://learn.microsoft.com/en-us/sql/relational-databases/system-information-schema-views/system-information-schema-views-transact-sql
-------------------------------------------------------------------------------------------------
SELECT * FROM TestDB.INFORMATION_SCHEMA.TABLES;
SELECT * FROM TestDB.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Inventory';


-------------------------------------------------------------------------------------------------
-- Comments
-------------------------------------------------------------------------------------------------
SELECT ROW_NUMBER() OVER (ORDER BY t.TABLE_NAME) AS '#', t.TABLE_NAME AS TableName, t.TABLE_TYPE, c.value AS Comment
FROM TestDB.INFORMATION_SCHEMA.TABLES AS t
LEFT JOIN sys.extended_properties AS c
    ON OBJECT_ID(t.TABLE_NAME) = c.major_id
        AND c.minor_id = 0
        AND c.name = 'MS_Description';

SELECT ROW_NUMBER() OVER (ORDER BY t.TABLE_NAME) AS '#', t.TABLE_NAME AS TableName, t.TABLE_TYPE, c.value AS Comment
FROM TestDB.INFORMATION_SCHEMA.TABLES AS t
LEFT JOIN sys.extended_properties AS c
    ON OBJECT_ID(t.TABLE_NAME) = c.major_id
        AND c.minor_id = 0
        AND c.name = 'MS_Description';

-------------------------------------------------------------------------------------------------
-- Table Fileds
-------------------------------------------------------------------------------------------------
SELECT * FROM TestDB.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Inventory';
--
-- try 1
--
SELECT A.name AS table_name,B.name AS column_name,C.value AS column_description
FROM sys.tables A
     INNER JOIN sys.columns B ON B.object_id = A.object_id
     LEFT JOIN sys.extended_properties C ON C.major_id = B.object_id AND C.minor_id = B.column_id
WHERE A.name = 'Inventory'; -- table name
--
-- try 2
--
SELECT
    TableName = o.name,
    FieleName = c.name,
    FieldComment = ep.value
FROM sys.objects o
INNER JOIN sys.columns c ON o.object_id = c.object_id
LEFT JOIN sys.extended_properties ep ON o.object_id = ep.major_id AND c.column_id = ep.minor_id AND ep.name = 'MS_Description'
WHERE 
    o.type = 'U' -- U: user tables
    AND o.name = 'Inventory'  -- table name
    -- AND c.name = 'FieldName' -- tield name
ORDER BY 
    TableName, c.column_id;
--
-- COMPLETE
--
SELECT -- A.name AS 'Table',
     D.ORDINAL_POSITION AS '#', D.COLUMN_NAME AS ColumnName, C.value AS Comment, D.DATA_TYPE, D.IS_NULLABLE, D.COLUMN_DEFAULT,
     CASE D.DATA_TYPE
     WHEN 'varchar' THEN CONCAT(D.DATA_TYPE, '(', D.CHARACTER_MAXIMUM_LENGTH, ')')
     -- other types
     END AS DATA_TYPE
FROM sys.tables A                                                        -- table
     INNER JOIN sys.columns B                                            -- column
        ON B.object_id = A.object_id
     INNER JOIN [TestDB].INFORMATION_SCHEMA.COLUMNS D                    -- column: with type info
        ON (A.name = D.TABLE_NAME AND B.name = D.COLUMN_NAME)
     LEFT JOIN sys.types T                                                -- type
        ON B.system_type_id = T.system_type_id 
     LEFT JOIN sys.extended_properties C                                  -- properties: Comment etc
        ON (C.major_id = B.object_id AND C.minor_id = B.column_id)
WHERE A.name = 'Inventory' -- table name
ORDER BY D.ORDINAL_POSITION;
