-- Data Analysis
-- 
-- Once you have a complete database, do the following:
-- 
-- 
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	emp.gender, 
	sal.salary
FROM employees emp
JOIN salaries sal ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- 2. List employees who were hired in 1986.
SELECT 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name,
	emp.hire_date
FROM employees emp
WHERE TO_CHAR(emp.hire_date,'YYYY') = '1986'
ORDER BY emp.hire_date; 

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.



select * from dept_emp;
select * from  dept_manager;
select * from  salaries;
select * from  departments;
select * from  employees;



