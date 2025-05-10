{{ config(
    materialized='incremental',
    unique_key = 'id'
) }}

with 

orders as (
    select * from {{ source('jaffle_shop', 'orders') }}
        {% if is_incremental() %}
            where user_id in (
                select distinct user_id from {{ source('jaffle_shop', 'orders') }}
            where _etl_loaded_at >= (select timestamp_sub(max(max_loaded_tstamp), interval 3 day) from {{ this }}))
        {% endif %}
),

aggregated_orders as (
    select 
        orders.id,
        min(orders.order_date) as min_order_date,
        max(orders._etl_loaded_at) as max_loaded_tstamp
    from orders
    group by 1
),

joined as (
    select 
        *
    from orders 
    left join aggregated_orders using (id)
),

indexed as (
    select joined.*,
    row_number() over (
        partition by joined.id 
        order by joined.order_date) as order_index,
    row_number() over (
        partition by joined.user_id
        order by joined.order_date) as user_index
    from joined
)

select * from indexed

