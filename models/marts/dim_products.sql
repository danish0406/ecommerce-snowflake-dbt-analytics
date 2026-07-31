WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),
order_items AS (
    SELECT * FROM {{ ref('stg_orders_items') }}
),
product_sales AS (
    SELECT
        product_id,
        COUNT(order_id) AS times_ordered,
        SUM(item_price) AS total_revenue_generated
    FROM order_items
    GROUP BY product_id
)
SELECT
    p.product_id,
    p.product_category_name,
    p.product_weight_g,
    COALESCE(ps.times_ordered, 0) AS times_ordered,
    COALESCE(ps.total_revenue_generated, 0.00) AS total_revenue_generated
FROM products p
LEFT JOIN product_sales ps ON p.product_id = ps.product_id