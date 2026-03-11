-- Create a Database
CREATE DATABASE automotive_analytics;


-- Create production data table
CREATE TABLE production_data (
    production_id SERIAL PRIMARY KEY,
    date DATE,
    plant VARCHAR(50),
    production_line VARCHAR(50),
    shift VARCHAR(20),
    vehicle_model VARCHAR(50),
    planned_production INT,
    actual_production INT,
    scrap_units INT,
    rework_units INT,
    downtime_minutes INT
);


-- Create quality data table
CREATE TABLE quality_data (
    inspection_id SERIAL PRIMARY KEY,
    date DATE,
    plant VARCHAR(50),
    vehicle_model VARCHAR(50),
    part_name VARCHAR(100),
    supplier VARCHAR(100),
    defect_type VARCHAR(100),
    inspection_method VARCHAR(100),
    production_volume INT,
    defect_count INT,
    rework_cost NUMERIC,
    warranty_cost NUMERIC,
    test_stage VARCHAR(50),
    failure_mode VARCHAR(100),
    severity_score INT
);

-- Create warranty data table
CREATE TABLE warranty_data (
    claim_id SERIAL PRIMARY KEY,
    claim_date DATE,
    vehicle_model VARCHAR(50),
    plant VARCHAR(50),
    supplier VARCHAR(100),
    part_name VARCHAR(100),
    failure_mode VARCHAR(100),
    claim_count INT,
    repair_cost NUMERIC,
    vehicle_age_months INT,
    region VARCHAR(50)
);


-- -- Create vehicle_dimension table
CREATE TABLE vehicle_dimension (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_model VARCHAR(50) UNIQUE,
    vehicle_segment VARCHAR(50),
    launch_year INT
);


-- Insert models into vehicle_dimension
INSERT INTO vehicle_dimension (vehicle_model, vehicle_segment, launch_year)
VALUES
('Offroad-A','Offroad',2018),
('SUV-A','SUV',2020),
('SUV-B','SUV',2021),
('Utility-A','Utility',2019);


-- Importing data to production data table
COPY production_data(
date,
plant,
production_line,
shift,
vehicle_model,
planned_production,
actual_production,
scrap_units,
rework_units,
downtime_minutes
)
FROM 'FULL_FILE_PATH/oem_plant_production_dataset.csv'
DELIMITER ','
CSV HEADER;



-- Importing data to quality data table
COPY quality_data(
date,
plant,
vehicle_model,
part_name,
supplier,
defect_type,
inspection_method,
production_volume,
defect_count,
rework_cost,
warranty_cost,
test_stage,
failure_mode,
severity_score
);




-- Importing data to warranty data table
COPY warranty_data(
claim_date,
vehicle_model,
plant,
supplier,
part_name,
failure_mode,
claim_count,
repair_cost,
vehicle_age_months,
region
)
FROM 'S:/Projects/Kaggle_Datasets/Chatgpt/oem_warranty_claims_dataset.csv'
DELIMITER ','
CSV HEADER;

