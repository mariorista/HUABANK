<%--
    Document   : accCheck
    Created on : Dec 15, 2010, 12:42:03 AM
    Author     : diego
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%

            session.isNew();


            String type = request.getParameter("type");
            String ammount = request.getParameter("ammount");
            String own = request.getParameter("owners#");
            String inte = request.getParameter("inte");
            String ac = request.getParameter("acc");
            String od = request.getParameter("od");

//int intrest =Integer.parseInt("aaa");


            session.setAttribute("type", type);
            session.setAttribute("ammount", ammount);
            session.setAttribute("own", own);
            session.setAttribute("acc", ac);
            session.setAttribute("opda", od);
            session.setAttribute("interest", inte);


///////////////////////////////////////////////////////////


//Date opendate=  df.parse(od);
%>
<%try {
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
//int interest= Integer.parseInt("inte");
                int coown = Integer.parseInt(own);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">                              <!-- display imputed data, account's data-->
            <thead>
                <tr>
                    <th>A</th>
                    <th>A</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>open date</td>
                    <td><%=od%></td>
                </tr>
                <tr>
                    <td>ammount</td>
                    <td><%=ammount%></td>
                </tr>
                <tr>
                    <td>intrest</td>
                    <td><%=inte%></td>
                </tr>
                <tr>
                    <td>account</td>
                    <td><%=ac%></td>
                </tr>
                <tr>
                    <td>type</td>
                    <td><%=type%></td>
                </tr>
                <tr>
                    <td>B</td>
                    <td>B</td>
                </tr>
            </tbody>
        </table><br>

        <%//out.print(type+" "+ammount+" "+own+" "+inte+" "+ac+" "+od);%>



        <!--for each one of the owners-->
        <form name="afms" action="account.jsp">
            enter the afm<br>
            <%
                        for (int i = 0; i < Integer.parseInt(own); i++) {%>
            <input type="text" name="afm<%=i%>" value="" /> <br>
            <% }%>

            <input type="submit" value="check" name="check" />
        </form>

    </body>
</html>
