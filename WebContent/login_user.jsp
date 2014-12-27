<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <%@page import="com.mai.pizza.UserDao" %>

            <%

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (username == null || password == null) {
                    out.print("Invalid paramters ");
                }
                int id = UserDao.logon(username, password);
                if (id != 0) {
                    out.print("You are successfully login <a href=\"pizza.jsp\" >Order Pizza</a>");
                    session.setAttribute("username", username);
                    session.setAttribute("id", id);
                }
                if (id == 0) out.print("Fail Login");

            %>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>