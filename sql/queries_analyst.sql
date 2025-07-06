-- total sales per week

SELECT 
    DATE_TRUNC('week', date) AS week_start,
    SUM(price) AS total_sales
FROM 
    sales_data
GROUP BY 
    DATE_TRUNC('week', date)
ORDER BY 
    week_start;

-- margin keuntungan per produk
SELECT 
    p.category,
    SUM(sd.price - (p.cost_price * sd.quantity)) AS total_margin
FROM 
    sales_data sd
JOIN 
    products p ON sd.product_id = p.product_id
GROUP BY 
    p.category
ORDER BY 
    total_margin DESC;


--segmentasi pelanggan berdasarkan pendapatan

SELECT 
    income_level,
    COUNT(*) AS total_customers
FROM 
    customers
GROUP BY 
    income_level
ORDER BY 
    total_customers DESC;


-- ranking top 10 best product 
SELECT 
    p.product_id,
    p.name,
    SUM(sd.quantity) AS total_sold
FROM 
    sales_data sd
JOIN 
    products p ON sd.product_id = p.product_id
GROUP BY 
    p.product_id, p.name
ORDER BY 
    total_sold DESC
LIMIT 10;

-- ranking 10 wors product
SELECT 
    p.product_id,
    p.name,
    SUM(sd.quantity) AS total_sold
FROM 
    sales_data sd
JOIN 
    products p ON sd.product_id = p.product_id
GROUP BY 
    p.product_id, p.name
ORDER BY 
    total_sold ASC
LIMIT 10;


-- rata rata penjualan per-produk
SELECT 
    product_id,
    AVG(price) AS avg_sales
FROM 
    sales_data
GROUP BY 
    product_id
ORDER BY 
    avg_sales DESC;

-- total penjualan per store
SELECT 
    s.store_id,
    s.name,
    SUM(sd.price) AS total_sales
FROM 
    sales_data sd
JOIN 
    stores s ON sd.store_id = s.store_id
GROUP BY 
    s.store_id, s.name
ORDER BY 
    total_sales DESC;

-- penjualan produk per-kategori
SELECT 
    p.category,
    COUNT(DISTINCT sd.product_id) AS total_products,
    SUM(sd.price) AS total_sales
FROM 
    sales_data sd
JOIN 
    products p ON sd.product_id = p.product_id
GROUP BY 
    p.category
ORDER BY 
    total_sales DESC;

-- kontribusi penjualan per region
SELECT 
    s.region,
    SUM(sd.price) AS total_sales
FROM 
    sales_data sd
JOIN 
    stores s ON sd.store_id = s.store_id
GROUP BY 
    s.region
ORDER BY 
    total_sales DESC;

--produk terlaris per kategori
SELECT category, product_id, total_qty
FROM (
    SELECT 
        p.category,
        sd.product_id,
        SUM(sd.quantity) AS total_qty,
        RANK() OVER (PARTITION BY p.category ORDER BY SUM(sd.quantity) DESC) AS rank_in_category
    FROM 
        sales_data sd
    JOIN 
        products p ON sd.product_id = p.product_id
    GROUP BY 
        p.category, sd.product_id
) ranked
WHERE rank_in_category = 1;

--jumlah transaksi di atas rata-rata
SELECT *
FROM sales_data
WHERE price > (
    SELECT AVG(price) FROM sales_data
);



