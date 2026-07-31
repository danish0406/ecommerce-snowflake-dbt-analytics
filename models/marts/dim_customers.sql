WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),
orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
order_summary AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        MIN(purchase_timestamp) AS first_order_date,
        MAX(purchase_timestamp) AS last_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.customer_unique_id,
    c.zip_code,
    c.customer_city,
    c.customer_state,
    COALESCE(os.total_orders, 0) AS total_orders,
    os.first_order_date,
    os.last_order_date,
    CASE 
        WHEN os.total_orders > 1 THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS customer_segment
FROM customers c
LEFT JOIN order_summary os ON c.customer_id = os.customer_id