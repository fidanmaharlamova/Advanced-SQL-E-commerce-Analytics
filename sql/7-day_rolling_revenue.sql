WITH daily_revenue AS (
    SELECT 
        DATE(o.order_purchase_timestamp) AS order_date,
        SUM(p.payment_value) AS revenue
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY DATE(o.order_purchase_timestamp)
)

SELECT
    order_date,
    revenue,
    SUM(revenue) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7_day_revenue
FROM daily_revenue;
