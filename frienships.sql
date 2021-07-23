use amigos;

/* PRINCIPAL: escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos. */
/* //////////////// */
SELECT users.first_name as first_name, users.last_name as last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users as user2 ON friendships.friend_id = user2.id;
/* //////////////// */

/* 1.- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados. */
/* //////////////// */
SELECT users.first_name as first_name, users.last_name as last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users as user2 ON friendships.friend_id = user2.id
WHERE user2.first_name = 'Kermit';
/* //////////////// */


/* 2.- Devuelve el recuento de todas las amistades. */
/* //////////////// */
select count(*) as total_amistades from (
SELECT users.first_name as first_name, users.last_name as last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users as user2 ON friendships.friend_id = user2.id
) as total;
/* //////////////// */



/* 3.- Descubre quién tiene más amigos y devuelve el recuento de sus amigos. */
/* //////////////// */
SELECT CONCAT(users.first_name, ' ' , users.last_name) as nombre, count(*) as total_amigos  FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users as user2 ON friendships.friend_id = user2.id
GROUP BY nombre
ORDER BY count(*) DESC;
/* //////////////// */


/* 4.- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark. */
/* //////////////// */

/* //////////////// */



/* 5.- Devuelve a los amigos de Eli en orden alfabético. */
/* //////////////// */

/* //////////////// */



/* 6.- Eliminar a Marky Mark de los amigos de Eli. */
/* //////////////// */

/* //////////////// */



/* 7.- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos */
/* //////////////// */

/* //////////////// */