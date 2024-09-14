# Base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip install --upgrade pip
RUN pip install pandas psycopg2-binary

# Set work directory
WORKDIR /app

# Copy the ETL script
COPY etl_transform.py /app/

# Command to run the ETL script
CMD ["python", "etl_transform.py"]
