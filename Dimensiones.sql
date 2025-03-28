-- Exploracion de las dimensiones en la base de datos
-- Explorar todos los paises de donde provienen nuestros clientes 

SELECT DISTINCT country FROM gold.dim_customers

-- Explorar todas las categorias 'las de mayor division'
SELECT DISTINCT category, subcategory, product_name from gold.dim_products
order by 1,2,3