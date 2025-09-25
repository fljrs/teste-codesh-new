-- Consulta 1: Listar todos os clientes que NÃO tenham realizado compras:

SELECT c.customer_id, c.first_name, c.last_name
FROM custormer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Consulta 2: Listar os produtos que NÃO tenham sido comprados:

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.item_id IS NULL;

-- Consulta 3: Listar os produtos SEM estoque:

SELECT product_id, product_name, quantity
FROM products
WHERE quantity = 0;

-- Consulta 4: AGRUPAR a quantidade de vendas de UMA determinada marca por loja:

SELECT s.store_name, b.brand_name, SUM(oi.quantity) AS total_sales
FROM order_items oi 
JOIN products p ON oi.products_id = p.products_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
WHERE b.brand_name = 'Example' -- Adicione a marca
GROUP BY s.store_name, b.brand_name
ORDER BY s.store_name, b.brand_name;

-- Consulta 5: LISTAR os funcionarios que NÃO estejam relacionados a um pedido.

SELECT s.staff_id, s.first_name, s.last_name
FROM staff s 
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.order_id IS NULL;






	