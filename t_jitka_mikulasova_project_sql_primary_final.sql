CREATE TABLE t_jitka_mikulasova_project_SQL_primary_final AS
SELECT  
	cpay.payroll_year,
	cpib.name AS industry_name,
	cpay.industry_branch_code, 
	avg(cpay.value) AS salary_CZK,
	cpay.value_type_code, 
	cpc.name AS food_name,
	cpc.code AS food_category,
	avg (cp.value) AS food_price_CZK,
	cpc.price_unit, 
	year(cp.date_from)AS price_measured_from     
FROM czechia_price AS cp
JOIN czechia_payroll AS cpay
    ON year(cp.date_from) = cpay.payroll_year 
LEFT JOIN czechia_price_category cpc
    ON cpc.code = cp.category_code	
LEFT JOIN czechia_payroll_industry_branch cpib
    ON cpib.code = cpay.industry_branch_code    
LEFT JOIN czechia_payroll_value_type cpvt 
	ON cpvt.code = cpay.value_type_code
GROUP BY cpay.payroll_year,
	industry_name,
	cpay.industry_branch_code,
	cpay.value_type_code,
	food_name,
	food_category,
	cpc.price_unit;
