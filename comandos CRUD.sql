USE panel_de_usuarios;
INSERT INTO usuarios ( username, password, email, validar_email, nombre, apellido, descripcion, tipo_usuario, created_at) 
values ( 'oguerrero', '123456', 'oguerrerog@gmail.com', 'oguerrerog@gmail.com', 'Oscar', 'Guerrero', 'Administrador Web', '0', NOW());
SELECT * FROM usuarios WHERE id = 1;
UPDATE usuarios SET descripcion = 'Super Administrador Web', updated_at = NOW() WHERE id = 1;
DELETE FROM usuarios WHERE id = 1;