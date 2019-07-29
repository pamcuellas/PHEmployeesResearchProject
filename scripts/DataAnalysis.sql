-- Data Analysis
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

-- 3. List the manager of each department with the following information: department number, department name, 
--    the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
	dep.dept_no,
	dep.dept_name,
	man.emp_no,   
	emp.last_name, 
	emp.first_name,
	man.from_date,
	man.to_date 
FROM dept_manager man
JOIN departments dep ON (man.dept_no = dep.dept_no)
JOIN employees   emp ON (man.emp_no  = emp.emp_no)
ORDER BY dep.dept_no, emp.last_name;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	demp.emp_no,   
	emp.last_name, 
	emp.first_name,
	dep.dept_name 
FROM dept_emp demp
JOIN departments dep ON (demp.dept_no = dep.dept_no)
JOIN employees   emp ON (demp.emp_no  = emp.emp_no)
ORDER BY dep.dept_name,emp.last_name,emp.first_name;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	emp.emp_no,   
	emp.last_name, 
	emp.first_name
FROM employees emp 
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%'
ORDER BY emp.last_name;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	demp.emp_no,   
	emp.last_name, 
	emp.first_name,
	dep.dept_name 
FROM departments dep
JOIN dept_emp  demp ON (dep.dept_no = demp.dept_no AND dep.dept_name = 'Sales')
JOIN employees emp  ON (demp.emp_no  = emp.emp_no)
ORDER BY emp.last_name,emp.first_name;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	demp.emp_no,   
	emp.last_name, 
	emp.first_name,
	dep.dept_name
FROM departments dep
JOIN dept_emp  demp ON (dep.dept_no = demp.dept_no AND dep.dept_name IN ('Sales','Development'))
JOIN employees emp  ON (demp.emp_no  = emp.emp_no)
ORDER BY emp.last_name,emp.first_name;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	emp.last_name, 
	COUNT(1) AS frequency_last_name
FROM employees emp 
GROUP BY emp.last_name 
ORDER BY frequency_last_name DESC;

