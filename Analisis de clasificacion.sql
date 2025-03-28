-- Cuales son los 5 productos que mayor ganacia generan?
-- funcion TOP luego del select
SELECT TOP 5
p.product_name as productos,
SUM(f.sales_amount) as Ingresos_totales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY Ingresos_totales DESC

-- cuales son las 5 mejores subcategorias
SELECT TOP 5
p.subcategory as subcategoria,
SUM(f.sales_amount) as Ingresos_totales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.subcategory	
ORDER BY Ingresos_totales DESC

-- ahora resolviendo por medio de una WINDOW FUNCTION

SELECT *
FROM(	
		SELECT
		p.product_name as producto,
		SUM(f.sales_amount) as Ingresos_totales,
		ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) as ranking_productos
		FROM gold.fact_sales f
		LEFT JOIN gold.dim_products p
		ON p.product_key = f.product_key
		GROUP BY p.product_name) t
WHERE ranking_productos <= 5
-- Cuales son los 5 productos que PEOR ganacia generan?

SELECT TOP 5
p.product_name as productos,
SUM(f.sales_amount) as Ingresos_totales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY Ingresos_totales


-- Hallar los 10 clientes con mayor generacion de pedidos y los 3 con menos cantidad de pedidos

SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) as gasto_total_cliente
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY
c.customer_key,
c.first_name,
c.last_name
ORDER BY gasto_total_cliente DESC

--
SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT order_number) as ordenes_totales
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY
c.customer_key,
c.first_name,
c.last_name
ORDER BY ordenes_totales
