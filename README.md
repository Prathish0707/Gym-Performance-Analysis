Gym Performance Analysis (SQL + Python)
Project Overview

This project analyzes the business performance of a multi-branch gym management system using SQL and Python. The goal is to evaluate revenue generation, customer retention, branch performance, and member engagement through structured analytical techniques.

The dataset was synthetically generated to simulate a real-world subscription-based gym business environment.

Tech Stack

MySQL – Database design and SQL analysis

Python (Pandas, Matplotlib) – Data analysis and visualization

Jupyter Notebook – Python implementation

Git & GitHub – Version control

Dataset Description

The dataset was generated using Python and simulates a realistic gym management system with five relational tables:

branches

members

membership_plans

subscriptions

workout_logs

Dataset Scale:

5,000 members

12,000 subscriptions

50,000 workout session records

Multiple branches across cities

The database schema was designed with proper primary and foreign key constraints to ensure referential integrity.

Database Relationships

One branch → Many members

One member → Many subscriptions

One member → Many workout logs

One membership plan → Many subscriptions

SQL Analysis Performed

The following business analyses were conducted using SQL:

Total revenue calculation

Revenue by membership plan

Revenue by city

Branch performance ranking

Monthly revenue trend

Overall churn rate

Churn rate by plan

Engagement comparison (Active vs Expired members)

Python Analysis

Python was used for:

Merging relational tables

Validating SQL revenue results

Churn distribution analysis

Aggregating workout logs

Data visualization

Workout logs were aggregated at member level before merging to maintain correct granularity and prevent data duplication.

Key Insights

Total revenue generated: approximately 41.87 Million

Elite plan generated the highest revenue

Bangalore contributed the majority of total revenue

Overall churn rate is approximately 77 percent

Branch performance varies significantly across locations

Member engagement levels differ across subscription status

Business Recommendations

Implement retention strategies to reduce churn

Introduce loyalty programs for expiring members

Improve performance in lower-revenue branches

Use engagement metrics to identify potential churn risks

Project Structure

Gym-Performance-Analysis
│
├── Data
│ ├── branches.csv
│ ├── members.csv
│ ├── membership_plans.csv
│ ├── subscriptions.csv
│ └── workout_logs.csv
│
├── sql_analysis.sql
├── GYM_Analysis.ipynb
└── README.md
