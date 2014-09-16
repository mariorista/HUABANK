
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>

<%! public String toString(String x, int y) {
        return (x + y);
    }
%>

<%
%>

<%

            String type = (String) session.getAttribute("type");
            String ammount = (String) session.getAttribute("ammount");
            String own = (String) session.getAttribute("own");
            String inte = (String) session.getAttribute("interest");
            String ac = (String) session.getAttribute("acc");
            String od = (String) session.getAttribute("opda");

%><br><%


            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");



                Date today = df.parse("od");
                 df.format(today);




    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/mm/dd");
    Date cd = dateFormat.parse(od);
    int year= cd.getYear();
    int month=cd.getMonth();
    int day=cd.getDate();




            out.print(type + " " + ammount + " " + own + " " + inte + " " + ac + " " + convertedDate);

            String name, surname, sex, birthdate, password, rezidence, workaddress, maxAccount, famstat, ssn;
            for (int i = 0; i < Integer.parseInt(own); i++) {
                name = request.getParameter(toString("name", i));
                surname = request.getParameter(toString("surname", i));
                sex = request.getParameter(toString("sex", i));
                birthdate = request.getParameter(toString("birthdate", i));
                //password= somehow from the other page
                rezidence = request.getParameter(toString("ra", i));
                workaddress = request.getParameter(toString("wa", i));
                maxAccount = request.getParameter(toString("max", i));
                famstat = request.getParameter(toString("fs", i));
                ssn = request.getParameter(toString("afm", i));
                //out.print(name+" "+surname+" "+sex+" "+birthdate+" "+rezidence+" "+ workaddress+" "+maxAccount+" "+ famstat+" "+ ssn);%><br><%
                                //Insert into actor.....all the above
                                //insert into account....
                            }








%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
