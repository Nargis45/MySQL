use employees;
drop procedure if exists select_employees;

delimiter $$
create procedure select_employees()
begin 
select * from employees limit 1000;
end $$
delimiter ;

call employees.select_employees();
call select_employees();

drop procedure if exists emp_salary;
delimiter $$
create procedure emp_salary(in p_emp_no integer)
begin
select e.first_name, e.last_name, s.salary, s.from_date, s.to_date 
from employees e 
join salaries s on e.emp_no=s.emp_no 
where e.emp_no=p_emp_no;
end $$
delimiter ;

call employees.emp_salary(10026);

drop procedure if exists emp_avg_salary;
delimiter $$
create procedure emp_avg_salary(in p_emp_no integer)
begin
select e.first_name, e.last_name, avg(s.salary)
from employees e 
join salaries s on e.emp_no=s.emp_no 
where e.emp_no=p_emp_no;
end $$
delimiter ;

call emp_avg_salary(10026);

drop procedure if exists emp_avg_salary_out;
delimiter $$
create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
begin
select avg(s.salary)
into p_avg_salary
from employees e 
join salaries s on e.emp_no=s.emp_no 
where e.emp_no=p_emp_no;
end $$
delimiter ;

set @p_avg_salary = 0;
call employees.emp_avg_salary_out(10026, @p_avg_salary);
select @p_avg_salary;

set @output = 0;
call employees.emp_avg_salary_out(10026, @output);
select @output;

drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary(p_emp_no integer) returns decimal(10,2)
deterministic
begin
declare v_avg_salary decimal(10,2);
select avg(s.salary)
into v_avg_salary
from employees e 
join salaries s on e.emp_no=s.emp_no 
where e.emp_no=p_emp_no;
return v_avg_salary;
end $$
delimiter ;

select employees.f_emp_avg_salary(10029);

set @v_emp_no=10029;
select emp_no, first_name, last_name, f_emp_avg_salary(@v_emp_no) as avg_salary from employees where emp_no=@v_emp_no;