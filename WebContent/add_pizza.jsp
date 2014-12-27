<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pizza add</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <%@page import="com.mai.pizza.PizzaDao" %>
            <jsp:useBean id="obj" class="com.mai.pizza.Pizza">
            </jsp:useBean>
            <jsp:setProperty property="*" name="obj"/>

            <%
                int id = PizzaDao.add_pizza(obj);
                if (id > 0)
                    out.print("Pizza successfully added");

            %>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>