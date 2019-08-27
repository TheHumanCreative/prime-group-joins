Tasks
1. Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id; 

2. Get all orders and their line items (orders, quantity and product).

SELECT * FROM "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id;

3. Which warehouses have cheetos?

SELECT "warehouse".id, "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "product_id" = 5;

4. Which warehouses have diet pepsi?

SELECT "warehouse".id, "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "product_id" =6;

5. Get the number of orders for each customer.

SELECT "customers".first_name, "customers".last_name, count("orders".address_id) as "Order-Count" 
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".id;

NOTE:
It is OK
if those without orders are not included in results.
6. How many customers do we have?

SELECT count("customers") as "Customer Count"
FROM "customers";

7. How many products do we carry?

SELECT count("products") as "Product Total"
FROM "products";

8. What is the total available on-hand quantity of diet pepsi?

SELECT sum("warehouse_product".on_hand)
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "warehouse_product".product_id = 6;

## Stretch
9. How much was the total cost for each order?
10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL
(research coalesce).
