

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    String connectionURL =
    "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
    Connection connection = null;
    Statement statement = null;
    Statement statement2 = null;
    ResultSet rs = null;
%>
<html>
    <head>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT accID FROM HasAccount WHERE AMOUNT=0;");
        while ( rs.next() ){
            statement2.executeUpdate("UPDATE ACCOUNT SET ClDATE=CURRENT_TIMESTAMP"
                    + " WHERE ACCOUNTID='"+rs.getString("accID")+"';");
        }
        out.print("Οι λογαριασμοί ενημερώθηκαν. ");
        %>
    <a href="superTeller.jsp">Επιστροφή</a>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
