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

-- Calculating churn by contract: obtaining sum of customers and their churn rates
SELECT CONTRACT,
	COUNT(*) AS customers,
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

CREATE TABLE compact_churn_analysis AS
SELECT
	CustomerID,
    Tenure_Months,
    Monthly_Charges,
    Total_Charges,
    Contract,
    Internet_Service,
    Payment_Method,
    churn_flag
FROM customers;