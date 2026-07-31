WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_ORDER_DETAILS') }}
)

SELECT
    order_id AS order_id,
    order_item_id AS order_item_id,
    product_id AS product_id,
    seller_id AS seller_id,
    shipping_limit_date AS shipping_limit_timestamp,
    price AS item_price,
    freight_value AS freight_value,
    (price + freight_value) AS total_item_cost
FROM source