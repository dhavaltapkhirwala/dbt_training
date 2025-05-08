select * from {{ source('jaffle_shop', 'orders') }}

{{ limit_data_in_dev(column_name = 'order_date', days = 10000) }}