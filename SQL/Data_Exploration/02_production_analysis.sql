-- Total production per plant
SELECT plant, SUM(actual_production) AS total_production
FROM production_data
GROUP BY plant
ORDER BY total_production DESC;

-- Scrap rate per plant
SELECT plant,
ROUND((SUM(scrap_units)::numeric / SUM(actual_production))*100,2) AS scrap_rate
FROM production_data
GROUP BY plant
ORDER BY scrap_rate DESC;