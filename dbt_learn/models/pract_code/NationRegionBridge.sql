{{ config ( schema = 'retail')}}


select n.n_name, r.r_name
from {{source("src_retail_schema","tb_nation")}} n
join {{source("src_retail_schema","tb_region")}} r 
on n.n_regionkey= r.r_regionkey