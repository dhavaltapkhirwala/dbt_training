with orders as (
    select * from {{ source('jaffle_shop', 'orders') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['user_id','order_date']) }} as id,
    user_id,
    order_date,
    count(1) as cnt
from orders
group by user_id,order_date