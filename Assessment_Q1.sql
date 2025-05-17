-- File: Assessment_Q1.sql
-- Question 1: High-Value Customers with Savings + Investment Plans

SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(s.confirmed_amount) / 100, 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON s.owner_id = u.id AND s.confirmed_amount > 0
JOIN plans_plan p ON p.owner_id = u.id AND p.is_a_fund = 1 AND p.status_id = 1
GROUP BY u.id, u.name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;



