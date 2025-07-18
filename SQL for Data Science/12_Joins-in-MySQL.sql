-- 1. INNER JOIN
-- We are telling MySQL to include only the rows that have matching values in both tables.

SELECT students.name, marks.subject, marks.score
FROM students INNER JOIN marks 
ON students.id = marks.student_id;

-- This will show only students who have marks recorded. If a student has no marks, they will not appear in the result.

-- 2. LEFT JOIN (or LEFT OUTER JOIN)
-- We are telling MySQL to include all students, even if they don't have any marks. 
-- If there's no match in the marks table, it will show NULL.

SELECT students.name, marks.subject, marks.score
FROM students LEFT JOIN marks 
ON students.id = marks.student_id;

-- This is useful when we want to list all students, and show marks only if available.

-- 3. RIGHT JOIN (or RIGHT OUTER JOIN)
-- We are telling MySQL to include all rows from the right table (marks), 
-- even if the student is missing from the students table.

SELECT students.name, marks.subject, marks.score
FROM students RIGHT JOIN marks 
ON students.id = marks.student_id;

-- This is rarely used unless we expect some marks that don’t have a student record.

-- 4. CROSS JOIN
-- We are telling MySQL to combine every row in the first table with every row in the second table.

SELECT students.name, marks.subject
FROM students
CROSS JOIN marks;

-- Use this only when you really want all combinations – it can produce a lot of rows.

-- Summary:

-- Join Type	What it does ?

-- INNER JOIN	Only rows with a match in both tables
-- LEFT JOIN	All rows from the left table, with matched data if any
-- RIGHT JOIN	All rows from the right table, with matched data if any
-- CROSS JOIN	All combinations of rows from both tables