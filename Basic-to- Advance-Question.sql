CREATE DATABASE analyst_practice;
USE analyst_practice;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    rating DECIMAL(2,1)
);

INSERT INTO orders VALUES
(101, 'Amit', 'Delhi', 'Laptop', 'Electronics', 1, 55000, '2026-01-10', 4.5),
(102, 'Priya', 'Mumbai', 'Mobile', 'Electronics', 2, 20000, '2026-01-15', 4.2),
(103, 'Rahul', 'Pune', 'Chair', 'Furniture', 4, 2500, '2026-02-02', 3.8),
(104, 'Neha', 'Delhi', 'Headphones', 'Electronics', 3, 1500, '2026-02-10', 4.8),
(105, 'Ankit', 'Bangalore', 'Table', 'Furniture', 2, 7000, '2026-02-15', 4.0),
(106, 'Sneha', 'Mumbai', 'Laptop', 'Electronics', 1, 60000, '2026-03-01', 4.9),
(107, 'Ravi', 'Pune', 'Mobile', 'Electronics', 3, 18000, '2026-03-05', 3.5),
(108, 'Pooja', 'Delhi', 'Chair', 'Furniture', 5, 3000, '2026-03-12', 4.1),
(109, 'Karan', 'Bangalore', 'Headphones', 'Electronics', 2, 2000, '2026-03-20', 4.6),
(110, 'Simran', 'Mumbai', 'Table', 'Furniture', 1, 8000, '2026-04-01', 4.3),
(111, 'Meera', 'Delhi', 'Mobile', 'Electronics', 2, 22000, '2026-04-05', 4.7),
(112, 'Vikas', 'Pune', 'Laptop', 'Electronics', 1, 58000, '2026-04-10', 4.4);

SELECT * FROM analyst_practice.orders;
select * from analyst_practice.orders where city ='Delhi';
-- Display all orders sorted by price from lowest to highest.
select * from analyst_practice.orders order by price asc;
-- Find the 3 most expensive orders.
select * from analyst_practice.orders order by price desc limit 3;
-- Display all unique cities.
select distinct city  from analyst_practice.orders;
-- Find orders where price is greater than 10,000 and rating is at least 4.
select * from analyst_practice.orders where price>10000 and rating>=4;
-- Find orders where the city is Delhi or Mumbai.
select * from analyst_practice.orders where city ='Mumbai' or city= 'Delhi';
-- Display the 5 most recent orders by order_id, highest first..
select * from analyst_practice.orders order by order_date desc limit 5;
-- Find orders that are NOT from Delhi..
select * from analyst_practice.orders where not city='Delhi';
-- Find orders whose rating is NOT 5.
select * from analyst_practice.orders where not rating= 5;
update analyst_practice.orders set city='Bokaro' where order_id =101;
select * from analyst_practice.orders;
update analyst_practice.orders set customer_name='Saloni' where order_id=101;
select * from analyst_practice.orders;
-- Count the total number of orders.
select count(*)  as total_orders from analyst_practice.orders;
-- Find the total revenue from all orders using the price column.
select  sum(price) as total_orders from analyst_practice.orders ;
-- Find the average product price.
select avg(price)as average_price from analyst_practice.orders;
-- Find the highest product price.
select max(price) as highest_price from analyst_practice.orders;
-- Find the lowest product price.
select min(price) as lowest_price from analyst_practice.orders;
-- Count how many orders have a rating greater than or equal to 4.
select count(*) as total_orders from analyst_practice.orders where rating>=4;
-- Calculate the total quantity of products ordered.
select sum(quantity) as total_quantity from analyst_practice.orders;
-- Find the average rating of all orders.
select avg(rating) as average_rating from analyst_practice.orders;
-- Count the number of orders from each city.
-- Find the total sales value for each product category, using quantity * price.
select sum(price*quantity) as total_value from analyst_practice.orders group by category;
-- Find the maximum price in each category.
select max(price) as maximum_price from analyst_practice.orders group by category;
-- Find the average rating for each city.
select avg(rating) as average_rating from analyst_practice.orders group by city;
-- Display only cities having more than 2 orders.
select city,count(*) as total_orders from analyst_practice.orders group by city having count(*)>2;
-- Find product categories whose average rating is greater than 4.3.
select  category,avg(rating) as average_rating from analyst_practice.orders
 group by category having avg(rating)>4.3;
 -- Find the city with the highest total sales value.
 select city,sum(quantity* Price) as total_sales from analyst_practice.orders
 group by city order by total_sales Desc limit 1;
 -- Count the distinct products in each category.
 select category, count(distinct product) from analyst_practice.orders group by category;
 -- Find the total sales value and average order value for each city.
 select city, sum(quantity* price)as total_order_value,
 avg(quantity* price) as average_order_value from analyst_practice.orders group by city;
 -- Display categories with total quantity greater than 5, 
 -- sorted by total quantity from highest to lowest.
 select category,count(quantity)as total_quantity from analyst_practice.orders
 group by category having sum(quantity)>5  order by  total_quantity desc ;