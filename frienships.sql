
USE amigos;

/* PRINCIPAL: escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos. */
/* //////////////// */

SELECT users.first_name AS first_name, users.last_name AS last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id;
/* //////////////// */

/* 1.- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados. */
/* //////////////// */
SELECT users.first_name AS first_name, users.last_name AS last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id
WHERE user2.first_name = 'Kermit';
/* //////////////// */


/* 2.- Devuelve el recuento de todas las amistades. */
/* //////////////// */
SELECT count(*) AS total_amistades FROM (
SELECT users.first_name AS first_name, users.last_name AS last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS user2 ON friendships.friend_id = user2.id
) AS total;
/* //////////////// */



/* 3.- Descubre quién tiene más amigos y devuelve el recuento de sus amigos. */
/* //////////////// */
SELECT CONCAT(users.first_name, ' ' , users.last_name) AS nombre, count(*) AS total_amigos FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id
GROUP BY nombre
ORDER BY count(*) DESC;
/* //////////////// */


/* 4.- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark. */
/* //////////////// */
SET
    @idEli = (SELECT id FROM users WHERE first_name = 'eli'),  
    @idKermit = (SELECT id FROM users WHERE first_name = 'kermit'), 
    @idMarky = (SELECT id FROM users WHERE first_name = 'marky'),
    @newID = (SELECT MAX(id)+1 FROM users);
INSERT INTO users (id, first_name, last_name, created_at) VALUES (@newID, 'Francisco', 'Boiser', NOW());
INSERT INTO friendships (user_id, friend_id, created_at) VALUES (@idEli, @newID, NOW());
INSERT INTO friendships (user_id, friend_id, created_at) VALUES (@idKermit, @newID, NOW());
INSERT INTO friendships (user_id, friend_id, created_at) VALUES (@idMarky, @newID, NOW());
/* //////////////// */

/* CONSULTA USUARIOS Y AMIGOS */
SELECT users.first_name AS first_name, users.last_name AS last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id;




/* 5.- Devuelve a los amigos de Eli en orden alfabético. */
/* //////////////// */
SELECT user2.first_name AS friend_first_name, user2.last_name AS friend_last_name FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id
WHERE users.first_name = 'eli'
ORDER BY friend_first_name ASC;
/* //////////////// */



/* 6.- Eliminar a Marky Mark de los amigos de Eli. */
/* //////////////// */
SET
    @idEli = (SELECT id FROM users WHERE first_name = 'eli'),
    @idMarky = (SELECT id FROM users WHERE first_name = 'marky');

DELETE FROM friendships 
WHERE friendships.user_id = @idEli and friend_id = @idMarky;
/* //////////////// */

/* DEVOLVER AMIGO A ELI */
INSERT INTO friendships (user_id, friend_id, created_at) VALUES (@idEli, @idMarky, NOW());
/* AGREGAR REGISTRO ELIMINADO A ELI */




/* 7.- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos */
/* //////////////// */
SELECT CONCAT(users.first_name, ' ', users.last_name) AS principal, CONCAT(user2.first_name, ' ', user2.last_name) AS amigo FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id 
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id;
/* //////////////// */