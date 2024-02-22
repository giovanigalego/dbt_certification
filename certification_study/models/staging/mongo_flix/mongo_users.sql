with users as (
    select * from {{ source('mongo_flix', '_AIRBYTE_RAW_USERS')}}
)

select * from users