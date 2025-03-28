-- hallar el total de ventas
SELECT SUM(sales_amount) as ventas_totales FROM gold.fact_sales


-- hallar cuantos productos se han vendido
SELECT SUM(quantity) as total_productos_vendidos FROM gold.fact_sales


-- hallar el precio promedio de venta
SELECT AVG(price) as precio_medio_de_venta FROM gold.fact_sales

-- el numero total de ordenes
SELECT COUNT(order_number) as cantidad_de_pedidos FROM gold.fact_sales
	-- ahora quiero saber cuales NO SON duplicados
		SELECT COUNT(DISTINCT (order_number)) as cantidad_de_pedidos FROM gold.fact_sales


-- el numero total de productos en venta/ vendidos
SELECT COUNT(product_key) as total_productos FROM gold.dim_products
SELECT COUNT(DISTINCT product_key) as total_productos FROM gold.dim_products

-- hallar la cantidad de compradores/clientes
SELECT COUNT(customer_id) as total_clientes FROM gold.dim_customers


-- hallar el numero total de comprados que solicitaron una orden, ya que pueden haberse registrado pero no comprar nada

SELECT COUNT(DISTINCT customer_key) as total_clientes FROM gold.fact_sales

-- Generar un reporte que muestre todas las metricas primorodiales del negocio
-- avanzado

SELECT 'Total de las ventas' as nombre_de_medida ,SUM(sales_amount) as ventas_totales FROM gold.fact_sales
UNION ALL
SELECT 'Total de cantidades' ,SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Precio promedio de productos' ,AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total de ordenes de compra'  ,COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Cantidad de Productos', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total de compradores', COUNT(customer_key) FROM gold.dim_customers
