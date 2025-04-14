<%-- 
    Document   : LoginServlet
    Created on : 19/10/2024, 08:11:36
    Author     : ruimo
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.security.MessageDigest" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! 
    // Função utilitária para hashear a password com SHA-256
    public String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            return null;
        }
    }
%>
        <%
            // Função utilitária para hashear a password com SHA-256
    
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Usar a função hashPassword da classe PasswordUtils
        String hashedPassword = hashPassword(password);

        // Dados da base de dados
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbURL = "jdbc:mysql://localhost:3306/bd_02";
        String dbUser = "root";
        String dbPassword = "";

        try {
            // Carregar o MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Ligar à base de dados
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Verificar as credenciais do utilizador
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, hashedPassword); // Comparar com a password hasheada

            rs = pstmt.executeQuery();

            // Verifica se o utilizador existe na base de dados
            if (rs.next()) {
                // Cria a sessão para o utilizador logado
                session.setAttribute("username", username);
                %>
                <script type="text/javascript">
                    alert('Login com sucesso!');
                </script>
                <%
                // Redireciona para a área pessoal
                response.sendRedirect("menu.jsp");
            } else {
                // Dados errados
                request.setAttribute("errorMessage", "Utilizador ou senha errados");
                %>
                <script type="text/javascript">
                    alert('Utilizador ou senha errados. Tente novamente.');
                </script>
                <%
                request.getRequestDispatcher("index.html").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        %>
    </body>
</html>

