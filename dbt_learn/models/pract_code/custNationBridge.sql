{{ config( schema = 'retail' )}}
select c.c_custkey cust_id , c.c_name cust_name , n.n_name
from {{ source("src_retail_schema","tb_cust") }} c 
join {{ source("src_retail_schema","tb_nation") }} n
on c.c_nationkey = n.n_nationkey
