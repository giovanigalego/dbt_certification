{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge'

    )
}}

select
    age
    ,datetime
    ,is_active
    ,name
    ,phone_number
    ,random_number
from {{ref('int_event')}}
{% if is_incremental() %}
where datetime > (select max(datetime) from {{ this }})
{% endif %}