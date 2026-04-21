"""
============================================================
Script  : run_o2c.py
Purpose : Connect to SQLite DB, run O2C queries, print results
Project : SAP SD - Order-to-Cash Simulation
============================================================
"""

import sqlite3
import os

DB_PATH = os.path.join(os.path.dirname(__file__), '..', 'data', 'processed', 'o2c.db')

def run_sql_file(conn, filepath):
    """Execute all statements in a .sql file."""
    with open(filepath, 'r') as f:
        sql = f.read()
    conn.executescript(sql)
    conn.commit()

def query(conn, sql, title=""):
    """Run a SELECT and print results."""
    print(f"\n{'='*55}")
    print(f"  {title}")
    print('='*55)
    cur = conn.execute(sql)
    cols = [d[0] for d in cur.description]
    print(" | ".join(cols))
    print("-" * 55)
    for row in cur.fetchall():
        print(" | ".join(str(v) for v in row))


def main():
    # ── Setup DB ──────────────────────────────────────────────
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    print(f"[OK] Connected → {DB_PATH}")

    # ── Load schema & data ────────────────────────────────────
    base = os.path.join(os.path.dirname(__file__))
    run_sql_file(conn, os.path.join(base, '01_create_tables.sql'))
    run_sql_file(conn, os.path.join(base, '02_insert_data.sql'))
    print("[OK] Tables created and data loaded.")

    # ── KPI 1: Total Revenue ──────────────────────────────────
    query(conn,
        "SELECT ROUND(SUM(amount),2) AS total_revenue_INR FROM invoices;",
        "KPI 1 — Total Revenue (INR)")

    # ── KPI 2: Pending Payments ───────────────────────────────
    query(conn, """
        SELECT i.invoice_id,
               i.amount AS invoice_amount,
               COALESCE(p.amount_paid,0) AS paid,
               i.amount - COALESCE(p.amount_paid,0) AS outstanding
        FROM invoices i
        LEFT JOIN payments p ON i.invoice_id = p.invoice_id
        WHERE i.amount > COALESCE(p.amount_paid,0);
    """, "KPI 2 — Pending / Outstanding Payments")

    # ── KPI 3: O2C Cycle Time ─────────────────────────────────
    query(conn, """
        SELECT s.order_id, s.order_date, p.payment_date,
               CAST((JULIANDAY(p.payment_date) - JULIANDAY(s.order_date)) AS INTEGER)
               AS cycle_days
        FROM   sales_orders s
        JOIN   deliveries d ON s.order_id    = d.order_id
        JOIN   invoices   i ON d.delivery_id = i.delivery_id
        JOIN   payments   p ON i.invoice_id  = p.invoice_id
        WHERE  p.payment_date IS NOT NULL;
    """, "KPI 3 — Order-to-Cash Cycle Time (Days)")

    conn.close()
    print("\n[DONE] All queries executed successfully.")

if __name__ == "__main__":
    main()
