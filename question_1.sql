-- jitmik, Jitka M.
-- podotazka

SELECT 
	min (payroll_year) AS year_min,
	max (payroll_year) AS year_max
FROM t_jitka_mikulasova_project_SQL_primary_final;

SELECT	
	industry_name,
	payroll_year,
	avg (salary_CZK) AS average_salary_CZK  
FROM t_jitka_mikulasova_project_SQL_primary_final
WHERE value_type_code = '5958'
	AND industry_branch_code IN ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S')
	AND payroll_year BETWEEN  2006 AND 2018
GROUP BY industry_name,
	industry_branch_code,
	payroll_year 
ORDER BY industry_name, payroll_year;
