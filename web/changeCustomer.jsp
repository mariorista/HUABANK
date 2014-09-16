
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%
String afm = request.getParameter("afm");
session.setAttribute("afmInfo", afm);
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
    rs = statement.executeQuery("SELECT * FROM ACTOR WHERE"+
            " AFM='"+afm+"'");
    if ( rs.next() ){
        String type = rs.getString("TYPE");
        if ( type.equals("c") ){
           session.setAttribute("name", rs.getString("NAME"));
           session.setAttribute("surname", rs.getString("SURNAME"));
           session.setAttribute("afm", rs.getString("AFM"));
           session.setAttribute("wAddr", rs.getString("WORKADDRESS"));
           session.setAttribute("sex", rs.getString("SEX"));
           session.setAttribute("hAddr", rs.getString("HOMEADDRESS"));
           session.setAttribute("fStatus", rs.getString("FAMILYSTATUS"));
           session.setAttribute("birth", rs.getString("BIRTHDAY"));
           rs.close();%>
           <jsp:forward page="customerInfo.jsp"/>
           
     <%}
        rs.close();
        if ( session.getAttribute("typeCheck").equals("t") ){%>
              <jsp:forward page="teller.jsp"/>
      <%}
        else if ( session.getAttribute("typeCheck").equals("s") ){%>
             <jsp:forward page="superTeller.jsp"/>
      <%}
    }%>
    </body>
</html>
