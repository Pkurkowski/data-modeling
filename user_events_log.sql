SELECT u.user_name, ue.event_name, ue.event_timestamp
FROM users u
JOIN user_events ue ON u.user_id = ue.user_id
ORDER BY ue.event_timestamp;
