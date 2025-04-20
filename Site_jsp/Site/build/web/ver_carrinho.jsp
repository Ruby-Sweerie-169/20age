<%-- 
    Document   : ver_carrinho
    Created on : 21/10/2024, 16:28:32
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
    <title>Carrinho de Compras</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

    <!-- Navbar -->
    <nav class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex-shrink-0 flex items-center">
                    <h2 class="text-xl font-semibold text-gray-800">Olá, <%= username %>!</h2>
                </div>
                <div class="md:hidden flex items-center">
                    <button id="mobile-menu-button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-500">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </button>
                </div>
                <div class="hidden md:flex md:items-center md:space-x-4">
                    <a href="ver_favoritos.jsp" class="px-3 py-2 rounded-md text-sm font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">Favoritos</a>
                    <a href="ver_carrinho.jsp" class="px-3 py-2 rounded-md text-sm font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">Carrinho</a>
                    <a href="LogoutServlet.jsp" class="px-3 py-2 rounded-md text-sm font-medium text-white bg-red-600 hover:bg-red-700">Logout</a>
                </div>
            </div>
        </div>
        <div id="mobile-menu" class="hidden md:hidden bg-white border-t border-gray-200">
            <div class="px-2 pt-2 pb-3 space-y-1">
                <a href="ver_favoritos.jsp" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">Favoritos</a>
                <a href="ver_carrinho.jsp" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">Carrinho</a>
                <a href="LogoutServlet.jsp" class="block px-3 py-2 rounded-md text-base font-medium text-red-600 hover:text-red-800">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Conteúdo Carrinho -->
    <div class="bg-white shadow-md rounded-lg p-8 w-full max-w-4xl mx-auto mt-6">
        <h3 class="text-xl text-gray-700 mb-6">Itens no Carrinho</h3>
        
        <%
            float total = 0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
            String sql = "SELECT * FROM carrinho, artigo WHERE username = ? AND carrinho.id_artigo=artigo.id";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
        %>

        <div class="overflow-x-auto">
            <table class="min-w-full table-auto border border-gray-200">
                <thead>
                    <tr class="bg-gray-100 text-left text-sm font-medium text-gray-700">
                        <th class="px-4 py-2 border-b">Descrição</th>
                        <th class="px-4 py-2 border-b">Quantidade</th>
                        <th class="px-4 py-2 border-b">Subtotal</th>
                        <th class="px-4 py-2 border-b">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                            String id = rs.getString("id");
                            String descr = rs.getString("descr");
                            int quantidade = rs.getInt("qtd");
                            float preco = rs.getFloat("preco");
                            float subtotal = preco * quantidade;
                            total += subtotal;
                    %>
                    <tr class="bg-white hover:bg-gray-50 text-sm text-gray-800">
                        <td class="px-4 py-2 border-b"><%= descr %></td>
                        <td class="px-4 py-2 border-b"><%= quantidade %></td>
                        <td class="px-4 py-2 border-b">€ <%= String.format("%.2f", subtotal) %></td>
                        <td class="px-4 py-2 border-b">
                            <form action="removecarrinho.jsp" method="post">
                            <input type="hidden" name="id_artigo" value="<%=rs.getInt("id_artigo")%>">
                            <input type="submit" value="Remover" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 transition duration-200 cursor-pointer">
                            </form>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="flex justify-between mt-6 border-t pt-4 text-gray-800">
            <span class="font-semibold text-xl">Total: € <%= String.format("%.2f", total) %></span>
            <a href="finalizarcompra.jsp" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Finalizar Compra</a>
        </div>
    </div>

    <script>
        document.getElementById('mobile-menu-button').addEventListener('click', function () {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
        });
    </script>

</body>
</html>




