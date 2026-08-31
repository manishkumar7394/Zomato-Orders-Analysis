
-- Coupon Analysis

-- 1. What percentage of orders use coupons?
SELECT 
	COUNT(*) AS total_orders,
	COUNT(CASE WHEN discount_amount > 0 THEN 1 END) as discount_orders,
	round(
		COUNT(CASE WHEN discount_amount >0 THEN 1 END)*100/COUNT(*),
		2) as coupons_pct
FROM orders


-- 2. Do coupon users spend more than non-coupon users?
SELECT 
	CASE 
		WHEN discount_amount >0 THEN 'coupon_user' else 'non_coupon_user' end as customer_type,
		
	count(*) as total_orders,
	round(avg(order_amount),2) as avg_order_amount,
	sum(order_amount) as total_amount
	
FROM orders
GROUP BY
	CASE
		WHEN discount_amount >0 THEN 'coupon_user' else 'non_coupon_user' end
ORDER BY total_amount desc


-- 3. Which city uses the most coupons?
with cte as(
	SELECT  r.city,
		CASE WHEN o.discount_amount >0 THEN 'coupon_user' else 'non_coupon_user' end as customer_type,
		count(o.*) as total_orders,
		round(avg(o.order_amount),2) as avg_order_amount,
		sum(o.order_amount) as total_amount
	FROM orders o 
	join restaurants r 
	on r.restaurant_id = o.restaurant_id
	GROUP BY CASE WHEN discount_amount >0 THEN 'coupon_user' else 'non_coupon_user' end, city
	ORDER BY total_amount desc
)
select * FROM CTE
WHERE customer_type = 'coupon_user'


-- 4. Are coupons helping customer retention?
WITH customer_spending AS (
    SELECT 
        customer_id,
        
        CASE 
            WHEN max(
                CASE 
                    WHEN discount_amount > 0 THEN 1 
                    ELSE 0 
                END
            ) = 1 THEN 'Coupon User'
            ELSE 'Non-Coupon User'
        END AS customer_type,
        
        SUM(order_amount) AS total_spending
        
    FROM orders
    GROUP BY customer_id
)

SELECT 
    customer_type,
    COUNT(*) AS total_customers,
    ROUND(AVG(total_spending), 2) AS avg_customer_spending
FROM customer_spending
GROUP BY customer_type;

------OR--------

WITH ranked_orders AS (
    SELECT 
        customer_id,
        order_id,
        order_timestamp,
        discount_amount,
        
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_timestamp
        ) AS order_number,
        
        COUNT(*) OVER (
            PARTITION BY customer_id
        ) AS total_orders
        
    FROM orders
),

customer_retention AS (
    SELECT 
        customer_id,
        
        MAX(total_orders) AS total_orders,
        
        MAX(
            CASE WHEN order_number = 1 AND discount_amount > 0  THEN 1
                ELSE 0
            END
        ) AS first_order_coupon
        
    FROM ranked_orders
    GROUP BY customer_id
)

SELECT 
    CASE 
        WHEN first_order_coupon = 1 
        THEN 'First Order Coupon User'
        ELSE 'First Order Non-Coupon User'
    END AS customer_type,
    
    COUNT(*) AS total_customers,
    
    COUNT(
        CASE 
            WHEN total_orders > 1 THEN 1
        END
    ) AS retained_customers,
    
    ROUND(
        COUNT(
            CASE 
                WHEN total_orders > 1 THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS retention_rate

FROM customer_retention
GROUP BY first_order_coupon;
