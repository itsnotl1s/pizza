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
            <p><%
                        String myname =  (String)session.getAttribute("username");
                        int id =  (Integer)session.getAttribute("id");
                        if("admin".equals(myname)){
                            out.println("Welcome  "+myname+" , Select a order.");
                        }
                        else {out.println("Please Login in");}
                        %>
            <table width="750" border="1" cellspacing="4">
                <tr align="center">
                    <th>ID order</th>
                    <th>Name Customer</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Open details</th>
                </tr>
            <%@ page
                    import="com.mai.pizza.Order,com.mai.util.SessionUtil,org.hibernate.Query,org.hibernate.Session,org.hibernate.SessionFactory" %>
            <%@ page import="org.hibernate.cfg.Configuration" %>
            <%@ page import="java.util.Iterator" %>
            <%! int order_id;
                    java.math.BigDecimal final_price;
                    int status;
                    String name;
                    Session session1 = null; %>

                <%
                    Configuration cf = new Configuration();
                    cf.configure();
                    SessionFactory sf = SessionUtil.getSessionFactory();
                    session1 = sf.openSession();
//Using from Clause
                    String SQL_QUERY = "from Order";
                    Query query = session1.createQuery(SQL_QUERY);
                    Iterator it = query.iterate();
                    while (it.hasNext()) {
                        Order o = (Order) it.next();
                        order_id = o.getId();
                        name = o.getUser().getLogin();
                        final_price = o.getFinal_price();
                        status = o.getStatus();
                %>
                <tr align="center">
                    <td><%=order_id%>
                    </td>
                    <td><%=name%>
                    </td>
                    <td><%=final_price%>

                    <td>
                    <form action="${pageContext.request.contextPath}/UpdateServlet">
                        <input type="hidden" name="orderCode" value="<%=order_id%>"/>
                        <select name="menu" size="1">
                            <option <%=(status == 0) ? "selected='selected'" : ""%> value="0">Status 0</option>
                            <option <%=(status == 1) ? "selected='selected'" : ""%> value="1">Status 1</option>
                            </select>
                        <input type="submit" value="Change Status"/>
                        </form>
                    </td>
                    <td><a href="${pageContext.request.contextPath}/pizza_in_order.jsp?orderCode=<%=order_id%>">Open
                        order</a></td>
                </tr>
                <%
                    }
                    session1.close();
                %>

            </table>
            <p>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>