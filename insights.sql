USE unicorn_project;

-- CATEGORY 1: GEOGRAPHIC ANALYSIS
-- Identify top countries and regional hubs with high average valuations.
SELECT country, COUNT(*) AS unicorn_count FROM companies
GROUP BY country ORDER BY unicorn_count DESC LIMIT 10;

SELECT city, country, COUNT(*) as unicorn_count, AVG(valuation) as avg_val
FROM companies c JOIN funding f ON c.company_id = f.company_id
GROUP BY city, country HAVING unicorn_count > 5 ORDER BY avg_val DESC;

-- CATEGORY 2: FINANCIAL INTELLIGENCE
-- Evaluating industry valuations and capital efficiency ratios.
SELECT i.industry, ROUND(SUM(f.valuation), 2) AS total_valuation_billions
FROM industries i JOIN funding f ON i.company_id = f.company_id
GROUP BY i.industry ORDER BY total_valuation_billions DESC;

SELECT i.industry, ROUND(AVG(f.valuation / f.total_raised), 2) AS efficiency_ratio
FROM industries i JOIN funding f ON i.company_id = f.company_id
WHERE f.total_raised > 0 GROUP BY i.industry ORDER BY efficiency_ratio DESC;

-- CATEGORY 3: GROWTH VELOCITY & RANKING
-- Analyzing time-to-unicorn status and ranking market leaders.
SELECT c.company, (YEAR(d.date_joined) - d.founded_year) AS years_to_unicorn
FROM companies c JOIN dates d ON c.company_id = d.company_id
WHERE d.founded_year IS NOT NULL ORDER BY years_to_unicorn ASC LIMIT 10;

WITH IndustryRank AS (
    SELECT i.industry, c.company, f.valuation,
    DENSE_RANK() OVER(PARTITION BY i.industry ORDER BY f.valuation DESC) AS valuation_rank
    FROM companies c JOIN industries i ON c.company_id = i.company_id
    JOIN funding f ON c.company_id = f.company_id
)
SELECT * FROM IndustryRank WHERE valuation_rank <= 3;
