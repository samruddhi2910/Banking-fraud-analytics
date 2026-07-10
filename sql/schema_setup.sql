-- create schema 
CREATE SCHEMA IF NOT EXISTS banking;

-- Checking whether python load created a transaction table.
SELECT *
FROM public.transactions
LIMIT 5;

-- Coping the transactions loaded table into the banking schema
DROP TABLE IF EXISTS banking.transactions_raw;

CREATE TABLE banking.transactions_raw AS
SELECT *
FROM public.transactions;

SELECT * 
FROM banking.transactions_raw
LIMIT 5;

-- creating the main cleaned transactions table
DROP TABLE IF EXISTS banking.transactions;

CREATE TABLE banking.transactions AS 
SELECT 
	step,
	type,
	amount,
	"nameOrig"  AS from_account,
	"oldbalanceOrg"  AS oldbalance_org,
	"newbalanceOrig" AS newbalance_orig,
	"nameDest" AS to_account,
	"oldbalanceDest" AS oldbalance_dest,
	"newbalanceDest" As newbalance_dest,
	"isFraud" AS is_fraud,
	"isFlaggedFraud" AS is_flagged_fraud
FROM banking.transactions_raw;


SELECT *
FROM banking.transactions
LIMIT 5;


-- creating accounts table from sender + receiver IDs

DROP TABLE IF EXISTS banking.accounts;

CREATE TABLE banking.accounts AS 
SELECT DISTINCT 
		account_id,
		CASE
			WHEN account_id LIKE 'C%' THEN 'Customer'
			WHEN account_id LIKE 'M%' THEN 'Merchant'
			ELSE 'Unknown'
		END AS account_type
FROM
	(SELECT from_account AS account_id
	 FROM banking.transactions
	 
	 UNION
	 
	 SELECT to_account AS account_id
	 FROM banking.transactions
	 )t;


-- Checking accounts table and its total count.

SELECT * 
FROM banking.accounts
LIMIT 20;


SELECT COUNT(*)
FROM banking.accounts;




