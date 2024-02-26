{% macro grant_select(role) %}
{% set sql %}
    grant usage on schema gg_dbt_raw.DBT_GGALEGO to role {{role}};
    grant select on all tables in schema gg_dbt_raw.DBT_GGALEGO to role {{role}};
    grant select on all views in schema gg_dbt_raw.DBT_GGALEGO to role {{role}};
{% endset %}
{% do run_query(sql) %}
{% do log("Privileges granted", info=True) %}
{% endmacro %}