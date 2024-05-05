with orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payments as (

    select * from {{ ref('stg_jaffle_shop__payments') }}

),

order_payments as (
    select
        orders.order_id,
        sum(case when orders.status = 'completed' then payments.amount end) as amount

    from orders 
    
    left join payments using(order_id)
    group by 1
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final