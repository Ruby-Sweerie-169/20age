<%-- 
    Document   : finalizarcompra
    Created on : 20/04/2025, 17:22:04
    Author     : Ruby_Sweetie_169
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
    <title>Compra Finalizada</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-md rounded-lg p-8 max-w-md w-full text-center">
        <h1 class="text-2xl font-bold text-gray-800 mb-4">Compra Finalizada ✅</h1>
        <p class="text-green-600 font-medium mb-6">A sua compra foi concluída com sucesso! Obrigado pela preferência. 💙</p>
        <button onclick="window.location.href='menu.jsp'" class="mt-4 px-6 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition duration-200">
            Voltar ao Menu
        </button>
    </div>
</body>
</html>

