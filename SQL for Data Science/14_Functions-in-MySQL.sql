-- 1. CONCAT() – Join strings together
-- We are telling MySQL to combine two or more strings.

SELECT CONCAT('Hello', ' ', 'World') AS greeting;
-- Output: Hello World

-- You can also use it with columns:

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;

-- 2. NOW() – Get the current date and time
-- We are telling MySQL to give us the current date and time.

SELECT NOW();
-- Output: 2025-05-03 14:20:45 (example)

-- 3. LENGTH() – Find length of a string (in bytes)
SELECT LENGTH('Harry');
-- Output: 5

-- Useful for validations or checking string size.

-- 4. ROUND() – Round numbers to a specific number of decimal places
SELECT ROUND(12.6789, 2);
-- Output: 12.68

-- 5. DATEDIFF() – Difference between two dates (in days)
SELECT DATEDIFF('2025-06-01', '2025-05-01');
-- Output: 31

-- Comprehensive List of Useful MySQL Functions:

-- Function	         Description	                          Example Usage

-- CONCAT()	         Combine multiple strings	              CONCAT('A', 'B') → 'AB'
-- LENGTH()	         Length of a string (in bytes)	          LENGTH('Hi') → 2
-- CHAR_LENGTH()	 Number of characters in a string	      CHAR_LENGTH('हिंदी') → 5
-- LOWER()	         Convert string to lowercase	          LOWER('MySQL') → mysql
-- UPPER()	         Convert string to uppercase	          UPPER('hello') → HELLO
-- REPLACE()	     Replace part of a string	              REPLACE('abc', 'b', 'x') → axc
-- TRIM()	         Remove leading/trailing spaces	          TRIM('  hello  ') → hello
-- NOW()	         Current date and time	                  NOW()
-- CURDATE()	     Current date only	                      CURDATE()
-- CURTIME()	     Current time only	                      CURTIME()
-- DATE()	         Extract date from datetime	              DATE(NOW())
-- MONTHNAME()	     Get month name from date	              MONTHNAME('2025-05-03') → May
-- YEAR()	         Extract year from date	                  YEAR(NOW())
-- DAY()	         Extract day of month	                  DAY('2025-05-03') → 3
-- DATEDIFF()	     Days between two dates	                  DATEDIFF('2025-06-01', '2025-05-01')
-- ROUND()	         Round to decimal places	              ROUND(5.678, 2) → 5.68
-- FLOOR()	         Round down to nearest whole number	      FLOOR(5.9) → 5
-- CEIL()	         Round up to nearest whole number	      CEIL(5.1) → 6
-- ABS()	         Absolute value	                          ABS(-10) → 10
-- MOD()	         Get remainder	                          MOD(10, 3) → 1
-- RAND()	         Random decimal between 0 and 1	          RAND()
-- IFNULL()	         Replace NULL with a default value	      IFNULL(NULL, 'N/A') → N/A
-- COALESCE()	     Return first non-NULL value in a list	  COALESCE(NULL, '', 'Hello') → ''
-- COUNT()	         Count rows	                              COUNT(*)
-- AVG()	         Average of a numeric column	          AVG(score)
-- SUM()	         Total sum of values	                  SUM(score)
-- MIN()	         Smallest value	                          MIN(score)
-- MAX()	         Largest value	                          MAX(score)