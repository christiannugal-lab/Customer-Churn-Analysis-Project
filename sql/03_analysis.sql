-- Churn analysis
-- Adding a churn_flag column
ALTER TABLE customers
ADD churn_flag INT;

-- Set binary/categorical output referencing churn_label, this is different to churn_value as it is created for clarity as churn_value remains numeric
UPDATE customers
SET churn_flag =
	CASE
		WHEN churn_label = 'Yes' THEN 1
        ELSE 0
	END;

SELECT churn_flag FROM customers;

-- Calculating churn rat
SELECT AVG(churn_flag) AS churn_rate
FROM customers;

-- Calculating revenue lost from churn
SELECT SUM(Total_Charges) AS revenue_lost
FROM customers
WHERE churn_flag = 1;

-- Calculating churn and average revenue by contract: obtaining sum of customers and their churn rates & monthy charges
SELECT CONTRACT,
	COUNT(*) AS customers,
    AVG(Monthly_Charges) AS avg_revenue,
    AVG(churn_flag) AS churn_rate
FROM customers
GROUP BY Contract;

-- Calculating churn by tenure: similar to churn by contract tenure months defined by 12 month breaks
SELECT
	CASE
		WHEN Tenure_Months < 12 THEN 'New'
        WHEN Tenure_Months < 24 THEN 'Mid-term'
        ELSE 'Loyal'
	END AS tenure_group,
    AVG(churn_flag) AS churn_rate
FROM customers
GROUP BY tenure_group;

-- Measuring CLTV against churn
SELECT churn_flag,
	AVG(CLTV) AS avg_cltv
FROM customers
GROUP BY churn_flag;

-- creating a feature impact visualisation consisting of Internet_Service, Tech_Support, Online_Security, 'Contract' (different from kpi query earlier), 'Payment_Method'
SELECT 'Internet_Service' AS feature, Internet_Service AS category, ROUND(AVG(churn_flag), 3) AS churn_rate
FROM compact_churn_analysis
GROUP BY Internet_Service

UNION ALL

SELECT 'Tech_Support', Tech_Support, AVG(churn_flag)
FROM compact_churn_analysis
GROUP BY Tech_Support

UNION ALL

SELECT 'Online_Security', Online_Security, AVG(churn_flag)
FROM compact_churn_analysis
GROUP BY Online_Security

UNION ALL

SELECT 'Contract', Contract, AVG(churn_flag)
FROM compact_churn_analysis
GROUP BY Contract

UNION ALL

SELECT 'Payment_Method', Payment_Method, AVG(churn_flag)
FROM compact_churn_analysis
GROUP BY Payment_Method;

-- DROP TABLE compact_churn_analysis;

CREATE TABLE compact_churn_analysis AS
SELECT
	CustomerID,
    Tenure_Months,
    Monthly_Charges,
    Total_Charges,
    Contract,
    Tech_Support,
    Online_Security,
    Internet_Service,
    Payment_Method,
    churn_flag
FROM customers;