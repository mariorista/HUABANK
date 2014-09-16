
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String connectionURL =
   "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;

String afmCust = (String)session.getAttribute("afmCust");
String passCust = request.getParameter("pass");
String howmuch = request.getParameter("poso");
String accountCust = request.getParameter("account");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deposit</title>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT HAS.accBALANCE FROM HasACCOUNT HAS " +
                "JOIN ACTOR ACT ON HAS.ActAFM=ACT.AFM 	" +
                "WHERE ACT.PASSWORD='"+passCust+"' AND HAS.AccID='"+accountCust+"' AND ACT.AFM='"+afmCust+"';");
        if ( rs.next() ){
           Double balance = rs.getDouble("accBALANCE");
           Double sin = Double.parseDouble(howmuch);
           balance = balance + sin;
           statement.executeUpdate("UPDATE HasACCOUNT SET accBALANCE='"+balance+"' WHERE AccID='"+accountCust+"';");
           statement.executeUpdate("INSERT INTO TRANSACTION " +
                   "VALUES('DEPOSIT', CURRENT_TIMESTAMP, '"+accountCust+"', '"+afmCust+"',"+sin+");");
           out.println("H κατάθεση επετεύχθει. ");
           if ( session.getAttribute("typeCheck").equals("t") ){%>
                <a href="teller.jsp">Επιστροφή</a>
         <%}
           else if ( session.getAttribute("typeCheck").equals("s") ){%>
                <a href="superTeller.jsp">Επιστροφή</a>
        <%}
        }
        %>
    </body>
</html>
