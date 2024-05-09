select 
    CUSTOMERID,
    SEGMENT,
    COUNTRY,
    sum(ORDERPROFIT) as PROFIT
from {{ ref('stg_orders') }}
group by
    CUSTOMERID,
    SEGMENT,
    COUNTRY