with comments as (
    select
        _AIRBYTE_AB_ID
        ,_AIRBYTE_DATA
        ,_AIRBYTE_EMITTED_AT
    from {{ source('mongo_flix', '_AIRBYTE_RAW_COMMENTS')}}
)

select
    _AIRBYTE_AB_ID
    ,_AIRBYTE_DATA
    ,_AIRBYTE_EMITTED_AT    
from comments