{% macro getjobstat(in_result) %}

{% if execute %}

{% for res in in_result %}
{{ log(res.node.unique_id|string,info=true) }}
{{ log(res.timing[1].started_at|string,info=true) }}
{{ log(res.timing[1].completed_at|string,info=true) }}
{{ log(res.status|string,info=true) }}
{{ log(res.message|string,info=true) }}
{{ log(res.compiled_code|string,info=true ) }}
{{ log(res.adapter_response.query_id|string,info=true ) }}

{% set exec_query %}

insert into DB_MONITOR.AUDIT.AUDIT_DBT_RUN
values(
'{{res.node.unique_id}}',
'{{res.timing[1].started_at}}',
'{{res.timing[1].completed_at}}',
'{{res.status}}',
'{{res.adapter_response.query_id}}',

'{{res.compiled_code}}'
)
{% endset %}

{{ log(exec_query|string,info=true ) }}


{% do run_query(exec_query) %}

{% endfor %}

{%endif%}
{% endmacro %}
