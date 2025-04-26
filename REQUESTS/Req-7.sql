select monthname(date) as month,
fs.fiscal_year as year,
sum(sold_quantity*gross_price) as gross_sales_amount
 from fact_sales_monthly fs
 join dim_customer c on c.customer_code = fs.customer_code
join fact_gross_price fg on fg.product_code = fs.product_code
where c.customer = 'Atliq Exclusive'
group by month,year
order by fs.Fiscal_year;