
<%@ page import="java.sql.*" %>
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

String afmCust = (String)session.getAttribute("afmCust");
String passCust = request.getParameter("pass");
String howmuch = request.getParameter("poso");
String accountCust = request.getParameter("account");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdraw</title>
    </head>
    <body>
        
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        statement2 = connection.createStatement();
        rs = statement.executeQuery("SELECT HAS.accBALANCE FROM HasACCOUNT HAS " +
                "JOIN ACTOR ACT ON HAS.ActAFM=ACT.AFM 	" +
                "WHERE ACT.PASSWORD='"+passCust+"' AND HAS.AccID='"+accountCust+"' AND ACT.AFM='"+afmCust+"';");
        ResultSet rs2 = null;
        if ( rs.next() ){

           rs2 = statement2.executeQuery("SELECT * FROM ACCOUNT " +
                "WHERE ACCOUNTID='"+accountCust+"';");
           if ( rs2.next() ){
               if ( rs2.getString("TYPE").equals("r") && session.getAttribute("typeCheck").equals("t") ){
                   %><jsp:forward page="permission.jsp"/><%
               }
               Double balance = rs.getDouble("accBALANCE");
               Double some = Double.parseDouble(howmuch);

               if( balance >= some ){
                     if ( some >= 100000 ){
                         //do something
                     }
                     balance = balance-some;

               }
               else{
                      %><jsp:forward page="error.jsp"/>
             <%}
               statement2.executeUpdate("UPDATE HasACCOUNT SET accBALANCE='"+balance+"' WHERE AccID='"+accountCust+"';");
               statement2.executeUpdate("INSERT INTO TRANSACTION " +
                       "VALUES('WITHDRAW', CURRENT_TIMESTAMP, '"+accountCust+"', '"+afmCust+"',"+some+");");
               out.println("H ανάληψη επετεύχθει. ");
               if ( session.getAttribute("typeCheck").equals("t") ){%>
                    <a href="teller.jsp">Επιστροφή</a>
             <%}
               else if ( session.getAttribute("typeCheck").equals("s") ){%>
                    <a href="superTeller.jsp">Επιστροφή</a>
            <%}
          }
       }
       else{
         %><jsp:forward page="tellerActions.jsp"/><%
       }%>
    </body>
</html>
