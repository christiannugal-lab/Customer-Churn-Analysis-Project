# Customer Churn \& Retention Analysis



## Business Problem

This telecommunications business experiences high customer churn, resulting in potential revenue loss. The management team suspects that customer churn, discounting strategies, and product mix are impacting long-term profitability but has failed to identify the underlying drivers.



The following assessment explores key business questions, such as:



* Diagnosing cost drivers
* Identifying loss-making segments
* Recommended profit optimisation strategies



This project identifies which customers are at risk of leaving and outlines the actions that can be taken to reduce churn.



## Dataset

* Source: https://www.kaggle.com/datasets/yeanzc/telco-customer-churn-ibm-dataset/data

## Tools Used

* SQL (data cleaning and exploratory analysis)
* Tableau (dashboard & visualisation)



## Approach

1. Clean and transform raw customer data using SQL
* Handled data type inconsistencies and cleaned non-numeric values using SQL REGEX before type conversion
2. Designed churn indicators and customer lifetime metrics
3. Analysed behavioural patterns leading to churn
4. Created Tableau dashboards to track retention KPIs



## Key Insights & Recommendations

Customer churn is heavily concentrated among short-tenure customers, especially those ‘New’ members (<12 months), who have a high 48% churn flag. This potentially means the business is failing at early-stage retention, where customers are leaving before becoming profitable. To reduce these numbers, it is recommended for the business to focus on onboarding, engagement and greater first-year incentives. 

Contract type is the main driver for churn, with month-to-month contracts having an average churn flag of 48%, followed by one-year and two-year contracts with 11% and 3%, respectively. Therefore, contracts with greater flexibility significantly increase the risk of churn. To combat this, the business could incentivise customers to move from month-to-month to longer contracts.

Those who subscribed to additional support services had lower churn. Customers without the likes of tech support and online security have higher churn rates (around 3x more likely to flip). Customers who are less connected with the ecosystem leave more easily. For greater appeal and an increased chance of subscribing, price reassessment and improving value (such as bundles and service quality) can transition a low-value customer to a higher value one.

Forms of payment methods that include manually transactions show higher churn. More friction in payments leads to a higher likelihood of leaving. Those who sent electronic checks had a 45% chance of churning, whereas their automatic counterparts (bank transfer and credit cards were sitting around 16%. The main goal in limiting revenue loss is the encouragement of customers to choose automatic payment methods (possibly adding a discount).

The CLTV distribution is heavily right-skewed, indicating that a majority of customers contribute relatively low lifetime value, while a small part of high-value customers drive a disproportionate share of total revenue. These high-value customers are usually those with longer tenure and contract-based plans. The business should aim to segment customers by value and tailor retention strategies to solely focus on high lifetime value potential.




## Visuals

![](https://github.com/christiannugal-lab/Customer-Churn-Analysis-Project/blob/main/outputs/Customer%20Churn%20Dashboard.png)



### Tableau Dashboard

https://public.tableau.com/app/profile/christian.nugal4702/viz/CustomerChurnAnalysis\_17744183967180/ChurnAnalysis?publish=yes 



### updates
updated readme

