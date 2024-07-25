{{
config ( database = 'hooks',
        schema = 'stg' ,
        materialized  = 'table' , 
        transient = False ,
        pre_hook =" insert into 
        hooks.audit.dbt_run_sudit(modelname,start_ts,status)
        values ('stgemp',current_timestamp(), 'Started' )",
        post_hook = "update  hooks.audit.dbt_run_sudit
        set  status = 'Completed' ,
         end_ts = current_timestamp()
         where modelname = 'stgemp' "
)
        

}}

select * from {{ source("src_hooks","tb_emp_hooks")}}