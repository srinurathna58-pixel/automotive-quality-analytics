-- High-cost vs low-cost warranty claims
select region, sum(claim_count) as total_claims, sum(case when repair_cost > 5000 then claim_count else 0 end) as high_cost_claims,
sum(case when repair_cost <= 5000 then claim_count else 0 end) as low_cost_claims, sum(repair_cost) as total_warranty_cost
from warranty_data
group by region;