-- câu 1
select o.user_id, count(*) as total_orders
from Orders o
group by o.user_id
having count(*) >= 3


-- câu 2
SELECT p.id, p.name, SUM(o.amount) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.id, p.name
ORDER BY total_sales DESC
LIMIT 5;
-- để tối ưu ta sử dụng Tạo index trên orders.product_id để tăng tốc độ JOIN


-- câu 3
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, AVG(amount) AS avg_order_amount
FROM orders
WHERE YEAR(order_date) = 2023
GROUP BY year, month
ORDER BY year, month;
-- để tối ưu Tạo chỉ mục trên cột order_date và amount để tăng tốc lọc và tính toán.



-- câu 4
WITH category_count AS (
    SELECT COUNT(DISTINCT category) AS total_categories
    FROM products
),
user_category AS (
    SELECT o.user_id, COUNT(DISTINCT p.category) AS user_category_count
    FROM orders o
    JOIN products p ON o.product_id = p.id
    GROUP BY o.user_id
)
SELECT uc.user_id
FROM user_category uc
JOIN category_count cc ON uc.user_category_count = cc.total_categories;
-- tối ưu tạo index trên orders.product_id, orders.user_id, products.id, products.category



