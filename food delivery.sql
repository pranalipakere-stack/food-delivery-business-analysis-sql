create database food_delivery_analysis;
use food_delivery_analysis;
#Q1.Display all records from the orders table.
select * from orders;
#Q2.Display only order_id, order_date, order_status, and total_amount from the orders table.
select order_id,order_date,order_status,
total_amount from orders;
#Q3.Find all orders where total_amount is greater than 500.
select * from orders 
where total_amount > 500;
#Q4.Display all orders whose order_status is 'completed'.
select * from orders 
where order_status = "Completed";
#Q5.Display the 10 highest-value orders, from highest to lowest total_amount.
select * from orders
order by total_amount desc limit 10;
#Q6.Display all customer records.
select * from customers;
#Q7. Find customers who registered after 1 January 2024.
select * from customers
where reg_date > '2024-01-01';
#Q8.Display the 10 most recently registered customers, from newest to oldest.
select * from customers 
order by reg_date desc limit 10;
#Q9.Display all records from the restaurants table.
select * from restaurants;
#Q10.Find how many restaurants are located in each city.
select restaurant_city,count(restaurant_name) from restaurants
group by restaurant_city;
#Q11.Display all records from the riders table.
select * from riders;
#Q12.Display the 5 most recently registered riders, from newest to oldest.
select * from riders
order by reg_date desc limit 5; 
#Q13.Display all records from the deliveries table.
select * from deliveries;
#Q14.Find how many deliveries belong to each delivery_status.
select delivery_status,count(*) from deliveries
group by delivery_status;
#Q15.Display the order_id, order_status, total_amount, and 
#delivery_status for orders that have a matching record in the deliveries table.
select o.order_id,o.order_status,o.total_amount,
d.delivery_status from orders o
inner join deliveries d
on o.order_id = d.order_id;
#Q16.Display all orders along with their matching delivery status.
select o.order_id,o.order_status,o.total_amount,
d.delivery_status from orders o
left join deliveries d
on o.order_id = d.order_id;
#Q17.Find orders that do not have a matching record in the deliveries table.
select o.order_id,o.order_status,o.total_amount
from orders o left join deliveries d
on o.order_id = d.order_id
where d.order_id is null;
#Q18.Find all orders where total_amount is greater than the average order amount.
select * from orders
where total_amount > (select avg(total_amount)from orders);
#Q19.Find the number of orders placed at each restaurant_id, 
#and display only restaurants that received more than 100 orders.
with restaurant_orders as (
    select
        restaurant_id,
        count(*) as total_orders
    from orders
    group by restaurant_id
)
select *
from restaurant_orders
where total_orders > 100;
#Q20.Rank all orders from highest to lowest based on total_amount.
select
    order_id,
    total_amount,
    rank() over (
        order by total_amount desc
    ) as order_rank
from orders;