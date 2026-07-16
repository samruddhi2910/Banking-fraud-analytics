-- Query 1 Sender VS Receiver Analysis
SELECT sender.account_type AS sender_type,
	 receiver.account_type AS receiver_type,
	COUNT(*) AS transaction_count,
	SUM(t.amount) AS total_amount
FROM banking.transactions t

INNER JOIN banking.accounts sender
ON t.from_account = sender.account_id

INNER JOIN banking.accounts receiver
ON t.to_account = receiver.account_id

GROUP BY sender.account_type,
	  receiver.account_type
ORDER BY total_amount DESC;


-- Query 2 Top Fraud accounts

SELECT  t.from_account,
    a.account_type,
    COUNT(*) AS fraud_transaction_count,
    SUM(t.amount) AS total_fraud_amount
FROM banking.transactions t

INNER JOIN banking.accounts a
ON t.from_account = a.account_id

WHERE t.is_fraud = 1
GROUP BY t.from_account,
        a.account_type
ORDER BY fraud_transaction_count DESC,
         total_fraud_amount DESC
LIMIT 20;