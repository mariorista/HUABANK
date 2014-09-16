
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

    String typeOfWork = null;
    String familyStatus = null;
    String haddress = null;
    String sex = null;
    String afm = null;
    String birth = null;
    String surname = null;
    String name = null;
%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>DIT BANK </title>

    <script type="text/javascript" src="script.js"></script>
    <script type="text/javascript">
        function formValidator(){
            // Make quick references to our fields
            var afm = document.getElementById('afm');
            var pass = document.getElementById('pass');

            // Check each input in the order that it appears in the form!
            if(notEmpty(afm, "Miss afm task!")){
                if(lengthRestriction(afm, 9)){
                    if(isNumeric(afm, "Please enter a valid afm(NO LETTERS)")){
                        if(notEmpty(pass, "Miss password task!")){
                                   return true;
                        }
                    }
                }
            }
            return false;
        }
        function notEmpty(elem, helperMsg){
            if(elem.value.length == 0){
                    alert(helperMsg);
                    elem.focus(); // set the focus to this input
                    return false;
            }
            return true;
        }
        function isNumeric(elem, helperMsg){
            var numericExpression = /^[0-9]+$/;
            if(elem.value.match(numericExpression)){
                    return true;
            }else{
                    alert(helperMsg);
                    elem.focus();
                    return false;
            }
	}
        function lengthRestriction(elem, equal){
            var uInput = elem.value;
            if(uInput.length == equal){
                    return true;
            }else{
                    alert("Please enter 9 characters");
                    elem.focus();
                    return false;
            }
        }

    </script>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
</head>
<body>
    <%
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
                else if ( rs.getString("TYPE").equals("a") || rs.getString("TYPE").equals("c")){
                %>
                    <jsp:forward page="deleteUser.jsp"/>
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
                rs.close();
           }
%>
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
                        <ul class="art-menu">
                		<li>
                			<a href="logout.jsp" class=" active"><span class="l"></span><span class="r"></span><span class="t">Logout</span></a>
                		</li>
                        </ul>

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
                                 <h2 class="art-postheader">
                                                Διαγραφή Χρήστη
                                            </h2>

                                            <table border="0">
                                                <thead>
                                                    <tr>
                                                        <th> <h3>ΣΤΟΙΧΕΙΑ ΕΡΓΑΖΟΜΕΝΟΥ</h3></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Όνομα:</td>
                                                        <td><%=name%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Επίθετο:</td>
                                                        <td><%=surname%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>AΦΜ:</td>
                                                        <td><%=afm%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Τύπος Εργαζομένου:</td>
                                                        <td><%=typeOfWork%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Φύλο:</td>
                                                        <td><%=sex%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Διεύθυνση Κατοικίας:</td>
                                                        <td><%=haddress%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ημερομηνία Γέννησης:</td>
                                                        <td><%=birth%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Οικογενειακή Κατάσταση:</td>
                                                        <td><%=familyStatus%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                                    <table border="0">
                                                <thead>
                                                    <tr>
                                                        <th> <h4>Θέλετε να διαγράψετε τον εργαζόμενο;</h4></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><form action="delDBUser.jsp">
                                                                <input type="submit" value="Ναι" /></form>
                                                        </td>
                                                        <td><form action="admin.jsp">
                                                                <input type="submit" value="Όχι" /></form>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

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




