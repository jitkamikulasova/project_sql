CREATE TABLE t_jitka_mikulasova_project_SQL_secondary_final AS
SELECT 
	c.country,
	c.continent, 
	e.GDP,
	e.gini,
	e.population, 
	e.`year` 
FROM countries c 
LEFT JOIN economies e  
	ON e.country = c.country
WHERE  c.continent = 'Europe'
	AND e.GDP IS NOT NULL 
ORDER BY c.country, e.`year`DESC, e.GDP DESC;