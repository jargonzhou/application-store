-------------------------------------------------------------------------------------------------
-- information_schema
-------------------------------------------------------------------------------------------------

SELECT TABLE_NAME, TABLE_COMMENT
FROM information_schema.tables
WHERE TABLE_SCHEMA = 'ex_table'
ORDER BY TABLE_NAME;

SELECT ORDINAL_POSITION AS '#', COLUMN_NAME, COLUMN_TYPE, COLUMN_COMMENT, COLUMN_DEFAULT, IS_NULLABLE
FROM information_schema.columns
WHERE TABLE_SCHEMA = 'ex_db' AND TABLE_NAME = 'ex_table'
ORDER BY ORDINAL_POSITION;