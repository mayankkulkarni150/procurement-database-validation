# Procurement Database Management & Data Validation

## Project Overview

This project focuses on managing procurement data and validating purchase order records using MySQL.

The objective is to analyse supplier information, purchase orders and purchase order items, identify data inconsistencies, and generate reconciliation reports.

## Technologies Used

- MySQL
- SQL

## Database Structure

The project uses three main tables:

| Table | Description |
|---|---|
| suppliers | Stores supplier information |
| purchase_orders | Stores purchase order details |
| po_items | Stores individual items associated with purchase orders |

## Project Features

- Database and table creation.
- Supplier and purchase order data insertion.
- Relational data analysis using SQL JOINs.
- Identification of purchase orders without item records.
- Purchase order amount reconciliation.
- Investigation of financial discrepancies.
- Duplicate record identification.
- Supplier reference validation.
- Missing data checks.
- Final reconciliation report.

## SQL Concepts Demonstrated

- CREATE DATABASE and CREATE TABLE
- INSERT INTO
- INNER JOIN and LEFT JOIN
- GROUP BY and ORDER BY
- Aggregate functions (SUM, COUNT)
- CASE statements
- COALESCE()
- HAVING clause
- Data validation and reconciliation

## Key Findings

The analysis identified two purchase order discrepancies:

| Purchase Order | Recorded Amount | Calculated Amount | Difference | Status |
|---|---:|---:|---:|---|
| 103 | ₹45,000 | ₹60,000 | -₹15,000 | Understated |
| 114 | ₹29,000 | ₹20,000 | ₹9,000 | Overstated |

The remaining 13 purchase orders were classified as matched.

## Project Files

| File | Description |
|---|---|
| 01_database_creation.sql | Creates the procurement database |
| 02_table_creation.sql | Creates the database tables |
| 03_insert_suppliers.sql | Inserts sample supplier and procurement data |
| 04_sql_analysis.sql | Contains SQL analysis and validation queries |

## How to Run

1. Install MySQL.
2. Open MySQL Workbench or another MySQL client.
3. Execute `01_database_creation.sql`.
4. Execute `02_table_creation.sql`.
5. Execute `03_insert_suppliers.sql`.
6. Execute `04_sql_analysis.sql`.
7. Review the query outputs and reconciliation results.

## Conclusion

This project demonstrates practical SQL skills in relational database management, procurement data analysis, data quality checks and financial reconciliation.

It highlights how SQL can be used to identify inconsistencies and improve the reliability of procurement records.

---

**Project Type:** SQL Database Management & Data Validation  
**Database:** MySQL
