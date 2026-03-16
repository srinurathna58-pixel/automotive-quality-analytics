-- Total warranty cost per failure mode
select failure_mode,sum(repair_cost) as total_warranty_cost
from warranty_data
group by failure_mode
order by total_warranty_cost desc;


-- Total warranty cost per supplier
select supplier,sum(repair_cost) as total_warranty_cost
from warranty_data
group by supplier
order by total_warranty_cost desc;

-- Vehicle Models with Highest Warranty Claims
select vehicle_model, sum(claim_count) as total_claims
from warranty_data
group by vehicle_model
order by total_claims desc;


-- Warranty Cost by Vehicle Model
select vehicle_model, sum(repair_cost) as total_warranty_cost
from warranty_data
group by vehicle_model
order by total_warranty_cost desc


-- Average Repair Cost per Claim
select vehicle_model, round(avg(repair_cost),2) as avg_repair_cost
from warranty_data
group by vehicle_model
order by avg_repair_cost desc

