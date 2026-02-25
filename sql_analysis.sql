CREATE DATABASE gym_analysis;

USE gym_analysis;

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    join_date DATE,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE membership_plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    price DECIMAL(10,2),
    duration_months INT
);

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    member_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (plan_id) REFERENCES membership_plans(plan_id)
);

CREATE TABLE workout_logs (
    log_id INT PRIMARY KEY,
    member_id INT,
    workout_type VARCHAR(50),
    calories_burned INT,
    workout_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

SELECT COUNT(*) FROM members;
SELECT COUNT(*) FROM subscriptions;
SELECT COUNT(*) FROM workout_logs;

SELECT SUM(mp.price) AS total_revenue
FROM subscriptions s
JOIN membership_plans mp 
ON s.plan_id = mp.plan_id;

SELECT mp.plan_name,
       COUNT(s.subscription_id) AS total_subscriptions,
       SUM(mp.price) AS revenue
FROM subscriptions s
JOIN membership_plans mp
ON s.plan_id = mp.plan_id
GROUP BY mp.plan_name
ORDER BY revenue DESC;

SELECT status,
       COUNT(*) AS total_count
FROM subscriptions
GROUP BY status;

SELECT mp.plan_name,
       SUM(CASE WHEN s.status = 'Expired' THEN 1 ELSE 0 END) AS expired_count,
       COUNT(*) AS total_count,
       (SUM(CASE WHEN s.status = 'Expired' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS churn_rate
FROM subscriptions s
JOIN membership_plans mp 
ON s.plan_id = mp.plan_id
GROUP BY mp.plan_name
ORDER BY churn_rate DESC;

SELECT s.status,
       COUNT(w.log_id) AS total_workouts
FROM subscriptions s
JOIN workout_logs w ON s.member_id = w.member_id
GROUP BY s.status;

SELECT s.status,
       COUNT(w.log_id) / COUNT(DISTINCT s.member_id) AS avg_workouts_per_member
FROM subscriptions s
JOIN workout_logs w 
ON s.member_id = w.member_id
GROUP BY s.status;

SELECT b.city,
       SUM(mp.price) AS total_revenue
FROM subscriptions s
JOIN members m ON s.member_id = m.member_id
JOIN branches b ON m.branch_id = b.branch_id
JOIN membership_plans mp ON s.plan_id = mp.plan_id
GROUP BY b.city
ORDER BY total_revenue DESC;

SELECT b.branch_name,
       b.city,
       SUM(mp.price) AS total_revenue
FROM subscriptions s
JOIN members m ON s.member_id = m.member_id
JOIN branches b ON m.branch_id = b.branch_id
JOIN membership_plans mp ON s.plan_id = mp.plan_id
GROUP BY b.branch_name, b.city
ORDER BY total_revenue DESC
LIMIT 5;



SELECT s.status,
       COUNT(w.log_id) AS total_workouts
FROM subscriptions s
JOIN workout_logs w 
ON s.member_id = w.member_id
GROUP BY s.status;

SELECT 
    DATE_FORMAT(s.start_date, '%Y-%m') AS month,
    SUM(mp.price) AS monthly_revenue
FROM subscriptions s
JOIN membership_plans mp ON s.plan_id = mp.plan_id
GROUP BY month
ORDER BY month;

SELECT m.member_name,
       SUM(mp.price) AS total_spent
FROM subscriptions s
JOIN members m ON s.member_id = m.member_id
JOIN membership_plans mp ON s.plan_id = mp.plan_id
GROUP BY m.member_name
ORDER BY total_spent DESC
LIMIT 5;

SELECT 
    CASE 
        WHEN m.age BETWEEN 18 AND 25 THEN '18-25'
        WHEN m.age BETWEEN 26 AND 35 THEN '26-35'
        WHEN m.age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    SUM(mp.price) AS total_revenue
FROM subscriptions s
JOIN members m ON s.member_id = m.member_id
JOIN membership_plans mp ON s.plan_id = mp.plan_id
GROUP BY age_group
ORDER BY total_revenue DESC;

SELECT workout_type,
       COUNT(*) AS total_sessions
FROM workout_logs
GROUP BY workout_type
ORDER BY total_sessions DESC;

SELECT b.branch_name,
       SUM(CASE WHEN s.status = 'Expired' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate
FROM subscriptions s
JOIN members m ON s.member_id = m.member_id
JOIN branches b ON m.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY churn_rate DESC;

