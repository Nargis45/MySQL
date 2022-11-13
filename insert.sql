USE employees;
insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date) values (999901, '1986-04-24', 'John', 'Smith', 'M', '2011-01-01');
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

CREATE TABLE department_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

insert into department_dup
(
dept_no,
dept_name
) select * from departments;

SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    department_dup;