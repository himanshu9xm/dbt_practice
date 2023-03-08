{{ config(materialized="view") }}

select user_id, orderid, status, amount, create_ts
from {{ ref("customer_details") }}
