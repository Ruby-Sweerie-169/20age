<%-- 
    Document   : ver_favoritos
    Created on : 21/10/2024, 17:13:11
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meus Favoritos</title>
    <!-- Incluindo Tailwind CSS via CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
    <!-- Navbar responsiva com Tailwind -->
    <nav class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <!-- Logo/Mensagem de Boas-vindas à esquerda -->
                <div class="flex-shrink-0 flex items-center">
                    <h2 class="text-xl font-semibold text-gray-800">Olá, <%= username %>!</h2>
                </div>
                
                <!-- Menu mobile (aparece em telas pequenas) -->
                <div class="md:hidden flex items-center">
                    <button id="mobile-menu-button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-700 hover:text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-500">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </button>
                </div>
                
                <!-- Botões à direita (visíveis em telas médias/grandes) -->
                <div class="hidden md:flex md:items-center md:space-x-4">
                    <a href="menu.jsp" class="px-3 py-2 rounded-md text-sm font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">
                        <span class="flex items-center">
                            <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                            </svg>
                            Início
                        </span>
                    </a>
                    <a href="ver_carrinho.jsp" class="px-3 py-2 rounded-md text-sm font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">
                        <span class="flex items-center">
                            <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                            Carrinho
                        </span>
                    </a>
                    <a href="LogoutServlet.jsp" class="px-3 py-2 rounded-md text-sm font-medium text-white bg-red-600 hover:bg-red-700">
                        <span class="flex items-center">
                            <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                            </svg>
                            Logout
                        </span>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Menu mobile dropdown (aparece quando clicado no botão do menu mobile) -->
        <div id="mobile-menu" class="hidden md:hidden bg-white border-t border-gray-200">
            <div class="px-2 pt-2 pb-3 space-y-1">
                <a href="menu.jsp" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">
                    <span class="flex items-center">
                        <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                        </svg>
                        Início
                    </span>
                </a>
                <a href="ver_carrinho.jsp" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100">
                    <span class="flex items-center">
                        <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                        Carrinho
                    </span>
                </a>
                <a href="LogoutServlet.jsp" class="block px-3 py-2 rounded-md text-base font-medium text-red-600 hover:text-red-800">
                    <span class="flex items-center">
                        <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                        </svg>
                        Logout
                    </span>
                </a>
            </div>
        </div>
    </nav>

    <!-- Conteúdo principal - Lista de Favoritos -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800">Meus Favoritos</h2>
            <a href="menu.jsp" class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded-md text-gray-700 flex items-center">
                <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                </svg>
                Voltar
            </a>
        </div>
        
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02", "root", "");
                
                // Consulta para obter artigos favoritos do usuário
                PreparedStatement pstmt = conn.prepareStatement(
                    "SELECT * FROM artigo a  JOIN favoritos f ON a.id = f.id_artigo JOIN categorias c ON a.id_categoria=c.id WHERE f.username = ?"
                );
                pstmt.setString(1, username);
                ResultSet rs = pstmt.executeQuery();
                
                boolean temFavoritos = false;
                
                while (rs.next()) {
                    temFavoritos = true;
                    int idArtigo = rs.getInt("id");
                    String descr = rs.getString("descr");
                    String foto = rs.getString("foto");
                    String preco = rs.getString("preco");
                    String categoria = rs.getString("categoria");
            %>
                <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
                    <div class="p-2 bg-gray-100">
                        <img src="<%= foto %>" alt="<%= descr %>" class="w-full h-48 object-cover rounded">
                    </div>
                    <div class="p-4">
                        <div class="flex justify-between items-center mb-2">
                            <h3 class="text-lg font-semibold text-gray-800"><%= descr %></h3>
                            <span class="px-2 py-1 bg-gray-200 text-gray-700 text-xs rounded"><%= categoria %></span>
                        </div>
                        <p class="text-xl font-bold text-blue-600 mb-4"><%= preco %> €</p>
                        
                        <div class="flex flex-col space-y-2">
                            <form action="removefavoritos.jsp" method="post" class="w-full">
                                <input type="hidden" name="id_artigo" value="<%= idArtigo %>">
                                <button type="submit" class="w-full px-4 py-2 bg-red-100 text-red-600 rounded flex justify-center items-center hover:bg-red-200">
                                    <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                                    </svg>
                                    Remover dos favoritos
                                </button>
                            </form>
                            
                            <form action="adicionar_carrinho.jsp" class="w-full">
                                <input type="hidden" name="id_artigo" value="<%= idArtigo %>">
                                <button type="submit" class="w-full px-4 py-2 bg-blue-600 text-white rounded flex justify-center items-center hover:bg-blue-700">
                                    <svg class="h-5 w-5 mr-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                                    </svg>
                                    Adicionar ao carrinho
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            <% } 
               
               if (!temFavoritos) { 
            %>
                <!-- Exibido quando não há favoritos -->
                <div class="col-span-full flex flex-col items-center justify-center py-12">
                    <svg class="h-16 w-16 text-gray-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                    </svg>
                    <h3 class="mt-4 text-xl font-medium text-gray-700">Nenhum favorito encontrado</h3>
                    <p class="mt-2 text-gray-500">Você ainda não adicionou nenhum artigo aos favoritos.</p>
                    <a href="menu.jsp" class="mt-4 px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">
                        Explorar Categorias
                    </a>
                </div>
            <% }
               
               rs.close();
               pstmt.close();
               conn.close();
            %>
        </div>
    </div>

    <!-- Script para o menu mobile -->
        <script>
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
        });
    </script>
</body>
</html>
