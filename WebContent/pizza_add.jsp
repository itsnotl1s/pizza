<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pizza_add</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
    String myname = (String) session.getAttribute("username");
    if (myname != null) {
        out.println("Welcome  " + myname + " ");
%>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <h1>Add pizza</h1>

            <form action="add_pizza.jsp" method="post">
                Name pizza:<input type="text" name="name"/><br><br/>
                ingredients:<input type="text" name="ingredient"/><br><br/>
                Price:<input type="text" name="price"/><br><br/>
                <input type="radio" name="flag" value="1"> Yes, add<Br>
                <input type="radio" name="flag" value="0"> add, without listing</p>
                <input type="submit" value="Add pizza"/>

            </form>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
<%


    } else {
        out.println("Please login in");
    }
%>
</body>
</html>