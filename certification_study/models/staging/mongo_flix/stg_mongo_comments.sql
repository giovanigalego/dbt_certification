with comments as (
    select
        _AIRBYTE_AB_ID
        ,PARSE_JSON(_AIRBYTE_DATA) AS _AIRBYTE_DATA
        ,_AIRBYTE_EMITTED_AT
        ,UPDATE_AT
    from {{ source('mongo_flix', '_AIRBYTE_RAW_COMMENTS')}}
)

select
    * 
from comments