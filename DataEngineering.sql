CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	CONSTRAINT PK_departments PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

CREATE TABLE department_employee (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL
);

SELECT * FROM department_employee;

CREATE TABLE department_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL
);

SELECT * FROM department_manager;


CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title VARCHAR(30) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date date NOT NULL,
	CONSTRAINT PK_employees PRIMARY KEY (emp_no)
);
	
SELECT * FROM employees;

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL
);

SELECT * FROM salaries;

CREATE TABLE titles (
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	CONSTRAINT PK_titles PRIMARY KEY (title_id)
);

SELECT * FROM titles;

--altering tables w/ proper fk 

ALTER TABLE department_employee ADD CONSTRAINT fk_emp_no fOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE department_employee ADD CONSTRAINT fk_dept_no fOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager ADD CONSTRAINT fk_dept_man_emp_no fOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager ADD CONSTRAINT fk_dept_man_dept_no fOREIGN KEY (emp_no)
REFERENCES employees (emp_no);


ALTER TABLE employees ADD CONSTRAINT fk_emp_title_id fOREIGN KEY (title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salary_emp_no fOREIGN KEY (emp_no)
REFERENCES employees (emp_no);
