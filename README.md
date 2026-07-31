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

![dbt DAG Lineage](
<img width="1501" height="602" alt="DAG diagram" src="https://github.com/user-attachments/assets/2280708d-c7b1-4586-8e18-4da3594c0757" />
)

---

## 🧪 Data Quality & Automated Testing
Implemented automated schema testing across primary keys, foreign key constraints, and required attributes:

![dbt Test Results](
<img width="1501" height="555" alt="test" src="https://github.com/user-attachments/assets/5c963d3c-ee31-436a-9914-591795f763d3" />
)

---

## 📈 Analytical Business Insights
Sample SQL query joining `FACT_ORDERS` with `DIM_CUSTOMERS` to compute revenue and average order value per state:

```sql
SELECT 
    c.customer_state,
    COUNT(f.order_id) AS total_orders,
    SUM(f.total_order_amount) AS total_revenue,
    AVG(f.order_revenue) AS avg_order_value
FROM ECOMMERCE_DB.ECOMMERCE_DB_ANALYTICS.FACT_ORDERS f
JOIN ECOMMERCE_DB.ECOMMERCE_DB_ANALYTICS.DIM_CUSTOMERS c 
    ON f.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 5;
