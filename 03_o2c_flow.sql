-- ============================================================
-- Script  : 03_o2c_flow.sql
-- Purpose : Simulate O2C process steps with SQL queries
-- ============================================================

-- ── STEP 1: Sales Order Created ──────────────────────────────
-- View all open/active Sales Orders
SELECT order_id, customer_id, material_id, quantity, order_date, net_value, status
FROM   sales_orders
ORDER  BY order_date;

-- ── STEP 2: Delivery Processing ──────────────────────────────
-- Match Sales Orders with their Delivery Documents
SELECT s.order_id, s.customer_id, d.delivery_id, d.delivery_date, d.status AS delivery_status
FROM   sales_orders s
JOIN   deliveries d ON s.order_id = d.order_id;

-- ── STEP 3: Billing / Invoice Raised ─────────────────────────
-- Match Deliveries with Invoices
SELECT d.delivery_id, d.order_id, i.invoice_id, i.invoice_date, i.amount, i.status AS invoice_status
FROM   deliveries d
JOIN   invoices i ON d.delivery_id = i.delivery_id;

-- ── STEP 4: Payment Received ─────────────────────────────────
-- Match Invoices with Payments
SELECT i.invoice_id, i.amount AS invoice_amount, p.payment_id, p.payment_date,
       p.amount_paid, p.status AS payment_status
FROM   invoices i
JOIN   payments p ON i.invoice_id = p.invoice_id;

-- ── FULL O2C PIPELINE VIEW (Single Query) ────────────────────
SELECT
    s.order_id,
    s.customer_id,
    s.order_date,
    d.delivery_date,
    i.invoice_date,
    p.payment_date,
    s.net_value,
    p.amount_paid,
    s.status AS order_status
FROM   sales_orders s
JOIN   deliveries d ON s.order_id   = d.order_id
JOIN   invoices   i ON d.delivery_id = i.delivery_id
JOIN   payments   p ON i.invoice_id  = p.invoice_id;
