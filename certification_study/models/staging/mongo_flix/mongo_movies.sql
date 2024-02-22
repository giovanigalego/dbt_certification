with movies as (
    select * from {{ source('mongo_flix', '_AIRBYTE_RAW_MOVIES')}}
)

select * from movies