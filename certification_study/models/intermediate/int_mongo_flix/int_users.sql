with int_users as (
    {{ flatten_json(
        model_name = ref("mongo_users"),
        json_column = '_AIRBYTE_DATA'
    )}}
)

select
    _id
    ,email
    ,name
    ,password
    ,preferences
from int_users