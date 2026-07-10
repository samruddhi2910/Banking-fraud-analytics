--
-- Basic SQL analysis on paysim data set
-- Practicing SELECT,WHERE,GROUP BY,HAVING,ORDER BY
-- ==================================================


-- Q1. Show first 10 rows from transactions table

SELECT * 
FROM banking.transactions
LIMIT 10;

-- Q2. Show only fraud transactions

SELECT *
FROM banking.transactions
WHERE is_fraud = 1;


-- Q3. Count total fraud transactions
SELECT COUNT(*) AS fraud_count
FROM banking.transactions
WHERE is_fraud = 1;

-- Q4. Count number of transactions by transaction type
SELECT type,
	   COUNT(*) AS total_transaction_count
FROM banking.transactions
GROUP BY type
ORDER BY total_transaction_count;

-- Q5. Find the total transaction amount by transaction type

SELECT type,
	   sum(amount) AS total_amount
FROM banking.transactions
GROUP BY type
ORDER BY total_amount DESC;
	
-- Q6. Show fraud transaction with amount greater than 100K

SELECT *
FROM banking.transactions
WHERE amount > 100000 AND is_fraud = 1
LIMIT 20;

-- Q7. Show top 20 highest fraud transactions by amount
SELECT *
FROM banking.transactions
WHERE is_fraud = 1
ORDER BY amount DESC
LIMIT 20;

  
-- Q8. Find the minimun,maximum and average transaction amount
SELECT MIN(amount) AS minimum_amount,
		MAX(amount) AS maximum_amount,
		AVG(amount) AS avg_amount
FROM banking.transactions;


-- Q9. Find the total amount of money involved in fraud transactions

SELECT SUM(amount) AS total_amount
FROM banking.transactions
WHERE is_fraud = 1;

-- Q10. Find the average amount of fraud transactions

SELECT
    AVG(amount) AS avg_fraud_amount
FROM banking.transactions
WHERE is_fraud = 1;

-- Q11. Find the average amount of non-fraud transactions
SELECT
    AVG(amount) AS avg_non_fraud_amount
FROM banking.transactions
WHERE is_fraud = 0;

-- Q12. Count number of fraud transactions by transaction type

SELECT COUNT(*) AS fraud_transaction_count,
		type
FROM banking.transactions
WHERE is_fraud = 1
GROUP BY type
ORDER BY fraud_transaction_count DESC;

-- Q13. Calculate average transaction amount by transaction type
SELECT AVG(amount)AS avg_amount,
		type
FROM banking.transactions
GROUP BY type
ORDER BY avg_amount DESC;

-- Q14. Count fraud and non-fraud transactions separately
SELECT is_fraud,
		COUNT(*) AS tansaction_type
FROM banking.transactions
GROUP BY is_fraud
ORDER BY is_fraud;

-- Q15. Find total fraud amount by transaction type

SELECT SUM(amount) AS fraud_amount,
		type
FROM banking.transactions
WHERE is_fraud = 1
GROUP BY type
ORDER BY fraud_amount;

-- Q16. Calculate total amount by transaction type and fraud flag
SELECT
    type,
    is_fraud,
    SUM(amount) AS total_amount
FROM banking.transactions
GROUP BY type, is_fraud
ORDER BY type, is_fraud;


-- Q17. Find total amount sent by each sender account
SELECT
    from_account,
    SUM(amount) AS transaction_amount
FROM banking.transactions
GROUP BY from_account
ORDER BY transaction_amount DESC
LIMIT 20;


-- Q18. Find sender accounts with at least 5 fraud transactions

SELECT
    from_account,
    COUNT(*) AS fraud_transaction_count
FROM banking.transactions
WHERE is_fraud = 1
GROUP BY from_account
HAVING COUNT(*) >= 5
ORDER BY fraud_transaction_count DESC;


-- Q19. Classify each transaction into amount bands:
-- Low: amount < 10000
-- Medium: amount between 10000 and 100000
-- High: amount > 100000

SELECT step,
	type,
	amount,
	CASE WHEN amount < 10000 THEN 'Low'
		 WHEN amount BETWEEN 10000 AND 100000 THEN 'Medium'	
		 ELSE 'High'
	END AS amount_band
FROM banking.transactions
LIMIT 20;
	

-- Q20. Count fraud transactions by amount band
SELECT COUNT(*) AS transaction_count,
		CASE 
			WHEN amount < 10000 THEN 'Low'
		 	WHEN amount BETWEEN 10000 AND 100000 THEN 'Medium'	
		 	ELSE 'High'
		END AS amount_band
FROM banking.transactions
WHERE is_fraud = 1
GROUP BY 
	CASE WHEN amount < 10000 THEN 'Low'
		 WHEN amount BETWEEN 10000 AND 100000 THEN 'Medium'	
		 ELSE 'High'
	END
ORDER BY transaction_count DESC;





