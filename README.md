# 🏦 Bank Transaction Fraud Analysis

SQL-based and Power BI-driven analysis of banking transactions to detect fraud patterns, anomalies, and high-risk customer behavior.

---

## 📌 Overview

This project analyzes banking transaction data to identify suspicious activities and fraud patterns using **SQL**, and presents insights through an interactive **Power BI dashboard**.

It simulates a real-world Anti-Money Laundering (AML) scenario where financial institutions monitor transactions to detect unusual behavior and mitigate risk.

---

## 🎯 Business Problem

Banks process thousands of transactions daily, making it difficult to manually detect fraud.

The goal of this project is to:

* Identify high-risk transactions
* Detect unusual customer behavior
* Analyze fraud patterns across transaction types and locations

---

## 📊 Dataset

* 5,000 transaction records
* Includes customer, transaction, and financial attributes
* Contains an anomaly flag (`-1 = suspicious, 1 = normal`)

---

## 🧹 Data Quality Assessment

* No missing values found
* Date fields converted to proper date format
* Anomaly flag interpreted for fraud detection

---

## 🔍 Key Analysis Performed

* Customer-level spending analysis
* Fraud rate calculation
* Transaction frequency monitoring
* Location-based fraud detection
* Time-based anomaly trends

---

## 🔗 Project Workflow

1. Data exploration and analysis using SQL
2. Fraud-related metrics calculated (fraud rate, fraud amount, etc.)
3. Data visualized in Power BI
4. Insights generated from dashboard analysis

---

## 🛠️ Tools & Technologies

* SQL (PostgreSQL)
* Power BI
* CSV / Excel
* GitHub

---

## 📊 Power BI Dashboard

This dashboard visualizes fraud patterns, transaction behavior, and key risk indicators.

![Dashboard](screenshots/dashboard.png)

---

## 📈 Key Insights

* Fraud rate is approximately **6%**, indicating moderate risk
* Fraud contributes nearly **6% of total transaction value**, showing proportional impact
* Fraud is distributed across transaction values, with no strong concentration in high-value transactions
* Fraud activity is concentrated in specific cities, indicating potential geographic hotspots
* Certain transaction types show higher fraud occurrences
* Fraud trends fluctuate across months, suggesting possible temporal patterns

---

## 💡 Business Impact

This analysis demonstrates how data analytics can:

* Detect fraudulent behavior
* Support risk management decisions
* Improve transaction monitoring systems

---

## 🚀 Future Improvements

* Apply machine learning models for fraud prediction
* Implement real-time anomaly detection

---

## 👩🏽‍💻 Author

**Saidat Makinde**
Data Analyst | SQL | Power BI | Financial Analytics
