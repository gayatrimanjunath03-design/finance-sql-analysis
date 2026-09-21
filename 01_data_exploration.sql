-- Finance SQL Analysis Project
-- File: 01_data_exploration.sql
-- Purpose: Basic SQL exploration and employee analysis


-- 1. View all employees
SELECT *
FROM employees;


-- 2. Select employee details
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees;


-- 3. Find employees earning above the average salary
SELECT
    first_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- 4. Find employees earning above their department average
SELECT
    first_name,
    department_id,
    salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);


-- 5. Find the employee(s) with the highest salary
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- 6. Extract the year an employee was hired
SELECT
    first_name,
    hire_date,
    strftime('%Y', hire_date) AS hire_year
FROM employees;


-- 7. Extract the month an employee was hired
SELECT
    first_name,
    hire_date,
    strftime('%m', hire_date) AS hire_month
FROM employees;


-- 8. Extract both year and month
SELECT
    first_name,
    hire_date,
    strftime('%Y', hire_date) AS hire_year,
    strftime('%m', hire_date) AS hire_month
FROM employees;
