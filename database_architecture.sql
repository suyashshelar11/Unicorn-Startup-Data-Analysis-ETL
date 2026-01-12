CREATE DATABASE IF NOT EXISTS unicorn_project;
USE unicorn_project;

-- Table: companies (Dimension Table)
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Table: funding (Fact Table)
CREATE TABLE funding (
    company_id INT,
    valuation DECIMAL(10,2), 
    total_raised DECIMAL(10,2),
    select_investors TEXT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Table: industries (Dimension Table)
CREATE TABLE industries (
    company_id INT,
    industry VARCHAR(100),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Table: dates (Dimension Table)
CREATE TABLE dates (
    company_id INT,
    date_joined DATE,
    founded_year INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);
