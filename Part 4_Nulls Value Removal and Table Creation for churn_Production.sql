-- Using the churn database
USE churn_db;

-- Remove NULL values and insert data into a new table called churn_Production
SELECT 
    Customer_ID,  -- Keeping original Customer_ID since it has no NULL
    Gender,       -- Keeping Gender since it has no NULL
    Age,          -- Keeping Age since it has no NULL
    Married,      -- Keeping marital status since it has no NULL
    State,        -- Keeping State since it has no NULL
    Number_of_Referrals,  -- Keeping number of referrals since it has no NULL
    Tenure_in_Months,     -- Keeping customer tenure since it has no NULL
    ISNULL(Value_Deal, 'None') AS Value_Deal,  -- Replacing NULL in Value_Deal with 'None'
    Phone_Service,  -- Keeping phone service info since it has no NULL
    ISNULL(Multiple_Lines, 'No') AS Multiple_Lines,  -- Replacing NULL with 'No'
    Internet_Service,  -- Keeping Internet service type since it has no NULL
    ISNULL(Internet_Type, 'None') AS Internet_Type,  -- Replacing NULL with 'None'
    ISNULL(Online_Security, 'No') AS Online_Security,  -- Replacing NULL with 'No'
    ISNULL(Online_Backup, 'No') AS Online_Backup,  -- Replacing NULL with 'No'
    ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,  -- Replacing NULL with 'No'
    ISNULL(Premium_Support, 'No') AS Premium_Support,  -- Replacing NULL with 'No'
    ISNULL(Streaming_TV, 'No') AS Streaming_TV,  -- Replacing NULL with 'No'
    ISNULL(Streaming_Movies, 'No') AS Streaming_Movies,  -- Replacing NULL with 'No'
    ISNULL(Streaming_Music, 'No') AS Streaming_Music,  -- Replacing NULL with 'No'
    ISNULL(Unlimited_Data, 'No') AS Unlimited_Data,  -- Replacing NULL with 'No'
    Contract,  -- Keeping contract type since it has no NULL
    Paperless_Billing,  -- Keeping paperless billing info since it has no NULL
    Payment_Method,  -- Keeping payment method since it has no NULL
    Monthly_Charge,  -- Keeping monthly charges since it has no NULL
    Total_Charges,  -- Keeping total charges since it has no NULL
    Total_Refunds,  -- Keeping total refunds since it has no NULL
    Total_Extra_Data_Charges,  -- Keeping extra data charges since it has no NULL
    Total_Long_Distance_Charges,  -- Keeping long distance charges since it has no NULL
    Total_Revenue,  -- Keeping total revenue since it has no NULL
    Customer_Status,  -- Keeping customer status since it has no NULL
    ISNULL(Churn_Category, 'Others') AS Churn_Category,  -- Replacing NULL with 'Others'
    ISNULL(Churn_Reason, 'Others') AS Churn_Reason  -- Replacing NULL with 'Others'

INTO [churn_db].[dbo].[churn_Production]  -- Creating a new table called churn_Production
FROM [churn_db].[dbo].[churn_main];  -- Source table: churn_main
