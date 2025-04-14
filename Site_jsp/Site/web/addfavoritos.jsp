<%-- 
    Document   : addfavoritos
    Created on : 19/10/2024, 10:32:31
    Author     : ruimo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Adcionar aos favoritos</h1>
        <%
        int id_artigo=Integer.parseInt(request.getParameter("id_artigo"));
        Class.forName("com.mysql.jdbc.Driver");
        // a seguir coloco o servidor da bd, user e pass
        Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02","root","");
        String sql = "INSERT INTO favoritos(username, id_artigo)"
            + "VALUES (?,?)";
        PreparedStatement statement=conn.prepareStatement(sql);
        statement.setString(1,username );
        statement.setInt(2,id_artigo );

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted>0)
            out.println("<h2>Artigo adicionado aos favoritos!</h2>");
        else
            out.println("<h2>Erro de comunicação com a base de dados!</h2>");
        statement.close();
        conn.close();
        %>
        <input type="button" value="Continuar" onclick="window.open('menu.jsp','_self')">
    </body>
</html>
