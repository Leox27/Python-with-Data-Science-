-- Basic SELECT Statement
SELECT * FROM student;

-- Using the WHERE Clause

-- Example: Students in 10th grade
SELECT * FROM student WHERE grade = '10th';

-- Example: Students older than 16
SELECT * FROM student WHERE age > 16;

-- Comparison Operators in MySQL

-- Operator	Description	Example:
-- =	Equals	WHERE age = 16
-- !=	Not equal to	WHERE grade != '12th'
-- <>	Not equal to (alternative)	WHERE grade <> '12th'
-- >	Greater than	WHERE age > 16
-- <	Less than	WHERE age < 17
-- >=	Greater than or equal to	WHERE age >= 16
-- <=	Less than or equal to	WHERE age <= 18

-- BETWEEN	   Within a range (inclusive)	WHERE age BETWEEN 15 AND 17
-- IN	       Matches any in a list	    WHERE grade IN ('10th', '12th')
-- NOT IN	   Excludes list items	        WHERE grade NOT IN ('9th', '11th')
-- LIKE	       Pattern matching	            WHERE name LIKE 'A%' (names starting with A)
-- NOT LIKE	   Pattern not matching	        WHERE name NOT LIKE '%a' (names not ending in a)

-- Handling NULL Values:

-- What is NULL?
-- NULL represents missing or unknown values. It is not equal to 0, empty string, or any other value.

-- Common Mistake (Incorrect):
-- -- This will not work as expected
-- SELECT * FROM student WHERE grade = NULL;

-- Correct Ways to Handle NULL:

-- Condition	Correct Syntax
-- Is NULL	    WHERE grade IS NULL
-- Is NOT NULL	WHERE grade IS NOT NULL

-- Example: Select students with no grade assigned
SELECT * FROM student WHERE grade IS NULL;

-- Example: Select students who have a grade
SELECT * FROM student WHERE grade IS NOT NULL;

-- Combining Conditions:
-- You can use AND, OR, and parentheses to combine conditions.

-- Example: Students in 10th grade and older than 16
SELECT * FROM student WHERE grade = '10th' AND age > 16;

-- Example: Students in 9th or 12th grade
SELECT * FROM student WHERE grade = '9th' OR grade = '12th';

-- Example: Complex conditions
SELECT * FROM student 
WHERE (grade = '10th' OR grade = '11th') AND age >= 16;

-- Sorting Results with ORDER BY-13_

-- Sort by age in ascending order:
SELECT * FROM student ORDER BY age ASC;

-- Sort by name in descending order:
SELECT * FROM student ORDER BY name DESC;

-- Limiting Results with LIMIT:

-- Get only 5 rows:
SELECT * FROM student LIMIT 5;

-- Get 5 rows starting from the 3rd (offset 2):
SELECT * FROM student LIMIT 2, 5;