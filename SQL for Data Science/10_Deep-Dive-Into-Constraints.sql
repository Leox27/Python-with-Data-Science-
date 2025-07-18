-- 1. NOT NULL Constraint
-- Ensures that a column cannot contain NULL values.

CREATE TABLE employees (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Use Case:
-- Make sure critical fields like id, name, or email are always filled.

-- 2. UNIQUE Constraint
-- Ensures that all values in a column are distinct (no duplicates).

CREATE TABLE users (
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Use Case:
-- Prevent duplicate usernames or email addresses.
-- Note: A table can have multiple UNIQUE constraints, but only one PRIMARY KEY.

-- 3. DEFAULT Constraint
-- Sets a default value for a column if none is provided during insert.

CREATE TABLE products (
    name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'in_stock'
);

-- Use Case:
-- Auto-fill common values to reduce data entry effort and prevent missing data.

-- 4. CHECK Constraint
-- Validates that values in a column meet a specific condition.

CREATE TABLE accounts (
    id INT,
    balance DECIMAL(10,2) CHECK (balance >= 0)
);

-- Use Case:
-- Enforce business rules such as non-negative balances or valid age ranges.
-- Note: MySQL versions before 8.0 parsed CHECK but did not enforce it. 
-- From MySQL 8.0 onwards, CHECK constraints are enforced.

-- 5. Naming Constraints
-- You can give explicit names to constraints. 
-- This makes them easier to reference, especially when altering or dropping them later.

CREATE TABLE students (
    roll_no INT PRIMARY KEY,
    age INT CONSTRAINT chk_age CHECK (age >= 5),
    email VARCHAR(100) UNIQUE
);

-- Benefits of Named Constraints:
-- Improves clarity and debugging
-- Useful when using ALTER TABLE to drop constraints

-- 6. Constraint Recap Table
-- Constraint	Purpose	                           Enforced By MySQL	Custom Name Support
-- NOT NULL	    Disallow null values     	       Yes	                Yes
-- UNIQUE	    Disallow duplicate values	       Yes	                Yes
-- DEFAULT	    Set default value if none given	   Yes	                No
-- CHECK	    Enforce value conditions	       Yes (MySQL 8.0+)	    Yes