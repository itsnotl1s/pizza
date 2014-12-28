<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WebPizza</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
    String myname = (String) session.getAttribute("username");
    int id = (Integer) session.getAttribute("id");
    if (myname.toLowerCase().trim().equals("admin")) {
        out.println("Welcome  " + myname + " , Select a pizza.");
%>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <h1 align="center">Welcome!!</h1>

            <p>

            <form action="<c:url value='/pizza_add.jsp'/>">
                <input type="submit" value="Add pizza"></form>
            <p>

            <form action="<c:url value='/removePizza.jsp'/>">
                <input type="submit" value="Remove pizza"></form>
            <p>

            <form action="<c:url value='/pizza.jsp'/>">
                <input type="submit" value="Veiw pizza"></form>
            <p>

            <form action="<c:url value='/orders.jsp'/>">
                <input type="submit" value="Veiw orders"></form>
            <p>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
<%
    } else {
        out.println("Please Login in");
    }
%>
</body>
</html>