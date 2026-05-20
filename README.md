# Bangalore Rapido Ride Services Analysis Dashboard

An end-to-end data analytics project focused on analyzing Bangalore Rapido ride booking data using **SQL Server**, **Power BI**, and **DAX**.  
This project performs **data cleaning**, **exploratory data analysis (EDA)**, **KPI calculation**, and **interactive dashboard visualization** to identify ride trends, revenue patterns, cancellation behavior, and customer booking insights.

---

##  Project Overview

The objective of this project is to analyze Rapido ride service data and uncover business insights such as:

- Most preferred ride services  
- Revenue contribution by services  
- Peak booking hours  
- Cancellation trends  
- Distance-wise pricing behavior  
- Ride demand patterns across weekdays and time periods  

The project combines:

- Data Cleaning & Exploratory Data Analysis (EDA)  
- Dashboard & Visualization  
- KPI calculations, measures, and derived columns  

---

##  Tools & Technologies Used

- SQL Server - Data Cleaning & EDA     
- Power BI - Dashboard Development
- DAX - Measures & Calculations 
- Excel/CSV Dataset - Source Data             

---

## Project Workflow

### 1 Data Cleaning using SQL
Performed:
- Duplicate checking using `ROW_NUMBER()`  
- Null value handling using `ISNULL()`  
- Data type conversion  
- Payment method standardization  
- Data preparation for dashboarding  

SQL Concepts Used: 
CTEs, Aggregate Functions, CASE Statements, GROUP BY, Window Functions, Data Cleaning Queries  

---

## Exploratory Data Analysis (EDA)

Key business questions answered:
1. Which service has the highest ride count?  
2. Which service generates the highest revenue?  
3. Which service has the highest cancellation rate?  
4. What are the peak booking hours?  
5. Which routes face frequent cancellations?  
6. Most preferred payment methods?  
7. Average fare by service type  
8. Distance vs Fare analysis  
9. Rush hour demand analysis  

---

## Power BI Dashboard Features

### KPI Cards
- Total Rides  
- Revenue  
- Cancellation Loss  
- Average Distance  
- Average Charge per KM  

### Visualizations
- Revenue by Services  
- Services Over Time  
- Ride Status Analysis  
- Weekday Ride Trends  
- Distance Range Analysis  
- Charge Per KM by Distance  

### Filters/Slicers
- Ride Status  
- Services  
- Payment Method  
- Period  

---

## DAX Measures Used

### Average Charge Per KM
<img width="1256" height="161" alt="Image" src="https://github.com/user-attachments/assets/d855056b-3799-4d04-b854-bb14ed354923" />

### Cancellation Loss
<img width="1227" height="62" alt="Image" src="https://github.com/user-attachments/assets/0765bb3f-aba0-46cf-8eb9-d331898430c4" />

### Revenue
<img width="1176" height="52" alt="Image" src="https://github.com/user-attachments/assets/ae644abc-16cf-417b-91e7-99a1aaf23581" />

### Ride Percent By weekdays
<img width="1186" height="65" alt="Image" src="https://github.com/user-attachments/assets/8353de37-ca9b-4ff5-a0b1-520d584a920c" />

#  Custom Weekday Analysis

Created a new weekday column in Power BI using DAX for weekday-wise ride analysis and visualization.
<img width="841" height="42" alt="Image" src="https://github.com/user-attachments/assets/2ec6fbd7-fed1-4242-8d47-ef86d265c09e" />

### Key Insights
#### Most Preferred Services
* Bike and Auto are the most preferred ride services.

#### Revenue Contribution
* Bike Revenue: ₹7,426,089 (7426.09K)
* Auto Revenue: ₹6,094,206 (6094.21K)
* Total Revenue: ₹24,590,737 (24590.74K)
- Bike and Auto together contribute approximately 55% of total revenue.

#### Peak Ride Hours

- Morning and Evening are the peak booking periods.
- These periods mainly represent office commuting hours.

#### Cancellation Analysis

* Cancellation rates are highest during:

  * Morning
  * Afternoon

* Estimated predictive revenue loss due to cancellations:

#### ₹2,754,180.04 (2754.18K)

#### Distance Analysis

* Most rides are booked within:

  * 21–40 KM
  * 1–20 KM

* Shorter distance rides have:

  * Higher **Charge Per KM**

###  Dashboard Preview

#### Overview Dashboard

* Service Revenue Analysis
* Ride Status Distribution
* Time-based Ride Analysis

#### Weekday & Distance Dashboard

* Weekday Ride Trends
* Distance Range Analysis
* Charge per KM Comparison

#  Business Conclusion

The analysis shows that economical ride services such as **Bike** and **Auto** dominate Bangalore’s ride-sharing demand and contribute the majority of total revenue.

Peak ride demand occurs during office commuting hours, especially in the morning and evening. However, cancellation rates are also higher during these periods, leading to noticeable revenue loss opportunities for the business.

Distance-based pricing analysis reveals that shorter rides generate higher revenue per kilometer, making them highly profitable for ride-sharing platforms.
