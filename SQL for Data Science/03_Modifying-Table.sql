-- Renaming a Table
RENAME TABLE old_table_name TO new_table_name;

-- Dropping a Table
DROP TABLE table_name;

-- Renaming a Column
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;

-- Dropping a Column
ALTER TABLE table_name DROP COLUMN column_name;

-- Adding a Column
ALTER TABLE table_name ADD COLUMN column_name datatype constraints;

-- Example:
ALTER TABLE student ADD COLUMN gender VARCHAR(10);

-- Modifying a Column
ALTER TABLE table_name MODIFY COLUMN column_name new_datatype new_constraints;

-- Example:
ALTER TABLE student MODIFY COLUMN name VARCHAR(150) NOT NULL;

-- Changing the Order of Columns
ALTER TABLE table_name MODIFY COLUMN column_name datatype AFTER another_column_name;