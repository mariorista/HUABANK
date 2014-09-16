
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<jsp:useBean id="passw" class="pass.Password" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String afm = request.getParameter("afm");
        String birthDay = request.getParameter("birthday");
        String homeAddress = request.getParameter("homeAddr");
        String sex = request.getParameter("sex");
        String familyStatus = request.getParameter("familyStatus");
        String type = request.getParameter("typeOfUser");
        String password = passw.createPassword( birthDay, type );
%>

<%
    String connectionURL =
    "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
    Connection connection = null;
    Statement statement = null; 
%>
<html>
    <body>
        
        
        <%
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            statement.executeUpdate( "INSERT INTO ACTOR " +
            "VALUES ( '"+name+"','"+surname+"', '"+birthDay+"', '"+sex+"'," +
                    " '"+homeAddress+"', 'Xarokopou 89', '"+afm+"', '"+familyStatus+
                    "', null, null, '"+type+"', '"+password+"' );" );
            
            if ( type.equals("t") )
                out.println("New Teller has been created. The password is "+password+". ");
            else if ( type.equals("b") )
                out.println("New Boss has been created. The password is "+password+". ");
            else if ( type.equals("s") )
                out.println("New Super Teller has been created. The password is " +password+". ");
            %> return to <a  href = "admin.jsp" > admin home </a ><%
        }
        catch( Exception e){
            out.println("Check your BirthDay. "+e.getLocalizedMessage());
            %>
            <jsp:include page="createUser.jsp"/>
            <%
        }
        %>
    </body>
</html>

