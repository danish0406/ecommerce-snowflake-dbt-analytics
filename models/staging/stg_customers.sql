WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_CUSTOMERS') }}
)
SELECT
    customer_id AS customer_id,
    customer_unique_id AS customer_unique_id,
    customer_zip_code_prefix AS zip_code,
    INITCAP(customer_city) AS customer_city,
    UPPER(customer_state) AS customer_state
FROM source