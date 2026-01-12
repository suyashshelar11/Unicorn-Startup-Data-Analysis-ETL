# Unicorn Startup Data Analysis & ETL Pipeline

## 📌 Project Overview
This project demonstrates an end-to-end data engineering and analytics workflow. I transformed a raw, unstructured dataset of 1,000+ global "Unicorn" startups into a high-performance relational database. The goal was to build a system that can track venture capital trends, geographic hotspots, and industry growth velocity.

## 🏗️ Database Architecture
I architected a **Star Schema** following **3rd Normal Form (3NF)** principles to ensure data integrity and query efficiency. The database is divided into four specialized dimension and fact tables:

- **Companies:** Geographic and naming data.
- **Funding:** Financial metrics (Valuations and Total Raised).
- **Industries:** Sector classifications.
- **Dates:** Temporal data (Founding years and join dates).



## 🛠️ Tech Stack & Skills
- **Language:** SQL (MySQL)
- **Engineering:** ETL Pipeline, Data Normalization (3NF), Schema Design.
- **Analytics:** Window Functions (`DENSE_RANK`), CTEs, Time-Series Analysis, Data Type Casting.

## 📂 Repository Structure
- `01_database_setup.sql`: DDL scripts to create the database and relational tables.
- `02_data_transformation.sql`: ETL scripts for data scrubbing, handling NULLs, and populating tables.
- `03_market_insights.sql`: Thematic analysis focusing on Geography, Finance, and Growth.

## 📊 Key Insights & Analytics
The analysis layer provides strategic intelligence across three main pillars:

### 1. Geographic Intelligence
* Identified top-tier startup hubs using the `HAVING` clause to filter cities with the highest average unicorn valuations.
* Analyzed country-wide distribution to visualize market concentration.

### 2. Financial Performance
* Calculated **Capital Efficiency Ratios** to determine which industries generate the most value per dollar of funding.
* Ranked top 10 investor portfolios by total market valuation.

### 3. Growth & Ranking
* Utilized **Window Functions** to benchmark the top 3 market leaders in every industry vertical.
* Performed **Time-Series Analysis** to calculate the "Time to Unicorn" (average years from founding to $1B valuation).

## 🚀 How to Use
1. Clone this repository.
2. Run `database_architecture.sql` to create the schema.
3. Import your raw CSV data into a temporary table named `unicorn_companies`.
4. Run `data_cleaning.sql` to clean and populate the production tables.
5. Execute `insights.sql` to generate business reports.

