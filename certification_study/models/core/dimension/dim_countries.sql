with country_raw as (
    select
        json.value as country_name
    from {{ ref('int_movies') }},
    lateral flatten (input=>COUNTRIES) as json
)

select distinct
    upper(country_name::string) as country_name    
from country_raw