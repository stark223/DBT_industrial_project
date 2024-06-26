with customers as(
    SELECT * FROM {{ref('stg_customers')}}
),
orders as(
    SELECT * FROM {{ref('stg_orders')}}
),
payments as(
    SELECT * FROM {{ref('stg_payments')}}
),

customer_level_details as (
    SELECT 
    c.Customer_ID,
    min(o.ORDER_DATE) as first_order,
    max(o.ORDER_DATE) as most_recent_order
    from customers c
    left join orders o
    on c.Customer_ID = o.Customer_ID
    group by c.Customer_ID,c.FIRST_NAME,c.LAST_NAME
     
),

payments_details as(
    select 
    o.Customer_ID,
    sum(p.SALES_AMOUNT) as AMOUNT  
    from payments p
    left join orders o
    on p.ORDER_ID=o.ORDER_ID
    group by o.Customer_ID
),

final as(
    select cl.*,pd.* from customer_level_details cl
    left join payments_details pd
    on cl.Customer_ID=pd.Customer_ID
)

select * from final

