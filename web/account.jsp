<%--
    Document   : account
    Created on : Dec 14, 2010, 1:16:14 PM
    Author     : diego
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>

        <%! public String toString(String x, int y) {
                return (x + y);
            }
        %>
        <%

                    String afm0 = request.getParameter("afm0");
                    String afm1 = request.getParameter("afm1");
                    String afm2 = request.getParameter("afm2");
                    String afm3 = request.getParameter("afm3");

                    session.setAttribute("afm0", afm0);
                    session.setAttribute("afm1", afm1);
                    session.setAttribute("afm2", afm2);
                    session.setAttribute("afm3", afm3);

                    //out.print(afm0 + afm1 + afm2 + afm3);
                    //out.print(toString("mario ",3));
                    int account = 0;

                    String connectionURL = "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;

                    String own = (String) session.getAttribute("own");
                    //out.print("owner"+own);
                    // Integer.parseInt(request.getParameter("owners#"));
        %>
        <form  action = "end.jsp">
            <%
                        for (int i = 0; i < Integer.parseInt(own); i++) {
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(connectionURL);
                                statement = connection.createStatement();
                                rs = statement.executeQuery("SELECT  mxACCOUNT FROM ACTOR WHERE AFM like'" + session.getAttribute(toString("afm", i)) + "';");
                                if (rs.wasNull()) {
                                    out.print("db error");
                                    continue;
                                }//if db returnf null  it goes crazy with null point exception

                                if (rs.next()) {

                                    account = rs.getInt("mxACCOUNT");

                                    if (account == 6) {
                                        out.print("accounts" + account);
                                        //rs.close();
                                        continue;
                                    } else if (account < 6) {
                                        out.print("user "+session.getAttribute(toString("afm", i))+"allredy in" + account);%><br><%
                                        rs.close();
                                        %>
                                        <input type="hidden" name="inusr<%=i%>" value="<%=session.getAttribute(toString("afm", i))%>" />
                                        <%
                                        continue;
                                    }
                                } else {

            %>
            <center>
            <table border="1">
                <thead>
                    <tr>
                        <th>Type</th>
                        <th>Data</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>name</td>
                        <td><input type="text" name="name<%=i%>" value="" /></td>
                    </tr>
                    <tr>
                        <td>surname</td>
                        <td><input type="text" name="surname<%=i%>" value=""/></td>
                    </tr>
                    <tr>
                        <td>sex</td>
                        <td>M<input type="radio" name="sex<%=i%>" value="M" checked="checked" />
                            F<input type="radio" name="sex<%=i%>" value="F" />
                        </td>
                    </tr>
                    <tr>
                        <td>birth date</td>
                        <td><input type="text" name="birthdate<%=i%>" value="" /></td>
                    </tr>
                    <tr>
                        <td>afm</td>
                        <td><%=session.getAttribute(toString("afm", i))%><input type="hidden" name="afm<%=i%>" value="<%=session.getAttribute(toString("afm", i))%>" /></td>
                    </tr>
                    <tr>
                        <td>rezidence </td>
                        <td><input type = "text" name ="ra<%=i%>" value=""/></td>
                    </tr>
                    <tr>
                        <td>work address</td>
                        <td><input type="text" name="wa<%=i%>" value="" /></td>
                    </tr>
                    <tr>
                        <td>family status</td>
                        <td><select name="fs<%=i%>">
                                <option>single</option>
                                <option>maried</option>
                                <option>divorced</option>
                                <option>decized</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>accounts number</td>
                        <td><%=account%><input type="hidden" name="max<%=i%>" value="" /></td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td>sys</td>
                    </tr>
                    <tr>
                        <td>type</td>
                        <td>C</td>
                    </tr>

                </tbody>
            </table>

    
            <%                                }
                                rs.close();

                            } catch (java.sql.SQLException e) {
                                out.print("some error");
                            }

                        }
            %>

                <input type="submit" value="ok" name="ok" />
</center>
        </form>


    </body>
</html>
