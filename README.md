# Zomato Orders Analysis

A business intelligence and data analytics project designed to analyze restaurant sales, customer behavior, payment trends, and revenue performance using real-world order data.

[![Python](https://img.shields.io/badge/Python-3.x-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-Analytics-4479A1?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Tableau](https://img.shields.io/badge/Tableau-Visualization-E97627?logo=tableau&logoColor=white)](https://www.tableau.com/)
[![Status](https://img.shields.io/badge/Status-Portfolio%20Project-success)](https://github.com/)

## Overview

This project explores a Zomato-style food delivery dataset to answer high-impact business questions such as:

- Which customers generate the highest revenue?
- Which restaurants and cuisines perform best?
- Which cities contribute the most to sales?
- Which payment methods drive the highest revenue?
- How effective are coupons and discounts?
- What is the cancellation and refund trend?
- Which customer channels bring the most valuable customers?

The objective is to transform raw transactional data into actionable business insights using SQL analysis, Python-based exploratory data analysis, and dashboard storytelling.

## Why This Project Matters

This project demonstrates practical analytical thinking and business understanding, which are essential for roles such as:

- Data Analyst
- Business Analyst
- BI Analyst
- Product Analyst
- Data Visualization Analyst

It goes beyond coding by focusing on the core business problems organizations face in food-tech and e-commerce ecosystems.

## Business Objective

The analysis aims to support strategic decision-making in areas such as:

- Marketing spend optimization
- Restaurant partnership strategy
- Customer retention planning
- Discount effectiveness evaluation
- Operational risk identification through cancellations and refunds
- Revenue growth planning by city, cuisine, and payment mode

## Dataset

The dataset contains transactional and customer-level information across multiple tables:

- Orders table: order amount, timestamp, payment mode, discount, delivery fee, order status
- Customers table: customer city, signup details, acquisition channel
- Restaurants table: restaurant name, cuisine, city, average rating

### Dataset Summary

- 49,990 orders
- 4,999 customers
- 200 restaurants

## Tools and Technologies

- Python: Pandas, NumPy, Matplotlib, Seaborn
- SQL: business queries, KPI analysis, reporting
- Tableau: dashboard and visual storytelling
- Excel: exploratory analysis and business presentations
- Jupyter Notebook: EDA and workflow documentation

## Key Insights

This project uncovers several meaningful business findings:

- Total revenue generated: ₹44,947,492.74
- Average order value: ₹899.13
- 40.26% of orders used discount coupons
- Cancellation rate: 20.19%
- Delivery rate: 59.67%
- Top revenue-generating city: Chennai
- Most popular cuisine by order volume: North Indian
- Leading payment method by revenue: UPI

These findings highlight revenue drivers, customer behavior patterns, and operational challenges that matter to business stakeholders.

## Repository Structure

```text
.
├── data/
│   ├── Restaurant_table.csv
│   ├── customers.csv
│   ├── orders_table.csv
│   └── Zomato  Order Data.xlsx
├── python/
│   ├── eda.ipynb
│   └── practic_.ipynb
├── sql_queries/
│   ├── business_scenario.sql
│   ├── Cancellation_Refunded_analysis.sql
│   ├── Coupon_Analysis.sql
│   ├── Customer_analysis.sql
│   ├── customer_churn_analysis.sql
│   ├── data_stractures.sql
│   ├── Restaurant_Performance.sql
│   └── Revenue_analysis.sql
├── Tableau_dashboard/
│   ├── Dashboard 1.png
│   ├── Dashboard 2.svg
│   ├── zomato dashboard.twb
│   ├── Zomato_orders_analysis_presentation.mov
│   └── images.png
├── excel_analysis/
│   ├── dashboard zamoto(AutoRecovered).xlsx
│   ├── join_all_zomato_table.png
│   └── zomato_excel_dashboard.png
├── problem_statement/
│   └── Zomato Problem Statement.pdf
├── .gitignore
├── README.md
└── .DS_Store
```

## Analysis Areas Covered

- Revenue analysis
- Customer segmentation and value analysis
- Restaurant performance evaluation
- Cuisine popularity analysis
- Payment mode performance
- Coupon and discount effectiveness
- Cancellation and refund analysis
- Customer retention and churn indicators
- Acquisition channel performance

## Methodology

1. Data collection and schema understanding
2. Data cleaning and preprocessing
3. Merging order, customer, and restaurant datasets
4. Exploratory data analysis in Python
5. KPI calculation using SQL
6. Dashboard creation in Tableau
7. Interpretation of insights and business recommendations

## SQL Analysis Highlights

The project includes SQL scripts covering several business scenarios, including:

- Top customers by revenue
- Top restaurant performers
- Monthly revenue trends
- City-wise revenue distribution
- Payment mode contribution
- Discount impact analysis
- Cancellation and refund rates
- Customer retention and repeat behavior

## Python EDA Highlights

The Python notebooks include:

- Data inspection and schema validation
- Missing value checks
- Revenue trend analysis
- Customer and restaurant grouping
- Coupon performance analysis
- Repeat customer detection
- Data-driven business storytelling through summaries and visualizations

## Dashboard Highlights

The Tableau dashboard visualizes key metrics such as:

- Revenue by city
- Restaurant sales performance
- Category and cuisine contributions
- Payment preference trends
- Order status performance
- Customer acquisition and order behavior

## How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/<your-username>/zomato_orders_data.git
cd zomato_orders_data
```

### 2. Create a virtual environment

```bash
python -m venv .venv
source .venv/bin/activate
```

### 3. Install dependencies

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### 4. Open the notebook

```bash
jupyter notebook python/eda.ipynb
```

### 5. Explore SQL queries

Open the SQL files inside the `sql_queries/` folder for business analysis logic

## Skills Demonstrated

This project showcases:

- Data cleaning and preprocessing
- Exploratory data analysis
- SQL querying and business KPI logic
- Dashboard creation and data visualization
- Business insights and stakeholder communication
- Portfolio-ready analytics project development

## Resume and Interview Value

This project is especially valuable for interviews because it shows that I can:

- Work with multi-table business data
- Ask the right analytical questions
- Translate raw data into revenue and customer insights
- Use multiple analytics tools in a real workflow
- Communicate findings clearly to business audiences

It is a strong addition to a portfolio for roles in:

- Data Analytics
- Business Intelligence
- Product Insights
- Reporting and Visualization

## Conclusion

This repository demonstrates a complete analytics project that combines data exploration, SQL analysis, business interpretation, and dashboard presentation. It is structured to be professional, insightful, and portfolio-ready for job applications, hiring discussions, and technical interviews.

The project reflects applied analytical thinking in a real-world food-tech setting and provides a strong example of how data can be translated into action-oriented business decisions.

## Contact

If you would like to collaborate, provide feedback, or discuss opportunities, feel free to connect.

