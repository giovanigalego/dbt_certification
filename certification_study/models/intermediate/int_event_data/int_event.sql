{{ flatten_json(
    model_name = ref("event_raw"),
    json_column = 'VALUE'
)}}