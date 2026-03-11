-- Date dimension table

CREATE TABLE date_dimension AS
SELECT DISTINCT production_date AS full_date
FROM production_data;

ALTER TABLE date_dimension
ADD COLUMN date_id SERIAL PRIMARY KEY;

ALTER TABLE date_dimension
ADD COLUMN year INT,
ADD COLUMN month INT,
ADD COLUMN month_name VARCHAR(20);

UPDATE date_dimension
SET
year = EXTRACT(YEAR FROM full_date),
month = EXTRACT(MONTH FROM full_date),
month_name = TO_CHAR(full_date,'Month');




-- Plant dimension table

CREATE TABLE plant_dimension AS
SELECT DISTINCT plant
FROM production_data;

ALTER TABLE plant_dimension
ADD COLUMN plant_id SERIAL PRIMARY KEY;





-- Vehicle dimension table

CREATE TABLE vehicle_dimension (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_model VARCHAR(50) UNIQUE
);

INSERT INTO vehicle_dimension (vehicle_model)
VALUES
('Offroad-A'),
('SUV-A'),
('SUV-B'),
('Utility-A');




-- Defect dimension table

CREATE TABLE dim_defect AS
SELECT DISTINCT
    defect_type,
    failure_mode,
    severity
FROM quality_data;

ALTER TABLE dim_defect
ADD COLUMN defect_id SERIAL PRIMARY KEY;




-- Inspection dimension table

CREATE TABLE dim_inspection AS
SELECT DISTINCT
    inspection_method,
    test_stage
FROM quality_data;

ALTER TABLE dim_inspection
ADD COLUMN inspection_id SERIAL PRIMARY KEY;




-- Part dimension table

CREATE TABLE dim_part AS
SELECT DISTINCT
    part_name,
    supplier
FROM quality_data;

ALTER TABLE dim_part
ADD COLUMN part_id SERIAL PRIMARY KEY;





-- Region dimension table

CREATE TABLE dim_region AS
SELECT DISTINCT
    region
FROM warranty_data;

ALTER TABLE dim_region
ADD COLUMN region_id SERIAL PRIMARY KEY;
