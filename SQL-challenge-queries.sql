-- QUERIES
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.emp_no,
	employees.last_name AS manager_last_name,
	employees.first_name AS manager_first_name,
	departments.dept_no,
	departments.dept_name
FROM employees
JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
JOIN departments ON
departments.dept_no = dept_manager.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
JOIN  employees ON
employees.emp_no = dept_emp.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name,
	first_name,
	sex
FROM employees
WHERE (first_name = 'Hercules' AND last_name LIKE 'B%');

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
JOIN  employees ON
employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
JOIN  employees ON
employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name ='Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS total_employees
FROM employees
GROUP BY last_name
ORDER BY total_employees desc;

-- "Search your ID number." Your employee ID number is 499942
SELECT * 
FROM employees
WHERE emp_no = 499942;
