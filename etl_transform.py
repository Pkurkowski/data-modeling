import pandas as pd
import psycopg2
from datetime import datetime
import time

# Connect to PostgreSQL database
conn = psycopg2.connect(
    dbname="your_db_name",
    user="your_username",
    password="your_password",
    host="your_host",
    port="5432"
)

# SQL query to fetch data from all three tables
query = """
    SELECT 
        u.user_id, u.user_name, u.user_email, u.signup_timestamp,
        pt.transaction_id, pt.product_id, pt.transaction_amount, pt.transaction_timestamp,
        ue.event_id, ue.event_name, ue.event_timestamp
    FROM users u
    LEFT JOIN purchase_transactions pt ON u.user_id = pt.user_id
    LEFT JOIN user_events ue ON u.user_id = ue.user_id;
"""

# Load data into a pandas DataFrame
df = pd.read_sql(query, conn)

# Function to convert different timestamp formats to epoch
def convert_to_epoch(timestamp, format_type):
    if format_type == "ISO":
        dt = datetime.strptime(timestamp, "%Y-%m-%dT%H:%M:%SZ")
    elif format_type == "String":
        dt = datetime.strptime(timestamp, "%m/%d/%Y %I:%M %p")
    elif format_type == "Date":
        dt = datetime.strptime(timestamp, "%Y-%m-%d")
    return int(time.mktime(dt.timetuple()))

# Apply the transformation to each column
df['signup_timestamp_epoch'] = df['signup_timestamp'].apply(lambda x: convert_to_epoch(x, "ISO"))
df['transaction_timestamp_epoch'] = df['transaction_timestamp'].apply(lambda x: convert_to_epoch(x, "String"))
df['event_timestamp_epoch'] = df['event_timestamp'].apply(lambda x: convert_to_epoch(x, "Date"))

# Drop original timestamp columns and retain epoch time
df_final = df.drop(columns=['signup_timestamp', 'transaction_timestamp', 'event_timestamp'])

# Save the final DataFrame to a CSV file
df_final.to_csv('semi_structured_table.csv', index=False)

# Close database connection
conn.close()
