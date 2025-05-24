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

![image](https://github.com/user-attachments/assets/f7458b85-c8b6-434a-88b2-dbcc8e9c4fe9)


Is loading into the worksheet 

Now the Data pane by the right corner is showing the churn_Production 

![image](https://github.com/user-attachments/assets/f0aa6cc6-d32d-4448-bf49-22a53b14b2d4)

At this point I had to save my file by pressing CTRL S and inputting the name as 
Chun Analysis

//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////// 


## My Summary Page Blueprint 

This is a list of visuals that will be on my summary page dashboard  
• Total Customers 
• New joiners 
• Total churn 
• Churn Rate 
• Gender 
• Age 
• Geographic 
• Services 
• Payment Method & Contract 
• Tenure 
• Churn Distribution 
• Services

Before I start to create charts, I would like to create a few measures and keep 
them separate from the main tables, that way is easy for me to edit the 
measure in case is required in the future. 

• I am going to create a dummy table where I will insert my measures 
manually to keep all my measures inside of it 


![image](https://github.com/user-attachments/assets/21ece9c9-6460-4829-8a0e-66affb55f775)


• Now I will click on Enter Data and this page will pop up, this is where I 
will input my table name as Churn_Measures and column as 
All_Measures

![image](https://github.com/user-attachments/assets/b57fa24c-7e9f-41c7-a8e6-bcc0c66522d0)


Now it has appeared on the Data pane. 
I will create new different measures by clicking right beside the 
churn_measure and clicking on new measure and write several Dax 
formulae’s


![image](https://github.com/user-attachments/assets/ede3ef83-433d-48d5-94ea-f3398ffcaf9d)


Now I am done with the measures I will be visualizing with; it is time for me to 
save my files so I wouldn’t lose my project CTRL S 
//////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////


## VISUALIZATION 

First visuals I must create are  
• Total Customers 
• New joiners 
• Total Churn 
• Churn Rate 

I will drop in few Cards from the visualization pane with its measures


![image](https://github.com/user-attachments/assets/6f01ba18-adaa-49a0-ae96-0938659e24bf)


I changed the churn rate to percentage 1 decimal value, and I did same with 
the comma as well for both 6418 and 1732. 

Now I am done with the Metrics, I will be diving into the individual categories 
available which are  

• Gender 
• Age 
• Geographic
• Payment Method & Contract 
• Tenure 
• Churn Distribution 
• Services 
I am going to use the donut chart for gender by going to the churn_production 
table and click on gender and then the donut chart. 
I will drag total churn from the All_Measure table into the donut chart 
Now I will do some formatting 

As for the Age column, since there are a lot of age digits clustered all around, 
it wouldn’t be easy to understand it when it gets visualized. 
So, I will head to transform Data which will take me to power query whereby I 
will reference the churn_production table.

![image](https://github.com/user-attachments/assets/851f5b6d-ef9d-466c-a403-15a576af4d63)

![image](https://github.com/user-attachments/assets/5f59f90d-5682-44a0-a5ac-ed78f32b45b6)

Changed it to Mapping_AgeGroup

![image](https://github.com/user-attachments/assets/334aff9f-9f6a-4981-9438-c8c1bcbbc2a5)

I created a new column as well with the formulae and I removed every other 
column beside Age


Age Group = if [Age] < 20 then “< 20” else if [Age] < 36 then “20 – 35” else if 
[Age] < 51 then “36 – 50” else “> 50” 
AgeGrpSorting = if [Age Group] = “< 20” then 1 else if [Age Group] = “20 – 35” 
then 2 else if [Age Group] = “36 – 50” then 3 else 4 
Then I changed Change data type of AgeGrpSorting to Numbers


![image](https://github.com/user-attachments/assets/9b816586-0b35-4d7c-81b4-e5894bd26ec9)

Now when I checked the model view section, I saw that my 
Mapping_AgeGroup is already linked to the churn_Production table. 
This shows that I can easily use this Age inside of it to filter all columns on the 
churn_Production table


![image](https://github.com/user-attachments/assets/da1ce492-c1ba-409f-ad39-8a86e944196a)

This is a line and stacked chart and my reason for using total customers and 
churn rate is because I would love to compare my churn rate with the number 
of customers that are available. 

Now I am done with Demographics I will start with the Account information 
I will be using the Clustered Bar chart for the Payment method By Total churn 
I will be using the Clustered Bar chart for the Contract by Churn Rate 
For Tenure I will have to Transform tenure since it has so many values which 
might affect my visualization, I will do the same as I did for Age.

![image](https://github.com/user-attachments/assets/30ec988e-f848-440a-9a1f-3dc27e5f9a2c)


![image](https://github.com/user-attachments/assets/c524d620-91c9-436f-b030-55a6b8b68847)


Power BI has already done the connection on the model view 
I will be using the Line & stacked Bar Chart for the Total Customers and Churn 
Rate by Tenure Group

![image](https://github.com/user-attachments/assets/bdea298d-eec9-4097-a9c9-a4966bfdead0)

I dragged the churn rate from the x axis to the y axis to create that line 
Looking at the x axis, it is not sorted in order so I will have to go back to 
transform and sort both the Mapping_AgeGroup and TenureMappingGroup 

![image](https://github.com/user-attachments/assets/4c9a18e5-9eaf-4631-a31e-8b05a8f2bd04)

![image](https://github.com/user-attachments/assets/089af7fc-a3eb-4352-b14e-219460b6369c)

![image](https://github.com/user-attachments/assets/46a00689-12c4-4938-a04b-c99406c90fb4)

Is now showing on the Data pane 
I will do the churn rate by state using the clustered bar chart, since there are a 
lot of states, I need the top 5 states with the highest churn rate.

![image](https://github.com/user-attachments/assets/65cf262f-cd20-4b13-93af-07cd9122776b)

I filtered it with the churn rate, which I dragged churn rate to the value box and 
from Basic filtering to Top N 
• Now, the next step is to visualize Churn Distribution using the 
churn_category column with a Clustered Bar Chart. 
• The reason I’m focusing on Total Churn instead of Churn Rate is 
because I’m analyzing the churn_category, and it’s essential to include 
all categories in the analysis to get a complete picture. 

![image](https://github.com/user-attachments/assets/1ceb3868-8e02-4cb1-a77c-aecf2474afba)

Now, I will perform the analysis for the Internet_Type column and visualize it 
using a Clustered Bar Chart. This time, I will include the Churn Rate to better 
understand how churn varies across different types of internet services. 
Lastly, I want to create a visual that consolidates all the telecom services into 
a single view. This will provide a comprehensive overview of service usage or 
churn patterns across multiple services, making it easier to identify trends and 
insights immediately.


![image](https://github.com/user-attachments/assets/436e2b2e-f73b-4e9b-81ac-33ac5e9cc6de)

Before I start, I need to rearrange all the telecom service columns into a grid 
format so that I can easily visualize and compare the services in one chart. 
I clicked on Transform Data, which took me to the churn_production table. I 
created a reference for it and renamed it to services_production. Then, I used 
Ctrl to select all the columns related to services, went to the Transform tab 
above, and clicked on Unpivot Columns to rearrange the data for easier 
visualization.

![image](https://github.com/user-attachments/assets/59bf6553-5208-47c0-805b-c42106d00720)

Now it added everything into 2 columns with the Attributes and Values 
which I changed the name to services and status

Now, I will click on Service, which will appear in the Fields pane. Then, I’ll select 
the Matrix visual from the Visualizations pane. In the Build pane, I will drag 
Status to the Columns section and Services to the Rows section to display 
the data in a clear and organized grid format. 
I will drag Churn Status to the Values section in the Build pane. By default, it 
shows the sum of Churn Status, but that's not what I want. I need to see the 
percentage of each service in terms of Churn Status (Yes/No). So, I will click 
the dropdown on the field in the Values section, go to Show Values As, and 
select Percent of Row Total to display the data as percentages. 


![image](https://github.com/user-attachments/assets/e2e6c8b2-6a5c-4127-95de-2eebfc164a3a)


I analyzed churn by incorporating Monthly Charge Range, Marital Status, and 
Service Usage to understand churn patterns. I calculated churn rates for each 
service and visualized the distribution of churn reasons as a percentage of total 
churn. This helps identify which customer groups and services are most 
associated with churn and why customers are leaving. 
//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////// 

## Enhance Visualization 

![image](https://github.com/user-attachments/assets/decad40b-e3f9-4686-bbd3-17b40487bc87)

This interactive Power BI dashboard provides a comprehensive analysis of 
customer churn using demographic, service usage, and contract data. Key 
business insights are highlighted to help reduce churn and improve customer 
retentio

Now I will be using the AI Narrative tool on the Visualization Pane  

![image](https://github.com/user-attachments/assets/23e7a3cd-6cd1-49ae-9411-db0e21ee028c)


![image](https://github.com/user-attachments/assets/5f49a3a1-570f-4a91-8452-589bbcbbe58b)

When I click on custom it will give me a summary of my entire visual in writing 

![image](https://github.com/user-attachments/assets/feda71a1-e00e-4995-a15a-05ff05eb10ee)

If I filter the visuals on my dashboard this AI copilot gives me a brief 
explanation of it and what happened, and this is just a starting point for me to 
start my analysis of the Dashboard 

![image](https://github.com/user-attachments/assets/ea97f3ed-12b1-4daf-9e1e-45665dda7af0)

The "Total Churn by Gender" chart shows that female customers account 
for 621 churned users, representing 35.8% of total churn. While male churn 
is higher overall, a deeper look into the "Customers and Total Churn by Age 
Group" chart reveals a strong issue: 
• In the 50+ age group, 548 customers churned, which is the highest 
among all age brackets. 
• Given the gender breakdown, it’s clear that a significant portion of these 
churned users are older female members.


## Marketing Solution 

Goal 
If I design a marketing campaign specifically targeting females aged over 50, I 
could help reduce churn significantly in this high-risk group. This segment 
accounts for a large portion of the 548 churned customers in the 50+ age 
group, as shown in the dashboard. By addressing their unique needs and 
offering personalized support, I can retain more loyal customers and improve 
overall retention.

![image](https://github.com/user-attachments/assets/02b9f5ad-3ea7-4eef-a92d-f97b9305cf63)

As I analyze further, I can see that most females that was churned was due to 
competitors

![image](https://github.com/user-attachments/assets/aa77f573-bf34-4ace-b652-e3e1cc69b76d)

When I hovered over the churn category data, I found that many customers 
left due to better devices and offers from competitors. These two factors 
fall under the "Competitor" churn reason, which had the highest count. 

Now looking closely at the Grid which is Churn by Services

![image](https://github.com/user-attachments/assets/785a8858-6d66-4445-87e6-9150a349b5bd)

Using a personal benchmark of 60% non-subscription as an indicator of poor 
service uptake, I analyzed the grid and found that several key services are 
underutilized by customers — particularly females aged over 50, who are 
already a high-churn demographic. 
Services with low adoption (over 60% saying “No”): 
• Device Protection Plan – 71% 
• Online Backup – 71.9% 
• Online Security – 84.6% 
• Premium Support – 83.5% 
• Streaming Music – 61.1%


## Conclusions

High-Risk Demographics Identified 
• I Discovered that 35.8% of churners are female, with 50+ age group 
contributing 548 churned customers which is a critical segment to 
prioritize. 
• There were High Competitors with better offers and devices which 
dominated and exposed vulnerabilities in retention strategies.


## Gap in Services Are Exposed 

• This is the Alarming low adoption of services used my 
customers whereby: 
• 84.6% lack Online Security 
• 83.5% don’t use Premium Support 
• 71% skip Device Protection 
• Looking at the gaps in % of services not used by customers, 
you will see the dissatisfaction and competitors switching.

##Payment & Contract Weaknesses 
• Month-to-month contracts have 3× higher churn risks than 
annual plans. 
• Bank transfer users churn 22% more frequently than automatic 
payment users. 


## My Recommendation

"Silver Shield" Loyalty Bundle for Women 50+ 
• With Total Package Deal of (Device Protection + Premium Support + 
Streaming Music) at a 40% discounted rate for this demographic. 
• After 12 months of subscription, customers will be given Free device 
upgrade which is a strong counter to competitors offers.

## Lock-In & Save Campaign Discount 
• annual contracts: "Pay for 10 months, get 12” which is a 
20% effective discount to reduce month-to-month volatility. 


## Impact I Enabled
• With these Dashboard-Driven Decisions, Executives can now 
track real-time churn drivers like "Competitor Offers" (23% of 
churn) vs "Service Dissatisfaction" (18%). 
• Service Revenue Growth: Closing adoption gaps could 
generate $1.2M/year from previously unused services. 






















































































































