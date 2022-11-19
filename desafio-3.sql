-- Author : Cristian VenegAS 
-- Desafio N3 ConsultAS multi tablAS 
--crear Base de datos 
CREATE DATABASE desafio3_Cristian_Venegas_245;

--Crear tabla usuarios
CREATE TABLE usuarios (
  id SERIAL,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  email VARCHAR,
  rol VARCHAR
);

--carga de datos tabla usuario
insert into
  usuarios (nombre, apellido, email, rol)
values
  (
    'Sabrina',
    'Arlet',
    'sarlet0@youtu.be',
    'Administrador'
  );

insert into
  usuarios (nombre, apellido, email, rol)
values
  (
    'Kassie',
    'Gabbitas',
    'kgabbitas1@nps.gov',
    'Usuario'
  );

insert into
  usuarios (nombre, apellido, email, rol)
values
  (
    'Joeann',
    'Widdicombe',
    'jwiddicombe2@examiner.com',
    'Usuario'
  );

insert into
  usuarios (nombre, apellido, email, rol)
values
  (
    'Deerdre',
    'La Rosa',
    'dlarosa3@samsung.com',
    'Usuario'
  );

insert into
  usuarios (nombre, apellido, email, rol)
values
  (
    'Monica',
    'Dearnley',
    'mdearnley4@vk.com',
    'Usuario'
  );

--crear tabla post 
CREATE TABLE post (
  id SERIAL,
  titulo VARCHAR,
  contenido TEXT,
  fecha_creacion TIMESTAMP,
  fecha_actualizacion TIMESTAMP,
  destacado BOOLEAN,
  usuario_id BIGINT
);

--carga datos tabla post
insert into
  post (
    titulo,
    contenido,
    fecha_creacion,
    fecha_actualizacion,
    destacado,
    usuario_id
  )
values
  (
    'Fast Food Nation',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',
    '2022-04-28',
    '03-13-2022',
    true,
    1
  );

insert into
  post (
    titulo,
    contenido,
    fecha_creacion,
    fecha_actualizacion,
    destacado,
    usuario_id
  )
values
  (
    'Boris and Natasha',
    'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',
    '2022-10-15',
    '04-01-2022',
    true,
    1
  );

insert into
  post (
    titulo,
    contenido,
    fecha_creacion,
    fecha_actualizacion,
    destacado,
    usuario_id
  )
values
  (
    'Legend of Leigh Bowery, The',
    'MaecenAS leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. CrAS pellentesque volutpat dui.',
    '2022-10-25',
    '10-31-2022',
    false,
    3
  );

insert into
  post (
    titulo,
    contenido,
    fecha_creacion,
    fecha_actualizacion,
    destacado,
    usuario_id
  )
values
  (
    'Phantom of Liberty, The (Fantôme de la liberté, Le)',
    'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',
    '2022-10-21',
    '07-13-2022',
    false,
    3
  );

insert into
  post (
    titulo,
    contenido,
    fecha_creacion,
    fecha_actualizacion,
    destacado
  )
values
  (
    'Bandits (Bandidos)',
    'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
    '2022-03-23',
    '10-15-2022',
    false
  );

-- crear tabla comentarios
CREATE TABLE comentarios (
  id SERIAL,
  contenido TEXT,
  fecha_creacion TIMESTAMP,
  usuario_id BIGINT,
  post_id BIGINT
) -- carga datos tabla comentarios
insert into
  comentarios (contenido, fecha_creacion, usuario_id, post_id)
values
  (
    'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',
    '2022-06-29',
    1,
    1
  );

insert into
  comentarios (contenido, fecha_creacion, usuario_id, post_id)
values
  (
    'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',
    '2022-11-02',
    2,
    1
  );

insert into
  comentarios (contenido, fecha_creacion, usuario_id, post_id)
values
  (
    'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
    '2022-03-23',
    3,
    1
  );

insert into
  comentarios (contenido, fecha_creacion, usuario_id, post_id)
values
  (
    'In congue. Etiam justo. Etiam pretium iaculis justo.',
    '2022-04-03',
    1,
    2
  );

insert into
  comentarios (contenido, fecha_creacion, usuario_id, post_id)
values
  (
    'Pellentesque at nulla. Suspendisse potenti. CrAS in purus eu magna vulputate luctus.',
    '2021-11-20',
    2,
    2
  );

-- 2. Cruza los datos de la tabla usuarios y posts mostrando lAS siguientes columnas. nombre e email del usuario junto al título y contenido del post.
SELECT
  u.nombre,
  u.email,
  p.titulo,
  p.contenido
FROM
  usuarios AS u
  JOIN post AS p ON u.id = p.usuario_id;

-- 3. Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id y debe ser seleccionado dinámicamente.
SELECT
  u.id,
  p.titulo,
  p.contenido
FROM
  post AS p
  JOIN usuarios AS u ON p.usuario_id = u.id
WHERE
  u.rol = 'Administrador';

-- 4. Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario.
SELECT
  u.id,
  u.email,
  count(p.usuario_id) AS cantidad
FROM
  usuarios u
  LEFT JOIN post p ON u.id = p.usuario_id
GROUP BY
  p.usuario_id,
  u.id,
  u.email;

-- 5. Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email.
select
  email
FROM
  usuarios
  JOIN post ON usuarios.id = post.usuario_id
GROUP BY
  usuarios.email
ORDER BY
  count(post.id) DESC
limit
  1;

-- 6. Muestra la fecha del último post de cada usuario (pregunta ambigua):
--6.1 Esta version trae a todos los usuarios incluso si no tiene post creados y muestra la fecha de creacion de aquellos que si tiene post :
select
  usuarios.nombre,
  max(post.fecha_creacion)
FROM
  usuarios
  LEFT JOIN post ON post.usuario_id = usuarios.id
GROUP BY
  usuarios.nombre;

-- 6.2 esta version mestra solo la fecha de creacion de aquellos usuarios que tienen post
select
  usuarios.nombre,
  max(post.fecha_creacion)
FROM
  usuarios
  JOIN post ON post.usuario_id = usuarios.id
GROUP BY
  usuarios.nombre;

-- 7. Muestra el título y contenido del post (artículo) con más comentarios
SELECT
  post.titulo,
  post.contenido
FROM
  post
  JOIN (
    SELECT
      post_id,
      COUNT(comentarios.post_id) AS total
    FROM
      comentarios
    GROUP BY
      comentarios.post_id
    ORDER BY
      total DESC
    LIMIT
      1
  ) AS tabla ON post.id = tabla.post_id;

-- 8. Muestra en una tabla el título de cada post, el contenido de cada post y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió.
SELECT
  p.titulo,
  p.contenido,
  c.contenido,
  u.email
FROM
  comentarios AS c
  JOIN post AS p ON c.post_id = p.id
  JOIN usuarios AS u ON u.id = c.usuario_id
ORDER BY
  p.id;

-- Muestra el contenido del último comentario de cada usuario