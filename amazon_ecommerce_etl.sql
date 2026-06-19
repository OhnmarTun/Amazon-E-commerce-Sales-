-- Show databases
select name
from sys.databases;

use Amazon_Ecommerce_Sale;

-- Show tables
select name
from sys.tables;

-- View the table 
select * from amazon_ecommerce;

-- Find the number of rows in the table
select count(*) as count_row from amazon_ecommerce;

-- Top 5 product categories that generated the highest total revenue
select top 5 
	category,
	count(product_id) as total_orders,
	sum(final_price) as total_revenue
from amazon_ecommerce
group by category
order by total_revenue desc;

-- Top 10 subcategories with the highest number of orders
select
	top 10 subcategory,
	count(product_id) as total_orders
from amazon_ecommerce
group by subcategory 
order by total_orders desc;

-- Top 10 subcategories with the highest average discount percentage
select
	top 10 subcategory,
	count(product_id) as total_orders,
	cast(round(avg(discount),2) as decimal(10,2)) as highest_avg_dis
from amazon_ecommerce
group by subcategory
order by highest_avg_dis desc;

-- Percentage contribution of each category to total revenue
select 
	category,
	cast(sum(final_price)*100/(select sum(final_price) from amazon_ecommerce) as decimal(10,2)) as total_percentage_revenue
from amazon_ecommerce
group by category
order by total_percentage_revenue desc;

-- Monthly revenue trend
select
	month(purchase_date) as month,
	format(purchase_date,'MMM') as month_name,
	sum(final_price) as total_revenue
from amazon_ecommerce
group by month(purchase_date),format(purchase_date,'MMM')
order by total_revenue desc;

-- Top 5 subcategories with the highest average order value
select 
	top 5 subcategory,
	sum(final_price) as total_revenue,
	count(*) as total_count,
	cast(round(sum(final_price)/count(*),2) as decimal(10,2)) as avg_order_value
from amazon_ecommerce
group by subcategory
order by avg_order_value desc;

-- Which customers are repeat buyers?
select 
	user_id,
	count(*) as user_count
from amazon_ecommerce
group by user_id
having count(*)>1
order by user_count desc;

-- Calculate customer RFM metrics?
select
	user_id,
	max(purchase_date) as last_purchase_date,
	DATEDIFF(day,max(purchase_date),getdate()) as recency,
	count(*) as frequency,
	sum(final_price) as monetary
from amazon_ecommerce
group by user_id
order by monetary desc;

-- Which locations generate the highest total revenue and order volume?
select
	location,
	sum(final_price) as total_revenue,
	count(*) as total_orders
from amazon_ecommerce
group by location
order by total_revenue desc;

-- Which device type brings the highest orders and revenue?
select
	device,
	sum(final_price) as total_revenue,
	count(*) as total_orders,
	cast(round(sum(final_price)/count(*),2) as decimal(10,2)) as avg_order_value
from amazon_ecommerce
group by device
order by total_revenue desc;

-- What is the return rate by subcategory?
select
	subcategory,
	count(*) as total_orders,
	sum(
	case
	when delivery_status like '%Returned%' then 1 else 0
	end) as total_return_order,
	sum(
	case
	when delivery_status like '%Returned%' then 1 else 0
	end)*100/
	count(*) as return_rate
from amazon_ecommerce
group by subcategory
order by return_rate desc;
Go

-- How does each delivery status impact: order volume, revenue generation, average order value?
select
	delivery_status,
	count(*) as total_orders,
	sum(final_price) as total_revenue,
	cast(
	round(
	sum(final_price)/count(*),2) as decimal(10,2)) as avg_order_value
from amazon_ecommerce
group by delivery_status
order by total_revenue desc;
Go

-- Which payment methods have the highest return rate?
	select
		payment_method,
		count(*) as total_orders,
		sum(
		case
		when delivery_status like '%Returned%' then 1 else 0
		end) as total_return_orders,
		sum(
		case
		when delivery_status like '%Returned%' then 1 else 0
		end)*100/count(*) as return_rate
	from amazon_ecommerce
	group by payment_method
	order by return_rate desc;
Go


-- Which customers generate the highest revenue and what is their average order value?
select
	user_id,
	count(*) as total_count,
	sum(final_price) as total_revenue,
	cast(round(
	sum(final_price)/count(*),2) as decimal(10,2)) as avg_order_value
from amazon_ecommerce
group by user_id
order by total_revenue desc;

-- Which payment method generates the highest total revenue?
select
	payment_method,
	sum(final_price) as total_revenue
from amazon_ecommerce
group by payment_method
order by total_revenue desc;

-- Which customer placed the most orders in a single month?
select
	top 1
	user_id,
	count(*) as total_order,
	month(purchase_date) as month,
	format(purchase_date,'MMMM') as month_name
from amazon_ecommerce
group by user_id,month(purchase_date),format(purchase_date,'MMMM')
order by total_order desc;

-- Which are the top 5 days with the highest sales revenue?
select
	top 5
	purchase_date,
	sum(final_price) as total_revenue
from amazon_ecommerce
group by purchase_date
order by total_revenue desc;

-- What is the average order value by delivery status?
select 
	delivery_status,
	sum(final_price) as total_revenue,
	count(*) as total_orders,
	cast(round(sum(final_price)/count(*),2) as decimal(10,2)) as avg_order_value
from amazon_ecommerce
group by delivery_status
order by avg_order_value desc;  

-- What is the relationship between discount and order volume?
select
	case
		when discount=0 then 'No Discount'
        when discount between 1 and 10 then 'Low Discount'
        when discount between 11 and 20 then 'Medium Discount'
        else 'High Discount'
	end as discount_category,
    count(*) as total_orders
from amazon_ecommerce
group by 
	case
		when discount=0 then 'No Discount'
        when discount between 1 and 10 then 'Low Discount'
        when discount between 11 and 20 then 'Medium Discount'
        else 'High Discount'
	end
order by total_orders desc;