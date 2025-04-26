select
M.product_code,
product,
M.manufacturing_cost 
from fact_manufacturing_cost M
join dim_product P
using(product_code)
where manufacturing_cost in 
(
select max(manufacturing_cost) from fact_manufacturing_cost 
union
select min(manufacturing_cost) from fact_manufacturing_cost
)
order by manufacturing_cost desc;