-- Syntax
CREATE TABLE table_name (
  column1 datatype constraints,
  column2 datatype constraints,
  ...
);

-- Example
CREATE TABLE student
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL DEFAULT 'No Name',
  age INT,
  email VARCHAR(100) UNIQUE,
  admission_date DATE
);

-- Commonly Used Data Types

-- INT – Whole numbers (e.g., age, quantity)
-- VARCHAR(n) – Variable-length string (e.g., names, emails)
-- TEXT – Long text strings (e.g., descriptions)
-- DATE – Stores date values (YYYY-MM-DD)
-- DATETIME – Stores date and time values
-- BOOLEAN – Stores TRUE or FALSE

-- Common Constraints

-- PRIMARY KEY – Uniquely identifies each record
-- NOT NULL – Ensures the column cannot be left empty
-- UNIQUE – Ensures all values in a column are different
-- AUTO_INCREMENT – Automatically increases numeric values
-- DEFAULT – Sets a default value for the column
-- FOREIGN KEY – Enforces relationships between tables

-- View All Tables
SHOW TABLES;

-- View Table Structure
DESCRIBE students;
 

-- Viewing Table Data
SELECT * FROM students;