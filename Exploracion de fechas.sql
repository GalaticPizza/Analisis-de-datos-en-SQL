-- Encontrar la fecha del primer y ultimo pedido
-- Funciones MIN MAX a su vez tambien para datos numericos pero tambien utiles en datos categoricos
-- Cuantos años de ventas tenemos disponibles

SELECT MIN(order_date) as fecha_primer_pedidO,
	   MAX(order_date) as fecha_ultimo_pedido,
	   -- DATEDIFF(year, MIN, MAX)
	   DATEDIFF(year,MIN(order_date),MAX(order_date)) as rango_de_años
	FROM gold.fact_sales 

-- Hallar al cliente mas joven y el cliente mas anciano

SELECT MIN(birthdate) AS mas_anciano,
	   DATEDIFF(year, MIN(birthdate), GETDATE()) as mayor_edad,
	   MAX(birthdate) as mas_joven,
	   DATEDIFF(year, MAX(birthdate), GETDATE()) as menor_edad,
	   DATEDIFF(year,MIN(birthdate),MAX(birthdate)) as rango_de_años
FROM gold.dim_customers