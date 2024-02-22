{% set json_column_query %}
    select distinct
        json.key as column_name
        
    from {{ ref('int_movies') }}
    ,lateral flatten(input=>AWARDS) as json
    {% endset %}

    {% set results = run_query(json_column_query) %}

    {% if execute %}
    {% set result_list = results.columns[0].values() %}
    {% else %}
    {% set result_list =[] %}
    {% endif %}

    select
        title,
        {% for column_name in result_list %}
            AWARDS:{{column_name}}::varchar as {{column_name}} {% if not loop.last %},{% endif %}
        {% endfor %}

    from {{ ref('int_movies') }}
