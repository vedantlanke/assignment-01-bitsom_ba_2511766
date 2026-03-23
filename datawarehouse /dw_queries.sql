-- Q1 Revenue by category per month

SELECT
    d.year,
    d.month_name,
    p.category,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY d.year, d.month, d.month_name, p.category
ORDER BY d.year, d.month;


-- Q2 Top 2 stores

SELECT
    s.store_name,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_store s ON f.store_key = s.store_key
GROUP BY s.store_name
ORDER BY revenue DESC
LIMIT 2;


-- Q3 Month-over-Month trend

SELECT
    d.year,
    d.month,
    SUM(f.total_amount) AS monthly_sales
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
