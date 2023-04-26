

CREATE TABLE departments (
  	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
  	dept_name VARCHAR NOT NULL
);

CREATE TABLE titles (
  	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
  	title VARCHAR NOT NULL
);

CREATE TABLE employees (
  	emp_no INTEGER NOT NULL PRIMARY KEY,
  	emp_title_id VARCHAR(5) NOT NULL,
  	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
  	birth_date VARCHAR NOT NULL,
  	first_name VARCHAR NOT NULL,
  	last_name VARCHAR NOT NULL,
	sex CHAR NOT NULL,
	hire_date VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),	
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
)

