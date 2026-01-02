use atliq_hardware_sales_db;
select * from customers; 
select count(*) from customers; -- 47 customers
select count(distinct customer_code) from customers; -- 47
select distinct customer_type from customers; -- retail, distributor, online

-- Top-performing customers
select c.customer_name, customer_type, sum(t.sales_amount) as Total_sales
from transactions t join customers c
on t.customer_code = c.customer_code
group by c.customer_name, customer_type
order by Total_sales desc
limit 5;
-- verification:
select customer_type, sum(t.sales_amount) as Total_sales
from transactions t join customers c
on t.customer_code = c.customer_code
group by customer_type
order by Total_sales desc;

select * from markets;
select count(*) from markets; -- 12
select zone, count(*) from markets group by zone; -- south:5, west:3, north:3, east:1

-- Top-performing markets
select m.market_name, sum(t.sales_amount) as Total_sales
from transactions t join markets m
on t.market_code = m.market_code
group by m.market_name
order by Total_sales desc
limit 2;
-- verification
select count(*) from transactions where market_code is null;
select distinct market_code from transactions;
select m.zone, sum(t.sales_amount) as Total_sales
from transactions t join markets m
on t.market_code = m.market_code
group by m.zone
order by Total_sales desc;

select * from products;
select count(distinct product_code) from products; -- 15prod
-- select count(distinct product_type) from products; -- 8
-- select distinct product_type from products; 

-- Top-performing products
select p.product_name, sum(t.sales_amount) as Total_sales
from transactions t join products p
on t.product_code = p.product_code
group by p.product_name
order by Total_sales desc
limit 5;

select * from transactions;
select count(*) from transactions; -- 150000
select distinct market_code from transactions; 
select * from transactions where sales_amount is null or sales_amount=0; -- null found in marketcode&currency, 0 salesAmt
SELECT sum(sales_amount) FROM atliq_hardware_sales_db.transactions; 

-- date
select * from date;

select * from transactions;
select * from transactions where sales_amount is null or sales_amount=0;



with total_cost as (
select base_price * sales_qty as cost_price from transactions t join products p
on t.product_code = p.product_code)
select sum(cost_price) from total_cost;



-- Top-performing markets
		select m.market_name, sum(t.sales_amount) as Total_sales
		from transactions t join markets m
		on t.market_code = m.market_code
		group by m.market_name
		order by Total_sales desc
		limit 2;
                            
-- Top-performing customers
		select c.customer_name, customer_type, sum(t.sales_amount) as Total_sales
		from transactions t join customers c
		on t.customer_code = c.customer_code
		group by c.customer_name, customer_type
		order by Total_sales desc
		limit 5;