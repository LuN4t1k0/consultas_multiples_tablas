-- Author : Cristian Venegas 
-- Desafio N3 Consultas multi tablas 

--crear Base de datos 
CREATE DATABASE desafio3_Cristian_Venegas_245;

--Crear tabla usuarios
CREATE TABLE usuarios (id SERIAL, nombre VARCHAR(50),apellido VARCHAR(50), email VARCHAR, rol VARCHAR);

--carga de datos tabla usuario
insert into usuarios (nombre, apellido, email, rol) values ('Sabrina', 'Arlet', 'sarlet0@youtu.be', 'Administrador');
insert into usuarios (nombre, apellido, email, rol) values ('Kassie', 'Gabbitas', 'kgabbitas1@nps.gov', 'Usuario');
insert into usuarios (nombre, apellido, email, rol) values ('Joeann', 'Widdicombe', 'jwiddicombe2@examiner.com', 'Usuario');
insert into usuarios (nombre, apellido, email, rol) values ('Deerdre', 'La Rosa', 'dlarosa3@samsung.com', 'Usuario');
insert into usuarios (nombre, apellido, email, rol) values ('Monica', 'Dearnley', 'mdearnley4@vk.com', 'Usuario');

--crear tabla post 

CREATE TABLE post (id SERIAL, titulo VARCHAR, contenido TEXT, fecha_creacion TIMESTAMP, fecha_actualizacion TIMESTAMP, destacado BOOLEAN, usuario_id BIGINT);

--carga datos tabla post
insert into post (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('Fast Food Nation', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2022-04-28', '03/13/2022', true, 1);
insert into post (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('Boris and Natasha', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2022-10-15', '04/01/2022', true, 1);
insert into post (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('Legend of Leigh Bowery, The', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2022-10-25', '10/31/2022', false, 3);
insert into post (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('Phantom of Liberty, The (Fantôme de la liberté, Le)', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2022-10-21', '07/13/2022', false, 3);
insert into post (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado) values ('Bandits (Bandidos)', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2022-03-23', '10/15/2022', false);

-- crear tabla comentarios
CREATE TABLE comentarios (id SERIAL, contenido TEXT, fecha_creacion TIMESTAMP, usuario_id BIGINT, post_id BIGINT)

-- carga datos tabla comentarios
insert into comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2022-06-29', 1, 1);
insert into comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2022-11-02', 2, 1);
insert into comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2022-03-23', 3, 1);
insert into comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('In congue. Etiam justo. Etiam pretium iaculis justo.', '2022-04-03', 1, 2);
insert into comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-11-20', 2, 2);

-- 2. Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas. nombre e email del usuario junto al título y contenido del post.

SELECT u.nombre, u.email, p.titulo, p.contenido FROM usuarios AS u JOIN post AS p ON u.id = p.usuario_id;

-- 3. Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id y debe ser seleccionado dinámicamente.

SELECT u.id, p.titulo, p.contenido FROM post AS p JOIN usuarios AS u ON p.usuario_id = u.id WHERE u.rol = 'Administrador';

-- 4. Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario.


