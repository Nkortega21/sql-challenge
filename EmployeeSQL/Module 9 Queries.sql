--List the employee number, last name, first name, sex, and salary of each employee.
select 
employees.emp_no as "Employee Number", 
employees.last_name as "Last Name", 
employees.first_name as "First Name", 
sex as "Sex",
salary as "Salary"
from employees
inner join salaries
on employees.emp_no = salaries.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986
select 
last_name as "Last Name", 
first_name as "First Name", 
hire_date
from employees
where extract(year from hire_date) = 1986;

--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name
select 
dept_manager.dept_no as "Department Number", 
departments.dept_name as "Department Name", 
employees.emp_no as "Employee Number", 
employees.last_name as "Last Name", 
employees.first_name as "First Name"
from dept_manager
join departments
on dept_manager.dept_no = departments.dept_no
join employees
on dept_manager.emp_no = employees.emp_no

--List the department number for each employee
--along with that employee’s employee number, last name, first name, and department name
select 
departments.dept_no as "Department Number", 
dept_emp.emp_no as "Employee Number",
employees.last_name as "Last Name", 
employees.first_name as "First Name",
departments.dept_name as "Department Name"
from dept_emp 
Join departments
on dept_emp.dept_no = departments.dept_no
Join employees
on dept_emp.emp_no = employees.emp_no

--List first name, last name, and sex of each employee whose
--first name is Hercules and whose last name begins with the letter B
select
employees.first_name as "First Name",
employees.last_name as "Last Name",
employees.sex as "Sex"
from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
select 
departments.dept_name as "Department Name",
dept_emp.emp_no as "Employee Number",
employees.last_name as "Last Name", 
employees.first_name as "First Name"
from dept_emp
Join departments on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no
Where departments.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their
--employee number, last name, first name, and department name
select 
dept_emp.emp_no as "Employee Number",
employees.last_name as "Last Name", 
employees.first_name as "First Name",
departments.dept_name as "Department Name"
from dept_emp
Join departments on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no
Where departments.dept_name = 'Sales' or departments.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)
select 
last_name as "Last Names", 
count(last_name) as "Shared Last Name"
from employees
group by last_name
order by 2 desc