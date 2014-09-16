

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="passw" class="pass.Password" scope="session"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String birth = request.getParameter("birthday");
    String sex = request.getParameter("sex");
    String home = request.getParameter("homeAddr");
    String work = request.getParameter("workAddr");
    String familyS = request.getParameter("familyStatus");
    String afm = (String)session.getAttribute("afmforAd");

    String connectionURL =
    "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
    Connection connection = null;
    Statement statement = null;
    Statement statement2 = null;
    ResultSet rs = null;
%>
<html>
    <body>
        <%
        String password = passw.createPassword(birth, "c");
        session.setAttribute("pass", password );
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        statement2 = connection.createStatement();
        rs = statement2.executeQuery("SELECT AFM FROM ACTOR "
                + "WHERE SURNAME='"+surname+"' AND TYPE='c';");

        statement.executeUpdate("INSERT INTO ACTOR "
                + "VALUES('"+name+"','"+surname+"','"+birth+"','"+sex+"', "
                + "'"+home+"', '"+work+"', '"+afm+"', '"+familyS+"', 1, 'c','"+password+"' );");
        
        while( rs.next() ){
            String afmC = rs.getString("AFM");
            statement.executeUpdate("INSERT INTO "
                        + "RELATION VALUES( '"+afm+"', '"+afmC+"' );");
        }
        rs.close();
        connection.close();
      %><jsp:forward page="checkAFMforAccount.jsp"/><%
        %>
    </body>
</html>
