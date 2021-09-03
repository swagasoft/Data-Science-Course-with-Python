
-- Let's start with creating a table that provides 
-- the following details: actor's first and last name combined as 
-- full_name, film title, film description and length of the movie.

-- How many rows are there in the table?

SELECT a.first_name, 
       a.last_name,
       a.first_name || ' ' || a.last_name AS full_name,
       f.title,
       f.length
FROM   film_actor fa
JOIN   actor a
ON     fa.actor_id = a.actor_id
JOIN   film f
ON     f.film_id = fa.film_id

-- Write a query that creates a list of actors and
--  movies where the movie length was more than 60 minutes. How many rows are there in this query result?

SELECT a.first_name, 
       a.last_name,
       a.first_name || ' ' || a.last_name AS full_name,
       f.title ,
       f.length
FROM   film_actor fa
JOIN   actor a
ON     fa.actor_id = a.actor_id
JOIN   film f
ON     f.film_id = fa.film_id
WHERE  f.length > 60


-- Question 3: Write a query that captures the full name of the actor, and counts the number of 
-- movies each actor has made. Identify the actor who has made the maximum number of movies.
SELECT actorid,  fullname,
COUNT (film_title) film_count_per_actor FROM
(SELECT a.actor_id actorid, a.first_name,
a.last_name, a.first_name || ' ' || a.last_name AS
fullname, f.title film_title
FROM film_actor fa JOIN actor a ON fa.actor_id = a.actor_id JOIN film f ON fa.film_id = f.film_id) t1
GROUP BY 1, 2 ORDER BY 3 DESC;




-- Question 1: Write a query that creates a table with 4 columns: actor's full name, 
-- film title, length of movie, and a column name "filmlen_groups" that classifies movies based on their length. 
-- Filmlen_groups 
-- should include 4 categories: 1 hour or less, Between 1-2 hours, Between 2-3 hours, More than 3 hours.

SELECT full_name, 
       filmtitle,
       filmlen,
       CASE WHEN filmlen <= 60 THEN '1 hour or less'
       WHEN filmlen > 60 AND filmlen <= 120 THEN 'Between 1-2 hours'
       WHEN filmlen > 120 AND filmlen <= 180 THEN 'Between 2-3 hours'
       ELSE 'More than 3 hours' END AS filmlen_groups
FROM 
    (SELECT a.first_name, 
               a.last_name,
               a.first_name || ' ' || a.last_name AS full_name,
               f.title filmtitle, 
               f.length filmlen
        FROM film_actor fa
        JOIN actor a
        ON fa.actor_id = a.actor_id
        JOIN film f
        ON f.film_id = fa.film_id) t1



       --  Question 2: Write a query you to create a count of movies in each of the
       --   4 filmlen_groups: 1 hour or less, Between 1-2 hours, Between 2-3 hours, More than 3 hours.


SELECT    DISTINCT(filmlen_groups),
          COUNT(title) OVER (PARTITION BY filmlen_groups) AS filmcount_bylencat
FROM  
         (SELECT title,length,
          CASE WHEN length <= 60 THEN '1 hour or less'
          WHEN length > 60 AND length <= 120 THEN 'Between 1-2 hours'
          WHEN length > 120 AND length <= 180 THEN 'Between 2-3 hours'
          ELSE 'More than 3 hours' END AS filmlen_groups
          FROM film ) t1
ORDER BY  filmlen_groups

-- PROJECT

-- Question 1
-- We want to understand more about the movies that families are watching. The following categories are considered 
-- family movies: Animation, Children, Classics, Comedy, Family and Music.

-- Create a query that lists each movie, the film category it is classified in, and the number of times it has been 
-- rented out.

-- Check Your Solution
-- For this query, you will need 5 tables: Category, Film_Category, Inventory, Rental and Film. Your solution should 
-- have three columns: Film title, Category name and Count of Rentals.

-- The following table header provides a preview of what the resulting table should look like if you order by category 
-- name followed by the film title.

-- HINT: One way to solve this is to create a count of movies using aggregations, subqueries and Window functions.

SELECT  fl.title film_title , ca.name category_name, COUNT (r.rental_id) rental_count FROM film_category fc 
JOIN category ca ON fc.category_id = ca.category_id 
JOIN film fl ON fc.film_id = fl.film_id
JOIN inventory iv ON iv.film_id = fl.film_id
JOIN rental r ON r.inventory_id = iv.inventory_id 
GROUP BY 1, 2 ORDER BY 1 


-- Question 2
-- Now we need to know how the length of rental duration of these family-friendly movies compares 
-- to the duration that all movies are rented for. Can you provide a table with the movie titles 
-- and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter)
--  based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories?
--  Make sure to also indicate the category that these family-friendly movies fall into.
SELECT  fl.title film_title , ca.name category_name, fl.rental_duration rental_duration ,
NTILE(4) OVER (PARTITION BY rental_duration ) AS standard_quartile
FROM film_category fc 
JOIN category ca ON fc.category_id = ca.category_id 
JOIN film fl ON fc.film_id = fl.film_id




SELECT t.name,
t.standard_quartile,
COUNT(*)
FROM (SELECT c.name,
f.rental_duration,
NTILE(4) OVER(ORDER BY f.rental_duration) AS standard_quartile
FROM category AS c
JOIN film_category AS fc
ON c.category_id = fc.category_id
AND c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
JOIN film AS f
ON f.film_id = fc.film_id) AS t
GROUP BY 1, 2
ORDER BY 1, 2;

-- SET #2
Question 1:
-- We want to find out how the two stores compare in their count of rental orders during every month for 
-- all the years we have data for. Write a query that returns the store ID for the store, the year and month
--  and the number of rental orders each store has fulfilled for that month. Your table should include a column 
-- for each of the following: year, month, store ID and count of rental orders fulfilled during that month.

SELECT  DATE_PART('month', r.rental_date) AS Rental_month,   DATE_PART('year', r.rental_date) AS Rental_year,
s.store_id store_ID, count(r.rental_id)
FROM rental r
JOIN  inventory i ON i.inventory_id = r.inventory_id
JOIN store s ON s.store_id = i.store_id
GROUP BY 1, 2, 3;



-- Question 2
-- We would like to know who were our top 10 paying customers, how many payments they made 
-- on a monthly basis during 2007, and what was the amount of the monthly payments. Can you 
-- write a query to capture the customer name, month and year of payment, 
-- and total payment amount for each month by these top 10 paying customers?

with cte AS

(SELECT cu.customer_id, cu.first_name || ' ' || cu.last_name AS fullname , SUM(amount)
FROM customer cu
JOIN payment pa
ON cu.customer_id = pa.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10)
SELECT date_trunc('month',payment_date) AS pay_mon,
cte.fullname, COUNT(*) AS pay_countpermon,
SUM(pu.amount)

FROM cte
JOIN payment pu
ON cte.customer_id = pu.customer_id
GROUP BY 2,1
ORDER BY 2,1




-- Finally, for each of these top 10 paying customers, I would like to find out the difference across 
-- their monthly payments during 2007. Please go ahead and write a query to compare the payment amounts
--  in each successive month. Repeat this for each of these 10 paying customers. Also, it will be tremendously helpful if
--  you can identify the customer name who paid the most difference in terms of payments.

-- SET #2 ANSWER 3
with cte AS

(SELECT cu.customer_id, cu.first_name || ' ' || cu.last_name AS fullname , SUM(amount)
FROM customer cu
JOIN payment pa
ON cu.customer_id = pa.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10)
SELECT date_trunc('month',payment_date) AS pay_mon,
cte.fullname, COUNT(*) AS pay_countpermon,
SUM(pu.amount),
LEAD(SUM(pu.amount)) OVER (PARTITION BY fullname ORDER BY date_trunc('month',payment_date)) AS previous_month_total
FROM cte
JOIN payment pu
ON cte.customer_id = pu.customer_id
GROUP BY 2,1
ORDER BY 2,1