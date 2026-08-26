
-- ZOMATO
-- Revenue Analysis

-- 1. What is the total revenue?
	SELECT sum(order_amount) as total_ravenue 
	FROM Orders;
	
-- 2. What is the monthly revenue trend?
	SELECT 
		TO_CHAR(order_timestamp, 'YYYY-MM') as monthly_revenue,
		SUM(order_amount) as total_revenue
	FROM orders
	GROUP BY TO_CHAR(order_timestamp,'YYYY-MM')

-- 3. Which city contributes the highest revenue?
	SELECT 
		r.city  as city_name , 
		SUM(o.order_amount) AS Total_revenue
	FROM Orders o
	join restaurants r on r.restaurant_id = o.restaurant_id
	GROUP BY  r.city
	ORDER BY Total_revenue desc

-- 4. Which payment mode generates the most revenue?
	SELECT
		payment_mode,	
		sum(order_amount) AS total_revenue
 	FROM Orders
	GROUP BY payment_mode
	ORDER by total_revenue DESC
		
-- 5. What is the Average Order Value (AOV)?
	SELECT avg(order_amount) as aov
	FROM orders