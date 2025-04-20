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
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Remover dos Favoritos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-md rounded-lg p-8 max-w-md w-full text-center">
        <h1 class="text-2xl font-bold text-gray-800 mb-4">Remover dos Favoritos</h1>
        <%
            int id_artigo = Integer.parseInt(request.getParameter("id_artigo"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
            String sql = "DELETE FROM favoritos WHERE username=? AND id_artigo=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, id_artigo);

            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
        %>
            <p class="text-green-600 font-medium mb-6">✔️ Artigo removido dos favoritos com sucesso!</p>
        <%
            } else {
        %>
            <p class="text-red-600 font-medium mb-6">❌ Erro ao remover o artigo da base de dados.</p>
        <%
            }
            statement.close();
            conn.close();
        %>
        <button onclick="window.location.href='ver_favoritos.jsp'" class="mt-4 px-6 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition duration-200">
            Ver Favoritos
        </button>
    </div>
</body>
</html>
