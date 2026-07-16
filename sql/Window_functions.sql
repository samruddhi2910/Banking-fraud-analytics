-- ===========================================
-- QUERY 1
-- Highest Value Transactions for each Transaction Type
--
-- BUSINESS QUESTION:
-- What is the largest transaction for every transaction type?

-- WHY THIS MATTERS:
-- Fraud teams monitor unusually large transactions because
-- they may indicate suspicious activity. 
-- ==============================================

WITH ranked_transactions AS
(
SELECT type,
       amount,
       is_fraud,
       ROW_NUMBER() OVER( PARTITION BY type
        ORDER BY amount DESC) AS transaction_rank
FROM banking.transactions)

SELECT *
FROM ranked_transactions
WHERE transaction_rank <= 5;


-- ============================================================
-- QUERY 2
-- Rank Accounts by Total Transaction Amount

-- BUSINESS QUESTION:
-- Which accounts transfer the largest amount of money?

-- WHY THIS MATTERS:
-- High-value accounts are often monitored more closely for
-- compliance and fraud detection purposes.
-- ============================================================

WITH account_summary AS
( SELECT from_account,
         SUM(amount) AS total_amount
  FROM banking.transactions
  GROUP BY from_account
)

SELECT from_account,
        total_amount,
        RANK() OVER(ORDER BY total_amount DESC)AS account_rank
FROM account_summary
ORDER BY account_rank
LIMIT 20


-- ============================================================
-- QUERY 3
-- Running Total of Transaction Amount

-- BUSINESS QUESTION:
-- How does the total amount of money transferred grow over time?

-- WHY THIS MATTERS:
-- Running totals are frequently used in financial reporting
-- and trend analysis.
-- ============================================================

SELECT step,
    amount,
    SUM(amount) OVER(ORDER BY step) AS running_total_amount
FROM banking.transactions
LIMIT 100;