-- 1. CURRENT_DATE
-- Returns the current date in YYYY-MM-DD format.

SELECT CURRENT_DATE;

-- Example Output:
2025-05-02

-- 2. CURRENT_TIME
-- Returns the current time in HH:MM:SS format.

SELECT CURRENT_TIME;

-- Example Output:
14:23:45

-- 3. CURRENT_TIMESTAMP (or NOW())
-- Returns the current date and time.

SELECT CURRENT_TIMESTAMP;
-- or
SELECT NOW();

-- Example Output:
2025-05-02 14:23:45
-- This is especially useful for storing creation or update times in records.

-- 4. LOCALTIME and LOCALTIMESTAMP
-- These are synonyms for NOW() and return the current date and time.

SELECT LOCALTIME;
SELECT LOCALTIMESTAMP;

-- These functions return the local date and time of the MySQL server, not the client's time zone.

-- Important Clarification:
-- The "local" in LOCALTIME refers to the time zone configured on the MySQL server, not the user's system.

-- You can check the current server time zone using:

-- 5. Using in Table Inserts
-- You can use NOW() or CURRENT_TIMESTAMP to auto-fill date-time columns.

USE school_1;

ALTER Table student ADD COLUMN joined_date DATETIME DEFAULT NOW();
INSERT INTO student (id, name, age, joined_date)
VALUES (27, "Mayur Jadhva", 21, NOW()), (41, "Suraj Lohar", 20, NOW());

Update student 
SET name = CASE 
        WHEN id = 27 THEN 'Mayur Jadhav'
        WHEN id = 41 THEN 'Suraj Lohar'
        ELSE name
    END,
SET email = CASE 
        WHEN id = 27 THEN 'mayur123@gmail.com'
        WHEN id = 41 THEN 'suraj123@gmail.com'
        ELSE email
    END,
    is_passed = CASE 
        WHEN id = 27 THEN 1
        WHEN id = 41 THEN 0
        ELSE is_passed
    END
WHERE id IN (27, 41);

SELECT * FROM student;

-- 6. Date and Time Functions Recap:
-- Function	            Returns	             Example Output
-- CURRENT_DATE	        Date only	         2025-05-02
-- CURRENT_TIME	        Time only	         14:23:45
-- NOW()	            Date and time      	 2025-05-02 14:23:45
-- CURRENT_TIMESTAMP	Date and time	     2025-05-02 14:23:45
-- LOCALTIME  	        Date and time	     2025-05-02 14:23:45