1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
///////////////////

select first_name, last_name, email, address from customer join address ON address.address_id = customer.customer_id
WHERE city_id = 312;

///////////////////


2. ¿Qué consulta harías para obtener todas las películas de comedia? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales y el género (categoría).
///////////////////

select film.film_id, title, description, release_year, rating, special_features, category.name from film
join film_category ON film.film_id = film_category.film_id
join category ON film_category.category_id = category.category_id
where category.name = 'comedy';

///////////////////




3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, 
la descripción y el año de lanzamiento.
///////////////////

select actor.actor_id, CONCAT(first_name,' ', last_name) as actor_name, film.film_id, film.title, film.description, film.release_year from actor
join film_actor ON  film_actor.actor_id = actor.actor_id
join film ON film_actor.film_id = film.film_id 
where actor.actor_id = 5;

///////////////////



4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
///////////////////

select * from customer
join address ON customer.address_id = address.address_id 
where store_id = 1 and address.city_id in (1,42,312,459);

///////////////////



5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y 
"característica especial = detrás de escena", unidas por actor_id = 15? 
Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
///////////////////

select film.title, film.description, film.release_year, rating, special_features from actor
join film_actor ON  film_actor.actor_id = actor.actor_id
join film ON film_actor.film_id = film.film_id 
where rating = 'g' and actor.actor_id = 15 and special_features like '%behind the scenes%';

///////////////////




6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
Su consulta debe devolver film_id, title, actor_id y actor_name.
///////////////////

select film.film_id, film.title, actor.actor_id, CONCAT(first_name ,' ', last_name) as actor_name from actor
join film_actor ON  film_actor.actor_id = actor.actor_id
join film ON film_actor.film_id = film.film_id
where film.film_id = 369;

///////////////////



7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales y el género (categoría).
///////////////////

select film.film_id, film.title, film.description, film.release_year, film.rating, special_features, category.name as genero, rental_rate from film
join film_category ON film.film_id = film_category.film_id
join category ON film_category.category_id = category.category_id
where category.name = 'drama' and film.rental_rate = 2.99;

///////////////////



8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales, el género (categoría) y el nombre y apellido del actor.
///////////////////

select * from actor
join film_actor ON  film_actor.actor_id = actor.actor_id
join film ON film_actor.film_id = film.film_id
join film_category ON film.film_id = film_category.film_id
join category ON film_category.category_id = category.category_id
where actor.first_name = 'sandra' and actor.last_name = 'kilmer' and category.name = 'action';

///////////////////

