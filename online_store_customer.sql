-- Create a table to store customer transaction data for an online store
CREATE TABLE online_store_customer_data(
Transaction_date DATE,
Transaction_ID INT,
Gender VARCHAR(200),
Age	INT,
Marital_status VARCHAR(200),
State_names VARCHAR(200),
Segment	VARCHAR(200),
Employees_status VARCHAR(200),
Payment_method	VARCHAR(200),
Referal	INT,
Amount_spent numeric(10,2)
);

-- This query retrieves the total revenue generated from customers in each state
SELECT state_names, SUM(amount_spent) AS total_revenue
FROM online_store_customer_data
GROUP BY state_names
ORDER BY total_revenue DESC;

-- This query retrieves the number of customers and the average amount spent for each customer segment
SELECT segment, COUNT(*) AS num_customers, ROUND(AVG(amount_spent)) AS avg_spent
FROM online_store_customer_data
GROUP BY segment
ORDER BY avg_spent DESC;

-- This query calculates the average amount spent by customers grouped by their referral source.
-- It excludes records where the referral source is NULL and rounds the average to the nearest whole number.
SELECT referal, ROUND(AVG(amount_spent)) AS avg_spent
FROM online_store_customer_data
WHERE referal IS NOT NULL
GROUP BY referal;


-- This query categorizes customers into age groups ('Teen', 'Young Adult', 'Adult', 'Senior'),
-- calculates the average amount spent (rounded) by each age group, 
-- and excludes records with NULL age values
SELECT
  CASE
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 39 THEN 'Young Adult'
    WHEN age BETWEEN 40 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  ROUND(AVG(amount_spent)) AS avg_spent
FROM online_store_customer_data
WHERE age IS NOT NULL
GROUP BY age_group;


-- This query retrieves the top 5 most frequently used payment methods 
-- by counting how many times each method appears in the data, 
-- then orders them in descending order of usage.
SELECT payment_method, COUNT(*) AS method_count
FROM online_store_customer_data
GROUP BY payment_method
ORDER BY method_count DESC
LIMIT 5;




