-- Customer Churn Analysis
-- 1. How many customers have churned?

WITH CustomerLastOrder AS (
    -- Step 1: Har customer ka sabse aakhri order date nikalna
    SELECT 
        customer_id,
        MAX(order_timestamp) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
)
-- Step 2nd: count who all customers purchesed last 90 days
SELECT 
    COUNT(customer_id) AS total_churned_customers
FROM CustomerLastOrder
WHERE last_purchase_date < (SELECT MAX(order_timestamp) FROM orders) - INTERVAL '90 days';




-- 2. What is the churn rate?

WITH CustomerLastOrder AS (
    SELECT customer_id, MAX(order_timestamp) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
),
ChurnStatus AS (
    SELECT customer_id,
           CASE WHEN last_purchase_date < (SELECT MAX(order_timestamp) FROM orders) - INTERVAL '90 days' THEN 1 ELSE 0 END AS is_churned
    FROM CustomerLastOrder
)
SELECT 
    ROUND(sum(is_churned) * 100.0 / COUNT(customer_id), 2) AS churn_rate_percentage
FROM ChurnStatus;




-- 3. Which city has the highest churn?

WITH CustomerLastOrder AS (
    SELECT customer_id, MAX(order_timestamp) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
),
ChurnedCustomers AS (
    SELECT customer_id
    FROM CustomerLastOrder
    WHERE last_purchase_date < (SELECT MAX(order_timestamp) FROM orders) - INTERVAL '90 days'
)
SELECT c.city, COUNT(ch.customer_id) AS total_churned
FROM customers c
JOIN ChurnedCustomers ch ON c.customer_id = ch.customer_id
GROUP BY c.city
ORDER BY total_churned DESC
LIMIT 1;

-- 4. How much revenue is lost due to churn?
WITH CustomerLastOrder AS (
    SELECT customer_id, MAX(order_timestamp) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
),
ChurnedCustomers AS (
    SELECT customer_id
    FROM CustomerLastOrder
    WHERE last_purchase_date < (SELECT MAX(order_timestamp) FROM orders) - INTERVAL '90 days'
)
SELECT SUM(o.order_amount) AS historical_revenue_lost
FROM orders o
JOIN ChurnedCustomers ch ON o.customer_id = ch.customer_id
WHERE o.order_status = 'Delivered';

-- 5. Who are the high-value churned customers?

WITH CustomerLastOrder AS (
    SELECT customer_id, MAX(order_timestamp) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
),
ChurnedCustomers AS (
    SELECT customer_id
    FROM CustomerLastOrder
    WHERE last_purchase_date < (SELECT MAX(order_timestamp) FROM orders) - INTERVAL '90 days'
)
SELECT ch.customer_id, SUM(o.order_amount) AS total_lifetime_value
FROM ChurnedCustomers ch
JOIN orders o ON ch.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY ch.customer_id
ORDER BY total_lifetime_value DESC
LIMIT 50; 
