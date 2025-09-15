-- Drop tables if they exist
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sales_reps;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS regions;

-- Tabella regioni (nodo geografico)
CREATE TABLE regions (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Prodotti
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price REAL
);

-- Clienti
CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    industry TEXT,
    region_id INTEGER,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);

-- Venditori
CREATE TABLE sales_reps (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    region_id INTEGER,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);

-- Vendite (arco di collegamento tra cliente, prodotto, venditore)
CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    product_id INTEGER,
    customer_id INTEGER,
    sales_rep_id INTEGER,
    quantity INTEGER,
    total_amount REAL,
    sale_date TEXT,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(id)
);

-- Inserimento regioni
INSERT INTO regions (name) VALUES
('North America'),
('Europe'),
('Asia');

-- Prodotti
INSERT INTO products (name, category, price) VALUES
('AI Assistant Pro', 'Software', 299.00),
('AI Analytics Engine', 'Software', 999.00),
('SupportBot Basic', 'Software', 99.00);

-- Clienti
INSERT INTO customers (name, industry, region_id) VALUES
('Acme Corp', 'Retail', 1),
('Globex Inc.', 'Finance', 2),
('Initech', 'Technology', 3),
('Umbrella Co', 'Healthcare', 1);

-- Venditori
INSERT INTO sales_reps (name, region_id) VALUES
('Alice Johnson', 1),
('Bob Smith', 2),
('Charlie Kim', 3);

-- Vendite
INSERT INTO sales (product_id, customer_id, sales_rep_id, quantity, total_amount, sale_date) VALUES
(1, 1, 1, 5, 1495.00, '2025-05-10'),
(2, 2, 2, 2, 1998.00, '2025-05-15'),
(3, 3, 3, 10, 990.00, '2025-04-01'),
(1, 4, 1, 1, 299.00, '2025-05-20'),
(3, 1, 1, 3, 297.00, '2025-05-25');
