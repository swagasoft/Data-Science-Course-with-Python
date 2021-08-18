
-- Write a query to return the 10 earliest
--  orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd
FROM orders ORDER BY occurred_at
LIMIT 10;


-- Write a query to return the top 5 orders
--  in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders ORDER BY total_amt_usd DESC
LIMIT 5;


-- Write a query to return the lowest 20
--  orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders ORDER BY total_amt_usd ASC
LIMIT 20;


-- Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the 
-- account ID (in ascending order), and then by the total dollar amount (in descending order)
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;



-- Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first
--  by total dollar amount (in descending order), and then by account ID (in ascending order). 


--Compare the results of these two
--  queries above. How are the results different when you switch the column you sort on first? 



-- Pulls the first 5 rows and all columns from the 
-- orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000
SELECT *
FROM orders WHERE gloss_amt_usd > 1000
ORDER BY gloss_amt_usd DESC
LIMIT 5;


-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
FROM orders WHERE total_amt_usd < 500
LIMIT 5;

-- 
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';


SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id, 
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10

-- All the companies whose names start with 'C'.
SELECT name FROM accounts WHERE name LIKE '%C%';

-- All companies whose names contain the string 'one' somewhere in the name.
SELECT name FROM accounts WHERE name LIKE '%one%';

-- All companies whose names end with 's'.
SELECT name
FROM accounts
WHERE name LIKE '%s';

-- Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT  name, primary_poc, sales_rep_id
FROM accounts WHERE name IN ('walmart','Target',
                            'Nordstrom');


-- Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

-- Use the accounts table to find the account name,
--  primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT * FROM accounts WHERE name NOT 
IN ('Target','Walmart');


-- All companies whose names do not contain the string 'one' somewhere in the name.
SELECT * FROM web_events WHERE channel NOT 
IN ('organic','adwords');


-- All the companies whose names do not start with 'C'
SELECT * FROM accounts WHERE name
NOT LIKE 'C%';

-- All companies whose names do not contain the string 'one' somewhere in the name
SELECT * FROM accounts WHERE name
NOT LIKE '%one%';


-- All companies whose names do not end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE '%s';


WHERE column >= 6 AND column <= 10
WHERE column BETWEEN 6 AND 10


-- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT * FROM orders WHERE standard_qty >1000
AND poster_qty = 0 AND gloss_qty = 0;

-- Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';


SELECT occurred_at, gloss_qty FROM orders WHERE gloss_qty BETWEEN 24 AND 29 ORDER BY occurred_at DESC;



SELECT * FROM orders 
WHERE standard_qty = 0 AND 
(gloss_qty > 1000 OR poster_qty > 1000

SELECT * FROM accounts WHERE
(name LIKE 'C%' OR name LIKE 'W%')
AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')  AND primary_poc NOT LIKE '%eana%');


