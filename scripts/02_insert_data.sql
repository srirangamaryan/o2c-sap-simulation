-- ============================================================
-- Script  : 02_insert_data.sql
-- Purpose : Load sample master & transactional data
-- ============================================================

-- CUSTOMERS (5 rows)
INSERT INTO customers VALUES ('C001','TechNova Solutions','Mumbai','India',500000);
INSERT INTO customers VALUES ('C002','Global Traders Ltd','Delhi','India',300000);
INSERT INTO customers VALUES ('C003','Sunrise Retail Co','Bangalore','India',200000);
INSERT INTO customers VALUES ('C004','Apex Industries','Chennai','India',450000);
INSERT INTO customers VALUES ('C005','BlueWave Exports','Pune','India',350000);

-- MATERIALS (5 rows)
INSERT INTO materials VALUES ('M001','Industrial Pump',  'EA', 12000.00);
INSERT INTO materials VALUES ('M002','Control Panel',    'EA',  8500.00);
INSERT INTO materials VALUES ('M003','Pressure Valve',   'EA',  3200.00);
INSERT INTO materials VALUES ('M004','Flow Sensor',      'EA',  4750.00);
INSERT INTO materials VALUES ('M005','Steel Pipe 10m',   'M',    950.00);

-- SALES ORDERS (5 rows)
INSERT INTO sales_orders VALUES ('SO1001','C001','M001', 5,'2024-01-05', 60000.00,'CLOSED');
INSERT INTO sales_orders VALUES ('SO1002','C002','M003',10,'2024-01-10', 32000.00,'CLOSED');
INSERT INTO sales_orders VALUES ('SO1003','C003','M002', 3,'2024-01-15', 25500.00,'BILLED');
INSERT INTO sales_orders VALUES ('SO1004','C004','M004', 8,'2024-01-20', 38000.00,'DELIVERED');
INSERT INTO sales_orders VALUES ('SO1005','C005','M005',20,'2024-01-25', 19000.00,'OPEN');

-- DELIVERIES (5 rows)
INSERT INTO deliveries VALUES ('DL2001','SO1001','2024-01-08', 5,'DELIVERED');
INSERT INTO deliveries VALUES ('DL2002','SO1002','2024-01-13',10,'DELIVERED');
INSERT INTO deliveries VALUES ('DL2003','SO1003','2024-01-18', 3,'DELIVERED');
INSERT INTO deliveries VALUES ('DL2004','SO1004','2024-01-23', 8,'SHIPPED');
INSERT INTO deliveries VALUES ('DL2005','SO1005','2024-01-30',20,'PENDING');

-- INVOICES (5 rows)
INSERT INTO invoices VALUES ('INV3001','DL2001','2024-01-09', 60000.00,'DUE');
INSERT INTO invoices VALUES ('INV3002','DL2002','2024-01-14', 32000.00,'DUE');
INSERT INTO invoices VALUES ('INV3003','DL2003','2024-01-19', 25500.00,'SENT');
INSERT INTO invoices VALUES ('INV3004','DL2004','2024-01-24', 38000.00,'RAISED');
INSERT INTO invoices VALUES ('INV3005','DL2005','2024-01-31', 19000.00,'RAISED');

-- PAYMENTS (5 rows)
INSERT INTO payments VALUES ('PAY4001','INV3001','2024-01-20', 60000.00,'COMPLETE');
INSERT INTO payments VALUES ('PAY4002','INV3002','2024-01-25', 32000.00,'COMPLETE');
INSERT INTO payments VALUES ('PAY4003','INV3003','2024-02-01', 15000.00,'PARTIAL');
INSERT INTO payments VALUES ('PAY4004','INV3004',NULL,          0.00,'PARTIAL');
INSERT INTO payments VALUES ('PAY4005','INV3005',NULL,          0.00,'PARTIAL');
