Gym Performance Analysis (SQL + Python)
Project Overview

This project analyzes the business performance of a multi-branch gym management system using SQL and Python. The objective is to evaluate revenue generation, customer retention, branch performance, and customer engagement using structured analytical techniques.

The dataset was synthetically generated to simulate a real-world subscription-based gym business.

Tech Stack

MySQL (Database & SQL Analysis)

Python (Pandas, Matplotlib)

Jupyter Notebook

Git & GitHub

Dataset Description

The dataset was generated using Python and simulates a realistic gym management system with the following tables:

branches

members

membership_plans

subscriptions

workout_logs

Dataset scale:

5,000 members

12,000 subscriptions

50,000 workout session records

Multiple cities and branches

The schema was designed with proper primary and foreign key relationships to maintain referential integrity.

Database Schema

Relationships:

One branch → Many members

One member → Many subscriptions

One member → Many workout logs

One membership plan → Many subscriptions

Key SQL Analysis

The following analyses were performed using SQL:

Total revenue calculation

Revenue by membership plan

Revenue by city

Branch performance ranking

Monthly revenue trend

Overall churn rate

Churn by plan

Engagement comparison (Active vs Expired)

Python Analysis

Python was used for:

Data merging and validation

Revenue cross-verification

Churn distribution analysis

Engagement aggregation

Visualization of revenue and trends

Workout logs were aggregated before merging to maintain correct granularity and avoid duplication.

Key Insights

Total revenue generated: ~41.87 Million

Elite plan generated the highest revenue

Bangalore contributed the majority of revenue

Overall churn rate is high (~77%)

Branch performance varies significantly

Engagement patterns differ among members

Business Recommendations

Implement customer retention strategies to reduce churn

Introduce loyalty incentives for expiring members

Improve performance of low-revenue branches

Use engagement metrics to identify at-risk customers
