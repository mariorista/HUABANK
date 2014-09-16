
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
String fromAccountCust = request.getParameter("fromAccount");
String toAccountCust = request.getParameter("toAccount");

String []IDs = (String[])session.getAttribute("arrayIDs");
String []amounts = (String[])session.getAttribute("arrayBal");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer</title>
    </head>
    <body>
        <%
        int indexFrom = -1;
        for ( int i=0; i<10; i++ )
        {
              if ( IDs[i].equals(fromAccountCust) ){
                  indexFrom = i;
                  break;
              }
        }
        int indexTo = -1;
        for ( int i=0; i<10; i++ )
        {
              if ( IDs[i].equals(toAccountCust) ){
                  indexTo = i;
                  break;
              }
        }

        if ( indexTo != -1 || indexFrom != -1 ){

             Class.forName("com.mysql.jdbc.Driver").newInstance();
             connection = DriverManager.getConnection(connectionURL);
             statement = connection.createStatement();
             rs = statement.executeQuery("SELECT * FROM ACTOR WHERE PASSWORD='"+passCust+"'");

             if ( rs.next() ){
                Double amountfrom = Double.parseDouble(amounts[indexFrom]);
                Double amountTo = Double.parseDouble(amounts[indexTo]);
                Double howMuch = Double.parseDouble(howmuch);

                if( amountfrom >= howMuch ){
                    amountfrom = amountfrom-howMuch;
                    amountTo = amountTo + howMuch;
                }
                else{
                     %>
                     <jsp:forward page="error.jsp"/>
              <%}

                statement.executeUpdate("UPDATE HasACCOUNT SET accBALANCE='"+amountfrom+"'WHERE AccID='"+fromAccountCust+"';");
                statement.executeUpdate("UPDATE HasACCOUNT SET accBALANCE='"+amountTo+"'WHERE AccID='"+toAccountCust+"';");
                statement.executeUpdate("INSERT INTO TRANSACTION  VALUES ('WITHDRAW', CURRENT_TIMESTAMP,'"+fromAccountCust+"','"+afmCust+"',"+howMuch+" );");
                statement.executeUpdate("INSERT INTO TRANSACTION  VALUES ('DEPOSIT', CURRENT_TIMESTAMP,'"+toAccountCust+"','"+afmCust+"',"+howMuch+" );");
                out.print("H μεταφορά χρημάτων επετεύχθει.");
                if (session.getAttribute("typeCheck").equals("t")){%>
                    <a href="teller.jsp">Επιστροφή</a>
              <%}
                if (session.getAttribute("typeCheck").equals("s")){%>
                      <a href="superTeller.jsp">Επιστροφή</a>
              <%}

             }

        }%>
    </body>
</html>

