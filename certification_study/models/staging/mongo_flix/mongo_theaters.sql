with theaters as (
    select * from {{ source('mongo_flix', '_AIRBYTE_RAW_THEATERS')}}
)

select * from theaters