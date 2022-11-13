use employees;
select * from dept_emp;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS num
FROM
    dept_emp
GROUP BY emp_no
HAVING num > 1;

SELECT 
    emp_no, MAX(from_date), MAX(to_date)
FROM
    dept_emp
GROUP BY emp_no;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date), MAX(to_date)
    FROM
        dept_emp
    GROUP BY emp_no;
    
select * from employees.v_dept_emp_latest_date; # like a function