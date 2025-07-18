-- 1. Basic Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

-- UPDATE: Specifies the table you want to modify.
-- SET: Assigns new values to columns.
-- WHERE: Filters which rows should be updated. Always include a WHERE clause unless you want to update all rows.

-- 2. Example Table
-- Assume the following student table:

-- id	name	age	grade
-- 1	Ayesha Khan	16	10th
-- 2	Ravi Sharma	17	11th
-- 3	Meena Joshi	15	9th

-- 3. Update a Single Row
-- Example: Change the grade of student with id = 2 to 12th
UPDATE student
SET grade = '12th'
WHERE id = 2;

-- 4. Update Multiple Columns
-- Example: Change age to 17 and grade to '10th' for id = 3
UPDATE student
SET age = 17, grade = '10th'
WHERE id = 3;

-- 5. Update All Rows
-- Example: Set all students to age 18
UPDATE student
SET age = 18;
-- *Warning: This will modify every row in the table.

-- 6. Conditional Update with Comparison Operators
-- Example: Promote all students in 9th grade to 10th grade
UPDATE student
SET grade = '10th'
WHERE grade = '9th';

-- Example: Increase age by 1 for students younger than 18
UPDATE student
SET age = age + 1
WHERE age < 18;

-- 7. Update Using IS NULL
-- Example: Set default grade to 'Unknown' where grade is NULL
UPDATE student
SET grade = 'Unknown'
WHERE grade IS NULL;

-- 8. Verify the Update
To check the results:

SELECT * FROM student;