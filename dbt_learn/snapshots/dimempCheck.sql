{% snapshot dimempCheck %}
{{    config (
        target_database = 'dwh',
        target_schema = 'asis',
        unique_key = 'empno',
        strategy = 'check',
        check_cols = ['ename','salary','phone']
    )
}}
select empno,
ename,
salary,
phone from
{{ source("src_hr","tb_emp") }}
{% endsnapshot %}