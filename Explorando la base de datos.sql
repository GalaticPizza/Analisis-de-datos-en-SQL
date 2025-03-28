-- Explorando la  base de datos en su conjunto

-- Explorar todos los objetos de la BD

SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Explorando todas las columnas en la BD
-- Si necesito informacion referente a una tabla en particular --> WHERE
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'dim_customers'