{{
    config(
    severity='warn'
)
}}

select 
    order_id,amount
from {{ ref('fct_orders') }}
where amount <=5 