

SELECT 
	payroll_year, 
	round(avg(salary_CZK),2) AS average_salary,
	food_name, 
	round(avg(food_price_CZK),2) AS average_food_price,
	price_measured_from, 
	round(avg(salary_CZK),2) / round(avg(food_price_CZK),2) AS price_unit 
FROM t_jitka_mikulasova_project_sql_primary_final tjmpspf 
WHERE food_name IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
	AND price_measured_from IN (2006,2018)
	AND payroll_year IN (2006,2018)
	AND value_type_code = 5958
GROUP BY food_name, payroll_year, price_measured_from; 	