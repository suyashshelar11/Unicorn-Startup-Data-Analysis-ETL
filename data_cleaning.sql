USE unicorn_project;

-- Populate Companies
SET @row_number = 0;
INSERT INTO companies (company_id, company, city, country)
SELECT (@row_number:=@row_number + 1), Company, City, Country 
FROM unicorn_companies;

-- Populate Industries
SET @row_number = 0;
INSERT INTO industries (company_id, industry)
SELECT (@row_number:=@row_number + 1), Industry 
FROM unicorn_companies;

-- Populate Dates with Data Cleaning
SET @row_number = 0;
INSERT INTO dates (company_id, date_joined, founded_year)
SELECT 
    (@row_number:=@row_number + 1), 
    STR_TO_DATE(`Date Joined`, '%m/%d/%Y'), 
    CASE 
        WHEN `Founded Year` = 'None' THEN NULL 
        ELSE CAST(`Founded Year` AS SIGNED) 
    END
FROM unicorn_companies;

-- Populate Funding with String Manipulation & Casting
SET @row_number = 0;
INSERT INTO funding (company_id, valuation, total_raised, select_investors)
SELECT 
    (@row_number:=@row_number + 1),
    CAST(REPLACE(REPLACE(`Valuation ($B)`, '$', ''), 'B', '') AS DECIMAL(10,2)),
    CASE 
        WHEN `Total Raised` = 'None' THEN NULL
        WHEN `Total Raised` LIKE '%B' THEN CAST(REPLACE(REPLACE(`Total Raised`, '$', ''), 'B', '') AS DECIMAL(10,2))
        WHEN `Total Raised` LIKE '%M' THEN CAST(REPLACE(REPLACE(`Total Raised`, '$', ''), 'M', '') AS DECIMAL(10,2)) / 1000
        ELSE 0 
    END,
    `Select Inverstors`
FROM unicorn_companies;

-- Remove the raw table after successful normalization
DROP TABLE IF EXISTS unicorn_companies;
