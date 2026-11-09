# SQL-ZEPTOinventory-analysis
# Zepto Data Analysis Project Using SQL

## Project Overview
This project focuses on analyzing Zepto's product inventory dataset using MySQL. The main objective is to perform data cleaning, exploratory data analysis (EDA), and business analysis to extract meaningful insights from the dataset.

The project uses SQL queries to analyze product categories, pricing, discounts, stock availability, inventory weight, and product value.

## Tools & Technologies
- **Database:** MySQL
- **SQL Editor:** MySQL Workbench
- **Dataset:** Zepto Dataset (CSV)
- **Language:** SQL

## Database and Table Creation

Created a database named `database_zepto` and a table named `zepto`.

```sql
CREATE DATABASE database_zepto;

USE database_zepto;

CREATE TABLE zepto (
    s_id SERIAL PRIMARY KEY,
    Category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);
```

## Data Cleaning

Performed data cleaning to ensure data quality and consistency.

- Checked for NULL values in important columns.
- Identified products with zero MRP or discounted selling price.
- Identified duplicate product names.
- Removed unwanted records.
- Converted TRUE/FALSE values into 1/0 for successful CSV import.
- Converted price values from paise to rupees where applicable.

## Exploratory Data Analysis (EDA)

The following business questions were answered using SQL:

### 1. Retrieve product records
Displayed the first 10 records from the Zepto table.

### 2. Check for NULL values
Identified missing values across important columns.

### 3. Identify distinct product categories
Retrieved all unique product categories.

### 4. Products in stock vs out of stock
Analyzed the number of products available and unavailable in stock.

### 5. Identify duplicate products
Found product names appearing multiple times.

## Business Analysis

### 1. Best Value Products
Identified the top 10 products offering the highest discount percentages.

### 2. High-Priced Out-of-Stock Products
Identified expensive products that are currently out of stock.

### 3. Inventory Value by Category
Calculated the total value of available inventory for each product category.

### 4. High MRP and Low Discount Products
Identified products with MRP greater than ₹500 and discount percentage below 10%.

### 5. Categories Offering Highest Average Discounts
Identified the top 5 categories with the highest average discount percentage.

### 6. Price Per Gram Analysis
Calculated the price per gram for products weighing more than 100 grams to identify better-value products.

### 7. Product Weight Categorization
Grouped products into three categories based on their weight:
- Low: Below 1000 grams
- Medium: 1000–5000 grams
- Bulk: Above 5000 grams

### 8. Total Inventory Weight by Category
Calculated the total inventory weight for each product category using available quantity and product weight.

## SQL Concepts Used

- CREATE DATABASE and CREATE TABLE
- SELECT and DISTINCT
- WHERE and ORDER BY
- GROUP BY and HAVING
- Aggregate Functions (SUM, AVG, COUNT)
- CASE WHEN
- DELETE and UPDATE
- Subqueries
- LIMIT
- NULL Value Handling
- Mathematical Operations

## Key Learning Outcomes

- Gained practical experience in MySQL and SQL queries.
- Learned how to clean and prepare real-world datasets.
- Improved understanding of aggregate functions and grouping.
- Learned to categorize products using CASE statements.
- Practiced solving business-related questions using SQL.
- Developed analytical thinking through inventory and pricing analysis.

## Conclusion

This project provided hands-on experience in SQL-based data analysis using a real-world retail dataset. It helped develop practical skills in data cleaning, exploratory data analysis, and extracting business insights using MySQL.

**Project Status:** Completed
