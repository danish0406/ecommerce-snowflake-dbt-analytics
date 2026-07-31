# 🛒 Modern Analytics Stack: E-Commerce Sales Data Warehouse

## 📌 Project Overview
Engineered an end-to-end cloud data warehouse using **Snowflake** and **dbt Cloud**, transforming over 100,000 raw e-commerce records into an analytics-ready **Star Schema** following Kimball dimensional modeling best practices.

## 🏗️ Architecture & Pipeline Flow
`Raw CSVs (Kaggle)` ➔ `Snowflake Landing (RAW)` ➔ `dbt Staging Layer (Views)` ➔ `dbt Marts Layer (Star Schema)`

## 🛠️ Tech Stack & Key Skills
* **Cloud Warehouse:** Snowflake
* **Transformation & Modeling:** dbt Cloud (SQL, CTEs, Window Functions, Dimensional Modeling)
* **Data Quality:** dbt Schema Testing (`unique`, `not_null`, `relationships`)
* **Version Control:** Git / GitHub

---

## 📊 Data Lineage Graph (dbt DAG)
Modular data architecture tracing dependencies from raw landing tables to final dimension and fact marts:

<img width="1501" height="602" alt="DAG diagram" src="https://github.com/user-attachments/assets/ff63c75a-89b4-4bf5-abf3-95ec01bcedb2" />


---

## 🧪 Data Quality & Automated Testing
Implemented automated schema testing across primary keys, foreign key constraints, and required attributes:

<img width="1501" height="555" alt="test" src="https://github.com/user-attachments/assets/fcdd8d24-2db6-4ee0-badb-1c5559a7e532" />


---

## 📈 Analytical Business Insights
Sample SQL query joining `FACT_ORDERS` with `DIM_CUSTOMERS` to compute revenue and average order value per state:

<img width="1872" height="896" alt="query" src="https://github.com/user-attachments/assets/c51f8519-fd51-4b71-863e-011ce449c05f" />


