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
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <%
                String myname = (String) session.getAttribute("username");
                if (myname.toLowerCase().trim().equals("admin")) {
            %><h1 align=\"center\"><% out.println("Welcome " + myname + "!!"); %></h1>

            <p>

            <form action="<c:url value='/pizza_add.jsp'/>">
                <input type="submit" value="Add pizza"></form>
            <p>

            <form action="<c:url value='/removePizza.jsp'/>">
            <input type="submit" value="Remove or return pizza"></form>
            <p>

            <form action="<c:url value='/pizza.jsp'/>">
                <input type="submit" value="Veiw pizza"></form>
            <p>

            <form action="<c:url value='/orders.jsp'/>">
                <input type="submit" value="Veiw orders"></form>
            <p>
                    <%
    } else {
        out.println("Please Login in");
    }
%>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>