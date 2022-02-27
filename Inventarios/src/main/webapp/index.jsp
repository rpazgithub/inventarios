<%-- 
    Document   : index
    Created on : 26/02/2022, 9:06:44 p. m.
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
        <title>Lista de Productos</title>
    </head>
    <body>
        <%
            Connection miConexion = null;
            Statement nuevoStatement = null;
            ResultSet nuevoResultSet = null;
            
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h2>Lista de productos</h2></th>
                                <th scope="col" colspan="7"><a href="create.jsp" class="text-right">Crear</a></th>
                                
                            </tr>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Referencia</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Peso</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Fecha</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                Class.forName("com.mysql.jdbc.Driver");
                                miConexion = DriverManager.getConnection("jdbc:mysql://localhost/inventario?user=root&password=mysql2022");
                                nuevoStatement = miConexion.createStatement();
                                nuevoResultSet  = nuevoStatement.executeQuery("SELECT * FROM `productos`;");
                                
                                while(nuevoResultSet.next())
                                {
                                    %>
                                        <tr>
                                            <th scope="row"><%= nuevoResultSet.getString(1)%></th>
                                            <td><%= nuevoResultSet.getString(2)%></td>
                                            <td><%= nuevoResultSet.getString(3)%></td>
                                            <td><%= nuevoResultSet.getString(4)%></td>
                                            <td><%= nuevoResultSet.getString(5)%></td>
                                            <td><%= nuevoResultSet.getString(6)%></td>
                                            <td><%= nuevoResultSet.getString(7)%></td>
                                            <td><%= nuevoResultSet.getString(8)%></td>
                                            <td><a href="edit.jsp?id=<%= nuevoResultSet.getString(1)%>&nombre=<%= nuevoResultSet.getString(2)%>&referencia=<%= nuevoResultSet.getString(3)%>&precio=<%= nuevoResultSet.getString(4)%>&peso=<%= nuevoResultSet.getString(5)%>&categoria=<%= nuevoResultSet.getString(6)%>&cantidad=<%= nuevoResultSet.getString(7)%>&fecha=<%= nuevoResultSet.getString(8)%>">Editar</a></td>
                                            <td><a href="delete.jsp?id=<%= nuevoResultSet.getString(1)%>">Eliminar</a></td>
                                        </tr>
                                    <%
                                        }
                                }
                                catch (Exception e)
                                {
                                    out.print("Error de conexion " +e);
                                }
                            %>
                            
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
