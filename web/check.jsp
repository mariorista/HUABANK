
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%
String afm = request.getParameter("afm");
String password = request.getParameter("password");

String connectionURL =
"jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>
<html>
<body>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL);
statement = connection.createStatement();
rs = statement.executeQuery("SELECT * FROM ACTOR WHERE PASSWORD='"+password+
        "' AND AFM='"+afm+"'");
if ( rs.next() ){
   session.setAttribute("nameT", rs.getString("NAME"));
   session.setAttribute("surnameT", rs.getString("SURNAME"));
   session.setAttribute("typeCheck", rs.getString("TYPE"));
   String type = rs.getString("TYPE");
   if ( type.equals("t") ){
       rs.close();%>
       <jsp:forward page="teller.jsp"/>
   <%}
   else if ( type.equals("s") ){
       rs.close(); %>
       <jsp:forward page="superTeller.jsp"/>

   <%}
   else if ( type.equals("a") ){
       rs.close();%>
       <jsp:forward page="admin.jsp"/>
   <%}
}
rs.close();%>
<jsp:forward page="index.jsp"/>

</body></html>