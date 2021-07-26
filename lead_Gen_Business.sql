SET lc_time_names = 'es_ES';  /* <---- Lenguaje español MYSQL */
USE lead_Gen_Business;

/* 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012? */
/* /////////////// */
SELECT
    MONTHNAME(charged_datetime) AS fecha,
    SUM(amount) AS montos_totales
FROM
    billing
WHERE
    charged_datetime BETWEEN '2012-03-01 00:00:00' AND '2012-03-31 23:59:59'
GROUP BY fecha;
  /* /////////////// */

/* 2. ¿Qué consulta ejecutaría para obtener los ingresos totales 
recaudados del cliente con una identificación de 2? */
/* /////////////// */
SELECT
    clients.client_id,
    SUM(amount) AS monto_total
FROM
    billing
    JOIN clients ON clients.client_id = billing.client_id
WHERE
    clients.client_id = 2
GROUP BY clients.client_id;
/* /////////////// */

/* 3. ¿Qué consulta ejecutaría para obtener todos los sitios que 
posee client = 10? */
/* /////////////// */
SELECT
    sites.domain_name,
    clients.client_id
FROM
    leads
    JOIN sites ON leads.site_id = sites.site_id
    JOIN clients ON sites.client_id = clients.client_id
WHERE
    clients.client_id = 10
GROUP BY sites.domain_name;
/* /////////////// */



/* 4. ¿Qué consulta ejecutaría para obtener el número total de sitios 
creados por mes por año para el cliente con una identificación de 1? 
¿Qué pasa con el cliente = 20? */
/* /////////////// */
/* Cliente 20, tiene 1 dominio) */
SELECT
    clients.client_id,
    COUNT(domain_name) as cantidad_sitios_web,
    MONTHNAME(created_datetime) as mes,
    YEAR(created_datetime) as año
FROM clients
JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 1
GROUP BY clients.client_id, mes, año;
/* /////////////// */


/* 5. ¿Qué consulta ejecutaría para obtener el número total de clientes 
potenciales generados para cada uno de los sitios entre 
el 1 de enero de 2011 y el 15 de febrero de 2011? */
/* /////////////// */
select
    sites.domain_name AS dominios,
    COUNT(leads.leads_id) as clientes_potenciales,
    DATE_FORMAT(sites.created_datetime,'%d-%m-%Y') as fecha
FROM
    leads
    JOIN sites ON leads.site_id = sites.site_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY
    dominios, fecha;
/* /////////////// */



/* 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes 
y el número total de clientes potenciales que hemos generado 
para cada uno de nuestros clientes entre 
el 1 de enero de 2011 y el 31 de diciembre de 2011? */
/* /////////////// */
select
    CONCAT(clients.first_name, ' ', clients.last_name) AS cliente,
    COUNT(leads.leads_id) as clientes_potenciales
FROM
    leads
    JOIN sites ON leads.site_id = sites.site_id
    JOIN clients ON sites.client_id = clients.client_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY
    cliente;
/* /////////////// */

/* 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes 
y el número total de clientes potenciales que hemos generado para 
cada cliente cada mes entre los meses 1 y 6 del año 2011? */
/* /////////////// */
select
    CONCAT(clients.first_name, ' ', clients.last_name) AS cliente,
    MONTHNAME(leads.registered_datetime) as mes,
    COUNT(leads.leads_id) as clientes_potenciales
FROM
    leads
    JOIN sites ON leads.site_id = sites.site_id
    JOIN clients ON sites.client_id = clients.client_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-06-31'
GROUP BY
    cliente, leads.registered_datetime
ORDER BY
    leads.registered_datetime;
/* /////////////// */

/* 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes 
y el número total de clientes potenciales que hemos generado para 
cada uno de los sitios de nuestros clientes entre 
el 1 de enero de 2011 y el 31 de diciembre de 2011? 
Solicite esta consulta por ID de cliente. 
Presente una segunda consulta que muestre todos los clientes, 
los nombres del sitio y el número total de clientes potenciales generados 
en cada sitio en todo momento. */
/* /////////////// */
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS cliente,
    sites.domain_name as dominio,
    count(*) AS clientes_potenciales,
    DATE_FORMAT(sites.created_datetime,'%M %d, %Y') as fecha
FROM
    leads
    JOIN sites ON leads.site_id = sites.site_id
    JOIN clients ON sites.client_id = clients.client_id
WHERE
    registered_datetime BETWEEN '2011/01/01' AND '2011/12/31'
    AND clients.client_id = 1
GROUP BY
    sites.client_id,
    sites.site_id;
/* /////////////// */

/* /////////////// */
/* 2da consulta */
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS cliente,
    sites.domain_name AS dominio,
    COUNT(leads.leads_id) AS clientes_potenciales
FROM
    clients
    JOIN sites ON clients.client_id = sites.client_id
    JOIN leads ON sites.site_id = leads.site_id
GROUP BY
    cliente,
    dominio
ORDER BY clientes_potenciales DESC;
/* /////////////// */





/* 9. Escriba una sola consulta que recupere los ingresos totales recaudados 
de cada cliente para cada mes del año. Pídalo por ID de cliente. */
/* /////////////// */
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS cliente,
    SUM(amount) as total_recaudado,
    MONTHNAME(billing.charged_datetime) as mes,
    YEAR(billing.charged_datetime) as año
FROM
    clients
    JOIN billing ON clients.client_id = billing.client_id
WHERE
    clients.client_id = 1 
GROUP BY
    clients.client_id,
    billing.charged_datetime
ORDER BY
    billing.charged_datetime;
/* /////////////// */



/* 10. Escriba una sola consulta que recupere todos los sitios que 
posee cada cliente. Agrupe los resultados para que cada fila muestre 
un nuevo cliente. Se volverá más claro cuando agregue un nuevo 
campo llamado 'sitios' que tiene todos los sitios que posee el cliente. 
(SUGERENCIA: use GROUP_CONCAT) */
/* /////////////// */
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS cliente,
    GROUP_CONCAT(sites.domain_name SEPARATOR " / ") AS dominio

FROM
    clients
    JOIN sites ON clients.client_id = sites.client_id
    JOIN leads ON sites.site_id = leads.site_id
GROUP BY
    cliente;
ORDER BY clients.client_id DESC;
/* /////////////// */