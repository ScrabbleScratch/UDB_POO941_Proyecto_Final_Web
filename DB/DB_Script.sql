UNLOCK TABLES;

-- CREATE FRESH DATABASE
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;

USE biblioteca;

-- CREATE USER FOR THE PROGRAM
CREATE USER IF NOT EXISTS 'biblioteca'@'%' IDENTIFIED WITH mysql_native_password BY 'biblioteca';
GRANT ALL PRIVILEGES ON biblioteca.* TO 'biblioteca'@'%';

-- CREATE TABLES

-- ROLES
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `roles` WRITE;
INSERT INTO `roles` VALUES
	(1, 'Administrador','Encargado de la gestion del contenido'),
    (2, 'Profesor','Usuario con privilegios limitados'),
    (3, 'Alumno','Usuario con privilegios limitados');
UNLOCK TABLES;

-- PARAMETROS DE ROLES
DROP TABLE IF EXISTS `rolparams`;
CREATE TABLE `rolparams` (
  `rol` INT NOT NULL,
  `max_prestamos` INT NOT NULL,
  `max_dias` INT NOT NULL,
  `mora_diaria` FLOAT NOT NULL,
  UNIQUE KEY (`rol`),
  FOREIGN KEY (`rol`) REFERENCES `roles`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `rolparams` WRITE;
INSERT INTO `rolparams` VALUES
	(1, 10, 10, 0),
    (2, 4, 5, 0.25),
    (3, 3, 3, 0.5);
UNLOCK TABLES;

-- USUARIOS
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `rol` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`nombre`),
  FOREIGN KEY (`rol`) REFERENCES `roles`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `usuarios` WRITE;
INSERT INTO `usuarios` VALUES
	(1, 'admin', 'admin', 1);
UNLOCK TABLES;

-- LIBROS
DROP TABLE IF EXISTS `libros`;
CREATE TABLE `libros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `anio_publicacion` int DEFAULT NULL,
  `edicion` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `estante` varchar(10) DEFAULT NULL,
  `palabras_clave` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `libros` WRITE;
INSERT INTO `libros` VALUES
	(1,'Ciencias Naturales','Santillana','Educativo','Santillana','123-4-56-789456-1',2010,13,3,'4','ciencias, educacion');
UNLOCK TABLES;

-- OBRAS
DROP TABLE IF EXISTS `obras`;
CREATE TABLE `obras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `anio_publicacion` int DEFAULT NULL,
  `edicion` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `estante` varchar(10) DEFAULT NULL,
  `palabras_clave` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `obras` WRITE;
INSERT INTO `obras` VALUES
	(1,'Don Quijote','Miguel de Cervantes','Clasico','Santillana','123-4-56-789456-1',2010,13,3,'4','Clasico');
UNLOCK TABLES;

-- REVISTAS
DROP TABLE IF EXISTS `revistas`;
CREATE TABLE `revistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `frecuencia` varchar(100) DEFAULT NULL,
  `issn` varchar(15) DEFAULT NULL,
  `tematica` varchar(100) DEFAULT NULL,
  `volumen` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `estante` varchar(10) DEFAULT NULL,
  `palabras_clave` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `revistas` WRITE;
INSERT INTO `revistas` VALUES
	(1,'National Geographic','National Geograpic','Mensual','1234-5678','Ciencia',25,3,'2','Ciencia');
UNLOCK TABLES;

-- CD
DROP TABLE IF EXISTS `cds`;
CREATE TABLE `cds` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `anio_publicacion` int DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `estante` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `cds` WRITE;
INSERT INTO `cds` VALUES
	(1,'Hibryd Theory','Linking Park','Alternativo',2006,130,5,'6');
UNLOCK TABLES;

-- TESIS
DROP TABLE IF EXISTS `tesis`;
CREATE TABLE `tesis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `fecha_publicacion` varchar(100) DEFAULT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `facultad` varchar(100) DEFAULT NULL,
  `paginas` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `estante` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tesis` WRITE;
INSERT INTO `tesis` VALUES
	(1,'Tesis 1','Enero 2010','Universidad Don Bosco','Ingenieria',200,1,'1');
UNLOCK TABLES;

-- PRESTAMOS
DROP TABLE IF EXISTS `prestamos_libros`;
CREATE TABLE `prestamos_libros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` INT NOT NULL,
  `item_id` INT NOT NULL,
  `fecha_prestamo` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_devolucion` TIMESTAMP DEFAULT NULL,
  `fecha_devuelto` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `libros`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `prestamos_obras`;
CREATE TABLE `prestamos_obras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` INT NOT NULL,
  `item_id` INT NOT NULL,
  `fecha_prestamo` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_devolucion` TIMESTAMP DEFAULT NULL,
  `fecha_devuelto` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `obras`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `prestamos_revistas`;
CREATE TABLE `prestamos_revistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` INT NOT NULL,
  `item_id` INT NOT NULL,
  `fecha_prestamo` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_devolucion` TIMESTAMP DEFAULT NULL,
  `fecha_devuelto` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `revistas`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `prestamos_cds`;
CREATE TABLE `prestamos_cds` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` INT NOT NULL,
  `item_id` INT NOT NULL,
  `fecha_prestamo` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_devolucion` TIMESTAMP DEFAULT NULL,
  `fecha_devuelto` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `cds`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `prestamos_tesis`;
CREATE TABLE `prestamos_tesis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` INT NOT NULL,
  `item_id` INT NOT NULL,
  `fecha_prestamo` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `fecha_devolucion` TIMESTAMP DEFAULT NULL,
  `fecha_devuelto` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `tesis`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- VISTAS
DROP VIEW IF EXISTS libros_consulta;
CREATE VIEW libros_consulta
AS
	SELECT
		I.id AS 'ID',
		titulo AS 'Titulo',
		autor AS 'Autor',
		genero AS 'Genero',
		editorial AS 'Editorial',
		anio_publicacion AS 'Publicacion',
		edicion AS 'Edicion',
		estante AS 'Estante',
		unidades AS 'Unidades',
		COUNT(P.id) AS 'Prestados',
		(unidades - COUNT(P.id)) AS 'Disponibles'
	FROM libros AS I
	LEFT JOIN prestamos_libros AS P ON P.item_id = I.id
	WHERE P.fecha_devuelto IS NULL
	GROUP BY I.id;

DROP VIEW IF EXISTS obras_consulta;
CREATE VIEW obras_consulta
AS
	SELECT
		I.id AS 'ID',
		titulo AS 'Titulo',
		autor AS 'Autor',
		genero AS 'Genero',
		editorial AS 'Editorial',
		anio_publicacion AS 'Publicacion',
		edicion AS 'Edicion',
		estante AS 'Estante',
		unidades AS 'Unidades',
		COUNT(P.id) AS 'Prestados',
		(unidades - COUNT(P.id)) AS 'Disponibles'
	FROM obras AS I
	LEFT JOIN prestamos_obras AS P ON P.item_id = I.id
	WHERE P.fecha_devuelto IS NULL
	GROUP BY I.id;

DROP VIEW IF EXISTS revistas_consulta;
CREATE VIEW revistas_consulta
AS
	SELECT
		I.id AS 'ID',
		titulo AS 'Titulo',
		editorial AS 'Editorial',
		frecuencia AS 'Frecuencia',
		tematica AS 'Tematica',
		volumen AS 'Volumen',
		estante AS 'Estante',
		unidades AS 'Unidades',
		COUNT(P.id) AS 'Prestados',
		(unidades - COUNT(P.id)) AS 'Disponibles'
	FROM revistas AS I
	LEFT JOIN prestamos_revistas AS P ON P.item_id = I.id
	WHERE P.fecha_devuelto IS NULL
	GROUP BY I.id;

DROP VIEW IF EXISTS cds_consulta;
CREATE VIEW cds_consulta
AS
	SELECT
		I.id AS 'ID',
		titulo AS 'Titulo',
		autor AS 'Autpr',
		genero AS 'Genero',
		anio_publicacion AS 'Publicacion',
		duracion AS 'Duracion',
		estante AS 'Estante',
		unidades AS 'Unidades',
		COUNT(P.id) AS 'Prestados',
		(unidades - COUNT(P.id)) AS 'Disponibles'
	FROM cds AS I
	LEFT JOIN prestamos_cds AS P ON P.item_id = I.id
	WHERE P.fecha_devuelto IS NULL
	GROUP BY I.id;

DROP VIEW IF EXISTS tesis_consulta;
CREATE VIEW tesis_consulta
AS
	SELECT
		I.id AS 'ID',
		titulo AS 'Titulo',
		fecha_publicacion AS 'Publicacion',
		institucion AS 'Institucion',
		facultad AS 'Facultad',
		paginas AS 'Paginas',
		estante AS 'Estante',
		unidades AS 'Unidades',
		COUNT(P.id) AS 'Prestados',
		(unidades - COUNT(P.id)) AS 'Disponibles'
	FROM tesis AS I
	LEFT JOIN prestamos_tesis AS P ON P.item_id = I.id
	WHERE P.fecha_devuelto IS NULL
	GROUP BY I.id;

DROP VIEW IF EXISTS libros_prestamos;
CREATE VIEW libros_prestamos
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * RP.mora_diaria, 0) AS 'Mora'
	FROM prestamos_libros AS P
	LEFT JOIN libros AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN roles AS R ON R.id = U.rol
	LEFT JOIN rolparams AS RP ON RP.rol = R.id;

DROP VIEW IF EXISTS obras_prestamos;
CREATE VIEW obras_prestamos
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * RP.mora_diaria, 0) AS 'Mora'
	FROM prestamos_obras AS P
	LEFT JOIN obras AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN roles AS R ON R.id = U.rol
	LEFT JOIN rolparams AS RP ON RP.rol = R.id;

DROP VIEW IF EXISTS revistas_prestamos;
CREATE VIEW revistas_prestamos
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * RP.mora_diaria, 0) AS 'Mora'
	FROM prestamos_revistas AS P
	LEFT JOIN revistas AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN roles AS R ON R.id = U.rol
	LEFT JOIN rolparams AS RP ON RP.rol = R.id;

DROP VIEW IF EXISTS cds_prestamos;
CREATE VIEW cds_prestamos
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * RP.mora_diaria, 0) AS 'Mora'
	FROM prestamos_cds AS P
	LEFT JOIN cds AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN roles AS R ON R.id = U.rol
	LEFT JOIN rolparams AS RP ON RP.rol = R.id;

DROP VIEW IF EXISTS tesis_prestamos;
CREATE VIEW tesis_prestamos
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * RP.mora_diaria, 0) AS 'Mora'
	FROM prestamos_tesis AS P
	LEFT JOIN tesis AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN roles AS R ON R.id = U.rol
	LEFT JOIN rolparams AS RP ON RP.rol = R.id;