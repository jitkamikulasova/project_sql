
CREATE TABLE t_question_five AS 
SELECT 
	tjmpssf.country, 
	tjmpssf2.GDP AS GDP_previous,
	tjmpssf.GDP AS GDP_next,
	tjmpssf2.`year` AS year_previous,
	tjmpssf.`year` AS year_next, 
	round( ( tjmpssf.GDP - tjmpssf2.GDP ) / tjmpssf2.GDP * 100, 2 ) as GDP_growth
FROM t_jitka_mikulasova_project_sql_secondary_final tjmpssf 
JOIN t_jitka_mikulasova_project_sql_secondary_final tjmpssf2 
	ON tjmpssf.country = tjmpssf2.country 
	AND tjmpssf.`year` = tjmpssf2.`year` + 1
WHERE tjmpssf.country = 'Czech Republic'	
GROUP BY tjmpssf.GDP,
		tjmpssf2.GDP,
		tjmpssf.`year`, 
		year_previous
ORDER BY tjmpssf.`year` DESC;


CREATE TABLE t_question_five_1a AS 
SELECT 
	year_previous, 
	sum(GDP_previous) AS sum_GDP_previous,
	sum(GDP_next) AS sum_GDP_next,
	sum(food_price_past) AS sum_food_price_past,
	sum(food_price_next) AS sum_food_price_next,
	sum(salary_past) AS sum_salary_past, 
	sum(salary_next) AS sum_salary_next
FROM t_question_five tqf 
JOIN t_question_4 tq 
	ON tqf.year_previous = tq.year_past
GROUP BY year_previous;


SELECT 
	year_previous,
	round( (sum_GDP_next - sum_GDP_previous) / sum_GDP_previous *100,2) AS sum_GDP_growth_percent, 
	round((sum_food_price_next - sum_food_price_past)/ sum_food_price_past *100,2) AS sum_food_price_growth_percent,
	round((sum_salary_next - sum_salary_past)/ sum_salary_past *100,2) AS sum_salary_growth_percent
FROM t_question_five_1 tqf; 
