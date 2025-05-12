with

payments as (

    select * from {{ ref('stg_stripe__payment') }}
),

successful_payments as (

    select 
        sum(payment_amount) as total_amount
    from 
        payments
    where
        payment_status = 'success'

)

select * from successful_payments