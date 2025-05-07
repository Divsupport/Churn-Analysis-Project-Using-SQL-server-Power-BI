# Churn-Analysis-Project-Using-SQL-server-Power-BI
I Analyzed 7,040 telecom customer records to identify churn drivers and design retention strategies. Built an end-to-end analytics pipeline: SQL ETL for data cleaning, Power BI for visualization, and actionable insights to reduce churn by 15% (~$720K annual savings).

## 🚀 Project Goals

1. **ETL Pipeline**: I set up a Microsoft SQL Server database (`Churn_db`) to stage, clean, and transform raw customer data.
2. **Data Exploration**: I analyzed customer demographics, service subscriptions, payment info, and churn status to uncover retention drivers.
3. **Power BI Dashboard**: I developed an interactive report with key metrics, custom segments, and AI-powered narratives.
4. **Insights & Recommendations**: I identified high-risk segments (e.g., women 50+), service gaps, and contract/payment vulnerabilities, and proposed targeted campaigns.
5. **Future Enhancements**: I laid out next steps for predictive modeling, automated ETL refreshes, and A/B testing.

## 📂 Repository Structure

```
---

## 🛠️ ETL Process (SQL Server)

1. **Create Database & Tables**

   * I used SSMS to run `create database Churn_db;` and defined staging table schemas.
2. **Import Raw Data**

   * With the Import Wizard, I loaded `Customer_Data.csv` into `churn_main`, set `Customer_ID` as primary key, and changed BIT columns to `VARCHAR(50)` to avoid import errors.
3. **Explore & Clean**

   * I wrote queries to analyze distributions (`Gender`, `Contract`, `Customer_Status`, `State`).
   * I checked NULL counts per column, then replaced missing values with business defaults via `ISNULL()`.
   * The cleaned dataset went into `churn_Production`.
4. **Create View**

   * I exposed `churn_Production` via a SQL view for easy access in Power BI.

---

## 📊 Power BI Transformation & Visuals

1. **Data Connection**: Connected to my SQL Server and loaded the `churn_Production` view.
2. **Calculated Columns**:

   * `churn_status` = 1 if `Customer_Status` = "Churned", else 0.
   * `Monthly_ChargeStatus` buckets: `<20`, `20-50`, `50-100`, `>100`.
3. **Measures**:

   * Total Customers, New Joiners, Total Churn, Churn Rate.
4. **Segment Mapping**:

   * Created Age Group and Tenure Group tables to sort and filter properly.
5. **Dashboard Layout**:

   * **Cards** for core metrics.
   * **Donut/Bar Charts** for demographics (Gender, Age, Geography).
   * **Bar & Line Charts** for payment methods, contracts, tenure vs. churn.
   * **Top 5 States** by churn rate.
   * **Churn Distribution** by category and internet type.
   * **Unpivoted Matrix** showing service adoption vs. churn percentage.
   * **AI Narrative** to generate on-the-fly insights when filters change.

---

## 🔍 Key Insights

* **High-Risk Segment**: Women aged 50+ account for 548 churners (35.8% of total churn).
* **Competitor Impact**: 23% of churn is driven by better offers/devices from competitors.
* **Service Gaps**: Over 60% of customers aren’t using key add-ons like Online Security (84.6%) and Premium Support (83.5%).
* **Contract & Payment Risks**:

  * Month-to-month plans have 3× higher churn than annual.
  * Bank transfer users churn 22% more than auto-pay customers.

## 💡 Recommendations

1. **"Silver Shield" Bundle**: Bundle Device Protection, Premium Support, and Streaming Music at 40% off for women 50+. Offer free device upgrades after 12 months.
2. **Lock-In & Save Campaign**: Annual plans—"Pay for 10 months, get 12"—to reduce month-to-month churn volatility.
3. **A/B Testing**: Run campaign variants, track monthly churn, and refine offers in real time.

---

## 📈 Impact & Next Steps

* Executives can now monitor churn drivers (Competitor Offers vs. Service Dissatisfaction) in real time.
* Closing service adoption gaps could generate \~\$1.2M/year in additional revenue.

**Future Work**:

* Develop a machine learning model for churn prediction and integrate it into the ETL.
* Automate data refresh in Power BI Service.
* Continuously measure campaign performance and iterate.

---

Thanks for exploring my project! Feel free to clone the repo.
