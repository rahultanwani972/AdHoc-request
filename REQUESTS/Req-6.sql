SELECT
	customer_code,
    customer,
    round(avg(pre_invoice_discount_pct)*100,2) as avg_discount
    from fact_pre_invoice_deductions
    join dim_customer
    using (customer_code)
    where fiscal_year = 2021 and market = "India"
    group by customer_code
    order by avg_discount desc
    limit 5;