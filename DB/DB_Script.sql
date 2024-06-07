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
DROP VIEW IF EXISTS libros_consulta_view;
CREATE VIEW libros_consulta_view
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
	LEFT JOIN (
		SELECT id, item_id
		FROM prestamos_libros
		WHERE fecha_devuelto IS NULL
	) AS P ON P.item_id = I.id
	GROUP BY I.id;

DROP VIEW IF EXISTS obras_consulta_view;
CREATE VIEW obras_consulta_view
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
	LEFT JOIN (
		SELECT id, item_id
		FROM prestamos_obras
		WHERE fecha_devuelto IS NULL
	) AS P ON P.item_id = I.id
	GROUP BY I.id;

DROP VIEW IF EXISTS revistas_consulta_view;
CREATE VIEW revistas_consulta_view
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
	LEFT JOIN (
		SELECT id, item_id
		FROM prestamos_revistas
		WHERE fecha_devuelto IS NULL
	) AS P ON P.item_id = I.id
	GROUP BY I.id;

DROP VIEW IF EXISTS cds_consulta_view;
CREATE VIEW cds_consulta_view
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
	LEFT JOIN (
		SELECT id, item_id
		FROM prestamos_cds
		WHERE fecha_devuelto IS NULL
	) AS P ON P.item_id = I.id
	GROUP BY I.id;

DROP VIEW IF EXISTS tesis_consulta_view;
CREATE VIEW tesis_consulta_view
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
	LEFT JOIN (
		SELECT id, item_id
		FROM prestamos_tesis
		WHERE fecha_devuelto IS NULL
	) AS P ON P.item_id = I.id
	GROUP BY I.id;

DROP VIEW IF EXISTS libros_prestamos_view;
CREATE VIEW libros_prestamos_view
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * R.mora_diaria, 0) AS 'Mora'
	FROM prestamos_libros AS P
	LEFT JOIN libros AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN rolparams AS R ON R.rol = U.rol;

DROP VIEW IF EXISTS obras_prestamos_view;
CREATE VIEW obras_prestamos_view
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * R.mora_diaria, 0) AS 'Mora'
	FROM prestamos_obras AS P
	LEFT JOIN obras AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN rolparams AS R ON R.rol = U.rol;

DROP VIEW IF EXISTS revistas_prestamos_view;
CREATE VIEW revistas_prestamos_view
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * R.mora_diaria, 0) AS 'Mora'
	FROM prestamos_revistas AS P
	LEFT JOIN revistas AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN rolparams AS R ON R.rol = U.rol;

DROP VIEW IF EXISTS cds_prestamos_view;
CREATE VIEW cds_prestamos_view
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * R.mora_diaria, 0) AS 'Mora'
	FROM prestamos_cds AS P
	LEFT JOIN cds AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN rolparams AS R ON R.rol = U.rol;

DROP VIEW IF EXISTS tesis_prestamos_view;
CREATE VIEW tesis_prestamos_view
AS
	SELECT
		P.id AS 'ID',
		I.titulo AS 'Titulo',
		U.nombre AS 'Usuario',
		P.fecha_prestamo AS 'Prestado',
		IF (P.fecha_devuelto IS NULL, 'NO DEVUELTO', P.fecha_devuelto) AS 'Devuelto',
		IF (fecha_devuelto IS NULL, 'SI', 'NO') AS 'Activo',
		IF (DATEDIFF(CURDATE(), P.fecha_devolucion) > 0, DATEDIFF(CURDATE(), P.fecha_devolucion) * R.mora_diaria, 0) AS 'Mora'
	FROM prestamos_tesis AS P
	LEFT JOIN tesis AS I ON I.id = P.item_id
	LEFT JOIN usuarios AS U ON U.id = P.usuario
	LEFT JOIN rolparams AS R ON R.rol = U.rol;

-- STORED PROCEDURES

-- VALIDAR USUARIO
DELIMITER $$

DROP PROCEDURE IF EXISTS validar_usuario $$
CREATE PROCEDURE validar_usuario (
	IN usuario VARCHAR(100),
    IN pass VARCHAR(100)
)
BEGIN
	SELECT rol
    FROM usuarios
    WHERE CAST(nombre AS BINARY) = usuario AND CAST(passwd AS BINARY) = pass;
END $$

DELIMITER ;

-- MORA ACUMULADA DE USUARIO
DELIMITER $$

DROP PROCEDURE IF EXISTS mora_usuario $$
CREATE PROCEDURE mora_usuario (
	IN categoria VARCHAR(25),
	IN usuario VARCHAR(100)
)
BEGIN
	SET @usuario = usuario;
    
	SET @qry = CONCAT("
	SELECT
		COUNT(id) AS prestamos_pendientes,
		IF(SUM(mora_acumulada) > 0, SUM(mora_acumulada), 0) AS mora_total
	FROM (
		SELECT P.id, P.fecha_devolucion, R.mora_diaria,
			IF(DATEDIFF(CURDATE(), fecha_devolucion) > 0, DATEDIFF(CURDATE(), fecha_devolucion) * mora_diaria, 0) AS mora_acumulada
		FROM prestamos_", categoria, " AS P
		JOIN usuarios AS U ON U.id = P.usuario
		JOIN rolparams AS R ON R.rol = U.rol
		JOIN libros AS I ON I.id = P.item_id
		WHERE U.nombre = ? AND P.fecha_devuelto IS NULL
	) AS P
	WHERE P.mora_acumulada > 0;
    ");
    PREPARE stm FROM @qry;
	EXECUTE stm USING @usuario;
	DEALLOCATE PREPARE stm;
END $$

DELIMITER ;

-- CONSULTAR ITEMS
DELIMITER $$

DROP PROCEDURE IF EXISTS consultar_items $$
CREATE PROCEDURE consultar_items (
	IN categoria VARCHAR(25)
)
BEGIN
	SET	@qry = CONCAT('SELECT * FROM ', categoria, '_consulta_view');
	PREPARE stm FROM @qry;
	EXECUTE stm;
	DEALLOCATE PREPARE stm;
END $$

DELIMITER ;

-- REGISTRAR PRESTAMO
DELIMITER $$

DROP PROCEDURE IF EXISTS registrar_prestamo $$
CREATE PROCEDURE registrar_prestamo (
	IN categoria VARCHAR(25),
    IN nombre VARCHAR(100),
    IN id INT
)
BEGIN
    SET @id = id;
    
    SELECT U.id, max_dias
    INTO @usuario, @dias
    FROM usuarios AS U
    LEFT JOIN rolparams AS R ON R.rol = U.rol
    WHERE U.nombre = nombre;
    
    SET @devolucion = DATE_ADD(CURDATE(), INTERVAL @dias DAY);
    
	SET	@qry = CONCAT('INSERT INTO prestamos_', categoria, ' (usuario, fecha_devolucion, item_id) VALUES (?, ?, ?);');
	PREPARE stm FROM @qry;
	EXECUTE stm USING @usuario, @devolucion, @id;
	DEALLOCATE PREPARE stm;
END $$

DELIMITER ;

-- CONSULTAR PRESTAMOS
DELIMITER $$

DROP PROCEDURE IF EXISTS consultar_prestamos $$
CREATE PROCEDURE consultar_prestamos (
	IN categoria VARCHAR(25),
    IN nombre VARCHAR(100)
)
BEGIN
    SET @nombre = nombre;
    
    IF (nombre IS NULL OR LENGTH(TRIM(nombre)) = 0) THEN
		SET	@qry = CONCAT('SELECT * FROM ', categoria, '_prestamos_view WHERE Activo = \'SI\'');
		PREPARE stm FROM @qry;
		EXECUTE stm;
		DEALLOCATE PREPARE stm;
	ELSE
		SET	@qry = CONCAT('SELECT * FROM ', categoria, '_prestamos_view WHERE Activo = \'SI\' AND Usuario = ?');
		PREPARE stm FROM @qry;
		EXECUTE stm USING @nombre;
		DEALLOCATE PREPARE stm;
	END IF;
END $$

DELIMITER ;

-- DEVOLVER ITEM
DELIMITER $$

DROP PROCEDURE IF EXISTS devolver_item $$
CREATE PROCEDURE devolver_item (
	IN categoria VARCHAR(25),
    IN id INT,
    IN devuelto TIMESTAMP
)
BEGIN
	SET @id = id;
    SET @devuelto = devuelto;
    SET	@qry = CONCAT('UPDATE prestamos_', categoria, ' SET fecha_devuelto = ? WHERE id = ?');
    
    PREPARE stm FROM @qry;
    EXECUTE stm USING @devuelto, @id;
    DEALLOCATE PREPARE stm;
END $$

DELIMITER ;

-- ELIMINAR USUARIO
DELIMITER $$

DROP PROCEDURE IF EXISTS crear_usuario $$
CREATE PROCEDURE crear_usuario (
	IN usuario VARCHAR(100),
    IN pass VARCHAR(100),
    IN rol INT
)
BEGIN
	INSERT INTO usuarios(nombre, passwd, rol)
    VALUES (usuario, pass, rol);
END $$

DELIMITER ;

-- ELIMINAR USUARIO
DELIMITER $$

DROP PROCEDURE IF EXISTS eliminar_usuario $$
CREATE PROCEDURE eliminar_usuario (
	IN usuario VARCHAR(100)
)
BEGIN
	DELETE FROM usuarios WHERE nombre = usuario;
END $$

DELIMITER ;

-- CONSULTAR ROL
DELIMITER $$

DROP PROCEDURE IF EXISTS consultar_rol $$
CREATE PROCEDURE consultar_rol (
	IN id INT
)
BEGIN
	SELECT *
    FROM roles AS R
    LEFT JOIN rolparams AS P ON P.rol = R.id
    WHERE R.id = id;
END $$

DELIMITER ;

-- ACTUALIZAR ROL
DELIMITER $$

DROP PROCEDURE IF EXISTS actualizar_rol $$
CREATE PROCEDURE actualizar_rol (
	IN id INT,
    IN prestamos INT,
    IN dias INT,
    IN mora FLOAT
)
BEGIN
	UPDATE rolparams
    SET max_prestamos = prestamos, max_dias = dias, mora_diaria = mora
    WHERE rol = id;
END $$

DELIMITER ;