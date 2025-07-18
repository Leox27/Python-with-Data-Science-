-- 1. Basic Syntax
DELETE FROM table_name
WHERE condition;

-- DELETE FROM: Specifies the table from which to remove rows.
-- WHERE: Filters which rows should be deleted.
-- Important: If you omit the WHERE clause, all rows in the table will be deleted.

-- 2. Example Table
-- Assume the following student table:

-- id	name	age	grade
-- 1	Ayesha Khan	16	10th
-- 2	Ravi Sharma	17	12th
-- 3	Meena Joshi	15	9th

-- 3. Delete a Specific Row
-- Example: Delete student with id = 2
DELETE FROM student
WHERE id = 2;

-- 4. Delete Rows Based on a Condition
-- Example: Delete all students in 9th grade
DELETE FROM student
WHERE grade = '9th';

-- 5. Delete Rows Using Comparison Operators
-- Example: Delete all students younger than 16
DELETE FROM student
WHERE age < 16;

-- 6. Delete Rows Where a Column is NULL
-- Example: Delete students with no grade assigned
DELETE FROM student
WHERE grade IS NULL;

-- 7. Delete All Rows (Use with Caution)
-- Example: Remove all data from the student table
DELETE FROM student;

-- This deletes all rows but retains the table structure.

-- 8. Completely Remove the Table
-- To delete the table itself (not just the data), use:

DROP TABLE student;