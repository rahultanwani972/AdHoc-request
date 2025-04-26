 with cte as
(
select *,
case
when month(date) in (9,10,11) then "Q1"
when month(date) in (12,01,02) then "Q2"
when month(date) in (03,04,05) then "Q3"
else "Q4"
end as Quarter
 from fact_sales_monthly
where fiscal_year  = 2020
)
select
quarter,
sum(sold_quantity) as total_sold_quantity
from cte
group by quarter
order by total_sold_quantity desc;