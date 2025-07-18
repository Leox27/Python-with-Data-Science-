-- The UNION operator is used to combine the result sets of two or more SELECT statements into a single result.

-- It helps when:

-- You're pulling similar data from different tables.
-- You want to merge results from multiple queries into one list.

-- 1. When UNION Works:
-- Same number of columns in all SELECT statements.
-- Compatible data types in corresponding columns.
-- Columns will be matched by position, not by name.
SELECT name, city FROM customers
UNION
SELECT name, city FROM vendors;

-- This combines names and cities from both tables into a single result.

-- 2. When UNION Doesn't Work:
-- If the number of columns is different:
-- -- This will throw an error
SELECT name, city FROM customers
UNION
SELECT name FROM vendors;

-- If the data types don’t match:
-- Error if 'age' is an integer and 'name' is a string
SELECT age FROM users
UNION
SELECT name FROM students;

-- MySQL will complain that the columns can't be matched due to type mismatch.

-- 3. UNION vs UNION ALL:
-- By default, UNION removes duplicate rows. If you want to keep duplicates, use UNION ALL:

SELECT name FROM students
UNION ALL
SELECT name FROM alumni;

-- Use UNION if:
-- You want a clean list without duplicates.

-- Use UNION ALL if:
-- You want performance and don’t care about duplicates.
-- Or you expect duplicate values and want to preserve them.

-- 4. Practical Use Case Example:
-- Let’s say you have two tables: students_2023 and students_2024.

SELECT name, batch FROM students_2023
UNION
SELECT name, batch FROM students_2024;

-- This gives a combined list of all students across both years, without duplicates.

-- 5. Sorting the Combined Result
-- You can sort the final output using ORDER BY at the end:

SELECT name FROM students_2023
UNION
SELECT name FROM students_2024
ORDER BY name;