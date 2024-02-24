with int_theaters as (
    {{ flatten_json(
        model_name = ref("stg_mongo_theaters"),
        json_column = '_AIRBYTE_DATA'
    )}}
)

select
    _ID
    ,THEATERID
    ,PARSE_JSON(LOCATION) AS LOCATION
from int_theaters