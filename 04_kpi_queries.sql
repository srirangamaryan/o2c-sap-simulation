-- ============================================================
-- Script  : 04_kpi_queries.sql
-- Purpose : 3 Core KPIs for O2C Analytics
-- ============================================================

-- ── KPI 1: Total Revenue (Sum of all Invoice Amounts) ────────
SELECT
    ROUND(SUM(amount), 2)  AS total_revenue_INR
FROM invoices;

-- ── KPI 2: Pending Payments (Invoices not fully paid) ────────
SELECT
    i.invoice_id,
    i.amount                          AS invoice_amount,
    COALESCE(p.amount_paid, 0)        AS amount_paid,
    i.amount - COALESCE(p.amount_paid,0) AS outstanding_balance
FROM invoices i
LEFT JOIN payments p ON i.invoice_id = p.invoice_id
WHERE i.amount > COALESCE(p.amount_paid, 0);

-- ── KPI 3: Order-to-Cash Cycle Time (Days) ───────────────────
-- Cycle Time = Payment Date - Order Date
SELECT
    s.order_id,
    s.order_date,
    p.payment_date,
    CAST(
        (JULIANDAY(p.payment_date) - JULIANDAY(s.order_date))
    AS INTEGER) AS cycle_days
FROM   sales_orders s
JOIN   deliveries d ON s.order_id    = d.order_id
JOIN   invoices   i ON d.delivery_id = i.delivery_id
JOIN   payments   p ON i.invoice_id  = p.invoice_id
WHERE  p.payment_date IS NOT NULL;
