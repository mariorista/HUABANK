

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String connectionURL =
    "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
    Connection connection = null;
    Statement statement = null;
    String afm = (String)session.getAttribute("afmInfo");
%>
<html>
    <body>
     <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        statement.executeUpdate("DELETE FROM ACTOR " +
             "WHERE AFM='"+afm+"';");
        out.println("H διαγραφη επετεύχθει. ");
      %>
      Επιστροφή στην <a href="admin.jsp">admin page</a>
    </body>
</html>
