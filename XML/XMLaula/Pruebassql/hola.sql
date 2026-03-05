

-- selecciona todos los datos de todos los clientes: 

SELECT * FROM clientes;


SELECT * FROM clientes;


SELECT nombre_columnas FROM tabla_origen;




SELECT DISTINCT nombre_columnas FROM tabla_origen;

-------------------------------------------------------
SELECT nombre_columna [AS] col_renombrada FROM tabla_origen;



/*Selecciona todos los clientes de nuestra empresa pero 
mostrando solamente las columnas de DNI, Nombre y apellidos, 
incluyendo Identificación como alias de DNI: */

SELECT DNI AS Identificacion, Nombre, Apellidos FROM clientes;

---------------------------------------

SELECT nombres_columnas FROM tabla_origen WHERE condicion;


/*Selecciona las columnas DNI, Nombre y Apellidos de la tabla clientes 
que tengan una fecha de alta mayor a ‘01/01/2010’: */

SELECT DNI, Nombre, Apellidos FROM clientes WHERE fecha_de_alta >"2010/01/01";

-------------------------------------------------------


 SELECT nombre_columna FROM tabla_origen ORDER BY nombre_columna [ASC][DESC];

/*Queremos ordenar a nuestros clientes según su fecha de alta 
de más nuevo a más antiguo (descendente), y además queremos ordenar 
los datos por orden alfabético según los apellidos (ascendente): */

SELECT * FROM clientes ORDER BY fecha_de_alta DESC, apellidos;



- suma (+)
- resta (-)
- concatenar (||)
- producto (*)
- división (/)
- resto (%)
- igualdad (=)

- división entera, es decir, 
parte entera de la división sin decimales (Div)

/*Devuelve el nombre de los productos con el precio 
incrementado un 20%: */

SELECT nombre, (precio_hora*1.20) AS nuevoPrecio FROM maquinas;

- Igualdad (=)
- Diferencia (!=) ó (<>)
- Mayor que (>)
- Menor que (<)
- Mayor o igual que (>=)
- Menor o igual que (<=)



LIKE (%)(_) 

/*Selecciona todos los clientes que empiecen por 
la letra R:*/

Select nombre from clientes where nombre like "R%"

/*Selecciona todos los clientes que empiecen por R 
y tengan solo 5 caracteres en total:*/

Select nombre from clientes where nombre like "R____";

- AND 
- OR 
- NOT 





SELECT col FROM tabla WHERE condición1 [AND|OR] condición2
[AND|OR] condición3...;


/*Muestra los productos con precio mayor a 100 
y stock menor a 20:*/

SELECT producto FROM inventario WHERE precio > 100 AND stock < 20;



SELECT columnas FROM tabla WHERE columna BETWEEN valor1 AND valor2;

/*Selecciona productos con precio entre 10 y 20:*/

SELECT nombre, precio FROM productos WHERE precio BETWEEN 10 AND 20;






SELECT columnas FROM tabla WHERE columna IN (valor1, valor2, valor3);

/*Clientes de Madrid, Barcelona o Valencia:*/

SELECT nombre FROM clientes WHERE ciudad IN ('Madrid', 'Barcelona', 'Valencia');



SELECT columnas FROM tabla WHERE columna IS NULL;

SELECT columnas FROM tabla WHERE columna IS NOT NULL;


SELECT columnas FROM tabla WHERE columna NOT BETWEEN valor1 AND valor2;


SELECT columnas FROM tabla WHERE columna NOT LIKE 'patrón';


SELECT columnas FROM tabla WHERE columna NOT IN (valor1, valor2, valor3);

-- SIN PARÉNTESIS
SELECT * FROM empleados
WHERE departamento = 'Ventas' OR departamento = 'Marketing' 
AND salario > 50000;

/* 5ª prioridad: Marketing AND salario > 50000 se evalúa PRIMERO

   6ª prioridad: Ventas OR (resultado anterior)

Resultado inesperado: Devuelve todos los de Ventas (sin importar salario)
 + los de Marketing con salario > 50000*/


-- INCORRECTO ❌ 
SELECT * FROM clientes WHERE telefono = NULL;
SELECT * FROM clientes WHERE telefono <> NULL;

-- CORRECTO ✓ 
SELECT * FROM clientes WHERE telefono IS NULL;
SELECT * FROM clientes WHERE telefono IS NOT NULL;


SELECT NULL + 140;  /* Resultado: NULL */


/* Reemplaza NULL por un valor alternativo */

SELECT IFNULL(columna, valor_reemplazo) FROM tabla;


/* Ejemplo: suma segura (evita NULL) */

SELECT salario + IFNULL(comision, 0) AS total FROM empleados;


SELECT * FROM nombreTabla WHERE condicion ORDER BY expresion LIMIT [m] n.

/* 
--"m" es opcional e indica el nº de fila por el que se comienza 
la visualización. Si no se pone, empieza por el valor 0 (la primera fila).
-- "n" indica el nº de filas que se quieren visualizar.*/



SELECT * FROM nombreTabla GROUP BY expresionColumna HAVING condicionSeleccion


/* Obtén los datos de los 5 empleados con menos salario: */

SELECT emp_no, apellido, salario, dep_no FROM empleados 
ORDER BY salario LIMIT 5

/* Obtén clasificación alfabética de empleados según 
su apellido, y mostrar desde el quinto hasta el 
séptimo de la lista: */
SELECT emp_no, apellido, salario, dep_no FROM empleados 
ORDER BY apellido LIMIT 4, 3;


SELECT * FROM nombreTabla GROUP BY expresionColumna 
HAVING condicionSeleccion;

/* Muestra el número total de empleados del departamento de Ventas*/
SELECT departamento, COUNT(*) AS total FROM empleados
GROUP BY departamento HAVING departamento = 'Ventas';  

/* OK: está en GROUP BY */

/*Mostrar, por cada producto, la cantidad total vendida y el precio
medio, pero solo de aquellos productos que hayan vendido más de 10 
unidades y cuyo precio medio sea superior a 5.*/

SELECT producto, SUM(cantidad) AS total, AVG(precio) AS precio_medio
FROM ventas GROUP BY producto 
HAVING SUM(cantidad) > 10 AND AVG(precio) > 5;          


SELECT producto, SUM(cantidad) AS total FROM ventas
GROUP BY producto HAVING precio > 5;  

/* ERROR: precio no está en GROUP BY ni es agregación */


/* Mostrar, por cada producto, la cantidad 
total vendida, pero solo de aquellos productos 
cuyo precio medio sea superior a 5.*/

SELECT producto, SUM(cantidad) AS total
FROM ventas GROUP BY producto
HAVING AVG(precio) > 5;  

/* OK: aunque AVG(precio) no esté en SELECT */


SELECT departamento, COUNT(*) AS total
FROM empleados
GROUP BY departamento
HAVING departamento = 'Ventas';  /* OK: está en GROUP BY */


/* Cuenta todos los empleados de la tabla*/

SELECT COUNT(*) AS total_empleados 
FROM empleados;



SELECT función(DISTINCT columna) FROM tabla;



/*Obtener el número de ciudades distintas (sin repetir)
en las que hay clientes."*/

SELECT COUNT(DISTINCT ciudad) FROM clientes;

SELECT AVG(columna) FROM tabla;


/* Calcular el precio medio de todos los productos.*/

SELECT AVG(precio) FROM productos;



SELECT COUNT(*) FROM tabla;


/* Obtener el número total de clientes 
(incluyendo aquellos con campos nulos)*/

SELECT COUNT(*) FROM clientes;

SELECT COUNT(columna) FROM tabla;


/* Contar cuántos clientes tienen teléfono registrado (no nulo).*/

SELECT COUNT(telefono) FROM clientes;


SELECT COUNT(DISTINCT columna) FROM tabla;



/*¿Cuántas ciudades diferentes tienen clientes?*/

SELECT COUNT(DISTINCT ciudad) FROM clientes;


SELECT SUM(columna) FROM tabla;


/* Calcular el total de unidades vendidas de todos los productos.*/

SELECT SUM(cantidad) FROM ventas;

SELECT MAX(columna) FROM tabla;

/* Obtener el salario más alto de la empresa.*/

SELECT MAX(salario) FROM empleados;


SELECT MIN(columna) FROM tabla;

/* Obtener el salario más bajo de la empresa.*/

SELECT MIN(salario) FROM empleados;


SELECT TRUNCATE(FUNCIÓN_DE_GRUPO(columna), decimales) AS alias
FROM nombre_tabla;

/*Calcula el sueldo medio de los directores, incluyendo en el 
cómputo a aquellos directores con sueldo NULL*/

SELECT TRUNCATE(SUM(sueldo)/COUNT(*),2) FROM directores;

-- Source - https://stackoverflow.com/a/41887627
-- Posted by Dhanu Kanakala, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-02-25, License - CC BY-SA 4.0


SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


SELECT columnas FROM tabla1, tabla2 
WHERE tabla1.columna = tabla2.columna AND condiciones;

/*Obtén el apellido de los empleados, el nombre de su departamento y 
la localidad donde trabajan, pero solo de aquellos que ganan más de 2000€*/

SELECT e.apellido, d.dnombre, d.localidad FROM empleados e, departamentos d 
WHERE e.dep_no = d.dep_no AND e.salario > 2000;


SELECT columnas FROM tabla1 INNER JOIN tabla2 
ON tabla1.columna = tabla2.columna WHERE condiciones;

/*Obtén el apellido de los empleados, el nombre de su departamento y 
la localidad donde trabajan, pero solo de aquellos que ganan más de 2000€ */

SELECT e.apellido, d.dnombre, d.localidad FROM empleados e 
INNER JOIN departamentos d ON e.dep_no = d.dep_no 
WHERE e.salario > 2000;

SELECT e.emp_no, e.apellido 
FROM empleados e 
INNER JOIN departamentos d ON e.dep_no = d.dep_no  ← SOLO la RELACIÓN
WHERE d.dnombre = 'VENTAS';                          ← FILTRO en WHERE



SELECT e.emp_no, e.apellido 
FROM empleados e 
INNER JOIN departamentos d ON d.dnombre = "VENTAS" AND e.dep_no != d.dep_no;
       ↑                              ↑                           ↑
    RELACIÓN?                        NO                        NO
                                   Esto es un              Esto es un
                                   FILTRO                  FILTRO




1. ON:  Tabla A ──(PK=FK)── Tabla B  ← Se CONECTAN
2. JOIN:   │_________│_________│      ← Se CONSTRUYE
3. WHERE:  │    │    │    │    │      ← Se FILTRA
           └────┴────┴────┴────┘



-- CASO 1: SELECT solo de una tabla (departamentos)
SELECT d.dep_no, d.dnombre     ← Solo datos de departamentos
FROM departamentos d
JOIN empleados e ON e.dep_no = d.dep_no;
-- Resultado: Repite departamentos 9 veces (una por cada empleado)
-- ¿Tiene sentido? NO, porque no muestro los empleados
-- SOLUCIÓN: DISTINCT



-- CASO 2: SELECT de ambas tablas
SELECT d.dep_no, d.dnombre,     ← Datos de departamentos
       e.apellido                ← Datos de empleados
FROM departamentos d
JOIN empleados e ON e.dep_no = d.dep_no;
-- Resultado: 9 filas, cada empleado con su departamento
-- ¿Tiene sentido? SÍ, cada fila es un empleado con su depto
-- SOLUCIÓN: NO DISTINCT (así debe ser)




10 CONTAB (2 veces) ──┐
20 INVEST (3 veces) ──┤→ Sin sentido
30 VENTAS (4 veces) ──┘  (no mostramos empleados)


SIN DISTINCT:    [10][10][20][20][20][30][30][30][30]
                  └──┘  └────┘  └────────┘
                  CONTAB INVEST    VENTAS


SELECT DISTINCT d.dep_no, d.dnombre
FROM departamentos d
JOIN empleados e ON d.dep_no = e.dep_no;

CON DISTINCT:    [10]   [20]       [30]
                  └──┘   └────┘     └────────┘
                  CONTAB INVEST      VENTAS

RESULTADO FINAL:
┌─────────────┐
│10│CONTAB    │
│20│INVEST    │
│30│VENTAS    │
└─────────────┘


Cada fila = UN EMPLEADO con los datos de SU DEPARTAMENTO
     ↑                      ↑
  (se repite)            (único por fila)


CASO 1 (solo deptos) → SELECT + JOIN = REPETICIÓN → necesita DISTINCT
CASO 2 (deptos + emp) → SELECT + JOIN = CADA FILA ES ÚNICA → NO DISTINCT


SIN DISTINCT:


                 [10-SMITH][10-JONES][20-SCOTT][20-ADAMS][20-FORD][30-ALLEN][30-WARD][30-MARTIN][30-TURNER]
                      │          │        │         │       │        │       │        │          │
                 CADA FILA ES ÚNICA (empleado diferente)
                      │          │        │         │       │        │       │        │          │
10 CONTAB (2 veces) ──┘          │        │         │       │        │       │        │          │
20 INVEST (3 veces) ─────────────┴────────┴─────────┘       │        │       │        │          │
30 VENTAS (4 veces) ────────────────────────────────────────┴────────┴───────┴────────┴──────────┘
                      (departamentos repetidos)
                                    +
                      (empleados ÚNICOS en cada fila)



1. ON (Conectar)
   d.dep_no = e.dep_no
   ┌─────┐        ┌─────┐
   │ 10  │────────│ Smith│
   │ 10  │────────│ Jones│
   │ 20  │────────│ Scott│
   │ 20  │────────│ Adams│
   │ 20  │────────│ Ford │
   │ 30  │────────│ Allen│
   │ 30  │────────│ Ward │
   │ 30  │────────│Martin│
   │ 30  │────────│Turner│
   └─────┘        └─────┘

2. JOIN + SELECT (Resultado final)
   ┌─────────────────────────────┐
   │dep_no│dnombre │apellido      │
   ├─────────────────────────────┤
   │ 10   │CONTAB  │Smith         │ ← Fila 1: empleado Smith
   │ 10   │CONTAB  │Jones         │ ← Fila 2: empleado Jones
   │ 20   │INVEST  │Scott         │ ← Fila 3: empleado Scott
   │ 20   │INVEST  │Adams         │ ← Fila 4: empleado Adams
   │ 20   │INVEST  │Ford          │ ← Fila 5: empleado Ford
   │ 30   │VENTAS  │Allen         │ ← Fila 6: empleado Allen
   │ 30   │VENTAS  │Ward          │ ← Fila 7: empleado Ward
   │ 30   │VENTAS  │Martin        │ ← Fila 8: empleado Martin
   │ 30   │VENTAS  │Turner        │ ← Fila 9: empleado Turner
   └─────────────────────────────┘


SÍ TIENE SENTIDO porque:
[10][10]     = CONTAB aparece 2 veces pero CADA UNA es un empleado DISTINTO
[20][20][20] = INVEST aparece 3 veces pero CADA UNA es un empleado DISTINTO  
[30][30][30][30] = VENTAS aparece 4 veces pero CADA UNA es un empleado DISTINTO

CADA CORCHETE = UNA FILA = UN EMPLEADO con su DEPARTAMENTO



CASO 1 (solo deptos):  [10][10][20][20][20][30][30][30][30] → ❌ SIN SENTIDO
                        └──┘  └────┘  └────────┘
                        (solo deptos repetidos, no hay empleados)

CASO 2 (deptos + emp): [10][10][20][20][20][30][30][30][30] → ✅ CON SENTIDO
                        └─┬┘  └─┬┘  └─┬┘  └──────┬──────┘
                         Smith Jones Scott...   Turner
                        (cada repetición tiene un empleado ÚNICO)


                        