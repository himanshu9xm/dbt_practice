{{ config(materialized="view") }}

select user_id, orderid, status, amount, created
from {{ ref("customer_details") }}
