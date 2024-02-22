with int_comments as (
    {{ flatten_json(
        model_name = ref("mongo_comments"),
        json_column = '_AIRBYTE_DATA'
    )}}
)

select 
    _id
    ,date
    ,email
    ,movie_id
    ,name
    ,text
from int_comments