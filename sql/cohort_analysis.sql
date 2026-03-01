WITH cohort AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(order_purchase_timestamp)) AS cohort_month
    FROM orders
    GROUP BY customer_id
),

order_month AS (
    SELECT 
        o.customer_id,
        DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month
    FROM orders o
)

SELECT 
    c.cohort_month,
    o.order_month,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM cohort c
JOIN order_month o ON c.customer_id = o.customer_id
GROUP BY c.cohort_month, o.order_month
ORDER BY c.cohort_month;