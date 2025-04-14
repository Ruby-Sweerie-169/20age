<%-- 
    Document   : adionar_carrinho
    Created on : 21/10/2024, 16:17:37
    Author     : ruimo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
        <%
        int id_artigo=Integer.parseInt(request.getParameter("id_artigo"));
        %>
        <h1>Adcionar ao carrinho</h1>
        <form action="adicionar_carrinho2.jsp">
            Qual a quantidade a adicionar:<br>
            <input type="hidden" name="id_artigo" value="<%= id_artigo%>"><br>
            <input type="number" name="qtd"><br>
            <input type="submit" value="Adicionar">
        </form>
    </body>
</html>
