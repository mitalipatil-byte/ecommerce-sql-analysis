-- 1. Revenue by Product Category
SELECT 
    p.category,
    COUNT(DISTINCT oi.order_id) as total_orders,
    SUM(oi.quantity) as total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) as total_revenue,
    ROUND(AVG(oi.quantity * oi.unit_price), 2) as avg_order_value
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 2. Top 5 Best Selling Products
SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) as total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) as total_revenue,
    ROUND(SUM(oi.quantity * (oi.unit_price - p.cost)), 2) as total_profit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 5;

-- 3. Monthly Sales Trends
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') as month,
    COUNT(DISTINCT o.order_id) as total_orders,
    COUNT(DISTINCT o.customer_id) as unique_customers,
    ROUND(SUM(o.total_amount), 2) as total_revenue,
    ROUND(AVG(o.total_amount), 2) as avg_order_value
FROM orders o
WHERE o.status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- 4. Customer Analysis - RFM (Recency, Frequency, Monetary)
WITH customer_metrics AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) as customer_name,
        DATEDIFF(CURDATE(), MAX(o.order_date)) as recency_days,
        COUNT(DISTINCT o.order_id) as frequency,
        ROUND(SUM(o.total_amount), 2) as monetary_value,
        ROUND(AVG(o.total_amount), 2) as avg_order_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_name,
    recency_days,
    frequency,
    monetary_value,
    avg_order_value,
    CASE 
        WHEN frequency >= 3 AND monetary_value >= 500 THEN 'High Value'
        WHEN frequency >= 2 OR monetary_value >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END as customer_segment
FROM customer_metrics
ORDER BY monetary_value DESC;

-- 5. Product Performance Metrics
SELECT 
    p.product_name,
    p.category,
    p.price,
    p.cost,
    ROUND(((p.price - p.cost) / p.price) * 100, 2) as profit_margin_percent,
    COALESCE(SUM(oi.quantity), 0) as total_units_sold,
    COALESCE(ROUND(SUM(oi.quantity * oi.unit_price), 2), 0) as total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category, p.price, p.cost
ORDER BY total_revenue DESC;