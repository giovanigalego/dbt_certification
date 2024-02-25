with users as (
    select
        row_number() over(order by _AIRBYTE_EMITTED_AT) as rn
        ,_AIRBYTE_AB_ID
        ,PARSE_JSON(_AIRBYTE_DATA) AS _AIRBYTE_DATA
        ,_AIRBYTE_EMITTED_AT
        ,UPDATE_AT
    from {{ source('mongo_flix', '_AIRBYTE_RAW_USERS')}}
)

select
    rn
    ,_AIRBYTE_AB_ID
    ,_AIRBYTE_DATA
    ,_AIRBYTE_EMITTED_AT
    ,UPDATE_AT
from users