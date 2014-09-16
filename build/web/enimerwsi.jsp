

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
String[] balance = null;
balance = (String[]) session.getAttribute("arrayBal");
String[] IDs = (String[]) session.getAttribute("arrayIDs");
%>
<html>
    <body><h3>Ενημέρωση Υπολοίπων.</h3>
        <table border="0">
            <thead>
                <tr>
                    <th>Λογαριασμός</th>
                    <th>Υπόλοιπο</th>
                </tr>
            </thead>
            <%for (int i = 0; i < balance.length; i++){
                 if (!(balance[i] == null)) {%>
                    <tbody>
                        <tr>
                            <td><%=IDs[i]%></td>
                            <td><%=balance[i]%></td>
                        </tr>
                    </tbody>
                <%}%>
            <%}%>
        </table>

    </body>
</html>
