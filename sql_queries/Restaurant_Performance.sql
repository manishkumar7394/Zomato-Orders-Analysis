
-- Restaurant Performance
-- 1. Which restaurants generate the highest revenue?
	SELECT 
		r.restaurant_name,
		SUM(o.order_amount) as highest_revenue
	FROM orders o
	join restaurants r on r.restaurant_id = o.restaurant_id
	GROUP BY  1
	ORDER BY highest_revenue desc
	limit 3

	
-- 2. Which restaurants receive the most orders?
	SELECT 
		r.restaurant_name,
		count(o.order_timestamp) as max_orders
	FROM orders o
	join restaurants r on r.restaurant_id = o.restaurant_id
	GROUP BY  1
	ORDER BY max_orders desc
	limit 3

-- 3. Which cuisines are most popular?
	SELECT 
		R.Cuisine,
		count(o.order_timestamp) as total_order
	FROM orders o
	join restaurants r on r.restaurant_id = o.restaurant_id
	GROUP BY  1
	ORDER BY total_order desc

-- 4. Do highly-rated restaurants generate more revenue?
	SELECT 
		 r.restaurant_name, r.avg_rating,
		SUM(o.order_amount) as highest_revenue
	FROM orders o
	join restaurants r 
	ON r.restaurant_id = o.restaurant_id
	GROUP BY  1,2
	ORDER BY r.avg_rating desc ,highest_revenue desc
	limit 10
	
-- 5. Last 5 Restaurant
	select r.restaurant_name, o.order_timestamp as order_
	from  orders o
	join restaurants r 
	on r.restaurant_id =  o.restaurant_id
	Order by order_ desc
	limit 5
	
