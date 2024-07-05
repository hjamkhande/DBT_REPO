{{ config (schema = "retail",
            materialized = "view" )}}

select cn.cust_name custname,
en.country country ,
en.total_mktsgment totalmaktsegment
from {{ref("custNationBridge")}} cn join
{{ref("ephemeralSample")}} en on 
cn.n_name = en.country