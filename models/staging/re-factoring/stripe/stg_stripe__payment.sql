with

source as (

    select * from {{ source('stripe', 'payment') }}

),

transformed as (

    select 
        orderid as order_id,
        id as payment_id,
        created as payment_created_at,
        status as payment_status,
        round(amount/100,2) as payment_amount

    from source

)

select * from transformed