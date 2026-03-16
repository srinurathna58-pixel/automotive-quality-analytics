-- Rank vehicle models by warranty cost

SELECT vehicle_model, ROUND(SUM(repair_cost)/1e6,2) AS total_warranty_cost_million, RANK() OVER(ORDER BY SUM(repair_cost) DESC) AS cost_rank
FROM warranty_data
GROUP BY vehicle_model;

-- Top 3 vehicle models with highest warranty cost
WITH ranked_costs AS
(
SELECT vehicle_model,
       ROUND(SUM(repair_cost)/1e6,2) AS total_warranty_cost_million,
       DENSE_RANK() OVER(ORDER BY SUM(repair_cost) DESC) AS cost_rank
FROM warranty_data
GROUP BY vehicle_model
)

SELECT *
FROM ranked_costs
WHERE cost_rank <= 3;



-- Calculate Month-to-Month Change in claim count
with monthly_claims as
(SELECT to_char(claim_date, 'month') AS month_name, date_part('month',claim_date) as month, SUM(claim_count) AS monthly_total_claims
FROM warranty_data
GROUP BY date_part('month',claim_date),to_char(claim_date, 'month')
order by date_part('month',claim_date),to_char(claim_date,'month'))

select month_name, monthly_total_claims, round(((monthly_total_claims-lag(monthly_total_claims) over(order by month))/((lag(monthly_total_claims) over(order by month))::numeric))*100,2) as claim_change
from c
order by month;


-- Rank vehicle models within each region by warranty cost
with total_warranty_cost_region as
(select vehicle_model, region, round(sum(repair_cost)/1e6,2) as total_warranty_cost
from warranty_data
group by vehicle_model, region
order by vehicle_model, region)

select region, vehicle_model, total_warranty_cost, dense_rank() over(partition by region order by total_warranty_cost desc) as regional_rank
from total_warranty_cost_region


-- Top 2 vehicle models per region by warranty cost
with total_warranty_cost_region as
(select vehicle_model, region, round(sum(repair_cost)/1e6,2) as total_warranty_cost
from warranty_data
group by vehicle_model, region
order by vehicle_model, region)

select * 
from
(select region, vehicle_model, total_warranty_cost, dense_rank() over(partition by region order by total_warranty_cost desc) as regional_rank
from total_warranty_cost_region) t
WHERE regional_rank <= 2;


-- Running warranty cost by region over month
with monthly_costs as
(select date_part('month', claim_date) as month,to_char(claim_date,'month') as month_name,region, round(sum(repair_cost)/1e6,2) as monthly_cost
from warranty_data
group by date_part('month', claim_date),to_char(claim_date,'month'),region
order by region, date_part('month', claim_date),to_char(claim_date,'month'))

select region, month_name, monthly_cost, sum(monthly_cost) over(partition by region order by month,month_name) as cumulative_cost
from c;



