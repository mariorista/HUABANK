

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String connectionURL =
   "jdbc:mysql://83.212.240.15:3306/it20818?user=it20818&password=changeit";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
ResultSet rs2 = null;

String afm = request.getParameter("afm");
String action = request.getParameter("action");

%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>Customer Info</title>

    <script type="text/javascript" src="script.js"></script>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
</head>
<body>
<div id="art-page-background-simple-gradient">
    </div>
    <div id="art-main">
        <div class="art-Sheet">
            <div class="art-Sheet-tl"></div>
            <div class="art-Sheet-tr"></div>
            <div class="art-Sheet-bl"></div>
            <div class="art-Sheet-br"></div>
            <div class="art-Sheet-tc"></div>
            <div class="art-Sheet-bc"></div>
            <div class="art-Sheet-cl"></div>
            <div class="art-Sheet-cr"></div>
            <div class="art-Sheet-cc"></div>
            <div class="art-Sheet-body">
                <div class="art-Header">
                    <div class="art-Header-jpeg"></div>
                    <div class="art-Logo">
                        <h1 id="name-text" class="art-Logo-name"><a href="index.jsp">DIT Bank</a></h1>
                        <div id="slogan-text" class="art-Logo-text">we care about your money</div>
                    </div>
                </div>
                <div class="art-nav">
                	<div class="l"></div>
                	<div class="r"></div>

                </div>
                <div class="art-contentLayout">
                    <div class="art-content">
                        <div class="art-Post">
                            <div class="art-Post-body">
                        <div class="art-Post-inner">

                        </div>

                        		<div class="cleared"></div>
                            </div>
                        </div>
                        <div>
                            <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT * FROM ACTOR WHERE AFM='"+afm+"';");
        if ( rs.next() ){
            rs2 = statement.executeQuery("SELECT * FROM HasACCOUNT WHERE ActAFM='"+afm+"';");
            int i=0;%>
            <h2 class="art-postheader">
                Λογαριασμοί Πελάτη
            </h2>
            <%
            String amount[] = new String[10];
            String IDs[] = new String[10];
            %><h4>Κωδικοί Λογαριασμών</h4>
            <table border="0">
                <tbody>
                    <tr>
                        <td><%
                            while ( rs2.next() ){
                                out.println( (i+1) + ". " + rs2.getString("AccID") );%><BR><%
                                amount[i] = rs2.getString("accBALANCE");
                                IDs[i] = rs2.getString("AccID");
                                i++;
                            }
                            %>
                        </td>
                    </tr>
                </tbody>
            </table>
            <%
            session.setAttribute("arrayBal", amount);
            session.setAttribute("arrayIDs", IDs);
            session.setAttribute("afmCust", afm);

            if ( action.equals("analipsi") ){
                %><jsp:include page="analipsi.jsp"/><%
            }
            else if ( action.equals("katathesi") ){
                %><jsp:include page="katathesi.jsp"/><%
            }
            else if ( action.equals("metafora") ){
                %><jsp:include page="metafora.jsp"/><%
            }
            else if ( action.equals("enimerwsi") ){
                %><jsp:include page="enimerwsi.jsp"/><%
            }
        }
        else
        {%>
            Λάθος ΑΦΜ. Το ΑΦΜ δεν υπάρχει. <a href="tellerActions.jsp">Επιστροφή</a>
      <%}%>



                                        <div class="cleared"></div>
                        </div>

                        		<div class="cleared"></div>
                            </div>



                </div>
                <div class="cleared"></div><div class="art-Footer">
                    <div class="art-Footer-inner">


                    </div>
                    <div class="art-Footer-background"></div>
                </div>
        		<div class="cleared"></div>
            </div>
        </div>
        <div class="cleared"></div>

    </div>

</body>
</html>
