# 📘 Data Dictionary – Retail Business Insights (SQL)

This document describes the structure of all tables used in the Retail Business Insights SQL project.

---

## 🟦 customers

| Column       | Type     | Description                     |
|--------------|----------|---------------------------------|
| customer_id  | INT      | Unique ID of the customer       |
| country      | VARCHAR  | Country where the customer lives|

---

## 🟩 products

| Column       | Type        | Description                     |
|--------------|-------------|---------------------------------|
| product_id   | VARCHAR     | Unique ID of the product        |
| product_name | VARCHAR     | Name/description of product     |
| price        | DECIMAL     | Unit price of the product       |

---

## 🟧 orders

| Column       | Type        | Description                          |
|--------------|-------------|--------------------------------------|
| order_id     | VARCHAR     | Unique ID of each order              |
| customer_id  | INT         | Customer who placed the order        |
| order_date   | DATETIME    | The date & time the order was placed |

---

## 🟥 order_details

| Column          | Type     | Description                           |
|------------------|----------|---------------------------------------|
| order_detail_id  | INT      | Unique line-item ID                   |
| order_id         | VARCHAR  | Order this line item belongs to       |
| product_id       | VARCHAR  | Product included in the order         |
| quantity         | INT      | Number of units ordered               |

---

This data dictionary helps understand your database structure, relationships, and business entities.
