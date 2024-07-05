{{
    config(materialized = 'incremental',
    unique_key ='empno',
    incremental_strategy='merge' ,
    merge_exclude_column=['etl_create_dt','etl_update_dt'],
    merge_update_column=['etl_update_dt','salary','phone'])
}}
select empno,
ename,
salary,
phone,
last_modified_date,
current_timestamp() etl_create_dt,
current_timestamp()   etl_update_dt,
 current_user()   etl_updated_by
 from {{ source("src_hr","tb_emp")}}