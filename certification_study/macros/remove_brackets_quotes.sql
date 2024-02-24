{% macro remove_brackets_quotes(field) %}
    REGEXP_REPLACE(
      REGEXP_REPLACE({{field}}, '\[', '', 1),
      '\]', '', 1
    ) AS {{field}}
{% endmacro %}