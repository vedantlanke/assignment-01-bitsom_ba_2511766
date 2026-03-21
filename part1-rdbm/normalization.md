## Anomaly Analysis
Insert Anomaly:
A new product such as "Tablet" cannot be inserted into the system unless an order record is created. 
This is because product information exists only within order rows (e.g., columns product_id, product_name).

Update Anomaly:
Customer "Priya Sharma" appears in multiple rows such as ORD1027 and ORD1002.
If her city changes from Delhi to Gurgaon, multiple rows must be updated, creating risk of inconsistent data.

Delete Anomaly:
If order ORD1027 (Notebook purchase) is deleted and this is the only occurrence of product P004,
then all information about the Notebook product will be lost from the database.

#### Normalization Justification
Keeping all data in a single flat table may appear simple initially, but it creates significant data integrity and maintenance issues. In the provided dataset, customer information such as customer_city and customer_email is repeated across multiple order rows. For example, the same customer appears in several orders. If the customer relocates to a new city, updating this information would require modifying multiple rows, which increases the risk of inconsistent or outdated data. This demonstrates an update anomaly.

Similarly, product details like product_name and unit_price are also duplicated across orders. If a new product needs to be added to the system before any order is placed, it cannot be inserted without creating a dummy order record. This is an example of an insert anomaly. Additionally, deleting the only order related to a specific product would remove all product information from the database, causing a delete anomaly.

Normalization to Third Normal Form separates customers, products, orders, and sales representatives into distinct tables. This reduces redundancy, improves data consistency, and ensures referential integrity using primary and foreign keys. Although normalization introduces more tables and joins, it significantly improves scalability, maintainability, and data accuracy. Therefore, normalization is not over-engineering but a necessary design approach for reliable transactional systems.
