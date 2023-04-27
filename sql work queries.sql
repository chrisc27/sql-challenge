
-- List the employee number, last name, first name, sex, and salary of each employee 
SELECT employees.emp_no
	, last_name
	, first_name
	, sex
	, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT first_name
	, last_name
	, hire_date
FROM employees
WHERE hire_date LIKE '%1986';   
   
-- List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name 
SELECT dm.dept_no
	, dept_name
	, dm.emp_no
	, last_name
	, first_name
FROM departments AS dt 
JOIN dept_manager AS dm ON dt.dept_no = dm.dept_no
JOIN employees AS ep ON dm.emp_no = ep.emp_no;
	
-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name 
SELECT de.dept_no
	, de.emp_no
	, last_name
	, first_name
	, dept_name
FROM dept_emp AS de
JOIN employees AS ep ON de.emp_no = ep.emp_no
JOIN departments AS dt ON dt.dept_no = de.dept_no;    
	
-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B 
SELECT first_name
	, last_name
	, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';  

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT dept_name
	, de.emp_no
	, last_name
	, first_name
FROM dept_emp AS de
JOIN employees AS ep ON de.emp_no = ep.emp_no
JOIN departments AS dt ON dt.dept_no = de.dept_no
WHERE dept_name = 'Sales';    
  
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name (4 points)
SELECT de.emp_no
	, last_name
	, first_name
	, dept_name
FROM dept_emp AS de
JOIN employees AS ep ON de.emp_no = ep.emp_no
JOIN departments AS dt ON dt.dept_no = de.dept_no
WHERE de.emp_no IN (
	SELECT emp_no
	FROM dept_emp
	JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name = 'Sales'    
) AND de.emp_no IN (
	SELECT emp_no
	FROM dept_emp
	JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name = 'Development'
);

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name) (4 points)
SELECT last_name, count(last_name) as last_name_freq
FROM employees
GROUP BY last_name
ORDER BY last_name_freq DESC;