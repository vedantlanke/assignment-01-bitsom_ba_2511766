Decision 1 — Date Format Harmonization

Problem: The dataset contained multiple date formats such as “29/08/2023”, “12-12-2023”, and “2023-02-05”, which would break time-based aggregation queries.
Resolution: All dates were transformed into ISO standard format (YYYY-MM-DD). A surrogate integer date_key (YYYYMMDD) was generated to improve join performance and enable efficient star schema design.

Decision 2 — Category Standardization

Problem: Product categories appeared in inconsistent casing such as “electronics”, “Electronics”, and “Groceries”. This would lead to fragmented grouping in BI reports.
Resolution: Categories were normalized into standardized title-case values (Electronics, Grocery, Clothing) during transformation before loading into the dimension table.

Decision 3 — Derived Sales Measure Creation

Problem: The raw dataset provided only units_sold and unit_price, but analytical reporting requires total revenue measures.
Resolution: A new metric total_amount was derived during ETL using the formula units_sold × unit_price. This numeric measure was stored in the fact table to support fast aggregation queries and dashboard reporting.
