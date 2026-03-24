-- Convert text columns to VARCHAR(n)
ALTER TABLE customers
MODIFY CustomerID VARCHAR(50),
MODIFY Country VARCHAR(100),
MODIFY State VARCHAR(100),
MODIFY City VARCHAR(100),
MODIFY Zip_Code VARCHAR(20),
MODIFY Gender VARCHAR(10),
MODIFY Senior_Citizen VARCHAR(5),
MODIFY Partner VARCHAR(10),
MODIFY Dependents VARCHAR(10),
MODIFY Phone_Service VARCHAR(10),
MODIFY Multiple_Lines VARCHAR(30),
MODIFY Internet_Service VARCHAR(50),
MODIFY Online_Security VARCHAR(30),
MODIFY Online_Backup VARCHAR(30),
MODIFY Device_Protection VARCHAR(30),
MODIFY Tech_Support VARCHAR(30),
MODIFY Streaming_TV VARCHAR(30),
MODIFY Streaming_Movies VARCHAR(30),
MODIFY Contract VARCHAR(50),
MODIFY Paperless_Billing VARCHAR(10),
MODIFY Payment_Method VARCHAR(50),
MODIFY Churn_Label VARCHAR(10),
MODIFY Churn_Reason VARCHAR(255);

-- Convert numeric columns
ALTER TABLE customers
MODIFY CustomerCount INT,
MODIFY Tenure_Months INT,
MODIFY Churn_Value INT,
MODIFY Churn_Score INT,
MODIFY Monthly_Charges DECIMAL(10,2),
MODIFY CLTV DECIMAL(10,2),
MODIFY Latitude DECIMAL(10,6),
MODIFY Longitude DECIMAL(10,6);

-- Clean and convert Total_Charges
SELECT Total_Charges
FROM customers
WHERE Total_Charges NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';

UPDATE customers
SET Total_Charges = NULL
WHERE Total_Charges NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';

ALTER TABLE customers
MODIFY Total_Charges DECIMAL(10,2);