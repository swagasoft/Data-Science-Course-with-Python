-- Using Derek's previous video as an example, create another running total.
--  This time, create a running total of standard_amt_usd (in the orders table) 
--  over order time with no date truncation. Your final table should have two columns:
--  one with the amount being added for each new row, and a second with the running total.


SELECT standard_amt_usd,
SUM(standard_amt_usd)  OVER (ORDER BY occurred_at) AS running_total FROM orders;


SELECT standard_amt_usd,
       DATE_TRUNC('year', occurred_at) as year,
       SUM(standard_amt_usd) OVER (PARTITION BY DATE_TRUNC('year', occurred_at) ORDER BY occurred_at) AS running_total
FROM orders


--  display the nmber of a given row
SELECT id, account_id
occurred_at, ROW_NUMBER() OVER 
(ORDER BY id) AS id_num FROM orders;

-- partition by account_id
SELECT id, account_id
occurred_at, ROW_NUMBER() OVER 
(PARTITION BY account_id ORDER BY occurred_at) AS id_num FROM orders;

-- RANK()  does something similar
SELECT id, account_id
occurred_at, RANK() OVER 
(PARTITION BY account_id ORDER BY occurred_at) AS id_num FROM orders;


-- Date trunc same example by month
SELECT id, account_id,
DATE_TRUNC('month', occurred_at) AS month, RANK() OVER 
(PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS id_num FROM orders;

--  dense_rank
SELECT id, account_id,
DATE_TRUNC('month', occurred_at) AS month, DENSE_RANK() OVER 
(PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS id_num FROM orders;


-- Select the id, account_id, and total variable from the orders table,
--  then create a column called total_rank that ranks this total amount of paper ordered 
-- (from highest to lowest) for each account using a partition. Your final table should have these four columns.
SELECT id,
       account_id,
       total,
       RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders;


-- Run the query that Derek wrote in the previous video in the first SQL Explorer below.
--  Keep the query results in mind; you'll be comparing them to the results of another query next.
SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS dense_rank,
       SUM(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS sum_std_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS count_std_qty,
       AVG(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS avg_std_qty,
       MIN(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS min_std_qty,
       MAX(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS max_std_qty
FROM orders;



-- window alias
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders 
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at))


-- window function explanation
-- Step one 
SELECT     account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1

-- Step 2:
-- We start building the outer query, and name the inner query as sub
SELECT account_id, standard_sum   
FROM   (
        SELECT   account_id, SUM(standard_qty) AS standard_sum
        FROM     orders
        GROUP BY 1
       ) sub


-- Step 3 (Part A):
-- We add the Window Function OVER (ORDER BY standard_sum) 
-- in the outer query that will create a result set in ascending order based on the standard_sum column.
SELECT account_id, 
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
        SELECT   account_id, SUM(standard_qty) AS standard_sum
        FROM     orders
        GROUP BY 1
       ) sub

-- This ordered column will set us up for the other part of the Window Function (see below).


-- Step 3 (Part B):
-- The LAG function creates a new column called lag as part of the outer query:
--  LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag.
--  This new column named lag uses the values from the ordered standard_sum (Part A within Step 3).
SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     demo.orders
        GROUP BY 1
       ) sub



-- Step 4:
-- To compare the values between the rows, we need to use both columns (standard_sum and lag).
--  We add a new column named lag_difference,
--  which subtracts the lag value from the value in standard_sum for each row in the table:
SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference
FROM (
       SELECT account_id,
       SUM(standard_qty) AS standard_sum
       FROM orders 
       GROUP BY 1
      ) sub



--       LEAD function
-- Purpose:
-- Return the value from the row following the current row in the table.
SELECT     account_id,
           SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1




-- Step 2:
-- We start building the outer query, and name the inner query as sub.
SELECT account_id,
       standard_sum   
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     demo.orders
        GROUP BY 1
       ) sub


-- Step 3 (Part A):
-- We add the Window Function (OVER BY standard_sum) in the outer
--  query that will create a result set ordered in ascending order of the standard_sum column.
SELECT account_id,
       standard_sum,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     demo.orders
        GROUP BY 1
       ) sub



--        Step 3 (Part B):
-- The LEAD function in the Window Function statement creates a new column called 
-- lead as part of the outer query: LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
SELECT account_id,
       standard_sum,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     orders
        GROUP BY 1
       ) sub



-- Step 4: To compare the values between the rows, we need to use both columns
--  (standard_sum and lag). We add a column named lead_difference,
--  which subtracts the value in standard_sum from lead for each row in the table:
LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference

SELECT account_id,
       standard_sum,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
       SUM(standard_qty) AS standard_sum
       FROM orders 
       GROUP BY 1
     ) sub

     Scenarios for using LAG and LEAD functions
You can use LAG and LEAD functions whenever you are trying to compare the
 values in adjacent rows or rows that are offset by a certain number.



-- Modify Derek's query from the previous video in the SQL Explorer below to perform this analysis. You'll need to use occurred_at and total_amt_usd in the orders table along with LEAD to do so. In your query results,
--  there should be four columns: occurred_at, total_amt_usd, lead, and lead_difference.
SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
       SUM(standard_qty) AS standard_sum
  FROM orders 
 GROUP BY 1
 ) sub


-- solution
SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) AS lead,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) - total_amt_usd AS lead_difference
FROM (
SELECT occurred_at,
       SUM(total_amt_usd) AS total_amt_usd
  FROM orders 
 GROUP BY 1
) sub


-- Percentiles with Partitions
SELECT
       account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
  FROM orders 
 ORDER BY account_id DESC

--  2
SELECT
       account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
  FROM orders 
 ORDER BY account_id DESC;

--  sample jion multiple account
SELECT a.name acount_name, a.website website, s.name sales_rep, r.name region_name
FROM accounts a
INNER JOIN sales_reps s ON a.sales_rep_id = s.id INNER JOIN region r ON s.region_id = r.id;

