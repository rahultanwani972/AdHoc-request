with cte20 as 
(
select count(distinct (product_code)) as unique_product_2020
from fact_manufacturing_cost
where cost_year = 2020
),
 cte21 as (
select count(distinct (product_code)) as unique_product_2021
from fact_manufacturing_cost 
where cost_year = 2021
)
select *,
round((unique_product_2021-unique_product_2020)*100/unique_product_2020,2) as percentage_chg
from cte20
cross join cte21;