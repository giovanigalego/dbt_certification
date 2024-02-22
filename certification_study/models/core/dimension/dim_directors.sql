with directors_raw as (
    select
        json.value as directors_name
    from {{ ref('int_movies') }},
    lateral flatten (input=>DIRECTORS) as json
)

select distinct
    upper(directors_name::string) as directors_name
from directors_raw