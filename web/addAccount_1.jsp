
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%! Random random = new Random();
        public int interest = 3 + random.nextInt( 9 );
        public long accnr =  11111 +random.nextInt(99999);
        public Date od= new Date();



%>
        <%//String interest = request.getParameter( "interest" );
        session.setAttribute( "inte", interest );%>

        <center>
   <form action="checkAccount.jsp" method="POST">

        <table border="5">
            <thead>
                <tr>
                    <th colspan = "2">enter the values

                        <input type="hidden" name="acc" value="<%=accnr%>"

                    </th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>openDate<input type="hidden" name="inte" value="<%=interest%>"</td>
                    <td><%=od%></td>
                </tr>
                <tr>
                    <td>account number<input type="hidden" name="od" value="<%=od%>"</td>
                    <td><%=accnr%></td>
                </tr>
                <tr>
                    <td>intrest</td>
                    <td><%=interest%></td>
                </tr>
                <tr>
                    <td>type</td>
                    <td>running<input type="radio" name="type" value="run"checked="checked" />balanced<input type="radio" name="type" value="bal" /> </td>
                </tr>
                <tr>
                    <td >ammount</td>
                    <td><input type="text" name="ammount" value="0.0" size="30" /></td>
                </tr>
                <tr>
                    <td>co-owners_nr</td>
                    <td><select name="owners#">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select></td>
                </tr>
            </tbody>
        </table>
               <input type="submit" value="next" name="next" />
    </form>
</center>


    </body>
</html>
