-- Production summary
CREATE VIEW vw_production_summary AS
SELECT
d.year,
d.month,
p.plant,
v.vehicle_model,
SUM(planned_production) AS planned_production,
SUM(actual_production) AS actual_production,
SUM(scrap_units) AS scrap_units,
SUM(rework_units) AS rework_units,
SUM(downtime_minutes) AS downtime_minutes
FROM production_fact f
JOIN date_dimension d ON f.date_id = d.date_id
JOIN plant_dimension p ON f.plant_id = p.plant_id
JOIN vehicle_dimension v ON f.vehicle_id = v.vehicle_id
GROUP BY d.year, d.month, p.plant, v.vehicle_model;
