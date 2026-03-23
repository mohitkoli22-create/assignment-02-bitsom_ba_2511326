## Anomaly Analysis

1. Insert Anomaly
columns involved - product_id, product_name, category, unit_price
If we want to insert a new product, we cannot do so unless we also create an order (order_id) and assign a customer. This forces insertion of irrelevant or fake data, which is an insert anomaly.

2. Update Anomaly
Columns involved - customer_id, customer_name, customer_email, customer_city
If the customer’s email or city changes, it must be updated in all rows. Missing even one row results in inconsistent data, which is an update anomaly.

3. Delete Anomaly
columns involved - product_id, product_name
Deleting a single order may also remove the only record of a product or sales representative if they appear only once. This leads to unintended data loss — a delete anomaly.


## Normalization Justification

Keeping all data in a single table may seem simpler initially, but it leads to serious data integrity issues.In the given dataset, customer information such as customer_id, customer_name, and customer_email is repeated across multiple rowsIf their email changes, it must be updated in every row. Missing even one update results in inconsistent data, demonstrating a clear update anomaly.
Similarly, product details are tightly coupled with order data. This makes it impossible to insert a new product without creating a corresponding order, leading to insert anomalies.
Normalization to Third Normal Form (3NF) eliminates these issues by separating data into logical tables.
Therefore, normalization is not over-engineering—it is essential for maintaining data integrity, scalability, and reliability in real-world database systems.