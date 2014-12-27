<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
    String myname = (String) session.getAttribute("username");
    if (myname != null) {
        out.println("Welcome  " + myname + "  you are already registered and login it , <a href=\"pizza.jsp\" >Order Pizza</a>");
    } else {
%>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <h1>Registration</h1>

            <form action="register_user.jsp" method="post">
                Name:<input type="text" name="login"/><br><br/>
                Password:<input type="password" name="password"/><br><br/>
                Email ID:<input type="text" name="email"/><br><br/>
                <input type="submit" value="Register user"/>

            </form>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
<%
    }
%>
</body>
</html>