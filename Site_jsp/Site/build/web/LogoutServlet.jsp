<%-- 
    Document   : LogoutServlet
    Created on : 19/10/2024, 08:21:41
    Author     : ruimo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             
             if (session != null) {
            session.invalidate(); // Termina a sessão
        }
        response.sendRedirect("index.html"); // Redireciona para o login
            %>
        <h1>Hello World!</h1>
    </body>
</html>
