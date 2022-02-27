<%-- 
    Document   : delete
    Created on : 27/02/2022, 10:32:41 a. m.
    Author     : Ruben
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection miConexion = null;
            Statement nuevoStatement = null;
            
            try 
            {
                    Class.forName("com.mysql.jdbc.Driver");
                    miConexion = DriverManager.getConnection("jdbc:mysql://localhost/inventario?user=root&password=mysql2022");
                    nuevoStatement = miConexion.createStatement();
                    nuevoStatement.executeUpdate("delete from `productos` where id='"+request.getParameter("id")+"';");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            catch(Exception e)
            {
                out.print(e);
            }
                                
            
            
        %>
    </body>
</html>
