# 🏭 SAP SD — Order-to-Cash (O2C) Simulation
> Capstone Project | SAP Data & Analytics Engineering (C_BCBDC)

---

## 📌 Project Overview
Simulates a complete **Order-to-Cash (O2C)** business cycle for **TechNova Engineering Pvt. Ltd.** — an industrial equipment distributor.  
Built entirely with **SQLite + Python**, this project covers Sales Order → Delivery → Billing → Payment.

---

## 🏗️ Architecture
```
SQLite DB (o2c.db)
  └── Tables: customers → sales_orders → deliveries → invoices → payments
Python Script (run_o2c.py)
  └── Creates DB → Loads Data → Runs KPI Queries → Prints Results
```

---

## 📁 Folder Structure
```
o2c-sap-sd/
├── data/
│   ├── raw/              ← Source CSV files (optional)
│   └── processed/        ← o2c.db (auto-generated)
├── scripts/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_o2c_flow.sql
│   ├── 04_kpi_queries.sql
│   └── run_o2c.py
├── docs/                 ← Business scenario & data design
└── README.md
```

---

## ▶️ Steps to Run
```bash
# 1. Clone the repo
git clone https://github.com/srirangamaryan/o2c-sap-simulation.git
cd o2c-sap-sd

# 2. Run the Python script
python scripts/run_o2c.py
```
No pip installs needed — only built-in `sqlite3`.

---

## 📊 KPIs Covered
| # | KPI | Description |
|---|-----|-------------|
| 1 | Total Revenue | Sum of all invoiced amounts |
| 2 | Pending Payments | Outstanding invoice balances |
| 3 | O2C Cycle Time | Days from Sales Order to Payment |

---


## 👤 Author
Aryan Srirangam | 23053033 | SAP Analytics Engineering Capstone | 2026
