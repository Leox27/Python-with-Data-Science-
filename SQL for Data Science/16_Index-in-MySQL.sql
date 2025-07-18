-- An index in MySQL is a data structure that makes data retrieval faster—especially 
-- when you're using WHERE, JOIN, ORDER BY, or searching large tables.

-- Think of an index like the index in a book: instead of reading every page, 
-- MySQL uses the index to jump straight to the relevant row(s).

-- Why Use Indexes?
-- Speed up queries that search, filter, or sort data.
-- Improve performance for frequent lookups or joins.
-- Enhance scalability of your database over time.
-- How to Create an Index

-- 1. Single Column Index
CREATE INDEX idx_email ON users(email);

-- You're telling MySQL:

-- "Create a quick lookup structure for the email column in the users table."

-- 2. Multi-column (Composite) Index
CREATE INDEX idx_name_city ON users(name, city);

-- This is useful when your query filters on both name and city in that specific order.

-- How to Delete (Drop) an Index
DROP INDEX idx_email ON users;

-- You're saying:

-- "Remove the index named idx_email from the users table."

-- 3. When to Use Indexes
-- Use indexes when:

-- A column is often used in WHERE, JOIN, or ORDER BY clauses.
-- You're searching by unique fields like email, username, or ID.
-- You're filtering large tables for specific values regularly.
-- You want to improve performance of lookups and joins.

-- 4. When Not to Use Indexes
-- Avoid adding indexes when:

-- The table is small (MySQL can scan it quickly anyway).
-- The column is rarely used in searches or filtering.
-- You're indexing a column with very few unique values (like a gender field with just 'M' and 'F').
-- You’re inserting or updating very frequently—indexes can slow down writes because they also need to be updated.
-- Viewing Existing Indexes

-- To list all indexes on a table:

SHOW INDEX FROM users;

-- Summary -

-- Action	        Syntax Example
-- Create index	    CREATE INDEX idx_name ON table(column);
-- Delete index	    DROP INDEX idx_name ON table;
-- List indexes	    SHOW INDEX FROM table;

-- Indexes are essential for performance, 
-- but overusing them or indexing the wrong columns can actually hurt performance. 
-- Use them wisely based on how your data is queried.

