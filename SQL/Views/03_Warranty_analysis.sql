-- Creating warranty analysis view table

CREATE VIEW vw_warranty_analysis AS

SELECT
    d.full_date,
    r.region,
    p.plant,
    v.vehicle_model,
    pr.part_name,
    sum(W.vehicle_age) as age


    SUM(w.claim_count) AS total_claims,
    SUM(w.repair_cost) AS total_repair_cost,

    SUM(pf.actual_production) AS production_volume,

    ROUND(
        SUM(w.claim_count)::numeric /
        NULLIF(SUM(pf.actual_production),0) * 100,
        2
    ) AS warranty_rate

FROM warranty_fact w

JOIN date_dimension d
ON w.date_id = d.date_id

JOIN plant_dimension p
ON w.plant_id = p.plant_id

JOIN vehicle_dimension v
ON w.vehicle_id = v.vehicle_id

JOIN dim_part pr
ON w.part_id = pr.part_id

JOIN dim_region r
ON w.region_id = r.region_id

LEFT JOIN production_fact pf
ON w.vehicle_id = pf.vehicle_id
AND w.plant_id = pf.plant_id
AND w.date_id = pf.date_id

GROUP BY
d.full_date,
r.region,
p.plant,
v.vehicle_model,
pr.part_name;