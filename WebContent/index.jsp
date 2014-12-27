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
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <h4 align="center">Welcome to the MONSTER PIZZA. Here you can order a pizza for every taste.
                Please enter your login or register if you are a first time for our pizza. </h4>
            <%
                String myname = (String) session.getAttribute("username");
                if (myname != null) {
                    out.println("Welcome  " + myname + "  , <a href=\"pizza.jsp\" >Order Pizza</a>");
                } else {
            %>

            <form action="login_user.jsp">
                <table>
                    <tr>
                        <td> Username :</td>
                        <td><input name="username" size=15 type="text"/></td>
                    </tr>
                    <tr>
                        <td> Password :</td>
                        <td><input name="password" size=15 type="password"/></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <th>
                            <small>
                                <input type="submit" value="Login"
                                       onclick="location.href='http://localhost:8080/test/login_user.jsp'">
                            </small>
                        </th>
                </table>
            </form>
            <table>
                <tr>
                    <th>
                        <small>
                            <input type="submit" value="Registration"
                                   onclick="location.href='http://localhost:8080/test/registration.jsp'">
                        </small>
                    </th>
                </tr>
            </table>

            <p>

        </div>
        <%
            }
        %>

        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>