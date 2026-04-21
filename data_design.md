# Data Design — O2C Schema

## Entity Relationship (Simplified)
```
customers ──< sales_orders ──< deliveries ──< invoices ──< payments
              materials ──<┘
```

## Table Schemas

### customers
| Column       | Type | Notes              |
|--------------|------|--------------------|
| customer_id  | TEXT | PK, e.g. C001      |
| customer_name| TEXT |                    |
| city         | TEXT |                    |
| country      | TEXT |                    |
| credit_limit | REAL | Max exposure limit |

### materials
| Column      | Type | Notes              |
|-------------|------|--------------------|
| material_id | TEXT | PK, e.g. M001      |
| description | TEXT |                    |
| unit        | TEXT | EA, M, KG          |
| list_price  | REAL | Base selling price |

### sales_orders
| Column      | Type    | Notes                        |
|-------------|---------|------------------------------|
| order_id    | TEXT    | PK, e.g. SO1001              |
| customer_id | TEXT    | FK → customers               |
| material_id | TEXT    | FK → materials               |
| quantity    | INTEGER |                              |
| order_date  | TEXT    | YYYY-MM-DD                   |
| net_value   | REAL    | qty × list_price             |
| status      | TEXT    | OPEN/DELIVERED/BILLED/CLOSED |

### deliveries
| Column        | Type    | Notes                       |
|---------------|---------|-----------------------------|
| delivery_id   | TEXT    | PK, e.g. DL2001             |
| order_id      | TEXT    | FK → sales_orders           |
| delivery_date | TEXT    | YYYY-MM-DD                  |
| quantity      | INTEGER |                             |
| status        | TEXT    | PENDING/SHIPPED/DELIVERED   |

### invoices
| Column       | Type | Notes                   |
|--------------|------|-------------------------|
| invoice_id   | TEXT | PK, e.g. INV3001        |
| delivery_id  | TEXT | FK → deliveries         |
| invoice_date | TEXT | YYYY-MM-DD              |
| amount       | REAL |                         |
| status       | TEXT | RAISED / SENT / DUE     |

### payments
| Column       | Type | Notes                   |
|--------------|------|-------------------------|
| payment_id   | TEXT | PK, e.g. PAY4001        |
| invoice_id   | TEXT | FK → invoices           |
| payment_date | TEXT | YYYY-MM-DD (NULL if due)|
| amount_paid  | REAL |                         |
| status       | TEXT | PARTIAL / COMPLETE      |
