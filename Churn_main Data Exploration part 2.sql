-- Using the churn database
USE churn_db;

-- Gender Distribution Analysis
SELECT 
    Gender, 
    COUNT(Gender) AS TotalCount,
    COUNT(Gender) * 100.0 / (SELECT COUNT(*) FROM churn_main) AS Percentage
FROM churn_main
GROUP BY Gender;

-- Contract Type Distribution Analysis
SELECT 
    Contract,
    COUNT(Contract) AS TotalCount,
    COUNT(Contract) * 100.0 / (SELECT COUNT(*) FROM churn_main) AS Percentage
FROM churn_main
GROUP BY Contract;

-- Customer Status & Revenue Analysis
SELECT 
    Customer_Status,
    COUNT(Customer_Status) AS TotalCount,
    SUM(Total_Revenue) AS TotalRevenue,
    SUM(Total_Revenue) * 100.0 / (SELECT SUM(Total_Revenue) FROM churn_main) AS RevenuePercentage
FROM churn_main
GROUP BY Customer_Status;

-- State-wise Customer Distribution
SELECT 
    State, 
    COUNT(State) AS TotalCount,
    COUNT(State) * 100.0 / (SELECT COUNT(*) FROM churn_main) AS Percentage
FROM churn_main
GROUP BY State
ORDER BY Percentage DESC;

-- Data Cleaning Section Starts
-- Identifying nulls across all columns


















