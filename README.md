# PaySim Fraud Analytics Project

#Project Overview:

This project analyzes financial transaction data from the PaySim synthetic financial dataset to identify transaction patterns, fraud activity, high-value transactions, and potentially high-risk transaction behavior.

The project combines Python and PostgreSQL to perform data cleaning, exploratory analysis, database preparation, and SQL-based fraud analysis.

#Business Problem:

Financial institutions need to monitor large volumes of transactions and identify unusual or potentially fraudulent activity.

This project explores transaction behavior and answers questions such as:

1.How many fraudulent transactions occurred?

2.What percentage of transactions were classified as fraud?

3.Which transaction types have the highest transaction volume?

4.Which transaction types are associated with the most fraud?

5.How much money was involved in fraudulent transactions?

6.How do fraudulent and non-fraudulent transaction amounts compare?

7.Which accounts have high transaction activity?

8.Which transactions represent the highest-value transactions?

#Dataset:

The project uses the PaySim synthetic financial dataset.

The dataset contains approximately 6.36 million financial transactions with information about transaction type, transaction amount, sender and receiver accounts, account balances, and fraud indicators.

Important columns include:

#step — time step of the transaction
#type — transaction type
#amount — transaction amount
#nameOrig — sender account
#oldbalanceOrg — sender balance before transaction
#newbalanceOrig — sender balance after transaction
#nameDest — receiver account
#oldbalanceDest — receiver balance before transaction
#newbalanceDest — receiver balance after transaction
#isFraud — fraud indicator
#isFlaggedFraud — system fraud flag

The dataset is synthetic and should not be interpreted as real customer banking data.

#Tools & Technologies

-Python
-Pandas
-Jupyter Notebook
-PostgreSQL
-SQL
-SQLAlchemy
-Git
-GitHub

#Project Workflow:

PaySim Dataset
    |
    v
Python/Panda
    |
    v
Data Cleaning and Exploration
    |
    V
POSTGRESQL
    |
    V
Database Tables
    |
    v
SQL Analysis
    |
    v
Fraud KPIs and Business Insights

#Data Exploration & Cleaning

Python and Pandas were used to inspect the dataset and evaluate its quality.

The analysis included:

-Dataset dimensions
-Column and data type inspection
-Missing-value checks
-Duplicate checks
-Transaction-type distribution
-Fraud/non-fraud distribution
-Basic transaction statistics

#The dataset contains:

-6,362,620 transactions
-11 columns

#PostgreSQL Database:

The project uses PostgreSQL to organize the transaction data for SQL analysis.

The database workflow includes:

1.Creating a banking schema.
2.Creating a raw transaction table.
3.Creating a cleaned transactions table.
4.Creating an accounts table.
5.Creating account-type classifications for customer and merchant accounts.

The main transaction table includes standardized column names such as:

from_account
to_account
oldbalance_org
newbalance_orig
oldbalance_dest
newbalance_dest
is_fraud
is_flagged_fraud

SQL Analysis:
1.Basic SQL
-COUNT
-SUM
-AVG
-GROUP BY
-ORDER BY
-CASE

2.Window Functions

-ROW_NUMBER()
-RANK()
-SUM() OVER()
-PARTITION BY
These were used for ranking high-value transactions, ranking accounts by transaction value, and calculating running transaction totals.

#KEY Findings:
The analysis identified the following results:

#Transaction Volume-
The dataset contains:
6,362,620 total transactions

#Transaction volume by type:
Transaction Type            Number of Transactions

CASH_OUT                2,237,500

PAYMENT                 2,151,495

CASH_IN                 1,399,284

TRANSFER                532,909

DEBIT                   41,432


#Fraud Volume:

The dataset contains:
-8,213 fraudulent transactions
-6,354,407 non-fraudulent transactions

Fraudulent transactions represent approximately 0.13% of all transactions.

#Fraud Amount:

The total amount associated with fraudulent transactions is approximately:
$12.06 billion

#Average Transaction Amount:

The average fraudulent transaction amount is approximately:
$1.47 million

The average non-fraudulent transaction amount is approximately:
$178,197

This shows a substantial difference between the average transaction amounts in the fraudulent and non-fraudulent groups within this dataset.

#Fraud Amount by Transaction Type:-
The total fraudulent transaction amount was approximately:

Transaction Type    Fraud Amount

CASH_OUT            $5.99 billion
TRANSFER            $6.07 billion

These results indicate that CASH_OUT and TRANSFER transactions are important areas for further fraud analysis in this synthetic dataset.

#Author:

Samruddhi Chapale

This project was created as a portfolio project to demonstrate practical skills in Python, SQL, PostgreSQL, data analysis, and fraud analytics.