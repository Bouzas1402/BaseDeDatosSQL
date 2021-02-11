1. Mostrar toda la información de la tabla empleado

SELECT * FROM empleado;

2. Mostrar códigos de departamento distintos de la tabla empleado

SELECT DISTINCT codigo_departamento FROM empleado;


3. Listar los empleados en el orden ascendente de sus salarios. 

SELECT codigo_empleado,salario_base_empleado FROM empleado ORDER BY salario_base_empleado DESC;

4. Muestra el nombre y fecha de nacimiento de todos los empleados. 

SELECT codigo_empleado,nombre_empleado,fecha_nacimiento_empleado FROM empleado;

5. Muestre los nombres de todos los empleados que trabajan en FINANZAS y reciben un
salario de más de 1500. 

SELECT * FROM empleado WHERE codigo_departamento = 130 AND salario_base_empleado > 1500;

6. Muestre el número y el nombres de los empleados que ganan comisiones

SELECT * FROM empleado WHERE comision_empleado IS NOT NULL;


7. Mostrar el nombre de los empleados que no ganan ninguna comisión. 

SELECT * FROM empleado WHERE comision_empleado IS NULL;


8. Muestre el nombre de los empleados que trabajan como FINANZAS,
ORGANIZACION o PROCESO DE DATOS y su salario más de 3000.
 
SELECT * FROM empleado WHERE codigo_departamento = 130 OR codigo_departamento = 120 OR codigo_departamento = 122 AND salario_base_empleado > 3000;

9. Muestre la lista de empleados que se han unido a la empresa antes del 30 de junio de
1.990 o después del 31 de diciembre de 1.997.

SELECT * FROM empleado WHERE fecha_ingreso_empleado < '1990-05-30' OR fecha_ingreso_empleado > '1997-12-31';


10. Mostrar la fecha actual.

SELECT CURRENT_DATE;

11. Listado de los detalles de los empleados en orden ascendente de los departamentos y
descendiente de la fecha de ingreso. 