
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- As we've learned, the SELECT clause indicates which
--  column(s) of data you'd like to see in the output
--   (For Example, orders.* gives us all the columns in
--    orders table in the output). The FROM clause indicates 
--    t table from which we're pulling data, and the JOIN 
--    indicates the second table. The ON clause specifies
--     the column on which you'd like to merge the two
--      tables together. Try running this query yourself
--       below.


--  select data from two columns
SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- selected value from join table
SELECT orders.standard_qty, orders.gloss_qty, 
       orders.poster_qty,  accounts.website, 
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

--  Join multiple tables
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

-- Provide a table for all the for all web_events associated with account name of Walmart.
--  There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. 
-- Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT a.primary_poc, w.occurred_at, w.channel, a.name FROM web_events w JOIN accounts a
ON w.account_id = a.id WHERE a.name = 'Walmart';


-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- Your final table should include three columns: the region name,
--  the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

-- The questions are aimed to assure you have a conceptual 
-- idea of what is happening with LEFT and INNER JOINs before you need to use them for more difficult problems.
SELECT c.countryid, c.countryName, s.stateName
FROM Country c
JOIN State s
ON c.countryid = s.countryid;


-- Provide a table that provides the region for each sales_rep along with their associated accounts.
--  This time only for the Midwest region. Your final table should include three columns: the region name,
--  the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;



-- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: 
-- the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;


-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
-- Your final table should include three columns: the
--  region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;

-- Provide the name for each region for every order, as well as the account name and 
-- the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard
--  order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price.
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100;

-- Provide the name for each region for every order, as well as the account name and
--  the unit price they paid (total_amt_usd/total) for the order. However, you should only
--  provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50.
--  Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first.










count