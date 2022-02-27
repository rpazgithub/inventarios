# inventarios
La aplicacion fue creada con Maven, JSP y se introdujo bootstrap 4.3

Consta de los siguientes archivos:

index.jsp: Visualiza un listado de todos los productos con las opciones para crear, editar y eliminar.

create.jsp: para la creacion de productos

delete.jsp: realiza la eliminacion de productos

edit.jsp: Permite la edicion de un producto

El nombre de la base de datos es "inventario" y tiene una tabla llamada productos, fue creada en MySQL con PHPMyAdmin, el script de creacion de la tabla de datos es:

create table usuarios (
     id int auto_increment,
	 nombre varchar(30) not null,
	 referencia varchar(10) not null,
     precio int not null,
     peso int not null,
     categoria varchar(20) not null,
     stock int not null,
     fecha date not null,
     primary key(id)
);

La conexion a la base de datos, en cada archivo se realiza con:

Class.forName("com.mysql.jdbc.Driver");
miConexion = DriverManager.getConnection("jdbc:mysql://localhost/inventario?user=root&password=mysql2022");
nuevoStatement = miConexion.createStatement();

Se debe poner el valor adecuado para user y password

Debido a cambios a ultima hora en mi actual trabajo, no me alcanzó el tiempo para terminar todo el ejercicio. Quedando por resolver los siguientes puntos:

Pendientes:
Realizar modulo para venta de productos y sus respectivas consultas (stock maximo y ventas maximas)

Se debe realizar el llenado del campo fecha desde Java y no por el usuario, esto evita errores de digitacion, al crear y actualizar un producto, no deberia permitirse al usuario
cambiar la fecha.

Realizar validaciones a los campos, por tipo de dato y otros criterios.

Realizar mejoras al diseño visual.

Realizar diferentes tipos de pruebas, funcionamiento, rendimiento, etc

