-- Insert Customers (Run this block)
INSERT INTO customers (first_name, last_name, email, registration_date, city, state, country) VALUES
('John', 'Doe', 'john.doe@email.com', '2022-01-15', 'New York', 'NY', 'USA'),
('Jane', 'Smith', 'jane.smith@email.com', '2022-02-20', 'Los Angeles', 'CA', 'USA'),
('Mike', 'Johnson', 'mike.j@email.com', '2022-03-10', 'Chicago', 'IL', 'USA'),
('Sarah', 'Wilson', 'sarah.w@email.com', '2022-04-05', 'Houston', 'TX', 'USA'),
('David', 'Brown', 'david.b@email.com', '2022-05-12', 'Phoenix', 'AZ', 'USA'),
('Emily', 'Davis', 'emily.d@email.com', '2022-06-18', 'Philadelphia', 'PA', 'USA'),
('Chris', 'Miller', 'chris.m@email.com', '2022-07-22', 'San Antonio', 'TX', 'USA'),
('Lisa', 'Taylor', 'lisa.t@email.com', '2022-08-30', 'San Diego', 'CA', 'USA'),
('Mark', 'Anderson', 'mark.a@email.com', '2022-09-15', 'Dallas', 'TX', 'USA'),
('Amy', 'Thomas', 'amy.t@email.com', '2022-10-10', 'San Jose', 'CA', 'USA');

-- Insert Products (Run this block)
INSERT INTO products (product_name, category, subcategory, price, cost) VALUES
('iPhone 14', 'Electronics', 'Smartphones', 999.00, 600.00),
('Samsung Galaxy S23', 'Electronics', 'Smartphones', 899.00, 550.00),
('MacBook Pro', 'Electronics', 'Laptops', 1999.00, 1200.00),
('Dell XPS 13', 'Electronics', 'Laptops', 1299.00, 800.00),
('iPad Air', 'Electronics', 'Tablets', 599.00, 350.00),
('AirPods Pro', 'Electronics', 'Audio', 249.00, 150.00),
('Sony Headphones', 'Electronics', 'Audio', 199.00, 120.00),
('Nike Air Max', 'Fashion', 'Shoes', 129.99, 65.00),
('Adidas Hoodie', 'Fashion', 'Clothing', 79.99, 35.00),
('Levi Jeans', 'Fashion', 'Clothing', 89.99, 40.00),
('Coffee Maker', 'Home & Kitchen', 'Appliances', 199.99, 100.00),
('Blender', 'Home & Kitchen', 'Appliances', 149.99, 75.00),
('Bluetooth Speaker', 'Electronics', 'Audio', 89.99, 45.00);

-- Insert Orders (Run this block) 
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2023-01-15', 1128.99, 'Completed'),
(2, '2023-01-20', 899.00, 'Completed'),
(1, '2023-02-14', 209.98, 'Completed'),
(3, '2023-02-28', 1999.00, 'Completed'),
(4, '2023-03-15', 369.97, 'Completed'),
(5, '2023-03-20', 89.99, 'Completed'),
(2, '2023-04-10', 279.98, 'Completed'),
(6, '2023-04-25', 848.00, 'Completed'),
(7, '2023-05-12', 329.98, 'Completed'),
(8, '2023-05-28', 599.00, 'Completed'),
(9, '2023-06-15', 1548.00, 'Completed'),
(10, '2023-06-30', 219.98, 'Completed'),
(1, '2023-07-10', 448.00, 'Completed'),
(3, '2023-07-25', 279.98, 'Completed'),
(5, '2023-08-12', 1299.00, 'Completed');

-- Insert Order Items (Run this block)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.00), (1, 8, 1, 129.99),
(2, 2, 1, 899.00),
(3, 8, 1, 129.99), (3, 9, 1, 79.99),
(4, 3, 1, 1999.00),
(5, 8, 2, 129.99), (5, 11, 1, 199.99),
(6, 13, 1, 89.99),
(7, 11, 1, 199.99), (7, 9, 1, 79.99),
(8, 6, 2, 249.00), (8, 13, 1, 89.99), (8, 10, 3, 89.99),
(9, 7, 1, 199.00), (9, 9, 1, 79.99), (9, 12, 1, 149.99),
(10, 5, 1, 599.00),
(11, 3, 1, 1999.00), (11, 6, 1, 249.00), (11, 4, 1, 1299.00),
(12, 8, 1, 129.99), (12, 13, 1, 89.99),
(13, 6, 1, 249.00), (13, 7, 1, 199.00),
(14, 11, 1, 199.99), (14, 9, 1, 79.99),
(15, 4, 1, 1299.00);