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
--Observation: most departments have more than one manager
SELECT dept_mgr.dept_no AS "Dept Mgr", dept.dept_name AS "Dept Name", dept_mgr.emp_no AS "Emp #", emp.first_name AS "First", emp.last_name AS "Last"
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
SELECT emp.emp_no AS "Emp #", emp.last_name AS "Last", emp.first_name AS "First", dept.dept_name AS "Dept Name"
	FROM employees
	AS emp
	JOIN "dept_emp"
	ON dept_emp.emp_no = emp.emp_no
	JOIN "Departments"
	AS dept
	on dept_emp.dept_no = dept.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.first_name AS "First", emp.last_name AS "Last", emp.sex AS "Sex"
	FROM employees 
	AS emp
	WHERE emp.first_name = 'Hercules'
	AND emp.last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no AS "Emp #", emp.last_name AS "Last", emp.first_name AS "First", dept.dept_name AS "Dept Name"
	FROM "Departments"
	AS dept
	JOIN "dept_emp"
	ON dept_emp.dept_no = dept.dept_no
	JOIN "employees"
	AS emp
	ON emp.emp_no = dept_emp.emp_no
	WHERE dept.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no AS "Emp #", emp.last_name AS "Last", emp.first_name AS "First", dept.dept_name AS "Dept Name"
	FROM "Departments"
	AS dept
	JOIN "dept_emp"
	ON dept_emp.dept_no = dept.dept_no
	JOIN "employees"
	AS emp
	ON emp.emp_no = dept_emp.emp_no
	WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--https://www.itsupportguides.com/knowledge-base/sql-server/sql-how-to-count-unique-values-in-database/
SELECT DISTINCT emp.last_name AS "Last", COUNT(emp.last_name) AS "Count"
	FROM "employees"
	AS emp
	GROUP BY emp.last_name
	ORDER BY emp.last_name desc;
	
--Epilogue
SELECT emp.emp_no AS "Emp #", emp.last_name AS "Last", emp.first_name AS "First", dept.dept_name AS "Dept Name"
	FROM "Departments"
	AS dept
	JOIN "dept_emp"
	ON dept_emp.dept_no = dept.dept_no
	JOIN "employees"
	AS emp
	ON emp.emp_no = dept_emp.emp_no
	WHERE emp.emp_no = '499942';
	