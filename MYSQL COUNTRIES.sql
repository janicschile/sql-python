Consultas
1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? 
Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente.
////////////////
select name, language, percentage from languages join countries ON country_id = countries.id 
where language = 'slovene'
ORDER BY percentage DESC;
////////////////


2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? 
Su consulta debe devolver el nombre del país y el número total de ciudades. 
Tu consulta debe organizar el resultado por el número de ciudades en orden descendente.
////////////////
select countries.name , count(*) from cities join countries ON country_id = countries.id
GROUP BY countries.name
ORDER BY count(*) DESC;
////////////////


3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
Tu consulta debe organizar el resultado por población en orden descendente.
////////////////
select countries.name, cities.name, cities.population from cities join countries ON country_id = countries.id 
WHERE countries.name = 'mexico' and cities.population > 500000
ORDER BY cities.population DESC;
////////////////



4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
////////////////
select name as pais, language, percentage from languages join countries ON country_id = countries.id
WHERE percentage > 89
ORDER BY percentage DESC;
////////////////



5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? 
////////////////
SELECT name, surface_area, population from countries
WHERE surface_area < 501 and population > 100000
ORDER BY population DESC;
////////////////



6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y 
una esperanza de vida superior a 75 años? (1)
////////////////
select government_form, capital, life_expectancy from countries
WHERE government_form = 'Constitutional Monarchy' and capital > 200 and life_expectancy > 75
ORDER BY name ASC;
////////////////




7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una 
población superior a 500,000? 
La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.
////////////////
select countries.name, cities.name, cities.district, cities.population from cities join countries ON country_id = countries.id 
WHERE countries.name = 'argentina' and district = 'Buenos Aires' and cities.population > 500000
////////////////




8. ¿Qué consulta harías para resumir el número de países en cada región? 
La consulta debe mostrar el nombre de la región y el número de países. 
Además, la consulta debe organizar el resultado por el número de países en orden descendente.
////////////////
select region, count(*) as Paises from countries
GROUP BY region
ORDER BY count(*) DESC;
////////////////
