CREATE VIEW vw_warranty_rate AS
SELECT
d.year,
d.month,
v.vehicle_model,
p.plant,
SUM(w.claim_count) AS total_claims,
SUM(pr.actual_production) AS total_production,
ROUND(
SUM(w.claim_count)::numeric /
NULLIF(SUM(pr.actual_production),0),
4
) AS warranty_rate,
SUM(w.repair_cost) AS total_repair_cost
FROM warranty_fact w
JOIN production_fact pr
ON w.vehicle_id = pr.vehicle_id
AND w.plant_id = pr.plant_id
AND w.date_id = pr.date_id
JOIN date_dimension d ON w.date_id = d.date_id
JOIN vehicle_dimension v ON w.vehicle_id = v.vehicle_id
JOIN plant_dimension p ON w.plant_id = p.plant_id
GROUP BY
d.year,
d.month,
v.vehicle_model,
p.plant;