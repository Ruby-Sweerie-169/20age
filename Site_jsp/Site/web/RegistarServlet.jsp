<%-- 
    Document   : RegistarServlet
    Created on : 14/04/2025, 14:42:57
    Author     : Ruby_Sweetie_169
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    // Dados do formulário
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String tlm = request.getParameter("tlm");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Hashear a password
    String hashedPassword = hashPassword(password);

    // Dados da base de dados
    String url = "jdbc:mysql://localhost:3306/bd_02";
    String user = "root";
    String pass = ""; // coloca a tua password se tiveres

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        String sql = "INSERT INTO users (nome, email, tlm, username, password) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.setString(2, email);
        stmt.setString(3, tlm);
        stmt.setString(4, username);
        stmt.setString(5, hashedPassword);

        int rows = stmt.executeUpdate();

        if (rows > 0) {
%>
            <script>
                alert("Utilizador registado com sucesso!");
                window.location.href = "index.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Erro ao registar utilizador.");
                window.history.back();
            </script>
<%
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
    } finally {
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
