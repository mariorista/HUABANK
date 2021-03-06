

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <title>Change Info</title>

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
                                    Αλλαγή στοιχείων Πελάτη
                                </h2>



                                <FORM METHOD=POST ACTION="changeDBInfoForCustomer.jsp" onsubmit='return formValidator()'>
                                    <table border="0">
                                        <tbody>

                                            <tr>
                                                <td>Όνομα:</td>
                                                <td><INPUT TYPE=TEXT NAME=name SIZE=20 value="<%=session.getAttribute("name") %>"></td>
                                            </tr>
                                            <tr>
                                                <td>Επώνυμο:</td>
                                                <td><INPUT TYPE=TEXT NAME=surname SIZE=20 value="<%=session.getAttribute("surname") %>"></td>
                                            </tr>
                                            <tr>
                                                <td>AΦΜ:</td>
                                                <td><INPUT TYPE=TEXT NAME=afm SIZE=20 value="<%=session.getAttribute("afm") %>"></td>
                                            </tr>
                                            <tr>
                                                <td>Ημερομηνία Γέννησης:</td>
                                                <td><INPUT TYPE=TEXT NAME=birthday SIZE=20 value="<%=session.getAttribute("birth") %>"</td>
                                            </tr>
                                            <tr>
                                                <td>Διεύθυνση Κατοικίας:</td>
                                                <td><INPUT TYPE=TEXT NAME=homeAddr SIZE=30 value="<%=session.getAttribute("hAddr") %>"></td>
                                            </tr>
                                            <tr>
                                                <td>Διεύθυνση Εργασίας:</td>
                                                <td><INPUT TYPE=TEXT NAME=workAddr SIZE=30 value="<%=session.getAttribute("wAddr") %>"></td>
                                            </tr>
                                            <tr>
                                                <td>Φύλο:</td>
                                                <td>
                                                  <%if ( session.getAttribute("sex").equals("m") ) {%>
                                                    <INPUT TYPE=RADIO NAME=sex VALUE="m"checked>Άντρας
                                                    <INPUT TYPE=RADIO NAME=sex VALUE="f">Γυναίκα
                                                    <%}
                                                    else if ( session.getAttribute("sex").equals("f") ){%>
                                                           <INPUT TYPE=RADIO NAME=sex VALUE="m">Άντρας
                                                           <INPUT TYPE=RADIO NAME=sex VALUE="f"checked>Γυναίκα
                                                    <%}%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Οικογενειακή Κατάσταση:</td>
                                                <td>
                                                    <%
                                                        if ( session.getAttribute("fStatus").equals("married") ) {%>
                                                            <INPUT TYPE=RADIO NAME=familyStatus VALUE="single">Άγαμος
                                                            <INPUT TYPE=RADIO NAME=familyStatus VALUE="married" checked>Έγγαμος
                                                      <%}
                                                        else if ( session.getAttribute("fStatus").equals("single") ) {%>
                                                            <INPUT TYPE=RADIO NAME=familyStatus VALUE="single"checked>Άγαμος
                                                            <INPUT TYPE=RADIO NAME=familyStatus VALUE="married" >Έγγαμος
                                                      <%}%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <INPUT TYPE=SUBMIT VALUE="Done">
                                                </td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </FORM>
                                <%
                                if ( session.getAttribute("typeCheck").equals("t") ){%>
                                    <form action="teller.jsp">
                                    <P><INPUT TYPE=SUBMIT VALUE="Back">
                                    </form>
                              <%}
                                else if ( session.getAttribute("typeCheck").equals("s") ){%>
                                    <form action="superTeller.jsp">
                                    <P><INPUT TYPE=SUBMIT VALUE="Back">
                                    </form>
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




