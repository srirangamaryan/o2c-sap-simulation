-- ============================================================
-- Project : Order-to-Cash (O2C) - SAP SD Simulation
-- Script  : 01_create_tables.sql
-- Author  : Capstone Project
-- DB      : SQLite
-- ============================================================

-- CUSTOMERS
CREATE TABLE IF NOT EXISTS customers (
    customer_id   TEXT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city          TEXT,
    country       TEXT,
    credit_limit  REAL
);

-- MATERIALS (Products)
CREATE TABLE IF NOT EXISTS materials (
    material_id   TEXT PRIMARY KEY,
    description   TEXT NOT NULL,
    unit          TEXT,
    list_price    REAL
);

-- SALES ORDERS
CREATE TABLE IF NOT EXISTS sales_orders (
    order_id      TEXT PRIMARY KEY,
    customer_id   TEXT,
    material_id   TEXT,
    quantity      INTEGER,
    order_date    TEXT,
    net_value     REAL,
    status        TEXT,   -- OPEN / DELIVERED / BILLED / CLOSED
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (material_id) REFERENCES materials(material_id)
);

-- DELIVERIES
CREATE TABLE IF NOT EXISTS deliveries (
    delivery_id   TEXT PRIMARY KEY,
    order_id      TEXT,
    delivery_date TEXT,
    quantity      INTEGER,
    status        TEXT,   -- PENDING / SHIPPED / DELIVERED
    FOREIGN KEY (order_id) REFERENCES sales_orders(order_id)
);

-- INVOICES (Billing Documents)
CREATE TABLE IF NOT EXISTS invoices (
    invoice_id    TEXT PRIMARY KEY,
    delivery_id   TEXT,
    invoice_date  TEXT,
    amount        REAL,
    status        TEXT,   -- RAISED / SENT / DUE
    FOREIGN KEY (delivery_id) REFERENCES deliveries(delivery_id)
);

-- PAYMENTS
CREATE TABLE IF NOT EXISTS payments (
    payment_id    TEXT PRIMARY KEY,
    invoice_id    TEXT,
    payment_date  TEXT,
    amount_paid   REAL,
    status        TEXT,   -- PARTIAL / COMPLETE
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);
