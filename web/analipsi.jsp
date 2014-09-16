

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <body>

        <h1>Ανάληψη Χρημάτων</h1>
        <div style="color:red" >Note: Only Super Teller can outherise withdraw from running accounts!</div>
        <form action="postAnalipsis.jsp" method="POST" >
            Κωδικός Πελάτη:<BR><input type="text" name="pass" size="20" /><BR>
            Κωδικός Λογαριασμού:<BR><input type="text" name="account" size="20" /><BR>
            Χρηματικό Ποσό:<BR><input type="text" name="poso" size="20" /><BR>
            <input type="submit" value="check" name="Next" />
        </form>
    </body>
</html>
