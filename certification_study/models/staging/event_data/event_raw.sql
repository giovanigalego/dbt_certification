with event_raw as (
    select * from {{ source('event_data', 'demo_data')}}
)

select
    json.*
from event_raw,
lateral flatten (input=> RANDOM_DATA) as json