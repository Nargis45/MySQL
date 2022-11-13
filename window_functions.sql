use employees;

SELECT 
    emp_no, salary
FROM
    salaries;
    
SELECT 
    emp_no, salary, row_number() over() as row_num
FROM
    salaries;
    
SELECT 
    emp_no, salary, row_number() over(order by salary desc) as row_num
FROM
    salaries;  
  
SELECT 
    emp_no, salary, row_number() over(partition by emp_no) as row_num
FROM
    salaries;    
    
SELECT 
    emp_no, salary, row_number() over(partition by emp_no order by salary desc) as row_num
FROM
    salaries;  
# this is making data look messy so we will apply relatable window function together.    
SELECT 
    emp_no, salary, 
    row_number() over() as row_num1,
    row_number() over(partition by emp_no) as row_num2,
    row_number() over(partition by emp_no order by salary desc) as row_num3,
    row_number() over(order by salary desc) as row_num4
FROM
    salaries
    order by emp_no, salary; 
    
SELECT 
    emp_no, salary, 
    row_number() over(partition by emp_no) as row_num2,
    row_number() over(partition by emp_no order by salary desc) as row_num3
FROM
    salaries; 
    
#same output wusing window clause
SELECT 
    emp_no, salary, row_number() over w as row_num
FROM
salaries
window w as (partition by emp_no order by salary desc); 

#using partition by and group by together(all will give same result)
select a.emp_no, max(salary) as max_salary from
(SELECT 
    emp_no, salary, row_number() over w as row_num
FROM
salaries
window w as (partition by emp_no order by salary desc)) as a
group by emp_no; 

select a.emp_no, max(salary) as max_salary from
(SELECT 
    emp_no, salary, row_number() over(partition by emp_no order by salary desc) as row_num
FROM
    salaries) a
    group by emp_no;  
    
select a.emp_no, max(salary) as max_salary from
(SELECT 
    emp_no, salary
FROM
    salaries) a
    group by emp_no;
    
select a.emp_no, a.salary as max_salary from
(SELECT 
    emp_no, salary, row_number() over w as row_num
FROM
salaries
window w as (partition by emp_no order by salary desc)) a
where a.row_num=1;

#to obtain second highest salary for each employee
select a.emp_no, a.salary as max_salary from
(SELECT 
    emp_no, salary, row_number() over w as row_num
FROM
salaries
window w as (partition by emp_no order by salary desc)) a
where a.row_num=2;

#rank() and dense_rank() window function:
#check how many employees sign the same contract more than once as their salary is going to be same
SELECT 
    emp_no, (COUNT(salary) - COUNT(DISTINCT salary)) AS diff
FROM
    salaries
GROUP BY emp_no
HAVING diff > 0
ORDER BY emp_no;

#in the o/p row 3 and 4 have same salary value so their rank should be same
SELECT 
    emp_no, salary, row_number() over w as row_num
FROM
    salaries
WHERE
    emp_no = 11839
window w as (partition by emp_no order by salary desc);

#using rank() to make it correct
#but in the o/p the value is not continuous, after 3,3 it's 5.
SELECT 
    emp_no, salary, rank() over w as rank_num
FROM
    salaries
WHERE
    emp_no = 11839
window w as (partition by emp_no order by salary desc);

#so we will use dense_rank() to make it correct
SELECT 
    emp_no, salary, dense_rank() over w as rank_num
FROM
    salaries
WHERE
    emp_no = 11839
window w as (partition by emp_no order by salary desc);


