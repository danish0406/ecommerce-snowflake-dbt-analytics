WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_ORDERS') }}
)

SELECT
    order_id AS order_id,
    customer_id AS customer_id,
    COALESCE(order_status, 'unknown') AS order_status,
    order_purchase_timestamp AS purchase_timestamp,
    order_approved_at AS approved_timestamp,
    order_delivered_carrier_date AS carrier_timestamp,
    order_delivered_customer_date AS delivered_timestamp,
    order_estimated_delivery_date AS estimated_delivery_timestamp
FROM source