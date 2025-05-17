-- File: Assessment_Q2.sql
-- Question 2: Transaction Frequency Analysis
-- Description: Categorize customers by average monthly transaction frequency.

WITH customer_transactions AS (
    SELECT
        s.owner_id,
        COUNT(*) AS total_transactions,
        TIMESTAMPDIFF(MONTH, MIN(s.created_on), MAX(s.created_on)) + 1 AS active_months
    FROM savings_savingsaccount s
    GROUP BY s.owner_id
),
customer_avg AS (
    SELECT
        ct.owner_id,
        ct.total_transactions,
        ct.active_months,
        ROUND(ct.total_transactions / ct.active_months, 2) AS avg_txn_per_month
    FROM customer_transactions ct
),
categorized AS (
    SELECT
        CASE
            WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
            WHEN avg_txn_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_txn_per_month
    FROM customer_avg
)
SELECT
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 2) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category
ORDER BY FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');
