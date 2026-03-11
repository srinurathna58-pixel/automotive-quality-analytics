-- Quality defect analysis
CREATE VIEW vw_quality_defects AS
select d.year,
d.month,
v.vehicle_model,
p.plant,
dp.part_name,
dd.defect_type,
dd.failure_mode,
SUM(q.defect_count) AS total_defects
from quality_fact q
JOIN date_dimension d ON q.date_id = d.date_id
JOIN vehicle_dimension v ON q.vehicle_id = v.vehicle_id
JOIN plant_dimension p ON q.plant_id = p.plant_id
JOIN dim_part dp ON q.part_id = dp.part_id
JOIN dim_defect dd ON q.defect_id = dd.defect_id
GROUP BY
d.year,
d.month,
v.vehicle_model,
p.plant,
dp.part_name,
dd.defect_type,
dd.failure_mode
order by total_defects desc

