-- Creating quality analysis view table

CREATE VIEW vw_quality_analysis AS

WITH quality_summary AS (

SELECT
    date_id,
    plant_id,
    vehicle_id,
    part_id,
    defect_id,
    inspection_id,
    SUM(defect_count) AS total_defects,
    SUM(rework_cost) AS total_rework_cost

FROM quality_fact
GROUP BY
    date_id,
    plant_id,
    vehicle_id,
    part_id,
    defect_id,
    inspection_id
)

SELECT
    d.full_date,
    d.year,
    d.month,

    p.plant,
    v.vehicle_model,

    pr.part_name,
    pr.supplier,

    df.defect_type,
    df.failure_mode,
    df.severity_score,

    ins.inspection_method,
    ins.test_stage,

    qs.total_defects,
    qs.total_rework_cost

FROM quality_summary qs

JOIN date_dimension d
ON qs.date_id = d.date_id

JOIN plant_dimension p
ON qs.plant_id = p.plant_id

JOIN vehicle_dimension v
ON qs.vehicle_id = v.vehicle_id

JOIN dim_part pr
ON qs.part_id = pr.part_id

JOIN dim_defect df
ON qs.defect_id = df.defect_id

JOIN dim_inspection ins
ON qs.inspection_id = ins.inspection_id;

