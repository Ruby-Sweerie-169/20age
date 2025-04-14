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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h2>Bem-vindo <%= username %>!</h2>
         <h3>Itens existentes no carrinho</h3>
    <form action="LogoutServlet.jsp" method="post">
        <input type="submit" value="Logout">
         </form>
        <%
            float total=0, total_final=0;
            Class.forName("com.mysql.jdbc.Driver");
            // a seguir coloco o servidor da bd, user e pass
            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_02","root","");
            Statement stm = conn.createStatement();
            PreparedStatement pstmt = null;
            String sql = "SELECT * FROM carrinho, artigo WHERE username = ? AND carrinho.id_artigo=artigo.id";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            %>
            <table border="1">
                <tr>
                    <th>Artigo</th>
                    <th>Preço</th>
                    <th>Quantidade</th>
                    <th>Total</th>
                    <th>Ação</th>
                </tr>

            <%
            while (rs.next()){
            total=rs.getInt("preco")*rs.getInt("qtd");
            total_final=total_final+total;
            %>
                <tr>
                    <td><%=rs.getString("descr") %></td>
                    <td><%=rs.getInt("preco") %> €</td>
                    <td><%=rs.getInt("qtd") %> </td>
                    <td><%=total %></td>
                    <td><form action="removecarrinho.jsp" target="_self" method="post">
                            <input type="hidden" name="id_artigo" value="<%=rs.getInt("id_artigo")%>">
                            <input type="submit" value="Remover">
                        </form></td>
                </tr> 
            <%
            }
            %>
            <tr>
                <td colspan="3">Total do carrinho</td>
                <td colspan="2"><%=total_final %> €</td>
            </tr>
         </table>       
            
            <input type="button" value="Finalizar compra" onclick="window.open('finaliza.jsp','_self')">
    </body>
</html>
