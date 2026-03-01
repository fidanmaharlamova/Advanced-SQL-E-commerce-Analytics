WITH product_revenue AS (
    SELECT
        pr.product_category_name,
        oi.product_id,
        SUM(p.payment_value) AS total_revenue
    FROM order_items oi
    JOIN products pr ON oi.product_id = pr.product_id
    JOIN payments p ON oi.order_id = p.order_id
    GROUP BY pr.product_category_name, oi.product_id
)

SELECT *,
    RANK() OVER (
        PARTITION BY product_category_name
        ORDER BY total_revenue DESC
    ) AS rank_in_category
FROM product_revenue;