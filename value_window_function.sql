use employees;

SELECT 
    emp_no,
    salary,
    lag(salary) over w as previous_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as diff_salary_current_previous,
    lead(salary) over w - salary as diff_salary_current_next
FROM
    salaries
where emp_no=10001
window w as (order by salary desc);