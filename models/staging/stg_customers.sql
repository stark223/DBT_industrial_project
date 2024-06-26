with raw as (
select * from {{source("Snowflake Source","raw_customers")}}
),   

final as(
    select ID AS Customer_ID,
    FIRST_NAME,
    LAST_NAME
    from raw

)

select * from final
