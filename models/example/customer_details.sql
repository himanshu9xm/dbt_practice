-- {{ config(materialized='table') }}
SELECT
  a.id AS id,
  first_name,
  last_name,
  user_id,
  order_date,
  b.status as status,
  orderid,
  paymentmethod,
  amount,
  current_timestamp() AS created
FROM
  `dbt-tutorial.jaffle_shop.customers` a
LEFT JOIN
  `dbt-tutorial.jaffle_shop.orders` b
ON
  a.id = b.id
LEFT JOIN
  `dbt-tutorial.stripe.payment` c
ON
  b.id = c.id