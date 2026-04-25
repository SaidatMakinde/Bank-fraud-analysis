# Bank-fraud-analysis
SQL-based analysis of banking transactions to detect fraud patterns, anomalies, and high-risk customer behavior.
# 🏦 Bank Transaction Fraud Analysis (SQL Project)

## 📌 Overview

This project analyzes banking transaction data to identify suspicious activities and fraud patterns using SQL.

It simulates a real-world Anti-Money Laundering (AML) scenario where financial institutions must monitor transactions to detect unusual behavior and mitigate risk.

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
* Date fields required conversion from text to date format
* Anomaly flag interpreted for fraud detection

---

## 🔍 Key Analysis Performed

* Customer-level spending analysis
* Fraud rate calculation
* High-value transaction analysis
* Transaction frequency monitoring
* Location-based fraud detection
* Time-based anomaly trends

---

## 📈 Key Insights

* Approximately **6% of transactions were flagged as suspicious**, indicating potential fraud
* **High-value transactions (> $10,000)** showed a higher likelihood of anomalies
* Certain transaction types (e.g., transfers) had **significantly higher fraud rates**
* Some customers performed **multiple transactions within short timeframes**, indicating unusual behavior
* Fraud patterns were concentrated in specific locations, suggesting **possible fraud hotspots**

---

## 🛠️ Tools Used

* SQL (PostgreSQL)
* VS Code
* GitHub

---

## 💡 Business Impact

This analysis demonstrates how SQL can be used to:

* Detect fraudulent behavior
* Support risk management decisions
* Improve transaction monitoring systems

---

## 🚀 Future Improvements

* Build an interactive dashboard using Power BI
* Apply machine learning models for fraud prediction
* Implement real-time anomaly detection

---

## 👩🏽‍💻 Author

**Saidat Makinde**
Data Analyst | SQL | Financial Analytics
