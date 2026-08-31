-- Cancellation & Refund Analysis

-- 1. What is the cancellation rate, and refund rate?
WITH CTE AS(
		SELECT 
			order_status,
			count(*) as total_orders,
			Round(count(*) *100/ (select count(*) from orders),2) as total_rate
		FROM ORDERS
		GROUP BY order_status
)
SELECT * FROM CTE
-- WHERE order_status in ('Cancelled','Refunded')
WHERE Order_status != 'Delivered'


-- 3. How much revenue is lost due to cancellations?
	SELECT 
		order_status,
		sum(order_amount) as total_revenue,
		count(*) as total_orders,
		Round(count(*) *100/ (select count(*) from orders),2) as total_rate
	FROM ORDERS
	WHERE Order_status = 'Cancelled'
	GROUP BY order_status


-- 4. Which restaurants have the highest cancellation rate?
SELECT 	
	r.restaurant_name as restaurant_name,
	o.order_status as order_status,
	count(*) as total_orders,
	round(count(*)*100/ sum(count(*)) over(),2) as total_cancellation_rate
FROM  orders o
INNER JOIN restaurants r 
ON r.restaurant_id = o.restaurant_id
WHERE order_status = 'Cancelled'
GROUP BY  r.restaurant_name, o.order_status
ORDER BY total_cancellation_rate desc
LIMIT 1
