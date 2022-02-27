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
        <title>Editar productos</title>
    </head>
    <body>
        <%
                String id = request.getParameter("id");
                String nombre = request.getParameter("nombre");
                String referencia = request.getParameter("referencia");
                String precio = request.getParameter("precio");
                String peso = request.getParameter("peso");
                String categoria = request.getParameter("categoria");
                String cantidad = request.getParameter("cantidad");
                String fecha = request.getParameter("fecha");
            
        %>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <form action="edit.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="referencia">Referencia</label>
                            <input type="text" class="form-control" id="referencia" value="<%= referencia%>" name="referencia" placeholder="Referencia del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="precio">Precio</label>
                            <input type="text" class="form-control" id="precio" value="<%= precio%>" name="precio" placeholder="Precio del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="peso">Peso</label>
                            <input type="text" class="form-control" id="peso" value="<%= peso%>" name="peso" placeholder="Peso del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="categoria">Categoria</label>
                            <input type="text" class="form-control" id="categoria" value="<%= categoria%>" name="categoria" placeholder="Categoria del producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="cantidad">Cantidad</label>
                            <input type="text" class="form-control" id="cantidad" value="<%= cantidad%>" name="cantidad" placeholder="Cantidad de producto" required="required">

                        </div>
                        <div class="form-group">
                            <label for="fecha">Fecha</label>
                            <input type="text" class="form-control" id="fecha" value="<%= fecha%>" name="fecha" placeholder="Fecha del dia" required="required">

                        </div>
                            <a href="index.jsp" class="btn btn-danger">Cancelar</a>    
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar</button>
                        <input type="hidden" name="id" value="<%= id%>">
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null)
            {
               
                
                try {
                        Connection miConexion = null;
                        Statement nuevoStatement = null;
                        //ResultSet nuevoResultSet = null;
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        miConexion = DriverManager.getConnection("jdbc:mysql://localhost/inventario?user=root&password=mysql2022");
                        nuevoStatement = miConexion.createStatement();
                        nuevoStatement.executeUpdate("update productos set nombre='" + nombre + "',referencia='" + referencia + "',precio='" + precio + "',peso='" + peso + "',categoria='" + categoria + "',stock='" +cantidad+ "',fecha='" + fecha + "' where id='" + id + "';");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        
                }
                catch(Exception e){
                    out.print(e);
                }
                
            }
        %>
    </body>
</html>
