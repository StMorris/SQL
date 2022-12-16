/*
no of active male and female managers from different 
departments each year, starting from 1990
*/

USE employees_mod;


SELECT d.dept_name, 
		ee.gender, 
        dm.emp_no, 
        dm.from_date, 
        dm.to_date, 
        e.calender_year,
	CASE
    -- check that the employee is still active
		WHEN YEAR(to_date) >= calender_year AND YEAR(from_date) <= calender_year THEN 1
        ELSE 0
	END as active

FROM
	(SELECT year(hire_date) as calender_year
	FROM t_employees
	GROUP BY calender_year) e
CROSS JOIN 
	t_dept_manager dm
JOIN
	t_departments d on dm.dept_no = d.dept_no
JOIN
	t_employees ee on dm.emp_no = ee.emp_no
ORDER BY ee.emp_no, e.calender_year;
	
