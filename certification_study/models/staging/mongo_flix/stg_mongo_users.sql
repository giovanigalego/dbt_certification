with users as (
    select
        _AIRBYTE_AB_ID
        ,PARSE_JSON(_AIRBYTE_DATA) AS _AIRBYTE_DATA
        ,_AIRBYTE_EMITTED_AT
    from {{ source('mongo_flix', '_AIRBYTE_RAW_USERS')}}
)

select * from users