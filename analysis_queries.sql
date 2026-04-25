-- =========================================
-- BANK FRAUD ANALYSIS PROJECT (SQL)
-- =========================================
-- Author: Saidat Makinde
-- Description: SQL analysis to detect fraud patterns
-- =========================================


-- =========================================
-- 1. DATA PREVIEW
-- =========================================

SELECT *
FROM transactions
LIMIT 10;

-- =========================================
-- 2. TOTAL TRANSACTIONS & TOTAL AMOUNT
-- =========================================
SELECT 
    COUNT(*) AS total_transactions,
    SUM(transaction_amount) AS total_amount
FROM transactions;


-- =========================================
-- 3. TOP 10 CUSTOMERS BY TOTAL SPENDING
-- =========================================
SELECT customer_id,
       SUM(transaction_amount) AS total_spent
FROM transactions
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- =========================================
-- 4. TOTAL TRANSACTIONS PER CUSTOMER
-- =========================================
SELECT customer_id,
       COUNT(*) AS total_transactions
FROM transactions
GROUP BY customer_id
ORDER BY total_transactions DESC;


-- =========================================
-- 5. CUSTOMERS WITH MORE THAN 10 TRANSACTIONS
-- =========================================
SELECT customer_id,
       COUNT(*) AS total_transactions
FROM transactions
GROUP BY customer_id
HAVING COUNT(*) > 10
ORDER BY total_transactions DESC;


-- =========================================
-- 6. AVERAGE TRANSACTION AMOUNT PER TYPE
-- =========================================
SELECT transaction_type,
       AVG(transaction_amount) AS avg_amount
FROM transactions
GROUP BY transaction_type
ORDER BY avg_amount DESC;


-- =========================================
-- 7. FRAUD (ANOMALY) RATE OVERALL
-- =========================================
SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) AS anomaly_count,
    ROUND(100.0 * SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS anomaly_percentage
FROM transactions;


-- =========================================
-- 8. FRAUD RATE BY TRANSACTION TYPE
-- =========================================
SELECT transaction_type,
       COUNT(*) AS total_transactions,
       SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) AS anomaly_count,
       ROUND(100.0 * SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS anomaly_rate
FROM transactions
GROUP BY transaction_type
ORDER BY anomaly_rate DESC;


-- =========================================
-- 9. HIGH-VALUE VS NORMAL TRANSACTIONS
-- =========================================
SELECT 
    CASE 
        WHEN transaction_amount > 10000 THEN 'High Value'
        ELSE 'Normal Value'
    END AS transaction_category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) AS anomaly_count,
    ROUND(100.0 * SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS anomaly_rate
FROM transactions
GROUP BY transaction_category;


-- =========================================
-- 10. DAILY TRANSACTION FREQUENCY (SUSPICIOUS ACTIVITY)
-- =========================================
SELECT customer_id,
       DATE(transaction_date) AS transaction_day,
       COUNT(*) AS transactions_per_day
FROM transactions
GROUP BY customer_id, transaction_day
HAVING COUNT(*) > 5
ORDER BY transactions_per_day DESC;


-- =========================================
-- 11. FRAUD BY LOCATION (HOTSPOTS)
-- =========================================
SELECT location,
       COUNT(*) AS total_transactions,
       SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) AS anomaly_count,
       ROUND(100.0 * SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS anomaly_rate
FROM transactions
GROUP BY location
ORDER BY anomaly_rate DESC;


-- =========================================
-- 12. CUSTOMERS EXCEEDING CREDIT LIMIT
-- =========================================
SELECT customer_id,
       credit_limit,
       credit_card_balance
FROM transactions
WHERE credit_card_balance > credit_limit;


-- =========================================
-- 13. LOAN STATUS VS TRANSACTION BEHAVIOR
-- =========================================
SELECT loan_status,
       COUNT(*) AS total_transactions,
       AVG(transaction_amount) AS avg_transaction,
       SUM(transaction_amount) AS total_amount
FROM transactions
GROUP BY loan_status
ORDER BY total_amount DESC;


-- =========================================
-- 14. LARGE WITHDRAWALS (POTENTIAL RISK)
-- =========================================
SELECT customer_id,
       transaction_amount,
       account_balance
FROM transactions
WHERE transaction_type = 'Withdrawal'
  AND transaction_amount > 5000
ORDER BY transaction_amount DESC;


-- =========================================
-- 15. MONTHLY FRAUD TREND
-- =========================================
SELECT DATE_TRUNC('month', CAST(transaction_date AS DATE)) AS month,
       COUNT(*) AS total_transactions,
       SUM(CASE WHEN anomaly = -1 THEN 1 ELSE 0 END) AS anomaly_count
FROM transactions
GROUP BY month
ORDER BY month;


-- =========================================
-- 16. MULTI-LOCATION CUSTOMER ACTIVITY
-- =========================================
SELECT customer_id,
       COUNT(DISTINCT location) AS locations_used
FROM transactions
GROUP BY customer_id
HAVING COUNT(DISTINCT location) > 3
ORDER BY locations_used DESC;


-- =========================================
-- 17. CUSTOMER TOTAL SPENDING RANK (ADVANCED)
-- =========================================
SELECT customer_id,
       SUM(transaction_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(transaction_amount) DESC) AS rank
FROM transactions
GROUP BY customer_id;


-- =========================================
-- 18. CUSTOMER SPENDING ABOVE AVERAGE
-- =========================================
WITH customer_totals AS (
    SELECT customer_id,
           SUM(transaction_amount) AS total_spent
    FROM transactions
    GROUP BY customer_id
)
SELECT *
FROM customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent) FROM customer_totals
);


-- =========================================
-- 19. CUSTOMER RANK (SAFE VERSION - WORKS EVERYWHERE)
-- =========================================
SELECT customer_id,
       total_spent,
       RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM (
    SELECT customer_id,
           SUM(transaction_amount) AS total_spent
    FROM transactions
    GROUP BY customer_id
) sub;
