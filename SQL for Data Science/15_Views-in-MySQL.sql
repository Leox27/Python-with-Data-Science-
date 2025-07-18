-- A View in MySQL is like a virtual table. It doesn’t store data by itself but instead shows data from one or more tables through a saved SQL query.

-- You can use a view just like a regular table: SELECT from it, filter it, join it, etc.

-- Why Use Views?
-- To simplify complex queries by giving them a name.
-- To hide sensitive columns from users.
-- To show only specific rows/columns from a table.
-- To reuse common query logic across your app or reports.

-- 1. Creating a View:
-- Let’s say you have an employees table with lots of details, 
-- but you only want to show public employee info (name, department, and salary).

CREATE VIEW public_employees AS
SELECT name, department, salary
FROM employees;

-- You’re telling MySQL:

-- “Create a view called public_employees that shows only name, department, and salary from the employees table.”

-- Using a View - Now you can query it like a normal table:

SELECT * FROM public_employees;

-- Or even apply filters:

SELECT * FROM public_employees
WHERE department = 'IT';

-- 2. Updating a View:
-- You can replace a view like this:

CREATE OR REPLACE VIEW public_employees AS
SELECT name, department
FROM employees;

-- 3. Dropping (Deleting) a View
DROP VIEW public_employees;

-- This removes the view from the database.

-- Notes:-
-- Views don’t store data. If the underlying table changes, the view reflects that automatically.
-- Not all views are updatable. Simple views usually are (like those selecting from one table without grouping or joins), 
-- but complex ones may not allow INSERT, UPDATE, or DELETE.
-- Views can make your queries cleaner and easier to maintain.

-- Example Use Case:
-- You have this query used 5 times across your app:

SELECT customer_id, name, total_orders, status
FROM customers
WHERE status = 'active' AND total_orders > 5;

-- Instead of repeating it, just create a view:

CREATE VIEW top_customers AS
SELECT customer_id, name, total_orders, status
FROM customers
WHERE status = 'active' AND total_orders > 5;

-- Now just do:

SELECT * FROM top_customers;