--Uso la base de datos bd2
use bd2

--1.	Escriba una consulta que muestre el apellido y la fecha de contratación de cualquier empleado que trabaje en el mismo departamento 
-- que Zlotkey. Excluya a Zlotkey.
select EMPLEADO_APELLIDO,EMPLEADO_FECING, DEPT_ID
from empleados
where DEPT_ID = 80 and EMPLEADO_APELLIDO != 'Zlotkey'

--2.	Cree una consulta para mostrar los números de empleado y los apellidos de todos los empleados que ganen más que el salario medio de 
-- la empresa. Ordene los resultados por salario en orden ascendente.
select EMPLEADO_ID, EMPLEADO_APELLIDO, EMPLEADO_SALARIO
from empleados
where EMPLEADO_SALARIO>(select AVG(EMPLEADO_SALARIO) from empleados)
order by EMPLEADO_SALARIO asc

--3.	Escriba una consulta que muestre los números de empleado y apellidos de todos los empleados, que trabajen en algún departamento que 
-- tenga un empleado cuyo apellido contenga una u. Guarde la sentencia SQL en un archivo de texto llamado lab6_3.sql. 
select EMPLEADO_ID, EMPLEADO_APELLIDO
from empleados
where DEPT_ID in (select DEPT_ID from empleados where EMPLEADO_APELLIDO like '%u%')

--4.	Muestre el apellido, el número de departamento y el identificador de cargo de todos los empleados que trabajan en departamentos cuyos 
-- identificadores de ubicación (loc_id) sea 1700.
select EMPLEADO_APELLIDO, EMPLEADO_ID, LOC_ID
from empleados e
inner join departamentos d
on e.DEPT_ID = d.DEPT_ID
where LOC_ID = 1700

--5.	Muestre el apellido y el salario de todos los empleados que informen a Rey.
select EMPLEADO_APELLIDO, EMPLEADO_SALARIO
from empleados
where MANAGER_ID = any(select EMPLEADO_ID from empleados where EMPLEADO_APELLIDO= 'Rey')

--6.	Muestre el número de departamento, el apellido y el identificador de cargo de todos los empleados del departamento Ejecutivos.
select DEPT_ID, EMPLEADO_APELLIDO, TRABAJO_ID
from empleados
where DEPT_ID in (select DEPT_ID from departamentos where DEPT_NOM ='Ejecutivos')


