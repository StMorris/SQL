/*
yearly average salary for each department and gender before 2002
*/

USE employees_mod;


SELECT year(s.from_date) as calender_year,
		ee.gender,
		d.dept_name,
        round(avg(s.salary), 2) as average_salary
        
FROM
	t_salaries s
JOIN
	t_employees ee on ee.emp_no = s.emp_no
JOIN
	t_dept_emp de on de.emp_no = s.emp_no
JOIN
	t_departments d on d.dept_no = de.dept_no
GROUP BY calender_year, ee.gender, d.dept_name
HAVING calender_year <= 2002
ORDER BY calender_year, d.dept_name, ee.gender;






	
	
        

