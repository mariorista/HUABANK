

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SuperTeller Page</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("nameT")%> <%=session.getAttribute("surnameT")%></h1>
        <form action="addAccount.jsp" method="POST">
            <input type="submit" value="ADD ACCOUNT" />
        </form><br>
        <form action="changeCustomerInfo.jsp" method="POST">
            <input type="submit" value="Change Info" />

        </form><br>
        <form action="tellerActions.jsp" method="POST">
            <input type="submit" value="ACTIONS" />
        </form>
        <br>
        <form action="closeEmptyAccounts.jsp" method="POST">
            <input type="submit" value="Close Accounts" />
        </form>
    </body>
</html>
