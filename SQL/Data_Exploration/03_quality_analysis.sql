-- Total defects per vehicle model
select vehicle_model, sum(defect_count) as total_defects
from quality_data
group by vehicle_model
order by total_defects desc;

-- Total defects per supplier
select supplier, sum(defect_count) as total_defects
from quality_data
group by supplier
order by total_defects desc;


-- Defect rate per part
select part_name, round((sum(defect_count)/sum(production_volume)::numeric)*100,2) as defect_rate
from quality_data
group by part_name
order by defect_rate desc;


-- Total defects per plant
select plant, sum(defect_count) as total_defects, SUM(production_volume) AS total_inspected_units
from quality_data
group by plant
order by total_defects desc

