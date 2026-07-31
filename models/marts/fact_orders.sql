WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),
order_items_agg AS (
    SELECT
        order_id,
        COUNT(order_item_id) AS total_items,
        SUM(item_price) AS order_revenue,
        SUM(freight_value) AS order_freight_cost,
        SUM(total_item_cost) AS total_order_amount
    FROM {{ ref('stg_orders_items') }}
    GROUP BY order_id
)
SELECT
    o.order_id,
    o.customer_id,
    c.customer_state,
    o.order_status,
    o.purchase_timestamp,
    COALESCE(oi.total_items, 0) AS total_items,
    COALESCE(oi.order_revenue, 0.00) AS order_revenue,
    COALESCE(oi.order_freight_cost, 0.00) AS order_freight_cost,
    COALESCE(oi.total_order_amount, 0.00) AS total_order_amount,
    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id 
        ORDER BY o.purchase_timestamp ASC
    ) AS customer_order_sequence,
    DATEDIFF('day', o.delivered_timestamp, o.estimated_delivery_timestamp) AS days_ahead_of_estimated_delivery
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_items_agg oi ON o.order_id = oi.order_id