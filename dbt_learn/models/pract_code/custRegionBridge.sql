{{ config(schema = 'retail')}}

select c.cust_name, r.r_name
from {{ref("NationRegionBridge")}} r 
join {{ref("custNationBridge")}} c   
on r.n_name= c.n_name