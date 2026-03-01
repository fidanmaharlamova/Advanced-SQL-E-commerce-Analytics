COPY public.customers 
FROM 'C:\Users\Public\olist_customers_dataset.csv' 
WITH (FORMAT CSV, HEADER);

COPY public.orders
FROM 'C:\Users\Public\olist_orders_dataset.csv' 
WITH (FORMAT CSV, HEADER);

COPY public.products 
FROM 'C:\Users\Public\olist_products_dataset.csv' 
WITH (FORMAT CSV, HEADER);

COPY public.payments
FROM 'C:\Users\Public\olist_order_payments_dataset.csv' 
WITH (FORMAT CSV, HEADER);

COPY public.sellers 
FROM 'C:\Users\Public\olist_sellers_dataset.csv' 
WITH (FORMAT CSV, HEADER);

COPY public.order_items 
FROM 'C:\Users\Public\olist_order_items_dataset.csv' 
WITH (FORMAT CSV, HEADER);
