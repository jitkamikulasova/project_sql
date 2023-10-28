CREATE TABLE t_question_4 AS
SELECT
	tjmpspf.food_name, 
	round(avg(tjmpspf.food_price_CZK),2) AS food_price_past,
	round(avg(tjmpspf2.food_price_CZK),2) AS food_price_next,
	tjmpspf.price_measured_from  AS year_past,
	tjmpspf2.price_measured_from AS year_next,
	tjmpspf.industry_name, 
	round(avg(tjmpspf.salary_CZK),2)  AS salary_past,
	round(avg(tjmpspf2.salary_CZK),2)  AS salary_next
FROM t_jitka_mikulasova_project_sql_primary_final tjmpspf 
JOIN t_jitka_mikulasova_project_sql_primary_final tjmpspf2
 	ON tjmpspf2.price_measured_from = tjmpspf.price_measured_from  + 1
 	AND tjmpspf2.food_name = tjmpspf.food_name
 	AND tjmpspf2.industry_name = tjmpspf.industry_name  
WHERE tjmpspf2.value_type_code = 5958
GROUP BY tjmpspf.food_name, 
	year_past, 
	year_next,
	tjmpspf.industry_name
ORDER BY year_past;


CREATE TABLE t_question_4a AS 
SELECT 
	food_name, 
	year_past,
	year_next,	
	round((food_price_next  - food_price_past)  / food_price_past  * 100,2)  AS food_growth_percent,
	industry_name, 
	round((salary_past - salary_next) / salary_past *100,2) AS salary_growth_percent
FROM t_question_4 tq
GROUP BY food_name,
	industry_name, 
	year_past,
	year_next;
	
 
SELECT
	food_name,  
	year_past,
	year_next, 
	food_growth_percent, 
	salary_growth_percent, 
	(food_growth_percent) - (salary_growth_percent) AS difference
FROM t_question_4a tqa
WHERE (food_growth_percent) - (salary_growth_percent) > 10
ORDER BY difference DESC;