


CREATE DATABASE examen;
USE examen;

CREATE TABLE usuario(
	codigo INT, -- Para numeros enteros
    nombre CHAR(20), -- Para palabras fijas
    apellidos VARCHAR(20), -- Para palabras no fijas
    dinero DECIMAL(4,2), -- Para decimales (10,00)
    descripcion TEXT,
    descripcionLarga LONGTEXT,
    fecha DATE,
    fechaHoras DATETIME,
    horas TIME,
    PRIMARY KEY (codigo)
    );

CREATE TABLE usuarioNivelColumna(
	codigo INT PRIMARY KEY, 
    apellidos VARCHAR(14) UNIQUE,
    telefono CHAR(9) NOT NULL,
    fecha_alta DATE DEFAULT '2000-01-01',
    codigo_postal CHAR(5) CHECK (codigo_postal BETWEEN 28000 AND 28999),
    color VARCHAR(20) CHECK (color IN ('ROJO', 'VERDE', 'AMARILLO'))
    );


CREATE TABLE otros(
	codigo INT PRIMARY KEY,
    incremento INT AUTO_INCREMENT,
    profesional VARCHAR(20) CHECK ('Graduado' OR 'Licenciado'),
	-- Podria ir tambien AND, OR, NOT
    mayuscula VARCHAR(20) CHECK (mayuscula=UPPER(mayuscula)),
    minuscula VARCHAR(29) CHECK (minuscula=LOWER(minuscula)),
    CONSTRAINT ck_incremento CHECK (incremento>10)
    );
    
ALTER TABLE usuario 
	ADD CONSTRAINT ck_usuario_dinero CHECK (dinero>10);  -- Añadir un constraint

ALTER TABLE usuario   -- AGREGAR UNA NUEVA CONDICION 
	ADD CONSTRAINT fk_usuario_codigo2
    FOREIGN KEY (codigo2) 
    REFERENCES otros(codigo)
    ON DELETE RESTRICT -- Por defecto RESTRIC y NO ACTION estan si no los pones 
    ON UPDATE CASCADE
    -- Tambien existen: SET NULL  y  SET DEFAULT
    ;

ALTER TABLE usuario -- AGREGAR COLUMNA NUEVA, tambien puedes ponerle al final CHECK, etc..
	ADD columna_nueva INT;

ALTER TABLE usuario  -- BORRAR COLUMNA
	DROP columna_nueva; 
    
ALTER TABLE usuario -- BORRAR CONDICION
	DROP CONSTRAINT fk_usuario_codigo2;
    
ALTER TABLE usuario -- Modificar columna sin cambiar su nombre, osea solo el dato.
	MODIFY nombre INT;

ALTER TABLE usuario -- Modificar columna tanto nombre como dato.
	CHANGE nombre nombre_usuario INT;
    
ALTER TABLE usuario  -- Cambiar nombre a la tabla
	RENAME TO usuario_BRO;
    

--!------------------------------------------------------------------------!--


CREATE DATABASE biblioteca;
use biblioteca;

CREATE TABLE libro
( isbn VARCHAR(15), -- Código identificativo del libro
titulo VARCHAR( 70 ), -- Título del libro
editorial VARCHAR( 40 ), -- Nombre de la editorial del libro
n_paginas INT, -- Número de páginas del libro
CONSTRAINT pk_libro PRIMARY KEY ( isbn ) -- PRIMARY KEY = NOT NULL && UNIQUE
);


ALTER TABLE libro MODIFY n_paginasn_paginas INT DEFAULT '1'; -- Para agregar un DEFAULT, tienes que poner MODIFY

CREATE TABLE socio
( dni CHAR( 9 ), -- DNI del socio
nombre VARCHAR( 70 ), -- Nombre completo del socio
provincia VARCHAR(20), -- Provincia del socio
fecha_nac DATE, -- fecha de nacimiento
CONSTRAINT pk_socio PRIMARY KEY ( dni ),
CONSTRAINT ck_socio1 CHECK (provincia IN ('Almería', 'Córdoba', 'Málaga', 'Granada')),
CONSTRAINT ck_socio2 CHECK (fecha_nac < '1991-10-11'));

CREATE TABLE prestamo
( isbn VARCHAR(15), -- Código del libro prestado
dni CHAR( 9 ), -- DNI del socio que se lleva el libro
fecha_prestamo DATE, -- Fecha del préstamo
fecha_devolucion DATE, -- Fecha de devolución
devuelto CHAR( 1 ) -- Indica si está devuelto o no
CONSTRAINT ck_devuelto CHECK ( devuelto IN ( 'S', 'N' ) ),
CONSTRAINT pk_prestamo PRIMARY KEY ( isbn, dni, fecha_prestamo ),
CONSTRAINT fk_prestamo1 FOREIGN KEY (isbn) REFERENCES libro(isbn) ON DELETE CASCADE,
CONSTRAINT fk_prestamo2 FOREIGN KEY (dni) REFERENCES socio(dni) ON DELETE CASCADE
);


INSERT INTO libro VALUES ('123', 'Quijote', 'Panini', '20'); -- Forma rapida de introducir una fila

SELECT * FROM libro; -- Ver tabla

INSERT INTO libro (isbn, titulo, editorial, n_paginas) VALUES ('124', 'Sancho', 'Librari', '20'); -- Forma larga pero poniendo atributos


INSERT INTO libro VALUES ('123', 'LOlito', 'Tuquyi', '20'); -- ERROR porque la primary KEY es repetida
-- Error Code: 1062. Duplicate entry '123' for key 'libro.PRIMARY'	0,00046 sec

INSERT INTO libro (editorial, isbn, titulo, n_paginas) VALUES ('125', 'Dalmata', 'Yunque', '20');
-- Si cambiamos el orden de los atributos, tambien se cambiara respectivamente con el de valores, si funcionara

INSERT INTO libro VALUES ( 'null', 'Ejemplo', 'EDITOR', '20'); 
-- Funciona porque si ponemos comillas lo detecta como string o VARCHAR 

INSERT INTO libro VALUES ( NULL, 'Ejemlo', 'Real', '20');
-- Error Code: 1048. Column 'isbn' cannot be null	0,00023 sec

INSERT INTO libro VALUES ('890','Quijote', '',20);  -- TE deja el dato en blanco

INSERT INTO libro VALUES ('890','Quijote',,'20'); -- Da ERROR
-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',20)' at line 1	0,00010 sec

INSERT INTO libro VALUES ('100','Quijote',20); -- DA ERROR PORQUE ESPERA QUE PONGAS TODOS LOS VALORES
-- Error Code: 1136. Column count doesn't match value count at row 1	0,00025 sec


INSERT INTO libro (isbn, titulo, n_paginas) VALUES ('200', 'Sancho', 20); -- Funciona y EDITORIAL te deja en NULL

INSERT INTO libro (isbn, titulo, editorial) VALUES ('201', 'Sancho', 'editorialPRO'); -- QUeriamos probar si INT recibe NULL y si recibe.


INSERT INTO libro (isbn, titulo, editorial) VALUES ('202', 'Sancho', 'editorialPRO'); -- Comprobamos que DEFAULT funciona.

INSERT INTO libro (titulo, editorial, n_paginas) VALUES ('300', 'Sancho', 12);  -- Si no declaramos la primary KEY, y no tiene auto increment, dara error
-- Error Code: 1364. Field 'isbn' doesn't have a default value	0,00022 sec

--!------------------------------------------------------------------------!--


CREATE TABLE inventario (
	num INT AUTO_INCREMENT PRIMARY KEY, 
	descripcion VARCHAR(15)
);

SELECT * FROM inventario; -- Ver tabla

INSERT INTO inventario (descripcion) VALUES ('MESA MADERA'); -- SE PONDRA 1 en el num
INSERT INTO inventario (descripcion) VALUES ('SILLA MADERA'); -- Se pondra 2 en el num
INSERT INTO inventario (descripcion) VALUES ('CARA MADERA'); -- Se pondra 3 en el num

INSERT INTO inventario VALUES (10, 'ORDENADOR'); -- Se pondra 10 en el num
INSERT INTO inventario (descripcion) VALUES ('CAMA'); -- Se pondra 11 en el num
INSERT INTO inventario VALUES (NULL, 'PORTATIL'); -- Si pones NULL, se autoincrementara el ultimo osea 12
 
--!------------------------------------------------------------------------!--



CREATE DATABASE conductores;
USE conductores;

CREATE TABLE conductor(
	dni INT PRIMARY KEY,
    destino VARCHAR(20)
);

CREATE TABLE conductorMadrid(
	dni INT PRIMARY KEY,
    destino VARCHAR(20)
);

INSERT INTO conductor VALUES ('12121', 'Madrid'),
('12131', 'Barcelona');

SELECT * FROM conductor;
SELECT * FROM conductorMadrid;

INSERT INTO conductorMadrid (SELECT * FROM conductor WHERE destino='Madrid'); -- Sirve para copiar y pegar datos de otra tabla.

DELETE FROM conductorMadrid WHERE destino='Madrid'; -- Eliminamos la fila

DELETE FROM conductorMadrid; -- SE elimina todas las filas





DROP TABLE conductorMadrid; -- Eliminar tabla


--!------------------------------------------------------------------------!--


CREATE DATABASE colegio;
USE colegio;

CREATE TABLE alumno(
	dni INT PRIMARY KEY,
    nombre VARCHAR (20),
    edad INT
);

CREATE TABLE aula(
	num_aula INT PRIMARY KEY,
    nombre_aula VARCHAR(20)
);

CREATE TABLE matricula(
	dni INT,
    num_aula INT,
    PRIMARY KEY (dni, num_aula)
);

ALTER TABLE matricula 
	ADD CONSTRAINT fk_matricula_dni
    FOREIGN KEY (dni)
    REFERENCES alumno(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
ALTER TABLE matricula
	ADD CONSTRAINT fk_matricula_num_aula
    FOREIGN KEY (num_aula)
    REFERENCES aula(num_aula)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
    
INSERT INTO alumno VALUES (1, 'erick', 20 ),
(2, 'Marco', 80), (3, 'Sete', 60);

INSERT INTO aula VALUES (10, 'DAM'), (11, 'DAW');


INSERT INTO matricula VALUES (4, 20);  -- Da error porque no existen los datos en las tablas principales
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`colegio`.`matricula`, CONSTRAINT `fk_matricula_dni` FOREIGN KEY (`dni`) REFERENCES `alumno` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE)	0,00038 sec

INSERT INTO matricula VALUES (1, 10), (2, 10), (3, 11);


SELECT * FROM alumno;
SELECT * FROM aula;
SELECT * FROM matricula;

DELETE FROM alumno WHERE nombre='erick'; -- Si es ON DELETE CASCADE, se borra tanto la principal como en la relacion.

DELETE FROM aula WHERE nombre_aula='DAW'; -- Si es ON DELETE NO ACTION/ RESTRIC, no nos permitira borrarlo.
 -- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`colegio`.`matricula`, CONSTRAINT `fk_matricula_num_aula` FOREIGN KEY (`num_aula`) REFERENCES `aula` (`num_aula`) ON DELETE RESTRICT ON UPDATE CASCADE)	0,0026 sec

UPDATE alumno SET dni=dni+2;

UPDATE alumno SET dni=10 WHERE nombre='Sete';

UPDATE alumno SET dni=dni*2 WHERE nombre='Sete';


SELECT * FROM alumno;

INSERT INTO alumno VALUES (10, 'Laura', 20);


SET AUTOCOMMIT=0; -- CUANDO RECONECTAMOS A LA BASE DE DATOS, EL AUTOCOMMIT SE VUELVE ACTIVAR... OJO

INSERT INTO alumno VALUES (90, 'Shayla', 30);

COMMIT;
ROLLBACK;
INSERT INTO alumno VALUES (3, 'Lopez', 10);
SET AUTOCOMMIT=1;
INSERT INTO alumno VALUES (100, 'vELASQUEz', 10);


START TRANSACTION;
INSERT INTO alumno VALUES (111, 'Gato', 21);
COMMIT;



SELECT * FROM alumno;


SELECT * FROM aula;


SELECT * FROM matricula;


UPDATE  matricula SET num_aula=20 WHERE dni=3;

-- ALTER TABLE matricula 
	-- ADD CONSTRAINT fk_matricula_dni
    -- FOREIGN KEY (dni)
    -- REFERENCES alumno(dni)
    -- ON DELETE CASCADE
    -- ON UPDATE CASCADE;
    
-- ALTER TABLE matricula
	-- ADD CONSTRAINT fk_matricula_num_aula
    -- FOREIGN KEY (num_aula)
    -- REFERENCES aula(num_aula)
    -- ON DELETE RESTRICT
    -- ON UPDATE CASCADE;