
CREATE TABLE ecommerce_db.public.customers (
   customer_id TEXT PRIMARY KEY,
   customer_unique_id TEXT,
   customer_zip_code_prefix TEXT,
   customer_city TEXT,
   customer_state TEXT
);
CREATE TABLE ecommerce_db.public.orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
	CONSTRAINT fk_customers FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),
	order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date TIMESTAMP
);
CREATE TABLE ecommerce_db.public.products (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
	product_photos_qty NUMERIC(2),
	product_weight_g NUMERIC(5),
	product_length_cm NUMERIC(3),
	product_height_cm NUMERIC(3),
	product_width_cm NUMERIC(3)
);
CREATE TABLE ecommerce_db.public.sellers (
   seller_id TEXT PRIMARY KEY,
   seller_zip_code_prefix TEXT,
   seller_city TEXT,
   seller_state TEXT
);
CREATE TABLE ecommerce_db.public.order_items (
    order_item_id TEXT,
    order_id TEXT,
	CONSTRAINT fk_orders FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    product_id TEXT,
	CONSTRAINT fk_products FOREIGN KEY (product_id)
    REFERENCES products(product_id),
	seller_id TEXT,
	CONSTRAINT fk_sellers FOREIGN KEY (seller_id)
    REFERENCES sellers(seller_id),
	shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);
CREATE TABLE ecommerce_db.public.payments (
    order_id TEXT,
	CONSTRAINT fk_orders FOREIGN KEY (order_id)
	REFERENCES orders(order_id),
	payment_sequential NUMERIC(2),
    payment_type TEXT,
	payment_installments NUMERIC(2),
    payment_value NUMERIC(10)
);
