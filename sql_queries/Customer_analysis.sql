-- Customer Analysis
-- 1. Who are the top 20 customers by revenue?
	SELECT c.customer_id, c.customer_name, sum(o.order_amount) as revenue
	from orders o
	join customers c 
	ON c.customer_id = o.customer_id
	group by c.customer_id , c.customer_name
	order by revenue desc
	limit 20
	
-- 2. What percentage of revenue comes from top customers?
	SELECT
		c.customer_id, 
		c.customer_name, 
		SUM(o.order_amount) as revenue , 
		round(
			SUM(o.order_amount)*100.0/(SELECT SUM(order_amount)FROM orders)
			,2) AS revenue_pct
	FROM orders o
	join customers c
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
	ORDER BY revenue desc
	limit 1
	
-- 3. Which acquisition channel brings the highest-value customers?
	SELECT 	
		c.acquisition_channel,
		c.customer_name  as customer,
	    SUM(o.order_amount) / COUNT(DISTINCT c.customer_id) AS avg_customer_value
	FROM customers c 
	JOIN orders o ON o.customer_id = c.customer_id
	GROUP BY c.acquisition_channel, c.customer_name
	ORDER BY avg_customer_value DESC;

-- 4. How many repeat customers do we have?
	SELECT customer_id , count(customer_id) as all_customer
	FROM  orders
	GROUP BY  customer_Id
	having count(customer_id) >1
