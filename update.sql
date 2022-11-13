USE employees;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Nargis',
    last_name = 'Nasreen',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    department_dup
ORDER BY dept_no;
    
commit;

UPDATE department_dup 
SET 
    dept_no = 'd009',
    dept_name = 'Quality Control';

Rollback;

commit;