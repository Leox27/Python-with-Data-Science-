-- 1. Create a Database
CREATE DATABASE school;
USE school;

-- 2. Create Tables
-- We'll create two tables:

-- students
-- classes
-- Each student will belong to a class, creating a one-to-many relationship (one class has many students).

Create classes Table
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL
);

Create students Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    class_id_of_student INT,
    FOREIGN KEY (class_id_of_student) REFERENCES classes(class_id) --Foreign Key here...
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- 3. Insert Sample Data
-- Insert into classes
INSERT INTO classes (class_name) VALUES ('Mathematics'), ('Science'), ('History');

-- Insert into students
INSERT INTO students (student_name, class_id) VALUES 
('Alice', 1),
('Bob', 2),
('Charlie', 1);

-- 4. Explanation of Foreign Key Behavior:
-- In the students table:

-- class_id is a foreign key.
-- It references 'class_id' in the classes table.
-- ON DELETE SET NULL: If a class is deleted, the related students will have class_id set to NULL.
-- ON UPDATE CASCADE: If a class ID changes, it will update automatically in the students table.

-- 5. View the Relationships:
-- To check the foreign key constraints:

SHOW CREATE TABLE students;

-- To see all foreign keys in the current database:

SELECT 
    table_name, 
    column_name, 
    constraint_name, 
    referenced_table_name, 
    referenced_column_name
FROM 
    information_schema.key_column_usage
WHERE 
    referenced_table_name IS NOT NULL
    AND table_schema = 'school';

-- Understanding ON UPDATE CASCADE and ON DELETE SET NULL
-- When you define a foreign key in MySQL, 
-- you can specify what should happen to the child table 
-- when the parent table is updated or deleted. These are called referential actions.

-- 1. ON UPDATE CASCADE -
-- Definition: If the value in the parent table (i.e., the referenced column) is updated, 
--             the corresponding foreign key value in the child table is automatically updated to match.

-- Example: Suppose we update a class_id in the classes table:

UPDATE classes SET class_id = 10 WHERE class_id = 1;

-- Then all students in the students table whose class_id was 1 will automatically be updated to 10.

-- 2. ON DELETE SET NULL -
-- Definition: If a row in the parent table is deleted, 
--             the foreign key in the child table will be set to NULL for all matching rows.

-- Example: If we delete a class from the classes table:

DELETE FROM classes WHERE class_id = 2;

-- Then all students in the students table who were in class 2 will have their class_id set to NULL, 
-- indicating that they are no longer assigned to a class.