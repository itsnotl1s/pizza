<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="menu">
    <div class="menu_title">Main menu</div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/index.jsp"
               class="menu_link">Main Page</a></li>
        <li><a href="${pageContext.request.contextPath}/pizza.jsp"
               class="menu_link">Pizza</a></li>
        <li><a href="${pageContext.request.contextPath}/cart.jsp"
               class="menu_link">Cart</a></li>


        <%
            String myname1 = (String) session.getAttribute("username");
            if (myname1 != null) {%>
        <li><a href="${pageContext.request.contextPath}/logout_user.jsp"
               class="menu_link">Logout</a></li>
        <%
            } else {
        %>
        <li><a href="${pageContext.request.contextPath}/registration.jsp"
               class="menu_link">Registration</a></li>
        <%
            }
            if ("admin".equals(myname1)) {
        %>
        <li><a href="${pageContext.request.contextPath}/admin.jsp"
               class="menu_link">Admin Panel </a></li>
        <%
            }
        %>
    </ul>
</div>
<marquee>If the delivery takes longer than 45 minutes, you get an order for free!</marquee>
</body>
</html>