CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autor(
	codigo_autor INT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo_autor)
);


CREATE TABLE libro(
	codigo_libro INT,
    titulo VARCHAR(70) NOT NULL,
    isbn VARCHAR(15) UNIQUE,
    editorial VARCHAR(20) CHECK (editorial IN ('Panini', 'Alfaguara', 'Navarrete')),
    paginas INT CHECK (paginas>0),
    PRIMARY KEY (codigo_libro)
);


ALTER TABLE libro 
	ADD CONSTRAINT ck_libro_editorial
    CHECK (editorial IN ('Panini', 'Alfaguara', 'Navarrete'));


CREATE TABLE escribe(
	codigo_autor INT,
    codigo_libro INT,
    PRIMARY KEY (codigo_autor, codigo_libro)
);

CREATE TABLE ejemplar(
	codigo_ejemplar INT,
    codigo_libro INT NOT NULL,
    localizacion VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo_ejemplar)
);

CREATE TABLE usuario(
	codigo_usuario INT,
    nombre VARCHAR(20) NOT NULL,
    telefono CHAR(9),
    direccion VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo_usuario)
);

CREATE TABLE saca(
	codigo_usuario INT,
    codigo_ejemplar INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    PRIMARY KEY (codigo_usuario, codigo_ejemplar, fecha_prestamo)
);


ALTER TABLE escribe 
ADD (CONSTRAINT fk_escribe_codigo_autor
	FOREIGN KEY (codigo_autor)
	REFERENCES autor(codigo_autor)
    ON DELETE RESTRICT
    ON UPDATE CASCADE),
ADD (CONSTRAINT fk_escribe_codigo_libro
	FOREIGN KEY (codigo_libro)
	REFERENCES libro(codigo_libro)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);
    
ALTER TABLE ejemplar
ADD CONSTRAINT fk_ejemplar_codigo_libro
	FOREIGN KEY (codigo_libro)
    REFERENCES libro(codigo_libro)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE saca
ADD (CONSTRAINT fk_saca_codigo_usuario
	FOREIGN KEY (codigo_usuario)
    REFERENCES usuario(codigo_usuario)
    ON UPDATE CASCADE),
ADD (CONSTRAINT fk_saca_codigo_ejemplar
	FOREIGN KEY (codigo_ejemplar)
    REFERENCES ejemplar(codigo_ejemplar)
    ON UPDATE CASCADE);

    
ALTER TABLE libro 
ADD (CONSTRAINT ck_libro_paginas
	CHECK (paginas>0)),
ADD (CONSTRAINT uq_libro_isbn
	UNIQUE (isbn));

ALTER TABLE usuario
ADD CONSTRAINT uq_usuario_telefono
	UNIQUE (telefono);

ALTER TABLE saca
ADD CONSTRAINT ck_saca_fecha_devolucion
	CHECK (fecha_devolucion IS NULL OR fecha_devolucion>fecha_prestamo);
    
 
SELECT * FROM autor; 
SELECT * FROM libro; 
SELECT * FROM escribe; 
SELECT * FROM ejemplar; 
SELECT * FROM usuario; 
SELECT * FROM saca; 

 
 -- --------------------------------------
    -- FORMAS CORRECTAS: 
    
INSERT INTO autor (codigo_autor, nombre) VALUES (1, 'Cesar');  

INSERT INTO autor VALUES (2, 'Arturo');

INSERT INTO autor VALUES (3, 'Aliaga'), 
						 (4, 'Luis'),
                         (5, 'Vallejo'),
                         (6, 'Marcos');

 -- --------------------------------------

INSERT INTO autor VALUES (7); 
-- Error Code: 1136. Column count doesn't match value count at row 1
INSERT INTO autor (codigo_autor, nombre) VALUES (7, NULL);
-- Error Code: 1048. Column 'nombre' cannot be null	


INSERT INTO autor (codigo_autor, nombre) VALUES (7, '');

INSERT INTO autor (codigo_autor, nombre) VALUES ('Erick', 2);
-- Error Code: 1366. Incorrect integer value: 'Erick' for column 'codigo_autor' at row 1

INSERT INTO autor VALUES (1, 'Cervantes');
-- Error Code: 1062. Duplicate entry '1' for key 'autor.PRIMARY'	


INSERT INTO autor VALUES (NULL, 'Cervantes');
-- Error Code: 1048. Column 'codigo_autor' cannot be null	


 -- --------------------------------------


INSERT INTO libro VALUES (100, 'El monje que vendio su ferrari', '010101M', 'Planeta', 300); 
-- Error Code: 3819. Check constraint 'ck_libro_editorial' is violated.	
INSERT INTO libro VALUES (100, 'El monje que vendio su ferrari', '010101M', 'Panini', 0); 
-- Error Code: 3819. Check constraint 'ck_libro_paginas' is violated.

INSERT INTO libro VALUES (100, 'El monje que vendio su ferrari', '010101M', 'Panini', 10); 
INSERT INTO libro VALUES (200, 'La ciudad y los perros', '010101M', 'Navarrete', 500); 
-- Error Code: 1062. Duplicate entry '010101M' for key 'libro.uq_libro_isbn'



-- CORRECTAMENTE:
INSERT INTO libro VALUES (200, 'La ciudad y los perros', '101010Y', 'Navarrete', 500),
						 (300, 'Don Quijote de la mancha', '182S121', 'Panini', 1000),
                         (400, 'Padre rico, padre pobre', 'x1921AAA', 'Alfaguara', 200) ; 
                         
-- ------------------------------------
CREATE TABLE usuario(
	codigo_usuario INT,
    nombre VARCHAR(20) NOT NULL,
    telefono CHAR(9) DEFAULT '000000000',
    direccion VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo_usuario)
);


INSERT INTO usuario (codigo_usuario, nombre, direccion) VALUES (1000, 'Erick','Calle Tomate 5');

-- ------------------------------------


CREATE TABLE autor(
	codigo_autor INT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo_autor)
);

SELECT * FROM autor;





CREATE TABLE libro(
	codigo_libro INT,
    titulo VARCHAR(70) NOT NULL,
    isbn VARCHAR(15) UNIQUE,
    editorial VARCHAR(20) CHECK (editorial IN ('Panini', 'Alfaguara', 'Navarrete')),
    paginas INT CHECK (paginas>0),
    PRIMARY KEY (codigo_libro)
);



SELECT * FROM libro ;

CREATE TABLE escribe(
	codigo_autor INT,
    codigo_libro INT,
    PRIMARY KEY (codigo_autor, codigo_libro)
);

INSERT INTO escribe VALUES (1, 100),
						   (2, 200),
                           (3, 300),
                           (4, 400),
                           (5, 100),
                           (6, 200);

INSERT INTO escribe VALUES (7, 100);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`biblioteca`.`escribe`, CONSTRAINT `fk_escribe_codigo_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`) ON DELETE RESTRICT ON UPDATE CASCADE)	0,00052 sec

SELECT * FROM escribe;

DELETE FROM autor WHERE codigo_autor=1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`biblioteca`.`escribe`, CONSTRAINT `fk_escribe_codigo_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`) ON DELETE RESTRICT ON UPDATE CASCADE)	0,0019 sec
DELETE FROM autor WHERE nombre='CESAR';
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`biblioteca`.`escribe`, CONSTRAINT `fk_escribe_codigo_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`) ON DELETE RESTRICT ON UPDATE CASCADE)	0,0017 sec

DELETE FROM libro WHERE titulo='Padre rico, padre pobre';


UPDATE libro SET codigo_libro=500 WHERE titulo='Don Quijote de la mancha';
-- 00:18:36	UPDATE libro SET codigo_libro=500 WHERE titulo='Don Quijote de la mancha'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`biblioteca`.`escribe`, CONSTRAINT `fk_escribe_codigo_libro` FOREIGN KEY (`codigo_libro`) REFERENCES `libro` (`codigo_libro`) ON DELETE CASCADE ON UPDATE RESTRICT)	0,0017 sec
UPDATE autor SET codigo_autor=10 WHERE nombre='Arturo';

DELETE FROM escribe WHERE codigo_autor=1;

UPDATE escribe SET codigo_autor=1	WHERE codigo_autor=5;


UPDATE escribe SET codigo_autor=100 WHERE codigo_autor=3;
-- 00:25:18	UPDATE escribe SET codigo_autor=100 WHERE codigo_autor=3	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`biblioteca`.`escribe`, CONSTRAINT `fk_escribe_codigo_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`) ON DELETE RESTRICT ON UPDATE CASCADE)	0,0025 sec


-- ------------------------------------

INSERT INTO autor VALUES (20, 'Gabriel');
SELECT * FROM autor;

SET AUTOCOMMIT=0;
INSERT INTO autor VALUES (30, 'Mario');
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO autor VALUES (40, 'Victor');
COMMIT; 
ROLLBACK;

SET AUTOCOMMIT=0;
INSERT INTO autor VALUES (50, 'Tomi');
COMMIT; 
INSERT INTO autor VALUES (60, 'Mikel');


SET AUTOCOMMIT=0;
INSERT INTO autor VALUES (70, 'Lucas');
COMMIT; 
SET AUTOCOMMIT=1;
INSERT INTO autor VALUES (80, 'Firex');

START TRANSACTION;
INSERT INTO autor VALUES (90, 'Axel');
COMMIT;
INSERT INTO autor VALUES (100, 'Isabel');

