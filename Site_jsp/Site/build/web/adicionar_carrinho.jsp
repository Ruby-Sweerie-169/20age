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
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar ao Carrinho</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <%
        int id_artigo = Integer.parseInt(request.getParameter("id_artigo"));
    %>
    <div class="bg-white shadow-md rounded-lg p-8 w-full max-w-md text-center">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Adicionar ao Carrinho</h1>
        <form action="adicionar_carrinho2.jsp" method="get" class="space-y-4">
            <input type="hidden" name="id_artigo" value="<%= id_artigo %>">

            <label for="qtd" class="block text-gray-700 text-left">Quantidade a adicionar:</label>
            <input type="number" name="qtd" id="qtd" min="1" required
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400">

            <input type="submit" value="Adicionar"
                   class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition duration-200">
        </form>
    </div>
</body>
</html>

