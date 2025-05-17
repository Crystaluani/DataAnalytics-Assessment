SELECT 
  s.id AS plan_id,
  s.owner_id,
  'Savings' AS type,
  MAX(s.created_on) AS last_transaction_date,
  DATEDIFF(CURDATE(), MAX(s.created_on)) AS inactivity_days
FROM savings_savingsaccount s
WHERE s.confirmed_amount > 0
GROUP BY s.id, s.owner_id
HAVING inactivity_days > 365

UNION ALL

SELECT 
  p.id AS plan_id,
  p.owner_id,
  'Investment' AS type,
  MAX(p.created_on) AS last_transaction_date,
  DATEDIFF(CURDATE(), MAX(p.created_on)) AS inactivity_days
FROM plans_plan p
WHERE p.is_a_fund = 1 AND p.status_id = 1
GROUP BY p.id, p.owner_id
HAVING inactivity_days > 365
ORDER BY inactivity_days DESC;
