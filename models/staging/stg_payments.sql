with raw as (
select * from {{source("Snowflake Source",'raw_payments')}}
),   

final as(
    select ID AS PAYMENT_ID,
    ORDER_ID,
    PAYMENT_METHOD AS PAYMENT_MODE,
    AMOUNT/100 AS AMOUNT
    from raw

)

select * from final