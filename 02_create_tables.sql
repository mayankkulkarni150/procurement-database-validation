USE procurement_db;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE purchase_orders (
    po_id INT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    amount DECIMAL(12,2),

    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id)
);

CREATE TABLE po_items (
    item_id INT PRIMARY KEY,
    po_id INT,
    item_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (po_id)
    REFERENCES purchase_orders(po_id)
);

SELECT DATABASE();
USE procurement_db;

SHOW TABLES;
DESCRIBE suppliers;
DESCRIBE purchase_orders;
DESCRIBE po_items;

DESCRIBE suppliers;
DESCRIBE purchase_orders;
