{% snapshot snap_shots %}
{# _etl_loaded_at field is considered to be the updated_at field for the purpose of learning snapshot
as we do not have the access to jaffle_shop.products table
{#
{{ snap shot based on timestamp strategy (most recommended to use timestamp strategy)
    config(
        target_schema='dbt_dtakhirwala_temp',
        unique_key='id',

        strategy='timestamp',
        updated_at='_etl_loaded_at' 

    )
}}
#}

{#snapshot based on check strategy#}
{{ 
    config(
        target_schema='dbt_dtakhirwala_temp',
        unique_key='id',

        strategy='check',
        check_cols=['status'],
    )
}}

select id, status from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}