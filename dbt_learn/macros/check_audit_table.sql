{% macro check_audit_table(in_db_name,in_schema_name,in_table_name) %}


{% set checkTableQuery %}
select 1 from 
{{in_db_name}}.information_schema.tables
where table_schema='{{in_schema_name}}' and
table_name= '{{in_table_name}}'
{% endset %}

{{ log(checkTableQuery , info=true) }}

{% set get_table_flag = dbt_utils.get_single_value(checkTableQuery) %}

{{ log(get_table_flag , info=true) }}

{% if get_table_flag != 1 %}

{% set tableCreation %}
create table {{in_db_name}}.{{in_schema_name}}.{{in_table_name}}
(jobname varchar(100),
start_ts timestamp,
end_ts timestamp,
status varchar(20)); 
{% endset %}

{% do run_query(tableCreation) %}
{{ log('table created using ' + tableCreation  , info=true) }}
{% endif%}


{% endmacro %}