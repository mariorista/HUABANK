
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    String afmCheck = request.getParameter("afm");
    String passwordCheck = request.getParameter("pass");

    String connectionURL =
    "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;

    String action = (String)session.getAttribute("act");
    

    String typeOfWork = null;
    String familyStatus = null;
    String haddress = null;
    String sex = null;
    String afm = null;
    String birth = null;
    String surname = null;
    String name = null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Worker Info</title>
    </head>
    <body>

        <%try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM ACTOR " +
                 "WHERE PASSWORD='"+passwordCheck+"' AND AFM='"+afmCheck+"';");

            if ( rs.next() ){

                if( rs.getString("TYPE").equals("t") )
                    typeOfWork = "Teller";
                else if( rs.getString("TYPE").equals("s") )
                    typeOfWork = "Super Teller";
                else if( rs.getString("TYPE").equals("u") )
                    typeOfWork = "Manager of Bank";
                else if ( rs.getString("TYPE").equals("a") ){%>
                    <jsp:include page="giveUser.jsp"/>
                <%}
                if( rs.getString("SEX").equals("f") )
                    sex = "Female";
                else if( rs.getString("SEX").equals("m") )
                    sex = "Male";

                name = rs.getString("NAME");
                surname = rs.getString("SURNAME");
                afm = rs.getString("AFM");
                haddress = rs.getString("HOMEADDRESS");
                familyStatus = rs.getString("FAMILYSTATUS");
                birth = rs.getString("BIRTHDAY");
                session.setAttribute("afmInfo", afm);
                rs.close();%>

                <h3>ΣΤΟΙΧΕΙΑ ΕΡΓΑΖΟΜΕΝΟΥ</h3><br>
                Όνομα: <% out.println(" "+name); %><br>
                Επίθετο:<% out.println(" "+surname); %><br>
                AΦΜ: <% out.println(" "+afm); %><br>
                Τύπος Εργαζομένου: <% out.println(" "+typeOfWork); %><br>
                Φύλο: <% out.println(" "+sex); %><br>
                Διεύθυνση Κατοικίας: <% out.println(" "+haddress); %><br>
                Ημερομηνία Γέννησης: <% out.println(" "+birth);%><br>
                Οικογενειακή Κατάσταση: <% out.println(" "+familyStatus); %><br>

                <%
                if ( action.equals("Delete user") ){
                %>
                <h4>Θέλετε να διαγράψετε τον εργαζόμενο;</h4><br>
                <form action="delDBUser.jsp">
                <input type="submit" value="Ναι" /></form>

                <form action="admin.jsp">
                <input type="submit" value="Όχι" /></form>
                <%
                }
                else if ( action.equals("Change informations") ){

                    session.setAttribute("nameInfo", name);
                    session.setAttribute("surnameInfo", surname);
                    session.setAttribute("typeInfo", typeOfWork);
                    session.setAttribute("sexInfo", sex);
                    session.setAttribute("addrInfo", haddress);
                    session.setAttribute("fStatusInfo", familyStatus);
                    session.setAttribute("birthInfo", birth);
                %>
                <h4>Θέλετε να αλλάξετε τα στοιχεία του εργαζόμενου;</h4><br>
                <form action="changeInfo.jsp">
                <input type="submit" value="Ναι" /></form>

                <form action="admin.jsp">
                <input type="submit" value="Όχι" /></form>
            <%
                }
            }
            else{%>
                <jsp:forward page="giveUser.jsp"/>
            <%}
        }
        catch(Exception e){
            rs.close();
            out.println("MPOU"+e.getLocalizedMessage());
            %>
            <jsp:forward page="giveUser.jsp"/>
<%      }            %>
    </body>
</html>
