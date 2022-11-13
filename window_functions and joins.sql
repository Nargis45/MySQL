use employees;

select 
d.dept_no,
d.dept_name, 
dm.emp_no,
rank() over w as dept_salary_ranking,
s.salary,
s.from_date as salary_from_date,
s.to_date as salary_to_date,
dm.from_date as dept_manager_to_date,
dm.to_date as dept_manager_to_date
from 
dept_manager dm 
join 
salaries s on dm.emp_no=s.emp_no
and s.from_date between dm.from_date and dm.to_date
and s.to_date between dm.from_date and dm.to_date
join 
departments d on d.dept_no=dm.dept_no
window w as (partition by dm.dept_no order by s.salary desc);