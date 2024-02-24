with int_movies as (
    {{ flatten_json(
        model_name = ref("stg_mongo_movies"),
        json_column = '_AIRBYTE_DATA'
    )}}
)

select
    _id
    ,PARSE_JSON("CAST") as cast
    ,PARSE_JSON(countries) as countries
    ,PARSE_JSON(genres) as genres
    ,PARSE_JSON(imdb) as imdb
    ,PARSE_JSON(languages) as languages
    ,lastupdated
    ,num_mflix_comments
    ,plot
    ,poster
    ,runtime
    ,type
    ,PARSE_JSON(writers) as writers
    ,fullplot
    ,PARSE_JSON(tomatoes) as tomatoes
    ,year_aibyte_transform
    ,PARSE_JSON(awards) as awards
    ,PARSE_JSON(directors) as directors
    ,released
    ,nullif(rated,'UNRATED') as rated
    ,metacritic
    ,title
from int_movies