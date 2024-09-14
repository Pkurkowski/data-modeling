-- Create User Data Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100),
    signup_timestamp TIMESTAMP -- ISO 8601 format
);

-- Create Purchase Transaction History Table
CREATE TABLE purchase_transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT,
    transaction_amount FLOAT,
    transaction_timestamp VARCHAR(20) -- String format
);

-- Create User Events Table
CREATE TABLE user_events (
    event_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    event_name VARCHAR(100),
    event_timestamp DATE -- Date format
);
