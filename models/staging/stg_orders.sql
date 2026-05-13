with

source as (

    select * from {{ source('ecom', 'raw_orders') }}

),

renamed as (

    select

        ----------  ids
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        ---------- numerics
        subtotal as subtotal_cents,
        tax_paid as tax_paid_cents,
        order_total as order_total_cents,
        {{ cents_to_dollars('subtotal') }} as subtotal,
        {{ cents_to_dollars('tax_paid') }} as tax_paid,
        {{ cents_to_dollars('order_total') }} as order_total,

        ---------- timestamps
        {{ dbt.date_trunc('day','ordered_at') }} as ordered_at

    from source

)

select * from renamed
-- ci trigger 1778589183
-- ci trigger 1778589222
-- ci trigger 1778589365
-- ci trigger 1778589478
-- ci run 1778589580
-- snowflake run 1778589742
-- test 1778589812
-- final test 1778590203
-- unified deploy 1778590812
-- v2 pipeline 1778590981
-- pipeline test 1778598582
-- debug 1778598877
-- assign test 1778599289
-- e2e test 1778599527
-- demo 1778599729
-- timing test 1778601327
-- timestamps 1778601553
-- sla test 1778601968
-- timing v2 1778602014
-- v9 test
-- v10
-- v11 real files
-- v12 error logging
