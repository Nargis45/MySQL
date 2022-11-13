Use employees;
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
        
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis', 'Mark', 'Elvis');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John', 'Mark', 'Jacob');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT 
    COUNT(first_name)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

SELECT 
    COUNT(*)
FROM
    dept_manager;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name ASC;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 200
ORDER BY names_count ASC;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

SELECT 
    *
FROM
    salaries;
    
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC
LIMIT 50;