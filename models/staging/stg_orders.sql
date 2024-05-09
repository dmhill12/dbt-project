select 
--from raw_orders
o.ORDERID,
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE,
o.ORDERCOSTPRICE - o.ORDERSELLINGPRICE as ORDERPROFIT,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE,
--from raw_customer
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
--from raw_product
p.CATEGORY,
p.PRODUCTNAME,
p.SUBCATEGORY
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.PRODUCTID = p.PRODUCTID