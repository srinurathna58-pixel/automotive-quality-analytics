-- Defect rate by vehicle model (Production vs Quality)
select p.vehicle_model,round((sum(q.defect_count) / sum(p.actual_production)::numeric)*100,2) as defect_rate
from production_data p
join quality_data q
on p.vehicle_model = q.vehicle_model
group by p.vehicle_model
order by defect_rate desc;



-- Production + Quality + Warranty -  high defect rate and high warranty cost per vehicle model

WITH p AS
(
SELECT vehicle_model, SUM(actual_production) AS total_production
FROM production_data
GROUP BY vehicle_model
),

d AS
(
SELECT vehicle_model, SUM(defect_count) AS total_defects
FROM quality_data
GROUP BY vehicle_model
),

w AS
(
SELECT vehicle_model, SUM(repair_cost) AS total_warranty_cost
FROM warranty_data
GROUP BY vehicle_model
)

SELECT 
    p.vehicle_model,
    ROUND((d.total_defects/p.total_production::numeric)*100,2) AS defect_rate,
    w.total_warranty_cost
FROM p
JOIN d ON p.vehicle_model = d.vehicle_model
JOIN w ON p.vehicle_model = w.vehicle_model
ORDER BY defect_rate DESC;