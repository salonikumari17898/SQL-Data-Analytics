SELECT * FROM analyst_practice.orders;
-- Display all orders sorted by price from lowest to highest.
select * from analyst_practice.orders order by price;
-- Display all customers in alphabetical order by customer_name. 
select * from analyst_practice.orders order by customer_name;
-- Display all orders from newest to oldest order_date. 
select* from analyst_practice.orders order by order_date Desc;
-- Display all products sorted by quantity from highest to lowest.
select * from analyst_practice.orders order by quantity Desc;
-- Display the orders sorted by rating from lowest to highest.
select* from analyst_practice.orders order by rating asc;
-- Find the 3 most expensive orders.
select* from analyst_practice.orders order by price desc limit 3;
-- Display orders from Delhi, sorted by price from highest to lowest.
select* from analyst_practice.orders  where city = 'Delhi'
order by price desc ;
-- Sort orders by city alphabetically and then by price from highest to lowest within each city.
select * from analyst_practice.orders order by city asc, price desc;
-- Display the 5 most recently placed orders.
select * from analyst_practice.orders order by order_date desc limit 5;
-- Display all Electronics orders by rating from highest to lowest.
select * from analyst_practice.orders  where category= 'Electronics'
order by rating desc;
-- Calculate revenue as quantity * price and sort orders by revenue from highest to lowest.

SELECT *,
       quantity * price AS revenue
FROM analyst_practice.orders
ORDER BY revenue DESC;
-- Find the second-highest distinct product price.
SELECT DISTINCT price
FROM analyst_practice.orders
ORDER BY price DESC
LIMIT 1 OFFSET 1;
-- Sort orders by category ascending, then order_date descending.
select *from analyst_practice.orders order by category asc, order_date desc;
-- Display the 3 lowest-rated orders, showing customer_name, product and rating.
select customer_name, product , rating from analyst_practice.orders 
order by rating asc limit 3;
-- Find the top 3 orders by total value (quantity * price), showing order_id, product, 
-- quantity, price and total value.
select order_id, product, price,quantity,
quantity * price as total_value from analyst_practice.orders 
 order by total_value desc limit 3;