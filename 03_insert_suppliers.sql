USE procurement_db;
## INSERTING SUPPLIERS
INSERT INTO suppliers
(supplier_id, supplier_name, city, email)
VALUES
(1, 'Tech Solutions Pvt Ltd', 'Pune', 'tech@example.com'),
(2, 'Global Office Supplies', 'Mumbai', 'global@example.com'),
(3, 'Apex Electronics', 'Bangalore', 'apex@example.com'),
(4, 'Reliable Logistics', 'Hyderabad', 'reliable@example.com'),
(5, 'Prime Industrial Goods', 'Chennai', 'prime@example.com'),
(6, 'Metro Components', 'Pune', 'metro@example.com'),
(7, 'Smart IT Services', 'Mumbai', 'smart@example.com'),
(8, 'Universal Traders', 'Delhi', 'universal@example.com'),
(9, 'Elite Manufacturing', 'Nashik', 'elite@example.com'),
(10, 'NextGen Systems', 'Bangalore', 'nextgen@example.com');

## INSERTING PURCHASE ORDERS
INSERT INTO purchase_orders
(po_id, supplier_id, order_date, amount)
VALUES
(101, 1, '2025-01-05', 25000.00),
(102, 2, '2025-01-08', 18000.00),
(103, 3, '2025-01-12', 45000.00),
(104, 4, '2025-01-15', 12000.00),
(105, 5, '2025-01-18', 32000.00),
(106, 1, '2025-02-02', 15000.00),
(107, 6, '2025-02-05', 28000.00),
(108, 7, '2025-02-10', 22000.00),
(109, 8, '2025-02-14', 19000.00),
(110, 9, '2025-02-18', 55000.00),
(111, 10, '2025-03-01', 40000.00),
(112, 2, '2025-03-05', 17000.00),
(113, 3, '2025-03-10', 36000.00),
(114, 5, '2025-03-15', 29000.00),
(115, 1, '2025-03-20', 21000.00);

SELECT * FROM purchase_orders;

## INSERTING PURCHASE ORDER ITEMS

INSERT INTO po_items
(item_id, po_id, item_name, quantity, unit_price)
VALUES
(1, 101, 'Laptop', 5, 4000.00),
(2, 101, 'Wireless Mouse', 10, 500.00),

(3, 102, 'Office Chair', 10, 1200.00),
(4, 102, 'Keyboard', 10, 600.00),

(5, 103, 'Desktop Computer', 5, 9000.00),
(6, 103, 'Monitor', 5, 3000.00),

(7, 104, 'Printer Paper', 20, 300.00),
(8, 104, 'Printer Ink', 10, 600.00),

(9, 105, 'Industrial Motor', 2, 10000.00),
(10, 105, 'Motor Belt', 4, 3000.00),

(11, 106, 'Laptop Bag', 10, 500.00),
(12, 106, 'USB Hub', 10, 1000.00),

(13, 107, 'Networking Switch', 4, 4000.00),
(14, 107, 'Ethernet Cable', 20, 600.00),

(15, 108, 'External Hard Drive', 5, 2000.00),
(16, 108, 'Pen Drive', 10, 1200.00),

(17, 109, 'Office Desk', 5, 3000.00),
(18, 109, 'Desk Lamp', 10, 400.00),

(19, 110, 'Industrial Generator', 1, 40000.00),
(20, 110, 'Generator Parts', 5, 3000.00),

(21, 111, 'Server Rack', 2, 12000.00),
(22, 111, 'Cooling Fan', 8, 2000.00),

(23, 112, 'Office Printer', 2, 5000.00),
(24, 112, 'Toner Cartridge', 5, 1400.00),

(25, 113, 'Graphics Card', 4, 6000.00),
(26, 113, 'RAM Module', 5, 2400.00),

(27, 114, 'Safety Helmet', 10, 1000.00),
(28, 114, 'Safety Gloves', 20, 500.00),

(29, 115, 'SSD Drive', 5, 3000.00),
(30, 115, 'Power Supply', 5, 1200.00);

SELECT COUNT(*) AS total_items
FROM po_items;