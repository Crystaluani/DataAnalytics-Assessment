USE adashi_staging;

SELECT
    u.id AS owner_id,
    u.name,
    MAX(s.created_on) AS last_activity
FROM users_customuser u
JOIN plans_plan p ON p.owner_id = u.id
LEFT JOIN savings_savingsaccount s ON s.owner_id = u.id
WHERE u.id IS NOT NULL
GROUP BY u.id, u.name
HAVING last_activity IS NULL
   OR last_activity < DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
ORDER BY last_activity
LIMIT 50;
SET GLOBAL net_read_timeout = 600;
SET GLOBAL net_write_timeout = 600;
