# Data Modeling for Product Analytics

This project demonstrates how to build a data model for product analytics by joining three relational tables: User Data, Purchase Transaction History, and User Events. The project includes extracting, transforming timestamps into epoch format, and loading the data into a semi-structured format. The ETL process is containerized with Docker and deployed on a Kubernetes cluster running on Ubuntu.

## Project Features:
- Three relational tables for users, purchases, and events.
- Timestamp transformation into epoch time in the ETL pipeline.
- Semi-structured table creation by joining the three tables.
- Dockerized ETL pipeline.
- Kubernetes deployment on Ubuntu.

## Tech Stack:
- **Python**: For data extraction, transformation, and loading (ETL).
- **PostgreSQL**: For storing relational tables.
- **Docker**: For containerizing the ETL pipeline.
- **Kubernetes**: To orchestrate the ETL process on Ubuntu.
- **Pandas**: For processing and transforming the data.

---

## File Structure:
- **SQL Files**:
  - `create_tables.sql`: SQL script to create the three relational tables (users, purchase transactions, user events).
  - `insert_data.sql`: SQL script to insert sample data into the three tables.

- **ETL Files**:
  - `etl_transform.py`: Python ETL script for transforming timestamps into epoch format and joining the three tables.
  
- **Containerization**:
  - `Dockerfile`: Docker configuration to containerize the ETL process.

- **Kubernetes**:
  - `etl_deployment.yaml`: Kubernetes deployment file to orchestrate the ETL process on Ubuntu.

---

## SQL Table Creation (File: `create_tables.sql`):

```sql
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
