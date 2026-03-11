-- Warranty cost analysis
CREATE VIEW vw_warranty_cost AS
SELECT
d.year,
d.month,
v.vehicle_model,
p.plant,
r.region,
dp.part_name,
dd.failure_mode,
SUM(w.claim_count) AS total_claims,
SUM(w.repair_cost) AS total_repair_cost
FROM warranty_fact w
JOIN date_dimension d ON w.date_id = d.date_id
JOIN vehicle_dimension v ON w.vehicle_id = v.vehicle_id
JOIN plant_dimension p ON w.plant_id = p.plant_id
JOIN dim_region r ON w.region_id = r.region_id
JOIN dim_part dp ON w.part_id = dp.part_id
JOIN dim_defect dd ON w.defect_id = dd.defect_id
GROUP BY
d.year,
d.month,
v.vehicle_model,
p.plant,
r.region,
dp.part_name,
dd.failure_mode;
