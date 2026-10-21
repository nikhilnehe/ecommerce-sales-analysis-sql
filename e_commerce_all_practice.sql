
-- Display all records from the ecommerce dataset.

select * from ecommerce_sales;

-- Display only Order_ID, Order_Date, Customer_ID, Product, and Sales.

select Order_ID, Order_Date, Customer_ID, Product, Sales from ecommerce_sales;

-- Find the total number of orders.

select count(Order_ID) as  total_number_orders from ecommerce_sales;

-- Find the total number of unique customers.

select count(distinct Customer_ID) as  total_unique_customers from ecommerce_sales;

-- Find all unique product categories.

select distinct Category as unique_product_categories from ecommerce_sales;

-- Find all unique payment methods.

select distinct Payment_Method as unique_payment_methods from ecommerce_sales;

-- Find all unique sales channels.

select distinct Sales_Channel as unique_sales_channels from ecommerce_sales;

-- Find the minimum, maximum, and average Sales.

select min(sales) as min_sales, max(sales) as max_sales ,avg(sales) as avg_sales from ecommerce_sales;

-- Find the minimum, maximum, and average Profit.

select min(profit) as min_profit, max(profit) as max_profit ,avg(profit) as avg_profit from ecommerce_sales;

-- Find the total quantity sold.

select sum(Quantity) as total_quantity_sold from ecommerce_sales;

-- Find all orders where Sales > 10000.

select * from ecommerce_sales
where sales >10000;

-- Find all orders where Profit > 5000.

select * from ecommerce_sales
where profit >10000;

-- Find orders placed in the state of Maharashtra.

select * from ecommerce_sales
where State = 'Maharashtra';

-- Find orders where Discount_Percent is greater than 10%.

select * from ecommerce_sales
where Discount_Percent > 10;

-- Find orders with a customer rating of 5.

select * from ecommerce_sales
where Customer_Rating = 5;


-- Find total sales by category.

select category , sum(sales) as total_sales from ecommerce_sales
group by category;

-- Find total profit by category.

select category ,sum(profit) as total_profit from ecommerce_sales
group by category;

-- Find total quantity sold by category.

select category ,sum(Quantity) as total_quantity from ecommerce_sales
group by category;

-- Find average sales by category.

select category , avg(sales) as total_sales from ecommerce_sales
group by category;

-- Find total sales by state.

select state ,sum(sales) as total_sales from ecommerce_sales
group by state;

-- Find total profit by state.

select state ,sum(profit) as total_profit from ecommerce_sales
group by state;

-- Find the top 10 states by sales.

select state ,sum(sales) as total_sales from ecommerce_sales
group by state
order by total_sales desc
limit 10;

-- Find the top 10 products by sales.

select Product ,sum(sales) as total_product from ecommerce_sales
group by Product
order by total_product desc
limit 10;

-- Find the top 10 products by profit.

select Product ,sum(profit) as total_product from ecommerce_sales
group by Product
order by total_product desc
limit 10;

-- Find the number of orders for each Order_Status.

select Order_Status , count(Order_ID) as number_of_orders from ecommerce_sales
group by Order_Status
order by number_of_orders desc;

-- Find the number of orders for each Payment_Method.

select Payment_Method , count(Order_ID) as number_of_orders from ecommerce_sales
group by Payment_Method
order by number_of_orders desc;

-- Find sales generated through each Sales_Channel.

select Sales_Channel , sum(sales) as number_of_sales from ecommerce_sales
group by Sales_Channel
order by number_of_sales desc;

-- Find average customer rating by category.

select category , avg(Customer_Rating) as avg_of_customer from ecommerce_sales
group by category
order by avg_of_customer desc;

-- Find average delivery days by sales channel.

select sales_channel , avg(delivery_days) as avg_of_delivery_days from ecommerce_sales
group by sales_channel
order by avg_of_delivery_days desc;

-- Find the category with the highest total profit

select category , sum(profit) as highest_total_profit from ecommerce_sales
group by category
order by highest_total_profit desc
limit 1;

-- Find categories where total sales are greater than ₹10 lakh.

select category , sum(sales) as total_sales from ecommerce_sales
group by category
having sum(sales) > 1000000
order by total_sales desc;

-- Find states where total profit is greater than ₹5 lakh.

select state, sum(profit) total_profit from ecommerce_sales
group by state
having sum(profit) > 500000
order by total_profit desc;

-- Find products whose total quantity sold is greater than 100.

select product, sum(quantity) total_quantity from ecommerce_sales
group by product
having sum(quantity) > 100
order by total_quantity desc;

-- Find customers who have placed more than 5 orders.

select Customer_ID,Customer_Name, count(order_ID) palced_order from ecommerce_sales
group by Customer_ID,Customer_Name
having count(order_ID) > 5
order by palced_order desc;

-- Find customers whose total spending is greater than ₹50,000.

select Customer_ID,Customer_Name, sum(Sales) total_spending from ecommerce_sales
group by Customer_ID,Customer_Name
having sum(sales) > 50000
order by total_spending desc;


-- Find categories having an average customer rating greater than 4.

select category , round(avg(Customer_Rating),2) as avg_customer_rating from ecommerce_sales
group by category
having avg(Customer_Rating) > 3
order by avg_customer_rating desc;

-- Find payment methods having more than 1,000 orders.

select Payment_Method , count(Order_ID) as count_order from ecommerce_sales
group by Payment_Method
having count(Order_ID) > 1000
order by count_order desc;

-- Find cities where total sales are greater than ₹1 lakh.

select city , sum(sales) as total_sales from ecommerce_sales
group by city
having sum(sales) > 100000
order by total_sales desc;


-- Create a column called Profit_Category:- Profit >= 5000 → High Profit
-- - Profit >= 2000 → Medium Profit
-- - Otherwise → Low Profit

select * ,
		case 
			when profit >= 5000 then 'High Profit'
			when profit >= 2000 then 'Medium Profit'
			else 'Low Profit'
		end as Profit_Category
from ecommerce_sales;

-- Categorize orders based on sales:- Sales >= 10,000 → High Value
-- - Sales >= 5,000 → Medium Value
-- - Otherwise → Low Value

select * ,
		case
			when sales >= 10000 then 'High Value'
			when sales >= 5000 then 'Medium Value'
			else 'Low Value'
		end as orders_based_on_sales
from ecommerce_sales;

-- Categorize customers based on their rating:- Rating = 5 → Excellent
-- - Rating >= 4 → Good
-- - Rating >= 3 → Average
-- - Otherwise → Poor

select * ,
		case
			when customer_rating = 5 then 'Excellent'
			when customer_rating >= 4 then 'Good'
			when customer_rating >= 3 then 'Average'
			else 'Poor'
		end as customers_based_rating
from ecommerce_sales;

-- Categorize delivery:- Delivery Days <= 3 → Fast
-- - Delivery Days <= 7 → Normal
-- - Otherwise → Delayed

select * ,
		case
			when delivery_days <= 3 then 'fast'
			when delivery_days <= 7 then 'Normal'
			else 'Delayed'
		end as Categorize_delivery
from ecommerce_sales;

-- Calculate the percentage of orders that were Delivered vs Cancelled vs Returned, if those statuses exist in your data.

select Order_Status, count(distinct Order_ID) as Total_Orders,
    round(count(distinct Order_ID) * 100.0 / sum(count(distinct Order_ID)) over (),2 ) as Order_Percentage
from ecommerce_sales
where Order_Status in ('Delivered', 'Cancelled', 'Returned')
group by Order_Status
order by Order_Percentage desc;


-- Find total sales year-wise.

SELECT EXTRACT(YEAR FROM Order_Date) AS Year,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY EXTRACT(YEAR FROM Order_Date)
ORDER BY Year;

-- Find total sales month-wise.

select extract(month from order_date) as month,
	sum(sales) as total_sales
from ecommerce_sales
group by extract(month from order_date)
order by month;

-- OR Month Name --

select to_char(order_date, 'Month') as month,
	sum(sales) as total_sales
from ecommerce_sales
group by to_char(order_date, 'Month')
order by month;

-- Find total profit month-wise.

select to_char(order_date, 'Month') as month,
	sum(profit) as total_profit
from ecommerce_sales
group by to_char(order_date, 'Month')
order by month;

-- Find the number of orders placed each month.

select to_char(order_date,'Month') as month,
	count(order_id) as number_of_order
from ecommerce_sales
group by to_char(order_date,'Month')
order by month;


-- Find the best-performing month based on sales.

select to_char(order_date, 'Month') as month,
	sum(sales) as total_sales
from ecommerce_sales
group by to_char(order_date, 'Month')
order by total_sales desc
limit 1;

-- Find the best-performing month based on profit.

select to_char(order_date, 'Month') as month,
	sum(profit) as total_profit
from ecommerce_sales
group by to_char(order_date, 'Month')
order by total_profit desc
limit 1;

-- Find monthly average order value.

select to_char(order_date,'Month') as month,
	round(avg(sales),2) as avg_order
from ecommerce_sales
group by to_char(order_date,'Month')
order by min(order_date);

-- Find the number of orders placed on each day of the week.

select to_char(order_date,'Day') as day,
	count(Order_ID) as placed_order
from ecommerce_sales
group by to_char(order_date,'Day')
order by min(order_date);


-- Find which month had the highest number of customers.

select to_char(order_date,'Month') as Month,
	count(Customer_ID) as total_customers
from ecommerce_sales
group by to_char(order_date,'Month')
order by total_customers desc
limit 1;


-- Find the monthly sales trend for 2025.

SELECT
    TO_CHAR(Order_Date, 'Month') AS Month,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
WHERE EXTRACT(YEAR FROM Order_Date) = 2025
GROUP BY TO_CHAR(Order_Date, 'Month')
ORDER BY MIN(Order_Date);


--Join orders with customers and display customer name with order details.
-- Find total sales generated by each customer.
-- Find the top 10 customers by total sales.
-- Find the top 10 customers by total profit.
-- Find customers who have never placed an order.
-- Find products that have never been sold.
-- Find the category generating the highest revenue.


-- Find the product with the highest sales.

select product , sum(sales) as total_sales
from ecommerce_sales
group by product
order by total_sales desc
limit 1;

-- Find the second-highest selling product.

select product , sum(sales) as total_sales
from ecommerce_sales
group by product
order by total_sales desc
limit 1 offset 1;

-- Find customers whose total spending is greater than the average customer spending.

select Customer_ID, Customer_Name , sum(sales) as total_spending
from ecommerce_sales
group by Customer_ID, Customer_Name
having sum(sales) > (select avg(total_spending) from (select Customer_ID, sum(sales) as total_spending from ecommerce_sales
group by Customer_ID ) as customer_sales)
order by total_spending desc;

-- Find products whose sales are greater than the average product sales.

select product , sum(Unit_Price) as product_sales
from ecommerce_sales
group by product
having sum (Unit_Price) > (select avg(product_sales) from (select product , sum(Unit_Price) as product_sales from ecommerce_sales
group by product) as product_sales)
order by product_sales desc;


-- Find employees/customers with the highest value in each relevant grouping.



-- Find orders where the sales amount is greater than the average order value.

-- Find the state with sales greater than the average state sales.




-- Using a CTE, calculate total sales by customer and find the top 10 customers.

-- Using a CTE, calculate monthly sales and identify the best month.

-- Using a CTE, calculate category-wise profit and rank categories.

-- Using a CTE, calculate customer lifetime sales.

-- Using a CTE, find customers who have placed more than 3 orders.

-- Using a CTE, calculate each state's sales and profit and identify the most profitable state.


-- Using a CTE, calculate total sales by customer and find the top 10 customers.

-- Using a CTE, calculate monthly sales and identify the best month.

-- Using a CTE, calculate category-wise profit and rank categories.

-- Using a CTE, calculate customer lifetime sales.

-- Using a CTE, find customers who have placed more than 3 orders.

-- Using a CTE, calculate each state's sales and profit and identify the most profitable state.


