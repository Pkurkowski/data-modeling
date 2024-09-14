SELECT u.user_name, SUM(pt.transaction_amount) AS total_spent
FROM users u
JOIN purchase_transactions pt ON u.user_id = pt.user_id
GROUP BY u.user_name;
