{% macro flatten_json(model_name, json_column) %}

{% set json_column_query %}
select distinct
    json.key as column_name
    
from {{ model_name }}
,lateral flatten(input=>{{ json_column }}) as json
{% endset %}

{% set results = run_query(json_column_query) %}

{% if execute %}
{% set result_list = results.columns[0].values() %}
{% else %}
{% set result_list =[] %}
{% endif %}

select
    {% for column_name in result_list %}
        {{ json_column }}:{{column_name}}::varchar as {{column_name}} {% if not loop.last %},{% endif %}
    {% endfor %}

from {{ model_name }}

{% endmacro %}