# SQL and Analytics

This folder contains my SQL practice and small analysis projects.

## Bike Sales SQL Analysis

This project uses the BikeStores sample database and focuses on three straightforward questions:

1. Which product did each customer purchase?
2. Which five products generated the most revenue?
3. Which five customers placed the most orders?

The main query file is [bike_sales_analysis.sql](bike_sales_analysis.sql).

### Data source

The table names and database structure used by the SQL queries follow the BikeStores sample database published by SQL Server Tutorial.

Source: https://www.sqlservertutorial.net/getting-started/sql-server-sample-database/

The repository also contains CSV exports used for this exercise:

- [Customers.csv](Customers.csv)
- [Orders.csv](Orders.csv)
- [Products.csv](Products.csv)

The CSVs are kept as project working files. They should not be confused with the original database schema: the SQL queries use the normalised sales and production tables from the BikeStores sample database.

### Results from the CSV working files

I recalculated the summary below from the CSV files currently stored in this folder.

- Customers: 1,445
- Order rows: 4,722
- Products: 293

#### Top products by calculated revenue

Revenue here is calculated as quantity × price from the CSV order rows.

| Product | Revenue |
|---|---:|
| Trek Slash 8 27.5 - 2016 | 615,998.46 |
| Trek Conduit+ - 2016 | 434,998.55 |
| Trek Fuel EX 8 29 - 2016 | 414,698.57 |
| Surly Straggler 650b - 2016 | 253,829.49 |
| Trek Domane SLR 6 Disc - 2017 | 236,499.57 |

#### Customers with the highest order count

The highest count in the current CSV files is 3 orders. Five customers returned by the analysis are:

- Monika Berg
- Saturnina Garner
- Ronna Butler
- Cleotilde Booth
- Williemae Holloway

There are ties at three orders, so the exact five names should not be read as a unique ranking.

### What I practised

This project helped me practise:

- JOIN
- GROUP BY
- aggregate functions
- revenue calculations
- COUNT
- ordering and limiting results
- reading a relational sales structure

I have kept the explanation simple because this is a practical SQL project, not a research project.
