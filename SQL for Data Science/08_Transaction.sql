-- What is a Transaction ?
-- A transaction is a sequence of one or more SQL statements that are executed as a single unit. 
-- A transaction has four key properties, known as ACID:

-- Atomicity: All or nothing.
-- Consistency: Valid state before and after.
-- Isolation: Transactions do not interfere.
-- Durability: Changes persist after commit.

-- AUTOCOMMIT:
-- By default, MySQL runs in autocommit mode. 
-- This means that every SQL statement is treated as a separate transaction and is committed automatically right after it is executed.

-- Check Autocommit Status
SELECT @@autocommit;

-- Disable Autocommit
SET autocommit = 0;

-- This allows you to group multiple statements into a transaction manually.

-- Enable Autocommit
SET autocommit = 1;

-- COMMIT
-- The COMMIT statement is used to permanently save all the changes made in the current transaction.

-- Example
START TRANSACTION;
 
UPDATE student SET age = age - 1 WHERE id = 1;
UPDATE student SET age = age + 1 WHERE id = 2;
 
COMMIT;

-- Once committed, the changes are visible to other sessions and are stored permanently in the database.

-- ROLLBACK
-- The ROLLBACK statement is used to undo changes made in the current transaction. It is useful if something goes wrong or a condition is not met.

-- Example
START TRANSACTION;
 
UPDATE student SET age = age - 1 WHERE id = 1;
UPDATE student SET age = age + 1 WHERE id = 2;
 
-- An error or condition check fails here
ROLLBACK;

-- After a rollback, all changes since the start of the transaction are discarded.

-- Summary Table
-- Statement	Description
-- AUTOCOMMIT	Automatically commits every query
-- SET autocommit = 0	Disables autocommit mode
-- COMMIT	Saves all changes in a transaction
-- ROLLBACK	Reverts all changes in a transaction