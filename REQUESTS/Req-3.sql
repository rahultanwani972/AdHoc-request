select
segment,
count(distinct (product_code)) as product_cnt
from dim_product
group by segment
order by product_cnt desc;