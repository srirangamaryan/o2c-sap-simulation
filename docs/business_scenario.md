# Business Scenario — TechNova Engineering Pvt. Ltd.

## Company Profile
| Field         | Detail                            |
|---------------|-----------------------------------|
| Company       | TechNova Engineering Pvt. Ltd.    |
| Industry      | Industrial Equipment Distribution |
| HQ            | Mumbai, India                     |
| Sales Org     | IN01 — India South Asia           |
| Distribution  | DI01 — Direct Sales               |
| Division      | 01 — Industrial Products          |

---

## Customers (5)
| ID   | Name                | City      | Credit Limit |
|------|---------------------|-----------|-------------|
| C001 | TechNova Solutions  | Mumbai    | ₹5,00,000   |
| C002 | Global Traders Ltd  | Delhi     | ₹3,00,000   |
| C003 | Sunrise Retail Co   | Bangalore | ₹2,00,000   |
| C004 | Apex Industries     | Chennai   | ₹4,50,000   |
| C005 | BlueWave Exports    | Pune      | ₹3,50,000   |

---

## Products / Materials (5)
| ID   | Description      | UoM | List Price |
|------|------------------|-----|------------|
| M001 | Industrial Pump  | EA  | ₹12,000    |
| M002 | Control Panel    | EA  | ₹8,500     |
| M003 | Pressure Valve   | EA  | ₹3,200     |
| M004 | Flow Sensor      | EA  | ₹4,750     |
| M005 | Steel Pipe 10m   | M   | ₹950       |

---

## Pricing Logic (Simplified)
- **Net Value** = Quantity × List Price
- No discounts, taxes, or surcharges applied (kept simple)
- All amounts in INR (₹)

---

## O2C Process Flow
```
Customer PO Received
      ↓
[1] Sales Order Created (VA01)
      ↓
[2] Delivery Document (VL01N)
      ↓
[3] Goods Issue Posted
      ↓
[4] Invoice / Billing Document (VF01)
      ↓
[5] Payment Received (F-28)
      ↓
Order Closed ✅
```
