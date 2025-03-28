-- Exploracion de las magnitudes

-- Hallar el total de clientes por paises
-- REGLA primero la medida luego la dimension, esto es asi tanto para el agrupar y el ordenar
SELECT
country,
COUNT(customer_key) as total_compradores
FROM gold.dim_customers
group by country
order by total_compradores DESC

-- total de clientes por genero
SELECT
gender,
COUNT(customer_key) as total_compradores
FROM gold.dim_customers
group by gender
order by total_compradores DESC

-- total de productos por categoria
SELECT
category as categoria,
COUNT(product_name) as total_productos
FROM gold.dim_products
group by category
order by total_productos DESC
-- ==================================== -- 
SELECT
category as categoria,
COUNT(DISTINCT product_key) as total_productos
FROM gold.dim_products
group by category
order by total_productos DESC

-- DAN LO MISMO ambas consultas pero porque ambas columnas de producto son categoricas

-- cual es el costo medio en cada categoria

SELECT
category as categoria,
AVG(cost) as media_de_precio
FROM gold.dim_products
group by category
order by media_de_precio DESC

-- cual es el ingreso total (proviene del hecho) generado por cada categoria (dimension)
-- Join tables
-- La medida viene de la tabla de hechos y la dimension proviene de la tabla de productos

SELECT 
p.category as categorias,
SUM(f.sales_amount) as Ingresos_totales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY category
ORDER BY Ingresos_totales DESC

-- cual es el ingreso total generado por cada cliente

SELECT 
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

-- cual es la distribucion de items vendidos a traves de los paises, algo asi como el total por pais
SELECT 
c.country as pais,
SUM(f.quantity) as cantidad_total
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY cantidad_total DESC