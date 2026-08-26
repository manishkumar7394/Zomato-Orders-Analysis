DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS customers;


-- =========================================
-- CUSTOMERS
-- =========================================

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_time DATE,
    acquisition_channel VARCHAR(50)
);


-- =========================================
-- RESTAURANTS
-- =========================================

CREATE TABLE restaurants (
    restaurant_id VARCHAR(20) PRIMARY KEY,
    restaurant_name VARCHAR(50),
    cuisine VARCHAR(50),
    city VARCHAR(50),
    avg_rating NUMERIC(3,2)
);


-- =========================================
-- ORDERS
-- =========================================

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    restaurant_id VARCHAR(20),
    order_timestamp DATE,
    order_amount NUMERIC(10,2),
    discount_amount NUMERIC(10,2),
    delivery_fee NUMERIC(10,2),
    payment_mode VARCHAR(15),
    order_status VARCHAR(25),

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_orders_restaurant
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)

select count(*) from orders
		
);