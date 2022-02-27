<%-- 
    Document   : create
    Created on : 26/02/2022, 11:30:57 p. m.
    Author     : Ruben
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Crear productos</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <form action="create.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="referencia">Referencia</label>
                            <input type="text" class="form-control" id="referencia" name="referencia" placeholder="Referencia del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="precio">Precio</label>
                            <input type="text" class="form-control" id="precio" name="precio" placeholder="Precio del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="peso">Peso</label>
                            <input type="text" class="form-control" id="peso" name="peso" placeholder="Peso del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="categoria">Categoria</label>
                            <input type="text" class="form-control" id="categoria" name="categoria" placeholder="Categoria del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="cantidad">Cantidad</label>
                            <input type="text" class="form-control" id="cantidad" name="cantidad" placeholder="Cantidad de producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="fecha">Fecha</label>
                            <input type="text" class="form-control" id="fecha" name="fecha" placeholder="Fecha del dia" required="required">

                        </div>
                        <button type="submit" name="crear" class="btn btn-primary">Crear</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("crear") != null)
            {
                String nombre = request.getParameter("nombre");
                String referencia = request.getParameter("referencia");
                String precio = request.getParameter("precio");
                String peso = request.getParameter("peso");
                String categoria = request.getParameter("categoria");
                String cantidad = request.getParameter("cantidad");
                String fecha = request.getParameter("fecha");
                
                try {
                        Connection miConexion = null;
                        Statement nuevoStatement = null;
                        ResultSet nuevoResultSet = null;
                        //
                        Class.forName("com.mysql.jdbc.Driver");
                        miConexion = DriverManager.getConnection("jdbc:mysql://localhost/inventario?user=root&password=mysql2022");
                        nuevoStatement = miConexion.createStatement();
                        nuevoStatement.executeUpdate("insert into productos (nombre, referencia, precio, peso, categoria, stock, fecha) values ('"+nombre+"','"+referencia+"','"+precio+"','"+peso+"','"+categoria+"','"+cantidad+"','"+fecha+"');");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        
                }
                catch(Exception e){
                    out.print(e);
                }
                
            }
        %>
    </body>
</html>
