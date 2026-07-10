--
-- Joins SQL on paysim data set
-- Practicing SQL JOINs using the transactions and accounts tables.
-- ==================================================

-- Q1. Count transactions by sender type and receiver type

SELECT sender.account_type, 
      receiver.account_type,
      COUNT(*) AS transaction_count
FROM banking.transactions t

INNER JOIN banking.accounts sender
ON t.from_account = sender.account_id

INNER JOIN banking.accounts receiver
ON t.to_account = receiver.account_id
GROUP BY sender.account_type,
         receiver.account_type
ORDER BY transaction_count DESC;

-- Q2. Accounts with more than 10 million total amount
SELECT  t.from_account,
    a.account_type,
   SUM(t.amount) AS total_amount
FROM banking.transactions t

INNER JOIN banking.accounts a
ON t.from_account = a.account_id

GROUP BY t.from_account,a.account_type
HAVING SUM(t.amount) > 10000000
ORDER BY total_amount DESC;

-- Q3. 
