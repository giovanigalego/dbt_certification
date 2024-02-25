select
    *
    ,case
        when year(to_timestamp(lastupdated)) = 2015 then dateadd(hours,-15,dateadd(hours,5,current_timestamp()))
        when year(to_timestamp(lastupdated)) = 2014 then dateadd(hours,-10,dateadd(hours,5,current_timestamp()))
        else to_timestamp(lastupdated)
    end as updated_at
    
from {{ ref('int_movies') }}