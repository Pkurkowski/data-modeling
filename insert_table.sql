-- Insert data into users table
INSERT INTO users (user_name, user_email, signup_timestamp) 
VALUES 
('Alice', 'alice@example.com', '2024-09-15T10:00:00Z'),
('Bob', 'bob@example.com', '2024-09-16T11:30:00Z');

-- Insert data into purchase_transactions table
INSERT INTO purchase_transactions (user_id, product_id, transaction_amount, transaction_timestamp) 
VALUES 
(1, 101, 29.99, '09/15/2024 10:00 AM'),
(2, 102, 49.99, '09-16-2024 11:30:00');

-- Insert data into user_events table
INSERT INTO user_events (user_id, event_name, event_timestamp)
VALUES
(1, 'Viewed Product', '2024-09-15'),
(2, 'Added to Cart', '2024-09-16');
