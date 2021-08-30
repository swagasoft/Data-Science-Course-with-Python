
-- inner join
SELECT column_name(s)
FROM Table_A
INNER JOIN Table_B ON Table_A.column_name = Table_B.column_name;
-- Left joins also include unmatched rows from the left table, which is indicated in the “FROM” clause.

-- Left Join
SELECT column_name(s)
FROM Table_A
LEFT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- Right joins are similar to left joins, but include unmatched data from the right table 
-- the one that’s indicated in the JOIN clause

-- Right join
SELECT column_name(s)
FROM Table_A
RIGHT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- Full Outer Join
SELECT column_name(s)
FROM Table_A
FULL OUTER JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- A common application of this is when joining two tables on a timestamp. Let’s say you’ve got one 
-- table containing the number of item 1 sold each day, 
-- and another containing the number of item 2 sold. If a certain date, like January 1, 2018, 
-- exists in the left table but not the right, while another date, like January 2, 2018, exists 
-- in the right table but not the left:

-- a left join would drop the row with January 2, 2018 from the result set
-- a right join would drop January 1, 2018 from the result set
-- The only way to make sure both January 1, 2018 and January 2,
--  2018 make it into the results is to do a full outer join. A full outer join returns
--   unmatched records in each table with null values for the columns that came from the opposite table.
-- If you wanted to return unmatched rows only, which is useful for some cases of data assessment, 
-- you can isolate them by adding the following line to the end of the query:


-- WHERE Table_A.column_name IS NULL OR Table_B.column_name IS NULL
-- Finding Matched and Unmatched Rows with FULL OUTER JOIN
Finding Matched and Unmatched Rows with FULL OUTER JOIN
SELECT *
  FROM accounts
 FULL JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id



-- If unmatched rows existed (they don't for this query),
--  you could isolate them by adding the following line to the end of the query:


--  write a query that left joins the accounts table and the sales_reps tables on each sale rep
--  's ID number and joins it using the < comparison operator on accounts.primary_poc and sales_reps.name, like so:
--  my solution
SELECT a.name account_name, a.primary_poc contact,
s.name sales_rep
FROM accounts a
LEFT JOIN sales_reps s ON a.primary_poc < s.name;


-- Inequality JOINs Solution
SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
  FROM accounts
  LEFT JOIN sales_reps
    ON accounts.sales_rep_id = sales_reps.id
   AND accounts.primary_poc < sales_reps.name

--  self JOIN internal
SELECT o1.id AS o1_id,
       o1.account_id AS o1_account_id,
       o1.occurred_at AS o1_occurred_at,
       o2.id AS o2_id,
       o2.account_id AS o2_account_id,
       o2.occurred_at AS o2_occurred_at
  FROM orders o1
 LEFT JOIN orders o2
   ON o1.account_id = o2.account_id
  AND o2.occurred_at > o1.occurred_at
  AND o2.occurred_at <= o1.occurred_at + INTERVAL '28 days'
ORDER BY o1.account_id, o1.occurred_at


-- Modify the query from the previous video, which is pre-populated in the SQL Explorer below, 
-- to perform the same interval analysis except for the web_events table. Also:

-- change the interval to 1 day to find those web events that occurred after, 
-- but not more than 1 day after, another web event
-- add a column for the channel variable in both instances of the table in your query
-- my solution
SELECT w1.id AS w1_id,
       w1.account_id AS w1_account_id,
       w1.occurred_at AS w1_occurred_at,
       w2.id AS w2_id,
       w2.account_id AS w2_account_id,
       w2.occurred_at AS w2_occurred_at
  FROM web_events w1
 LEFT JOIN web_events w2
   ON w1.account_id = w2.account_id
  AND w2.occurred_at > w1.occurred_at
  AND w2.occurred_at <= w1.occurred_at + INTERVAL '1 day'
ORDER BY w1.account_id, w1.occurred_at


-- Self JOINs solution
SELECT we1.id AS we_id,
       we1.account_id AS we1_account_id,
       we1.occurred_at AS we1_occurred_at,
       we1.channel AS we1_channel,
       we2.id AS we2_id,
       we2.account_id AS we2_account_id,
       we2.occurred_at AS we2_occurred_at,
       we2.channel AS we2_channel
  FROM web_events we1 
 LEFT JOIN web_events we2
   ON we1.account_id = we2.account_id
  AND we1.occurred_at > we2.occurred_at
  AND we1.occurred_at <= we2.occurred_at + INTERVAL '1 day'
ORDER BY we1.account_id, we2.occurred_at


-- Write a query that uses UNION ALL on two instances 
-- (and selecting all columns) of the accounts table. Then inspect the results and answer the subsequent quiz.
SELECT * FROM accounts
WHERE accounts.name = 'Walmart'
UNION ALL 

SELECT * FROM accounts


-- Add a WHERE clause to each of the tables that you unioned in the query above,
--  filtering the first table where name equals Walmart and 
-- filtering the second table where name equals Disney. Inspect the results then answer the subsequent quiz.

SELECT * FROM accounts
WHERE accounts.name = 'Walmart'
UNION ALL 

SELECT * FROM accounts WHERE name = 'Disney'


-- Alternative
SELECT * FROM accounts
WHERE name = 'Walmart' OR name= 'Disney'

-- Solutions
-- Quiz 1
SELECT *
    FROM accounts

UNION ALL

SELECT *
  FROM accounts



  -- QUIZ 2
  SELECT *
    FROM accounts
    WHERE name = 'Walmart'

UNION ALL

SELECT *
  FROM accounts
  WHERE name = 'Disney'

  -- QUIZ 3
  WITH double_accounts AS (
    SELECT *
      FROM accounts

    UNION ALL

    SELECT *
      FROM accounts
)

SELECT name,
       COUNT(*) AS name_count
 FROM double_accounts 
GROUP BY 1
ORDER BY 2 DESC
