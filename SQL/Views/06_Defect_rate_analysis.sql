CREATE VIEW vw_defect_rate AS
SELECT
d.year,
d.month,
v.vehicle_model,
p.plant,
SUM(q.defect_count) AS total_defects,
SUM(pr.actual_production) AS total_production,
ROUND(
SUM(q.defect_count)::numeric /
NULLIF(SUM(pr.actual_production),0),
4
) AS defect_rate
FROM quality_fact q
JOIN production_fact pr
ON q.vehicle_id = pr.vehicle_id
AND q.plant_id = pr.plant_id
AND q.date_id = pr.date_id
JOIN date_dimension d ON q.date_id = d.date_id
JOIN vehicle_dimension v ON q.vehicle_id = v.vehicle_id
JOIN plant_dimension p ON q.plant_id = p.plant_id
GROUP BY
d.year,
d.month,
v.vehicle_model,
p.plant;