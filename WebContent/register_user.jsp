<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <%@page import="com.mai.pizza.UserDao" %>
            <jsp:useBean id="obj" class="com.mai.pizza.User">
            </jsp:useBean>
            <jsp:setProperty property="*" name="obj"/>

            <%
                int id = UserDao.register(obj);
                if (id > 0)
                    out.print("You are successfully registered");

            %>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>