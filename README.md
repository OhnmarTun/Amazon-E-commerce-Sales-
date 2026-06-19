Amazon E-commerce Sales Analysis

📌 Project Overview

This project analyzes Amazon E-commerce sales data using SQL Server and Power BI to uncover business insights related to sales performance, customer behavior, product categories, payment methods, delivery status, and revenue trends.

The objective is to transform raw transactional data into meaningful insights that support data-driven decision making.

The dataset contains Amazon E-commerce transaction records including:
- user_id
- product_id
- category
- subcategory
- brand
- price
- discount
- final_price
- rating (product rating)
- review_count
- stock
- seller_id
- seller_rating
- purchase_date
- shipping_time_days
- location
- device
- payment_method
- is_returned
- delivery_status

Key Skills Demonstrated

SQL Skills
- Aggregate Functions (COUNT, SUM, AVG, MAX)
- Date Functions (MONTH, FORMAT, DATEDIFF)
- CASE Statements
- GROUP BY & HAVING
- Percentage Calculations

Power BI Skills
- Data Modelling
- DAX Measures
- KPI Calculations
- Business-oriented data analysis & insights

DAX
- Avg Order Value = [Total Revenue]/[Total Orders]

- Net Revenue = 
    CALCULATE(
        SUM(Ecommerce_Sales[final_price]),
        Ecommerce_Sales[delivery_status] <> "Returned")

- Return Amount = 
    CALCULATE(
        SUM(Ecommerce_Sales[final_price]),
        Ecommerce_Sales[delivery_status] = "Returned")

- Return Orders = 
    CALCULATE(
        COUNTROWS(Ecommerce_Sales),
        Ecommerce_Sales[is_returned]="TRUE")

- Return Rate = DIVIDE([Return Orders],[Total Orders])

- Total Orders = COUNT(Ecommerce_Sales[user_id])

- Total Revenue = SUM(Ecommerce_Sales[final_price])

🛠️ Tools Used

- SQL Server Management Studio (SSMS)
- Microsoft SQL Server
- Power BI

Business Questions Answered

- Which product categories generate the highest revenue?
- Which subcategories receive the most orders?
- What is the percentage contribution of each category to total revenue?
- How does revenue change over time?
- Which customers are repeat buyers?
- What are the customer RFM metrics?
- Which locations generate the highest revenue?
- Which devices drive the most sales?
- Which subcategories have the highest return rates?
- Which payment methods have the highest return rates?
- What is the average order value across customer segments?
- How do discounts influence order volume?

📊 SQL Analysis Highlights

- Revenue analysis by category and subcategory
- Monthly sales trend analysis
- Customer behavior and repeat purchase analysis
- RFM (Recency, Frequency, Monetary) analysis
- Return rate analysis
- Payment method performance analysis
- Location-based sales analysis
- Device performance analysis
- Discount effectiveness analysis

📊 Dashboard Features

Revenue KPIs  : Total Revenue, Net Revenue, AOV
Customer KPIs : Total Orders, Return Orders, Return Rate
Trend Analysis: Monthly Revenue Trend
Breakdowns    : Category, Subcategory, Location, Device

📊 Key Insights

- Sales revenue peaks in March across 2024–2026.
- Electronics category generates highest revenue.
- Mobile subcategory drives the most sales.
- 11-20 discount range generates the most revenue.
- When shipping time increases to 6 Days, the return rate increased significantly.
- Products with a rating of only 2 has highest return rate.
- Higher seller ratings generally drive higher revenue.

