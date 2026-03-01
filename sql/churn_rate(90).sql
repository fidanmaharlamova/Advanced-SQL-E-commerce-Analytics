WITH last_orders AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS last_order_date
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)

SELECT
    COUNT(*) FILTER (WHERE last_order_date < NOW() - INTERVAL '90 days')::float 
    / COUNT(*) * 100 AS churn_rate_percentage
FROM last_orders;
