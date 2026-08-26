-- 		Business scenario
-----------------------------------------------------

-- 1•	Who are our most valuable customers?
		select c.customer_id, c.customer_name ,count(c.*) as total_orders
		from customers c
		join orders  o on o.customer_id = c.customer_id
		group by c.customer_id, c.customer_name
		order by total_orders desc
		limit 5


-- 2•	Which restaurants and cuisines perform best?
		SELECT  r.restaurant_name, r.cuisine, r.city, r.avg_rating as top_rating, COUNT(*) AS total_orders
		FROM restaurants r
		JOIN orders o 
		ON o.restaurant_id= r.restaurant_id
		GROUP BY  r.restaurant_name, r.cuisine, r.city, r.avg_rating
		ORDER BY  total_orders DESC , top_rating DESC
		 

-- 3•	Which cities generate the most business?
		SELECT
			r.restaurant_name, 
			r.city, COUNT(*) AS total_orders,
			SUM(o.order_amount) AS total_sales
		
		FROM Restaurants r
		JOIN orders  o
		ON o.restaurant_id = r.restaurant_id
		GROUP BY  
				r.restaurant_name,
				r.city
		ORDER BY  total_sales DESC
		LIMIT 5 ;
		
-- 4•	How much revenue are we generating?
		SELECT SUM(Order_amount) AS Total_revenue
		FROM Orders
		

-- 5•	How effective are discounts?

		SELECT 
			CASE WHEN discount_amount >0 THEN 'Discount_Applied' ELSE 'NO_Discount' END AS Discount_status,				 
			COUNT(*) AS Total_orders,
			SUM(order_amount) AS  total_revenue,
			ROUND(
				AVG(order_amount)
			,2) AS avg_amount,
			SUM(CASE WHEN order_status = 'Delivered' THEN 1 ELSE 0 END ) AS successful_order,
			ROUND(
				sum(case when order_status = 'Delivered' THEN 1 ELSE 0 END )*100/count(*) 
			,2) AS delivery_rate_pct,
			SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END ) AS Cancelled_orders,
			ROUND(
				SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END )*100/count(*) 
			,2 ) as Cancelled_orders_pct
			
		FROM orders
		GROUP BY 
			CASE WHEN discount_amount >0 THEN 'Discount_Applied' ELSE 'NO_Discount' END
	


-- 6•	Why are orders being cancelled?

		SELECT 
			payment_mode, 
			count(*) as total_orders,
			SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS  Cancelled_orders,
			round(
				SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END)*100/count(*)
				,2) as Cancelletion_rates
		FROM orders
		GROUP BY payment_mode
		ORDER BY  Cancelled_orders desc

		
-- 7•	Which acquisition channels bring high-value customers?
	
		SELECT c.acquisition_channel, 
		count(*) as total_orders,
		sum(o.order_amount) as total_revenue
	
		from customers c
		join orders o
		on c.customer_id = o.customer_id
		group by c.acquisition_channel
		ORDER BY total_orders desc ,total_revenue desc


-- 8•	What factors affect order value?
		SELECT 
		    restaurant_id, 
		    round(AVG(order_amount),2) as avg_order_value,
		    COUNT(order_id) as total_orders
		FROM orders
		GROUP BY restaurant_id
		ORDER BY avg_order_value DESC;

		
-- 9•	Which customers are becoming inactive?
		SELECT customer_id, max(order_timestamp) AS last_order
		FROM orders
		GROUP BY customer_id
		ORDER BY  last_order asc
	

-- 10•	Where should the company focus its marketing and restaurant partnerships
		SELECT 
		    restaurant_id, 
		    COUNT(order_id) AS total_successful_orders,
		    SUM(order_amount) AS total_revenue
		FROM orders
		WHERE order_status = 'Delivered'
		GROUP BY restaurant_id
		ORDER BY total_successful_orders DESC, total_revenue DESC;
