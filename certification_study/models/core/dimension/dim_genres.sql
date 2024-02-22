with movies_raw as (
    select
        json.value as genres_name
    from {{ ref('int_movies') }},
    lateral flatten (input=>GENRES) as json
)

select distinct
    upper(genres_name::string) as genres_name
from movies_raw