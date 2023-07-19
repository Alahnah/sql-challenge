--employee salary table join
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--1986 hired employees
SELECT first_name, last_name, hire_date 
FROM employees
WHERE
	hire_date >= '1/1/1986'
	AND hire_date <= '12/31/1986';

--manager and employee info
SELECT department_manager.dept_no, departments.dept_name, employees.emp_no,employees.last_name, employees.first_name
FROM department_manager
JOIN departments 
ON department_manager.dept_no = departments.dept_no
JOIN employees
ON department_manager.emp_no = employees.emp_no;

--department number and employee info
SELECT department_employee.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employee
JOIN employees
ON department_employee.emp_no = employees.emp_no
JOIN departments
ON department_employee.dept_no = departments.dept_no;

--employee info of Hercules and last name w/ "B"
SELECT first_name, last_name, sex
FROM employees
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
--department of Sales and employee info
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employee
ON employees.emp_no = department_employee.emp_no
JOIN departments
ON department_employee.dept_no = departments.dept_no
WHERE 
	dept_name = 'Sales';
	
--Sales and Development department and employee info
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employee
ON employees.emp_no = department_employee.emp_no
JOIN departments
ON department_employee.dept_no = departments.dept_no
WHERE 
	dept_name = 'Sales'
	OR dept_name = 'Development';
	
--frequency count of last names
SELECT last_name, COUNT(last_name) AS "frequency count"
FROM employees
GROUP BY last_name
ORDER BY "frequency count" DESC;
