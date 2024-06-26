with raw as (
select * from {{source("Snowflake Source",'raw_orders')}}
),   

final as(
    select ID AS ORDER_ID,
    USER_ID as CUSTOMER_ID,
    ORDER_DATE,
    STATUS
    from raw

)

select * from final