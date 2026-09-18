# SQL & Analytics

This folder contains practical SQL work I have done while building up my data-analysis skills.

## Bike Sales Analysis

The main exercise in this folder uses three CSV files based on the BikeStores sample database structure:
- Customers.csv
- Orders.csv
- Products.csv

The public BikeStores sample database is commonly documented as a SQL Server sample database with sales and production schemas. The version used here has been kept as three simpler CSV tables, so the queries are written to match the files actually stored in this repository.

Source reference: https://www.sqlservertutorial.net/getting-started/sql-server-sample-database/

## Questions answered
1. Which customer bought which product?
2. Which five products generated the most revenue?
3. Which five customers placed the most orders?

## What I practised
- Joining related tables
- Matching customer and product IDs
- Aggregating sales values
- Counting customer orders
- Sorting and limiting results
- Keeping the SQL consistent with the actual data structure

## Results

The current CSVs contain 1,445 customers, 4,722 orders and 321 products.

The verified results are recorded in [Bike_Sales_Results.md](Bike_Sales_Results.md).

## Files
- [bike_sales_analysis.sql](bike_sales_analysis.sql) — SQL queries used for the analysis
- [Bike_Sales_Results.md](Bike_Sales_Results.md) — short record of the results
- [Customers.csv](Customers.csv)
- [Orders.csv](Orders.csv)
- [Products.csv](Products.csv)
- [AmanGupta_Velocity_Bikes_Analysis.pdf](AmanGupta_Velocity_Bikes_Analysis.pdf) — earlier analysis document retained as project history

I have kept the written documentation separate from the SQL so the queries can be read and checked on their own.