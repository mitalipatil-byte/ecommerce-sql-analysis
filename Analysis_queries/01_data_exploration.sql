-- Quick verification
SELECT 'Customers' as table_name, COUNT(*) as record_count FROM customers
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Order_Items', COUNT(*) FROM order_items;

-- Revenue by Category
SELECT 
    p.category,
    COUNT(DISTINCT oi.order_id) as total_orders,
    SUM(oi.quantity) as total_units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) as total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Check for data quality issues
SELECT 
    COUNT(*) as total_orders,
    COUNT(CASE WHEN total_amount <= 0 THEN 1 END) as invalid_amounts,
    MIN(order_date) as earliest_order,
    MAX(order_date) as latest_order
FROM orders;