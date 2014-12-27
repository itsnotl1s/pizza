<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>WebPizza</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<body>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <%@ page import="com.mai.pizza.OrderDao,org.hibernate.*,org.hibernate.cfg.*" %>
            <%int order_id = OrderDao.OrderMake(request, response); %>
            <h1 align="center">Thank you for Your order #<%=order_id%>. Come back again.</h1>
            <% session.removeAttribute("cart"); %>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>