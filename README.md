# Churn-Analysis-Project-Using-SQL-server-Power-BI
I Analyzed 7,040 telecom customer records to identify churn drivers and design retention strategies. Built an end-to-end analytics pipeline: SQL ETL for data cleaning, Power BI for visualization, and actionable insights to reduce churn by 15% ($720K annual savings).

## 🚀 Project Goals

1. **ETL Pipeline**: I set up a Microsoft SQL Server database (`Churn_db`) to stage, clean, and transform raw customer data.
2. **Data Exploration**: I analyzed customer demographics, service subscriptions, payment info, and churn status to uncover retention drivers.
3. **Power BI Dashboard**: I developed an interactive report with key metrics, custom segments, and AI-powered narratives.
4. **Insights & Recommendations**: I identified high-risk segments (e.g., women 50+), service gaps, and contract/payment vulnerabilities, and proposed targeted campaigns.
5. **Future Enhancements**: I laid out next steps for predictive modeling, automated ETL refreshes, and A/B testing.


## Churn Analysis Introduction 

In today's competitive corporate environment, customer retention is 
critical to long-term success. One important method for 
comprehending and lowering this client attrition is churn analysis. It 
entails looking at customer data to find trends and explanations for 
why customers leave. Businesses may identify which clients are 
most likely to leave and comprehend the variables influencing their 
choices by utilizing machine learning and advanced data analytics. 
With this information, businesses may take proactive measures to 
increase client loyalty and happiness.

## Who is the Target Audience? 
The methods and insights used in this research are applicable to a variety of 
businesses, even though it concentrates on churn analysis for a telecom 
company. This Churn research is useful for any company that values keeping 
customers, from retail and banking to healthcare and beyond. I will examine 
the strategies, resources, and best practices for enhancing customer loyalty 
and lowering attrition while turning data into useful insights for long-term 
success. 


## Metrics Needed  

Total Clients - Total Churn - Churn Rate for New Hires

## SQL Server ETL Process 

Step 1 
The first step in analyzing churn involves importing the data from my source file. I will be utilizing Microsoft SQL Server for this, as it is a popular solution in the industry and offers superior capability in managing recurring data loads and ensuring data integrity compared to an Excel file.


## Download SSMS 
To execute our SQL queries, Microsoft offers a graphical user interface called 
SQL Server Management Studio. You can obtain the latest version from the 
link provided below. 

https://learn.microsoft.com/en-us/sql/ssms/download-sql-server
management-studio-ssms?view=sql-server-ver16 

![image](https://github.com/user-attachments/assets/605542a5-57ee-439c-b672-ebe80eb53bf8)

## Creating Database 

After completing the installation, I will be directed to the following screen. I 
made sure to copy and save the server’s name somewhere, as it will be 
needed later. Additionally, I checked the box that says, "Trust Server 
Certificate," and then I clicked on Connect. 
Once I was connected, I clicked on the NEW QUERY button located in the top 
ribbon and then entered the following query. This will create a new database 
named Churn_db

![image](https://github.com/user-attachments/assets/c06d8012-4c9b-493d-816d-5139ccad0b04)

The steps to do from here are to: - Creating a database - Creating a Table - Load The Data into the Table  

 ![image](https://github.com/user-attachments/assets/4efcf69a-24d2-44e2-ba1c-8898a9dd835c)

Now the database is shown on the left explorer panel. 

To import a CSV file into a SQL Server staging table using the Import Wizard, I 
began by right-clicking on the newly created churn_db database in the 
explorer panel, then navigated to Task >> Import >> Flat file >> Browse for the 
CSV file called Customer_Data. It’s important that I set customerId as the 
primary key and permit null values for all other columns to prevent any data 
load errors. Additionally, ensure that I modify the data type from Bit to 
Varchar(50). This change is necessary because I encountered issues with the 
BIT data type while using the import wizard, whereas Varchar (50) worked 
without problems.

![image](https://github.com/user-attachments/assets/ebc40e50-2b1a-4ce1-9a0e-47ff26a7b4cc)

![image](https://github.com/user-attachments/assets/f5fcf321-a430-4d6a-8aa8-0c20a5da2ad2)

The dbo means database owner which is the default database/schema of the 
SQL SERVER.

![image](https://github.com/user-attachments/assets/6ed0c576-ab9c-4c26-9947-2767c1701266)

Now this is the preview of the data being loaded.

![image](https://github.com/user-attachments/assets/bab12561-2e8c-4262-9cf1-ed0f397a29c1)

Now this Modify column is where I modified my Datatype, Primary key, Null 
values, is important because with the wrong placement of datatypes, the data 
will not load, and it will show an error. 
So, I changed all datatypes showing bits to varchar(50) and I ticked the box for 
Customer_ID to be the primary key and I unchecked Allow Null for 
Customer_ID because originally all unique identifiers shouldn’t have Null 
values.

![image](https://github.com/user-attachments/assets/725434cf-4cb8-49df-8340-418c707ba568)

Finally, it got Imported and Operation successful. 

![image](https://github.com/user-attachments/assets/bc3a962c-aecb-4148-b151-5774a87b5253)

Now the table has appeared on the explorer panel.

## Data Exploration – Checking for Distinct Values 

First, I had to check the columns to see that everything was alright and 
understand the distribution of data. 

![image](https://github.com/user-attachments/assets/e7e3cabe-3a0a-4ffd-a0af-6bc9ac3eb38a)

While looking at the gender column,  - I would like to know how many items are on the gender column - What is the COUNT on each of these items.  - And I will need an additional column as an Alias which tells me the 
Percentage Distribution of this column.

![image](https://github.com/user-attachments/assets/92e26e07-24ff-417d-a806-1a8a72c634d0)

In this query, I explored the gender distribution within the churn_main table of 
the churn_db database. The goal is to understand the proportion of each 
gender represented in the dataset. 
• COUNT(Gender) calculates the total number of records for each gender. 
• The subquery (SELECT COUNT(*) FROM churn_main) returns the total 
number of rows in the table. 
• Multiplying COUNT(Gender) / total by 100.0 converts the proportion into 
a percentage representation of each gender in the dataset.


//////////////////////////////////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////////////////////////////// 

 
![image](https://github.com/user-attachments/assets/e3106963-eb2b-47ef-9c68-591842f4955f)

In this query, I analyzed how different contract types are distributed among 
customers. 
• COUNT(Contract) gives the total number of customers for each contract 
type. 
• The subquery (SELECT COUNT(*) FROM churn_main) returns the total 
number of records in the dataset. 
• By Multiplying by 1.0 ensures decimal division, so I get the proportion 
as a decimal percentage. 
//////////////////////////////////////////////////////////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////////////////////////

Now I will be exploring the Customer_Status column 
This column tells me if a customer has stayed or churned(left) 
Now I will be checking for the Customer_Status for who stayed, churned, or 
joined.

![image](https://github.com/user-attachments/assets/edea92ef-95fa-426a-b727-0bb80b074ab6)

![image](https://github.com/user-attachments/assets/6211377c-fbd3-4d50-a52b-a400d704d4cc)

In this query, I analyzed how customer status (e.g., Churned, Joined, Stayed) 
affects revenue contribution: 

• COUNT(Customer_Status) shows how many customers belong to each 
group. 
• SUM(Total_Revenue) aggregates the revenue from each status group. 
• Dividing each group's revenue by the total revenue and multiplying by 
100 gives the percentage contribution of each group. 

//////////////////////////////////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////////////////////////////// 
 
And finally, I will start exploring the State column and see how many states 
represent what percentage of values


![image](https://github.com/user-attachments/assets/8be0563e-2bb6-458d-8319-989c8205c9fe)


In this query, I analyzed how the state of customers (e.g., Churned, Joined, 
Stayed) affects their distribution: 

• COUNT(State) shows how many customers belong to each state (such 
as 'Active', 'Churned', etc.). 
• The COUNT(State) * 100.0 / (SELECT COUNT (*) FROM churn_main) 
calculates the percentage of total customers that belong to each state. 
It compares the count of customers in each state to the total number of 
customers in the churn_main table. 
• The ORDER BY Percentage DESC sorts the results so that states with 
the highest percentage of customers appear at the top of the list. 

//////////////////////////////////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////////////////////////////// 


## Data Exploration – Data Cleaning - Null Value Checking 

Now I will Find Null Values in Each column and Remove Null as Per Column 
Values. 
N/B: NULL can create a lot of problems if I ignore it, so I will check the 
columns for Missing NULL


![image](https://github.com/user-attachments/assets/385bbd4e-5e64-4330-8f00-070c38bf93e2)


This query checks for missing (NULL) values in each column of the 
churn_main table. 

• It counts how many NULLs are in each column using SUM(CASE WHEN 
column IS NULL THEN 1 ELSE 0 END). 
• This result tells me which columns have missing data. 
• Is First Assigning NULL Values As 1 and else 0 and saves it As an Alias

## Data Exploration – Data Cleaning - Null Value Removal

Now the next Step, is to Remove this NULLs Values  
I will be replacing these Nulls values and inserting the data into a new table 
which will be a Production Table. 
This table will be used as the source of all upcoming steps

![image](https://github.com/user-attachments/assets/f5480d9b-47f5-4098-8d19-8d85e5b3990d)

In this step, I performed data cleaning by removing or handling NULL values 
and saved the cleaned results into a new table called churn_Production: 

• I used the ISNULL() function to replace NULLs with default values for 
specific columns: 
o For service-related columns like Multiple_Lines, Online_Security, 
etc., I replaced NULL with 'No'. 


o For Value_Deal and Internet_Type, I replaced NULL with 'None'. 
o For churn-related fields like Churn_Category and Churn_Reason, I 
replaced NULL with 'Others'. 
• I kept columns like Customer_ID, Gender, Age, Contract, and others 
unchanged because they didn't contain any NULLs. 
• Finally, I saved the cleaned data onto a new table called 
churn_Production to keep the original data intact and work with a clean 
version going forward.

![image](https://github.com/user-attachments/assets/fd231d1f-26af-461b-9dbf-c5736ebaac0f)

Churn_Production has now appeared on the explorer panel. 

//////////////////////////////////////////////////////////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////////////////////////

## Data Exploration – View for Visual Table 

In a Database, the main purpose of VIEW is to create a Virtual Table, so as this 
view will not have any physical Presence on the Database itself, which I am 
being careful of, and it will provide me with the Output when a Query calls for 
it


![image](https://github.com/user-attachments/assets/a3b4f68d-738e-48f6-8285-49bce056208d)

The Dropdown message shows success and if you look at the left-hand corner 
of the explorer panel, you will see the view option

![image](https://github.com/user-attachments/assets/c493d7e6-355f-4d2a-b6c7-09f2785fec13)



Now that’s my virtual table 
Now all data from the churn_Production table will be on the view

Now I will move into the Power BI Visualization Tool, which is a powerful 
business intelligence platform used to create interactive dashboards and 
visual reports from the cleaned and processed data. 

I’m done with the SQL aspect of this Project. 

//////////////////////////////////////////////////////////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////////////////////////



## Power BI Transform 

I will be using the Microsoft Power BI Desktop Application for my visualization. 
https://www.microsoft.com/fr-fr/download/details.aspx?id=58494


![image](https://github.com/user-attachments/assets/bc2f1e6c-c04a-495b-9273-ce3fdb3b83db)

After completing the download and installation, I will open a blank report. 
Since I want to import my SQL queries, I will click the Get Data button in the 
top left corner and select the SQL Server option.


![image](https://github.com/user-attachments/assets/76fbcd10-070d-4c0e-aed9-f5ee9215a45f)


![image](https://github.com/user-attachments/assets/8c745ed8-5640-4bdf-afb9-ae3b314cc4db)

Now I will copy my server’s name and import on the server and click on 
import, which is on my connection page of my SQL server Application.

![image](https://github.com/user-attachments/assets/3d0e5136-8790-467e-84d1-f513b8ef9e47)

![image](https://github.com/user-attachments/assets/0a9c9eef-9fb5-4a6d-9d1f-57ced775e4ae)

Then I will click on OK, which will prompt me to the Navigator panel

![image](https://github.com/user-attachments/assets/f9ac96f1-57f8-4738-9f10-efcf10586c16)

Now I will select the churn_production and click on transform Data which will 
prompt me to the power query editor where I will transform and edit this data.

![image](https://github.com/user-attachments/assets/e5f387ab-b595-4f7d-9b19-45b82f12e624)

![image](https://github.com/user-attachments/assets/1c751375-a8f9-46b0-8747-84257e181577)

Looking at the Customer_Status column which has three values which are 
stayed, churned, and joined. I would like to create another column which will 
be a number column which defines whether a certain row is for churned or not 

• I will click on add column then custom column and call it churn status 
• And add this DAX formulae to it If [Customer_Status] = “Churned” then 1 
else 0

![image](https://github.com/user-attachments/assets/d43d317c-7f18-4d3d-817c-244ba60f3f65)


![image](https://github.com/user-attachments/assets/b5539d6e-6eb3-4be6-9262-7f7d47250205)

Having been added, I renamed the column to churn_status 
Now I have the column I will have to change it from string text to whole 
number 

![image](https://github.com/user-attachments/assets/449a0bd6-0118-40ba-bd69-24bd59c4290c)


I will be using this column to do some calculations 
Now I will be creating another column called Monthly_ChargeStatus 
Using this formula if [Monthly_charge] < 20 then “<20” else if 
[Monthly_Charge] < 50 then “20-50” else if [Monthly_Charge] < 100 then “50
100” else “>100”

![image](https://github.com/user-attachments/assets/c474f355-302e-4779-bdce-fa6e74d9e64a)

The reason for this is that the Monthly_Charge column contains a wide range 
of values, which can make it difficult to process effectively during the 
visualization stage. To address this, I created a new column called 
Monthly_ChargeStatus that categorizes the values into defined ranges, 
making the data easier to analyze and visualize. 

![image](https://github.com/user-attachments/assets/a024e3fb-0b7c-4d28-9912-c670cd5912ec)

This is the numerous values on it  

Now down below is the new range column

![image](https://github.com/user-attachments/assets/4c780e7b-bb49-46af-8c64-f2343ab73789)

Now I will close and apply changes to the Data 

![image](https://github.com/user-attachments/assets/92387e25-1054-4348-b06e-8c7025d23118)


























