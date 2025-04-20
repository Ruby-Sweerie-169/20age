<%-- 
    Document   : adicionar_carrinho2
    Created on : 21/10/2024, 16:24:16
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
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar ao Carrinho</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-md rounded-lg p-8 w-full max-w-md text-center">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Adicionar ao Carrinho</h1>
        <%
            int id_artigo = Integer.parseInt(request.getParameter("id_artigo"));
            int qtd = Integer.parseInt(request.getParameter("qtd"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
            String sql = "INSERT INTO carrinho (username, id_artigo, qtd) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, id_artigo);
            statement.setInt(3, qtd);

            int rowsInserted = statement.executeUpdate();
        %>
        <%
            if (rowsInserted > 0) {
                out.println("<h2 class='text-green-600 font-semibold'>Artigo adicionado ao carrinho com sucesso!</h2>");
            } else {
                out.println("<h2 class='text-red-600 font-semibold'>Erro de comunicação com a base de dados!</h2>");
            }
            statement.close();
            conn.close();
        %>
        <input type="button" value="Continuar" onclick="window.open('menu.jsp','_self')"
               class="mt-6 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition duration-200">
    </div>
</body>
</html>
