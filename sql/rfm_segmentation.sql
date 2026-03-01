WITH rfm AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS last_order_date,
        COUNT(o.order_id) AS frequency,
        SUM(p.payment_value) AS monetary
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
),

rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY last_order_date DESC) AS recency_score,
        NTILE(5) OVER (ORDER BY frequency DESC) AS frequency_score,
        NTILE(5) OVER (ORDER BY monetary DESC) AS monetary_score
    FROM rfm
)

SELECT *,
    CASE
        WHEN recency_score >=4 AND frequency_score >=4 THEN 'VIP'
        WHEN recency_score >=3 AND frequency_score >=3 THEN 'Loyal'
        ELSE 'At Risk'
    END AS segment
FROM rfm_scores;
