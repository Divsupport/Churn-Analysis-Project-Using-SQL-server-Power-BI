-- Use the churn database
USE churn_db;

-- Creating the view for customers who have either 'Churned' or 'Stayed'
CREATE VIEW view_churn AS
SELECT *
FROM churn_Production
WHERE Customer_Status IN ('Churned', 'Stayed');

-- Creating the view for customers who have 'Joined'
CREATE VIEW view_JoinData AS
SELECT *
FROM churn_Production
WHERE Customer_Status = 'Joined';

