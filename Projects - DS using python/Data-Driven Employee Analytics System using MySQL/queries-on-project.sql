-- 2. SAMPLE QUERIES

-- 2.1 Top 3 performers by department
SELECT 
    e.first_name, e.last_name, d.dept_name, AVG(p.rating) AS avg_rating
FROM employees e
JOIN performance_reviews p ON e.emp_id = p.emp_id
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY e.emp_id, d.dept_name
ORDER BY avg_rating DESC
LIMIT 3

-- 2.2 Department with highest average salary
SELECT 
    d.dept_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC
LIMIT 1;

-- 2.3 Employee turnover greater than 5 years
SELECT 
    first_name, last_name, hire_date,
    ROUND(DATEDIFF(CURDATE(), hire_date) / 365, 0) AS turnover_years
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) / 365 > 5;

-- 2.4 Employees who worked on more than 2 projects
SELECT 
    emp_id, COUNT(project_id) AS project_count
FROM employee_projects
GROUP BY emp_id
HAVING project_count > 1;

-- 2.5 Monthly hiring trend
SELECT 
    MONTH(recruited_on) AS month, COUNT(*) AS hires
FROM recruitment
GROUP BY MONTH(recruited_on)
ORDER BY month;

-- =========================
-- 3. TRIGGER EXAMPLE
-- =========================

DELIMITER //

CREATE TRIGGER trg_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
  IF OLD.salary <> NEW.salary THEN
    INSERT INTO audit_log(emp_id, change_type)
    VALUES (NEW.emp_id, 'Salary Updated');
  END IF;
END; //

DELIMITER ;

SELECT * FROM employees;

-- =========================
-- 4. VIEW FOR HR DASHBOARD
-- =========================

CREATE VIEW hr_summary AS
SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS avg_salary,
    SUM(CASE WHEN e.is_active THEN 1 ELSE 0 END) AS active_employees
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- =========================
-- 5. PROCEDURE TO PROMOTE
-- =========================

DELIMITER //

CREATE PROCEDURE promote_employee(IN empId INT, IN newSalary DECIMAL(10,2))
BEGIN
  UPDATE employees SET salary = newSalary WHERE emp_id = empId;

  INSERT INTO salaries(emp_id, salary, updated_on)
  VALUES (empId, newSalary, CURDATE());
END;
//

DELIMITER ;
