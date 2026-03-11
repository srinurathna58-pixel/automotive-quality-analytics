-- Supplier defect analysis
CREATE VIEW vw_supplier_defects AS
SELECT
dp.supplier,
dp.part_name,
SUM(q.defect_count) AS total_defects
FROM quality_fact q
JOIN dim_part dp ON q.part_id = dp.part_id
GROUP BY dp.supplier, dp.part_name
ORDER BY total_defects DESC;
