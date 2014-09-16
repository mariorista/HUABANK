

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String connectionURL =
   "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
Connection connection = null;
Statement statement = null;

String name = request.getParameter("name");
String surname = request.getParameter("surname");
String work = request.getParameter("workAddr");
String sex = request.getParameter("sex");
String haddress = request.getParameter("homeAddr");
String familyStatus = request.getParameter("familyStatus");
String birth = request.getParameter("birthday");
String afm = request.getParameter("afm");

String checkAfm = (String)session.getAttribute("afmInfo");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Info</title>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        statement.executeUpdate("UPDATE ACTOR SET NAME='"+name+"', SURNAME='"+surname+"', AFM='"+afm+"'," +
            "WORKADDRESS='"+work+"', HOMEADDRESS='"+haddress+"', BIRTHDAY='"+birth+"', SEX='"+sex+"'," +
            " FAMILYSTATUS='"+familyStatus+"' WHERE AFM='"+checkAfm+"';");

        %>
        Η ενημέρωση των στοιχείων του πελάτη ολοκληρώθηκε με επιτυχία.
        <%out.println(" ");
        if ( session.getAttribute("typeCheck").equals("t") ){%>
            <a href="teller.jsp">Επιστροφή</a>
      <%}
        else if ( session.getAttribute("typeCheck").equals("s") ){%>
            <a href="superTeller.jsp">Επιστροφή</a>
      <%}%>
    </body>
</html>

