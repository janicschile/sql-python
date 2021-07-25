USE lead_Gen_Business;


/* 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012? */
/* /////////////// */
SELECT amount AS montos_totales, charged_datetime AS fecha FROM billing
WHERE charged_datetime >= '2012-03-01 00:00:00' AND charged_datetime <= '2012-03-31 23:59:59';
/* /////////////// */

/* 2. ¿Qué consulta ejecutaría para obtener los ingresos totales 
recaudados del cliente con una identificación de 2? */
/* /////////////// */
SELECT
    clients.client_id,
    CONCAT(clients.first_name, ' ', clients.last_name) AS client_name,
    amount AS montos_totales,
    charged_datetime AS fecha
FROM
    billing
    JOIN clients ON clients.client_id = billing.client_id
WHERE
    clients.client_id = 2;
/* /////////////// */

/* 3. ¿Qué consulta ejecutaría para obtener todos los sitios que 
posee client = 10? */
/* /////////////// */
SELECT
    clients.client_id,
    CONCAT(clients.first_name, ' ', clients.last_name) AS client_name,
    clients.email,
    sites.domain_name,
    CONCAT(leads.first_name,' ', leads.last_name) AS administrador,
    leads.registered_datetime as fecha_registro,
    leads.email
FROM
    leads
    JOIN sites ON leads.site_id = sites.site_id
    JOIN clients ON sites.client_id = clients.client_id
WHERE
    clients.client_id = 10;
/* /////////////// */



/* 4. ¿Qué consulta ejecutaría para obtener el número total de sitios 
creados por mes por año para el cliente con una identificación de 1? 
¿Qué pasa con el cliente = 20? */
select * FROM sites;
select * FROM leads;
select * FROM clients;

SELECT 
    EXTRACT(YEAR FROM charged_datetime) AS 'Año',
    EXTRACT(MONTH FROM charged_datetime) AS 'Mes'
FROM billing
JOIN clients ON billing.client_id = clients.client_id
JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 20;
WHERE charged_datetime >= '2012-03-01%' AND charged_datetime <= '2012-03-31%';


SELECT * FROM billing
    JOIN clients ON billing.client_id = clients.client_id
    JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 1;

SELECT * EXTRACT(MONTH FROM "2010-06-15 09:34:21");
select * FROM leads;

AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
SELECT YEAR(charged_datetime) as año, MONTH(charged_datetime) as mes ,COUNT(*) as total_dominios
FROM billing
JOIN clients ON billing.client_id = clients.client_id
JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 1
GROUP BY YEAR(charged_datetime), MONTH(charged_datetime);



/* SELECT * FROM sites WHERE cliens.client_id = 1

 YEAR(created_datetime) = 2011 AND MONTH(created_datetime) = %m;

/* 5. ¿Qué consulta ejecutaría para obtener el número total de clientes 
potenciales generados para cada uno de los sitios entre 
el 1 de enero de 2011 y el 15 de febrero de 2011?

6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes 
y el número total de clientes potenciales que hemos generado 
para cada uno de nuestros clientes entre 
el 1 de enero de 2011 y el 31 de diciembre de 2011?

7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes 
y el número total de clientes potenciales que hemos generado para 
cada cliente cada mes entre los meses 1 y 6 del año 2011?

8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes 
y el número total de clientes potenciales que hemos generado para 
cada uno de los sitios de nuestros clientes entre 
el 1 de enero de 2011 y el 31 de diciembre de 2011? 
Solicite esta consulta por ID de cliente. 
Presente una segunda consulta que muestre todos los clientes, 
los nombres del sitio y el número total de clientes potenciales generados 
en cada sitio en todo momento.

9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.

10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)