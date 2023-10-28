SELECT
	tjmpspf.food_name, 
	tjmpspf.food_price_CZK AS food_price_past,
	tjmpspf2.food_price_CZK AS food_price_next,
	tjmpspf.price_measured_from AS year_past,
	tjmpspf2.price_measured_from AS year_next,
	round((tjmpspf2.food_price_CZK - tjmpspf.food_price_CZK)  / tjmpspf.food_price_CZK * 100,2)  AS food_growth_percent
FROM t_jitka_mikulasova_project_sql_primary_final tjmpspf 
JOIN t_jitka_mikulasova_project_sql_primary_final tjmpspf2
 	ON tjmpspf2.price_measured_from = tjmpspf.price_measured_from + 1
 	AND tjmpspf2.food_name = tjmpspf.food_name 
GROUP BY tjmpspf.food_name, 
	food_price_past,
	food_price_next,
	year_past, 
	year_next
ORDER BY food_growth_percent,year_past;	