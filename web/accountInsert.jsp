
<%@page import="java.util.Random"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    String type = request.getParameter("type");
    String rate = request.getParameter("rate");
    String amount = request.getParameter("amount");
    String afm = (String)session.getAttribute("afmforAd");

    String connectionURL =
    "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
    Connection connection = null;
    Statement statement = null;
    int error = 0;
%>
<html>
    <body>
        <%
        Random random = new Random();
        long account =  0;
        String accountid = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        

        while ( error == 0 ){
            account =  11111 +random.nextInt(99999);
            accountid = String.valueOf(account);
            error = statement.executeUpdate( "INSERT INTO ACCOUNT "
                    + "VALUES('"+accountid+"', '"+type+"', '"+rate+"', 1, CURRENT_TIMESTAMP, null )");
        }

        statement.executeUpdate( "INSERT INTO HasACCOUNT "
                + "VALUES( '"+afm+"','"+accountid+"', '"+amount+"' );");
        
        if ( !(session.getAttribute("pass") == null) )
            out.print("O Πελάτης καταχωρήθηκε. Ο κωδικός του είναι "+session.getAttribute("pass")+". ");
        out.print("O Λογαριασμός δημιουργήθηκε. Ο κωδικός του είναι "+accountid+". ");
        if ( session.getAttribute("typeCheck").equals("t") ){%>
                <a href="teller.jsp">Επιστροφή</a>
         <%}
           else if ( session.getAttribute("typeCheck").equals("s") ){%>
                <a href="superTeller.jsp">Επιστροφή</a>
        <%}
        
        
    %>
    </body>
</html>
