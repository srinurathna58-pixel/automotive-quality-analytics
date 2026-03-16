-- Creating production fact table

CREATE TABLE production_fact (
    production_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT,
    plant_id INT,
    date_id INT,
    planned_production INT,
    actual_production INT,
    downtime_minutes INT,
    scrap_units INT,
    rework_units INT
    
    FOREIGN KEY (vehicle_id) REFERENCES vehicle_dimension(vehicle_id),
    FOREIGN KEY (plant_id) REFERENCES plant_dimension(plant_id),
    FOREIGN KEY (date_id) REFERENCES date_dimension(date_id)
);



-- Populating production fact table

INSERT INTO production_fact
(vehicle_id, plant_id, date_id, planned_production, actual_production, downtime_minutes, scrap_units, rework_units)

SELECT
v.vehicle_id,
p.plant_id,
d.date_id,
pd.planned_production,
pd.actual_production,
pd.downtime_minutes,
pd.scrap_units,
pd.rework_units

FROM production_data pd
JOIN vehicle_dimension v
ON pd.vehicle_model = v.vehicle_model

JOIN plant_dimension p
ON pd.plant = p.plant_name

JOIN date_dimension d
ON pd.production_date = d.production_date;




-- Creating and populating quality fact table

CREATE TABLE quality_fact AS
SELECT 
    q.plant,
    q.vehicle_model,
    p.part_id,
    d.defect_id,
    i.inspection_id,
    q.defect_count,
    q.inspection_date
FROM quality_data q
LEFT JOIN dim_part p
    ON q.part_name = p.part_name
    AND q.supplier = p.supplier
LEFT JOIN dim_defect d
    ON q.defect_type = d.defect_type
    AND q.failure_mode = d.failure_mode
    AND q.severity = d.severity
LEFT JOIN dim_inspection i
    ON q.inspection_method = i.inspection_method
    AND q.test_stage = i.test_stage;

-- Adding primary key

ALTER TABLE quality_fact
ADD COLUMN fact_id SERIAL PRIMARY KEY;


-- Modyfying quality fact table with vehicle_id, plant_id and date_id

ALTER TABLE quality_fact
ADD COLUMN vehicle_id INT,
ADD COLUMN plant_id INT,
ADD COLUMN date_id INT;

UPDATE quality_fact q
SET vehicle_id = v.vehicle_id
FROM vehicle_dimension v
WHERE q.vehicle_model = v.vehicle_model;

UPDATE quality_fact q
SET plant_id = p.plant_id
FROM plant_dimension p
WHERE q.plant = p.plant;

UPDATE quality_fact q
SET date_id = d.date_id
FROM date_dimension d
WHERE q.date = d.full_date;

ALTER TABLE quality_fact
DROP COLUMN vehicle_model,
DROP COLUMN plant,
DROP COLUMN date;


-- Adding Foreign Keys to quality fact table
ALTER TABLE quality_fact
ADD CONSTRAINT fk_vehicle
FOREIGN KEY (vehicle_id)
REFERENCES vehicle_dimension(vehicle_id);


-- Creating and population warranty fact table

CREATE TABLE warranty_fact AS
SELECT
    w.claim_date,
    w.vehicle_model,
    w.plant,
    p.part_id,
    f.failure_id,
    r.region_id,
    w.vehicle_age_months,
    w.claim_count,
    w.repair_cost
FROM warranty_data w
LEFT JOIN dim_part p
    ON w.part_name = p.part_name
    AND w.supplier = p.supplier
LEFT JOIN dim_failure f
    ON w.failure_mode = f.failure_mode
LEFT JOIN dim_region r
    ON w.region = r.region;


-- Adding primary key

ALTER TABLE warranty_fact
ADD COLUMN warranty_id SERIAL PRIMARY KEY;


-- Modyfying warranty fact table with vehicle_id, plant_id and date_id

ALTER TABLE warranty_fact
ADD COLUMN vehicle_id INT,
ADD COLUMN plant_id INT,
ADD COLUMN date_id INT;

UPDATE warranty_fact w
SET vehicle_id = v.vehicle_id
FROM vehicle_dimension v
WHERE w.vehicle_model = v.vehicle_model;

UPDATE warranty_fact w
SET plant_id = p.plant_id
FROM plant_dimension p
WHERE w.plant = p.plant;

UPDATE warranty_fact w
SET date_id = d.date_id
FROM date_dimension d
WHERE w.claim_date = d.full_date;

ALTER TABLE warranty_fact
DROP COLUMN vehicle_model,
DROP COLUMN plant,
DROP COLUMN claim_date;
