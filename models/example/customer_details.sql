{{ config(materialized='table') }}
SELECT
  a.id AS id,
  first_name,
  last_name,
  user_id,
  order_date,
  b.status,
  orderid,
  paymentmethod,
  amount,
  created
FROM
  `dbt-tutorial.jaffle_shop.customers` a
JOIN
  `dbt-tutorial.jaffle_shop.orders` b
ON
  a.id = b.id
JOIN
  `dbt-tutorial.stripe.payment` c
ON
  b.id = c.id;