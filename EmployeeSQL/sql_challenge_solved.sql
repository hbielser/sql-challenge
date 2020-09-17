-- List the following details of each employee: employee number, last name, first name, sex, and salary.
--JOIN on employees and salaries by emp_no

SELECT emp.emp_no as "Emp #", emp.last_name as "Last", emp.first_name as "First", emp.sex as "Sex", sal.salary as "Salary" 
	FROM employees 
	AS emp 
	JOIN salaries 
	AS sal
	ON emp.emp_no = sal.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name as "First", emp.last_name as "Last", emp.hire_date as "Hire Date"
	FROM employees
	AS emp
	WHERE emp.hire_date between '1/1/1986' and '12/31/1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_mgr.dept_no, dept.dept_name, dept_mgr.emp_no, emp.first_name, emp.last_name
	FROM dept_manager 
	AS dept_mgr
	JOIN "Departments"
	AS dept
	ON dept_mgr.dept_no = dept.dept_no
	JOIN "employees"
	AS emp
	ON dept_mgr.emp_no = emp.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
-- Observation: Some employees are assigned to more than one department
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
	FROM employees
	AS emp
	JOIN "dept_emp"
	ON dept_emp.emp_no = emp.emp_no
	JOIN "Departments"
	AS dept
	on dept_emp.dept_no = dept.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.first_name, emp.last_name, emp.sex
	FROM employees 
	AS emp
	WHERE emp.first_name = 'Hercules'
	AND emp.last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
	FROM "Departments"
	AS dept
	JOIN "dept_emp"
	ON dept_emp.dept_no = dept.dept_no
	JOIN "employees"
	AS emp
	ON emp.emp_no = dept_emp.emp_no
	WHERE dept.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.