USE olist_etl;
GO

-- 1) Total Sales per Product Category
SELECT
    p.product_category_name,
    SUM(f.total_price) AS total_sales
FROM dbo.fact_order_items AS f
JOIN dbo.dim_products   AS p
  ON f.product_id = p.product_id
GROUP BY p.product_category_name;
GO

-- 2) Average Delivery Time per Seller
SELECT
    s.seller_id,
    AVG(f.delivery_time) AS avg_delivery_time
FROM dbo.fact_order_items AS f
JOIN dbo.dim_sellers    AS s
  ON f.seller_id = s.seller_id
GROUP BY s.seller_id;
GO

-- 3) Number of Orders per State
SELECT
    c.state,
    COUNT(DISTINCT f.order_id) AS order_count
FROM dbo.fact_order_items AS f
JOIN dbo.dim_customers   AS c
  ON f.customer_id = c.customer_id
GROUP BY c.state;
GO
