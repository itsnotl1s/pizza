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
            <table border="1" cellspacing="4">
                <tr align="center">
                    <th>Quantity</th>
                    <th>Name</th>
                    <th>Unit price</th>
                    <th>Price</th>
                    <th>Remove</th>
                </tr>
                <c:forEach var="item" items="${cart.items}">
                    <tr align="center">
                        <td>
                            <form action="<c:url value='/CartServlet'/>">
                                <input type="hidden" name="productCode" value="${item.product.id}">
                                <input type="text" size="2" name="quantity" value="${item.quantity}">
                                <input type="submit" value="Counted">
                            </form>
                        </td>
                        <td>${item.product.name}</td>
                        <td>${item.product.price}</td>
                        <td>${item.totalCurrencyFormat}</td>
                        <td>
                            <form action="<c:url value='/CartServlet'/>">
                                <input type="hidden" name="productCode" value="${item.product.id}">
                                <input type="hidden" name="quantity" value="0">
                                <input type="submit" value="Remove">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p>

            <form action="<c:url value='/pizza.jsp' />">
                <input type="submit" value="Continue shopping"></form>
            <form action="<c:url value='/thankyou.jsp' />">
                <input type="submit" value="Make order"></form>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>


















