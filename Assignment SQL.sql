-- Assignment
-- SQL Basics
#Q1  Create a table called employees with the following structure?
-- emp_id (integer, should not be NULL and should be a primary key)Q
-- emp_name (text, should not be NULL)Q
-- age (integer, should have a check constraint to ensure the age is at least 18)Q
-- email (text, should be unique for each employee)
-- salary (decimal, with a default value of 30,000).
-- Write the SQL query to create the above table with all constraints.

use empdb;
create table employees ( emp_id int primary key not null,
 emp_name varchar(100) not null, age int, check (age>17), 
email varchar(100) unique, salary int default 30000);

#Q2 Explain the purpose of constraints and how they help maintain data integrity in a database. 
#Provide examples of common types of constraints.
# ans - Constraints in a database enforce rules and restrictions on data, ensuring data integrity and accuracy. 
#They prevent invalid data from being entered and maintain consistent relationships between tables. 
#By defining constraints, you establish rules at the database level, making sure that data adheres to specific formats, 
#ranges, and relationships. This helps to maintain data consistency, accuracy, and reliability, 
#which are crucial for reliable database operations. 

#Q3 Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values?
#Justify your answer.
#Ans - The NOT NULL constraint is applied to a column to ensure that the column always contains a value and 
#does not allow NULL values. No primary key cant contain null values as all data is is specific to a primary key

#Q4 Explain the steps and SQL commands used to add or remove constraints on an existing table. 
#Provide an example for both adding and removing a constraint.
#Ans- To add or remove constraints on an existing SQL table, use the ALTER TABLE statement. 
#To add a constraint, use ADD CONSTRAINT followed by the constraint type and definition. 
#To remove a constraint, use DROP CONSTRAINT followed by the constraint name. 
#Example- Identify the table: Use ALTER TABLE <table_name> to specify the target table.
#Specify the constraint type: Use ADD CONSTRAINT <constraint_name> followed by the constraint type

#Q5   Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
#Provide an example of an error message that might occur when violating a constraint.
#Ans- Attempting to insert, update, or delete data in a way that violates constraints 
#results in the database rejecting the operation and returning an error message. 
# If you try to insert a value that doesn't meet the conditions defined by a check constraint, 
#the database will reject the insertion with an error message like "Check constraint violated". 

#Q6  You created a products table without constraints as follows:
#CREATE TABLE products (product_id INT,product_name VARCHAR(50),price DECIMAL(10, 2));  
#Now, you realise that?
# The product_id should be a primary keyQ
# The price should have a default value of 50.00
#Ans - Alter table products 
# add constraint primary key(product id)
#add constraint df
#DEFAULT '50.00' FOR price

# Q7 

#ans- select student name,class name from students
# inner join . classes
#on students.class_id=classes.class_id

#Q8 Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
#listed even if they are not associated with an order 

#Ans- 
-- SELECT 
  #  orders.order_id, 
   # Customers.customer_name, 
   # products.product_name, 
#FROM orders
#INNER JOIN customer 
#ON orders.customer_id =  customer.customer_id
# left join products
#on orders.orderid=products.orderid

#Q9 Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function

#SELECT SUM(sales.amount)
#FROM sales
#INNER JOIN ON sales.productid = products.productid

#Q10 Write a query to display the order_id, customer_name, and the quantity of products ordered by each
#customer using an INNER JOIN between all three tables.
# -- SELECT 
  #  orders.order_id, 
   # Customers.customer_name, 
   # orderdetails.quantity, 
#FROM orders
#INNER JOIN customer 
#ON orders.customer_id =  customer.customer_id
# inner join orderdetailos
#on orders.orderid=orderdetails.orderid

# SQL commands
# Q1 Identify the primary keys and foreign keys in maven movies db. Discuss the differences
# Ans  The various form of id present in each table like actorid, customerid is primary key, 
# while these key present in other table is foreign key


#Q2  List all details of actors

select * 
from actor;

#Q3 -List all customer information from DB.

select * 
from customer;

#Q4 -List different countries.

select country
from country;

#Q5 Display all active customers.

select *
from customer
where active = 1;

#Q6 -List of all rental IDs for customer with ID 1

select * 
from rental
where customer_id like '1%' ;

#Q7 Display all the films whose rental duration is greater than 5 

select * 
from film
where rental_duration > 5;

#Q8 List the total number of films whose replacement cost is greater than $15 and less than $20.

select * 
from film
where replacement_cost between 15 and 20;

#Q9  Display the count of unique first names of actors

select count(distinct (first_name))
from actor;

#Q10 Display the first 10 records from the customer table 

select *
from customer
limit 10;

#Q11 Display the first 3 records from the customer table whose first name starts with ‘b'

select * 
from customer 
where first_name like 'b%'
limit 3;

#Q12 Display the names of the first 5 movies which are rated as ‘G’.

select *
from film
where rating = 'G'
limit 5;

#Q13 Find all customers whose first name starts with "a".

select *
from customer
where first_name regexp '^(a)';

#Q14  Find all customers whose first name ends with "a"

select *
from customer
where first_name regexp 'a$';

#Q15 Display the list of first 4 cities which start and end with ‘a'

select *
from city
where city regexp '^(a)'
limit 4;

#Q16 Find all customers whose first name have "NI" in any position.

select *
from customer
where first_name like '%NI';

#Q17 Find all customers whose first name have "r" in the second position 

#Q18  Find all customers whose first name starts with "a" and are at least 5 characters in length

select *
from customer
where first_name regexp '^(a)'
and length(first_name) = 5;

#Q19 Find all customers whose first name starts with "a" and ends with "o"

select *
from customer
where first_name regexp '^(a)'
and '$(o)';

#Q20 Get the films with pg and pg-13 rating using IN operator

select *
from film
where rating in ('PG', 'PG-13');

#Q21 Get the films with length between 50 to 100 using between operator.

select *
from film
where length between 50 and 100
order by length;

#Q22  Get the top 50 actors using limit operator

select *
from actor
limit 50;

#Q23 Get the distinct film ids from inventory table.

select distinct(film_id) 
from inventory;

#Functions

#Q1 Retrieve the total number of rentals made in the Sakila database

select count(rental_id)
from rental;

#Q2 Find the average rental duration (in days) of movies rented from the Sakila database

select avg(date(return_date) - date(rental_date)) as Avg_total_days
from rental;

#Q3 Display the first name and last name of customers in uppercase.

select upper(first_name), upper(last_name)
from customer;

#Q4 Extract the month from the rental date and display it alongside the rental ID

select rental_id, month(rental_date)
from rental;

#Q5 Retrieve the count of rentals for each customer (display customer ID and the count of rentals

select  customer_id,count(rental_id) as No_of_rentals
from rental
group by customer_id;

#Q6 Find the total revenue generated by each store

select staff_id, sum(amount)
from payment
group by staff_id;

#Q7 Determine the total number of rentals for each category of movies.
select *
from film f 
left join film_category fc on f.film_id=fc.film_id;

#Q8 Find the average rental rate of movies in each language.
select *
from film f 
left join language ll on f.language_id=ll.language_id;


#Q9 Display the title of the movie, customer s first name, and last name who rented it

select f.film_id, f.title, i.inventory_id, r.customer_id, c.first_name, c.last_name
from film f
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id
left join customer c on r.customer_id=c.customer_id;

#Q10 Retrieve the names of all actors who have appeared in the film "Gone with the Wind


select *
from film f
left join film_actor fa on fa.film_id=f.film_id
inner join actor a on fa.actor_id=a.actor_id
where title like "Gone with the wind"
order by title;

#Q11 Retrieve the customer names along with the total amount they've spent on rentals


select customer_id, sum(amount)
 from payment as t
 group by customer_id
 join customer c as t.customer_id=c.customer_id;
 
 #Window Functions
 
# Rank the customers based on the total amount they've spent on rentals.

select customer_id, sum(amount)
from payment
group by customer_id
order by sum(amount) desc;