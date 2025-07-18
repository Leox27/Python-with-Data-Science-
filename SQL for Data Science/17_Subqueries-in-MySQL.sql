-- What is a Subquery?
-- A subquery is enclosed in parentheses and returns data to be used by the outer query.

-- It can return:

-- A single value (scalar)
-- A row
-- A full table

-- 1. Subquery in the "WHERE" Clause:

-- Example: Employees who earn more than average

SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- We are telling MySQL: "First calculate the average salary, 
-- then return employees with salaries greater than that."

-- 2. Subquery in the "FROM" Clause:

-- Example: Department-wise average salary above 50,000

SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary FROM employees
    GROUP BY department
) AS dept_avg
WHERE avg_salary > 50000;

-- We are telling MySQL: "Create a temporary table of average salaries by department, 
-- then filter departments where the average is above 50,000."

-- 3. Subquery in the "SELECT" Clause:

-- Example: Count of projects per employee

SELECT name,
       (SELECT COUNT(*) FROM projects WHERE projects.employee_id = employees.id) 
       AS project_count
FROM employees;

-- This gives each employee along with the number of projects they are assigned to.

-- 4. Correlated Subqueries:
-- A correlated subquery depends on the outer query. It runs once for each row in the outer query.

-- Example: Employee earning more than department's average

SELECT name, department, salary FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- We are telling MySQL: "For each employee, compare their salary with the average salary of their department."

-- 5. Types of Subqueries:

-- Type	              Description

-- Scalar Subquery	  Returns a single value
-- Row Subquery	      Returns one row with multiple columns
-- Table Subquery	  Returns multiple rows and columns

-- Correlated Subquery	Refers to the outer query inside the subquery

-- 6. When to Use Subqueries:

-- When your logic depends on calculated values (like averages or counts)
-- When you need to filter based on dynamic conditions
-- When you're breaking down complex queries for readability

-- 7. When to Avoid Subqueries:

-- When the same result can be achieved with a JOIN, which is often faster
-- When the subquery is being executed repeatedly for every row (correlated subqueries on large tables)

-- Summary:

-- Clause	   Use Case

-- WHERE	   Filter based on the result of a subquery
-- FROM	Use    a subquery as a derived table
-- SELECT	   Add related calculations inline

-- Subqueries are powerful for solving multi-step problems and isolating logic, 
-- but be mindful of performance when working with large data sets.