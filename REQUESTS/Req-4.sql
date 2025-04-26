with cte20 as (
select
P.segment as segment,
count(distinct(p.product_code)) as product_cnt_2020
from dim_product P
join fact_sales_monthly FM
using (product_code)
where fiscal_year = 2020
group by segment
),
cte21 as (
select
P.segment as segment,
count(distinct(p.product_code)) as product_cnt_2021
from dim_product P
join fact_sales_monthly FM
using (product_code)
where fiscal_year = 2021
group by segment
)
select cte20.segment as segment,
cte20.product_cnt_2020 as product_cnt_2020,
cte21.product_cnt_2021 as product_cnt_2021,
(cte21.product_cnt_2021 - cte20.product_cnt_2020) as difference
from cte20
join cte21
on cte20.segment = cte21.segment;
