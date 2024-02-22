{{
  config(
    materialized = 'incremental',
    )
}}

select
    age
    ,datetime
    ,is_active
    ,name
    ,phone_number
    ,random_number
from {{ ref('int_event') }} as int_event
{% if is_incremental() %}
where int_event.datetime > (select max(datetime) from {{ this }})
{% endif %}