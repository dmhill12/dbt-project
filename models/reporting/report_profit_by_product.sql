select 
    PRODUCTID,
    PRODUCTNAME,
    CATEGORY,
    SUBCATEGORY,
    sum(ORDERPROFIT) as PROFIT
from {{ ref('stg_orders') }}
group by
    PRODUCTID,
    PRODUCTNAME,
    CATEGORY,
    SUBCATEGORY