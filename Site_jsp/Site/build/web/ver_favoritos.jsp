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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h2>Bem-vindo <%= username %>!</h2>
         <h3>Artigo Favoritos</h3>

        <%
            
            Class.forName("com.mysql.jdbc.Driver");
            // a seguir coloco o servidor da bd, user e pass
            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02","root","");
            Statement stm = conn.createStatement();
            PreparedStatement pstmt = null;
            String sql = "SELECT * FROM favoritos, artigo WHERE username = ? AND favoritos.id_artigo=artigo.id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            %>
            <table border="1">
                <tr>
                    <th>Artigo</th>
                    <th>Preço</th>
                    <th>Ação</th>
                </tr>
            <%
            while (rs.next()){
            %>
                <tr>
                    <td><%=rs.getString("descr") %></td>
                    <td><%=rs.getInt("preco") %> €</td>
                    <td><form action="removefavoritos.jsp" target="_self" method="post">
                            <input type="hidden" name="id_artigo" value="<%=rs.getInt("id_artigo")%>">
                            <input type="submit" value="Remover">
                        </form></td>
                </tr> 
            <%
            }
            %>
            
         </table>       
            
  
    </body>
</html>
